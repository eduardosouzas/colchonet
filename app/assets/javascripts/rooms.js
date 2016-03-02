$(function() {
    function highlightStars(elem) {
        elem.parent().children('label').removeClass('toggled');
        elem.addClass('toggled').prevAll('label')
            .addClass('toggled');
    }
    highlightStars($('.review input:checked + label'));

    var $stars = $('.review input:enabled ~ label');

    $stars.on('mouseenter', function() {
        highlightStars($(this));
    });
    $stars.on('mouseleave', function() {
        highlightStars($('.review input:checked + label'));
    });
    $('.review input').on('change', function() {
        $stars.off('mouseenter').off('mouseleave').off('click');
        $(this).parent('form').submit();
    });

});