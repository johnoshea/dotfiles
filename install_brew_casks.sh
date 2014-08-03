#!/usr/local/bin/zsh

programs=(adobe-creative-cloud airfoil audacity balsamiq-mockups bartender boot2docker chromium chronosync codekit colloquy consul cord dash default-folder-x electric-sheep ember evernote ffmpegx firefox flux garmin-express google-adwords-editor google-chrome google-drive google-earth googleappenginelauncher gpgtools handbrake hazel imageoptim istumbler iterm2 java jedit keyboard-maestro kindle kismac launchbar launchcontrol macvim mailmate marked mediainfo menumeters mindnode-pro moom mountain nvalt omnidisksweeper omnifocus omnigraffle omnioutliner omniplan omnipresence onepassword parallels path-finder pdfpen pgadmin3 phantomjs pycharm rcdefaultapp reggy rescuetime screenflow scrivener seil skype soulver sourcetree teamviewer textexpander the-unarchiver tinkertool transmission transmit unicodechecker vagrant vagrant-manager virtualbox virtualhostx viscosity vlc ynab)

for program in $programs; do
    brew cask install $program
done
