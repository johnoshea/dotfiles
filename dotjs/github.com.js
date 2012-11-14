$(function() {
    if ($('body').hasClass('page-commits')) {

        $('ul.pagehead-actions').prepend('<li><a class="minibutton btn-watch" href="#" id="toggle-merges-button"><span><span class="icon"></span><span class="text">Review</span></span></a></li>');

        $('#toggle-merges-button').toggle(function() {
            $('li.commit').each(function() {
                var t = $(this).find('a.message').text().substring(0, 5);
                if (t === 'Merge' || t === 'merge') {
                    $(this).hide();
                    return;
                }
            });
            $('span.text', this).text('Stop reviewing');
        }, function() {
            $('li.commit').show();
            $('span.text', this).text('Review');
        });
    }
});
