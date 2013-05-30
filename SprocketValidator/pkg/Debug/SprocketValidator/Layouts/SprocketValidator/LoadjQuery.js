if (typeof jQuery == 'undefined') {
    // load jquery 
    var script = document.createElement('script');
    script.type = "text/javascript";
    script.src = "_layouts/SprocketValidator/jQuery.js";
    document.getElementsByTagName('head')[0].appendChild(script);
} else {
    //already loaded
}

