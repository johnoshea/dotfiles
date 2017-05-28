#!/bin/sh
#
# Rob Trew www.complexpoint.net
# https://github.com/RobTrew/tree-tools
#
# Ver 0.05
# Logs today's OmniFocus DONE items in DAYONE,
# Avoiding duplication if called several times in one day
# ( Maintains a text file list of which items have already been logged today )

# Requires installation of the [DayOne Command Line Interface](http://dayoneapp.com/tools/)
# For more details of the dayone command line tool, try:
# man -t 'dayone' | pstopdf -i -o ~/Desktop/dayone.pdf

# Can be used with [HAZEL](http://www.noodlesoft.com/hazel.php) rules like:
## Watch:   ~/Library/Containers/com.omnigroup.OmniFocus2/Data/Library/Caches/com.omnigroup.OmniFocus2
## or:      ~/Library/Containers/com.omnigroup.OmniFocus2/Data/Library/Caches/com.omnigroup.OmniFocus2.MacAppStore
##  Date Last Modified is after Date last Matched
##  <AND> Date last Modified is not in the last 5 mins

# (The delay reduces the number of log events,
# allowing time for a small set of actions within one project to be marked as done,
# without undue fragmentation into separate DayOne Log events)

# Ver 3 Improves handling of done items from Inbox,
# and makes trailling project colon a live link back to the project in the OmniFocus database
# Ver 4 facilitates choice between plain and bold Project title lines ($PROJECT_PREFIX below)

PROJECT_PREFIX="## " # Edit this to an empty string (see next line) for unbolded Day-One project lines.
#PROJECT_PREFIX=""

DONE_LOG_FOLDER="$HOME/Dropbox/OmniFocus2DayOne"
DONE_TODAY_FILE="$DONE_LOG_FOLDER/DoneToday.txt"
LOGGED_TODAY_FILE="$DONE_LOG_FOLDER/LoggedToday.txt"
LOG_NOW_FILE="$DONE_LOG_FOLDER/JustDone.txt"

CACHE_LOCATION="Library/Containers/com.omnigroup.OmniFocus2/Data/Library/Caches/"

OFOC="com.omnigroup.OmniFocus2"
if [ ! -d "$HOME/$CACHE_LOCATION/$OFOC" ]; then OFOC=$OFOC.MacAppStore; fi
OFQUERY="sqlite3 $HOME/$CACHE_LOCATION/$OFOC/OmniFocusDatabase2"
START_OF_DAY=$(date -v0H -v0M -v0S +%s) #Midnight at the start of today: set the time component to 00:00
TODAY=$(date "+%Y-%m-%d")

# Suggestions welcome here - not sure this simple arithmetic works for New Zealand's DST +1300 UTC
ZONERESET=$(date +%z | awk '
{if (substr($1,1,1)!="+") {printf "+"} else {printf "-"} print substr($1,2,4)}')
YEARZERO=$(date -j -f "%Y-%m-%d %H:%M:%S %z" "2001-01-01 0:0:0 $ZONERESET" "+%s")
DONE="($YEARZERO + t.dateCompleted)";

# This join includes context & folder, to allow for broader queries
JOIN="(((task tt left join projectinfo pi on tt.containingprojectinfo=pi.pk) t
left join task p on t.task=p.persistentIdentifier)
left join context c on t.context = c.persistentIdentifier)
left join folder f on t.folder=f.persistentIdentifier"

MATCHES="$DONE > $START_OF_DAY"
# doneTOTAL=$($OFQUERY "SELECT count(*) FROM $JOIN WHERE $MATCHES;")
# printf "DONE TODAY (%s)\n\n" "$doneTOTAL"

$OFQUERY "
SELECT t.persistentIdentifier, p.persistentIdentifier, strftime('%Y-%m-%d|%H:%M',$DONE, 'unixepoch'), p.name, t.name
FROM $JOIN WHERE $MATCHES ORDER BY t.datecompleted
" > $DONE_TODAY_FILE
# Determine what, if anything needs to be logged
if [ -f $LOGGED_TODAY_FILE ]; then
    if grep -q $TODAY $LOGGED_TODAY_FILE; then # Find items in the full DONE list which have NOT yet been logged
       awk 'FNR==NR{old[$0];next};!($0 in old)' $LOGGED_TODAY_FILE $DONE_TODAY_FILE > $LOG_NOW_FILE
    else # nothing yet logged from today
        cp -f $DONE_TODAY_FILE $LOG_NOW_FILE
        rm $LOGGED_TODAY_FILE  # start a fresh 'LoggedToday.txt'
    fi
else # Log the whole file, then copy done file to logged file
   cp -f $DONE_TODAY_FILE $LOG_NOW_FILE
fi
# then if the log_now file contains entries, log them, and append the newly logged list to the existing logged list
if [ -s $LOG_NOW_FILE ] ; then
echo "" > "tmp_pretty.txt"
cat $LOG_NOW_FILE | awk -v prj_prfx="$PROJECT_PREFIX" '
BEGIN {FS="\|"; prj=0; str=""}
{
    if (prj!=$5) {prj=$5;
        if (prj!="") {print ("\n" prj_prfx prj "[:](omnifocus:///task/" $2 ")") >> "tmp_pretty.txt" }
        else {print ("\nInbox[:](omnifocus:///task/" $1 ")") >> "tmp_pretty.txt"}
  }
  if ($6!=prj) {print ("- " $6 " @done(" $4 ")") >> "tmp_pretty.txt"  }
  else {{print "- *Project completed* @done(" $4 ")"  >> "tmp_pretty.txt" }}
}'
# cat tmp_pretty.txt
cat tmp_pretty.txt | /usr/local/bin/dayone2 new
rm tmp_pretty.txt
cat $LOG_NOW_FILE >> $LOGGED_TODAY_FILE  # Append the list of logged tasks to avoid duplication

# Optional acoustic feedback on completion... Comment the next line out if it's distracting
afplay /System/Library/Sounds/Pop.aiff
fi

