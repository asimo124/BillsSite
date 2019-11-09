$(document).ready(function() {
    $('nav li ul').hide().removeClass('fallback');
    $('nav li').hover(
        function () {
            $('ul', this).stop().slideDown(100);
        },
        function () {
            $('ul', this).stop().slideUp(100);
        }
    );
})/**
 * Created by ahawley on 9/26/2017.
 */
