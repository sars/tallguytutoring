$(document).ready(function(){
    $(".copy-link.brandon").zclip({
        path: '/assets/ZeroClipboard.swf',
        copy: $('.copy-link.brandon').text(),
        afterCopy: function(){
            $(".copied-msg").css("display", "block");
            setTimeout(function() {
                $(".copied-msg").css("display", "none");
            }, 3000);
        }
    });
});
