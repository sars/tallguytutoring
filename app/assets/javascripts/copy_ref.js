$(document).ready(function(){
    var hasFlash = false;
    try {
        hasFlash = Boolean(new ActiveXObject('ShockwaveFlash.ShockwaveFlash'));
    } catch(exception) {
        hasFlash = ('undefined' != typeof navigator.mimeTypes['application/x-shockwave-flash']);
    }

    hasFlash && $(".copy-link.brandon").zclip({
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
