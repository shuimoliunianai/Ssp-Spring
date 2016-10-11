<!DOCTYPE html>
<html>
<head>
    <title>Advertisment</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale= 1.0, maximum-scale= 1.0, minimum-scale=1.0, user-scalable=no" />
    <style id="glftSspStyleBase">
        html, body, div, span, applet, object, iframe,
        h1, h2, h3, h4, h5, h6, p, blockquote, pre,
        a, abbr, acronym, address, big, cite, code,
        del, dfn, em, img, ins, kbd, q, s, samp,
        small, strike, strong, sub, sup, tt, var,
        b, u, i, center,
        dl, dt, dd, ol, ul, li,
        fieldset, form, label, legend,
        table, caption, tbody, tfoot, thead, tr, th, td,
        article, aside, canvas, details, embed,
        figure, figcaption, footer, header, hgroup,
        menu, nav, output, ruby, section, summary,
        time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }

        /* HTML5 display-role reset for older browsers */
        article, aside, details, figcaption, figure,
        footer, header, hgroup, menu, nav, section {
            display: block;
        }

        body {
            line-height: 1;
        }

        ol, ul {
            list-style: none;
        }

        blockquote, q {
            quotes: none;
        }

        blockquote:before, blockquote:after,
        q:before, q:after {
            content: '';
            content: none;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        a {
            color: #000000;
            text-decoration: none;
            border: 0;
        }

        #overlay {
            position: absolute;
            opacity: 0.8;
            z-index: 1;
            width: 0px;
            height: 0px;
            background-color: #000000;
        }

        .advertismentLabel {
            bottom: 3px;
            left: 6px;
            font-family: arial;
            color: #FFFFFF;
            z-index: 100000000;
            font-size: 1.5em;
            display: block;
            text-shadow: 1px 1px 5px #000000, -1px -1px 5px #000000, 1px 1px 5px #000000, -1px -1px 5px #000000;
            position: absolute;
        }

        /* Small screens */
        @media only screen {
            .glftSspAdClose {
                width: 15px;
            }
        } /* Define mobile styles */

        @media only screen and (min-width: 20em) {
            .glftSspAdClose {
                width: 30px;
            }
        } /* min-width XXXpx, XXX screens */

        /* Medium screens */
        @media only screen and (min-width: 40em) {
            .glftSspAdClose {
                width: 40px;
            }
        } /* min-width 641px, medium screens */

        /* Large screens */
        @media only screen and (min-width: 64em) {
            .glftSspAdClose {
                width: 40px;
            }
        } /* min-width 1025px, large screens */

        /* XLarge screens */
        @media only screen and (min-width: 90em) {
            .glftSspAdClose {

            }
        } /* min-width 1441px, xlarge screens */

        /* XXLarge screens */
        @media only screen and (min-width: 120.063em) {
            .glftSspAdClose {

            }
        } /* min-width 1921px, xxlarge screens */

        /* GLADS CSS Breakpoints */
        @media only screen and (min-width: 1px) {
            body {
                font-size: 20%
            }
        }

        @media only screen and (min-width: 270px) {
            body {
                font-size: 35%
            }
        }

        @media only screen and (min-width: 320px) {
            body {
                font-size: 38%
            }
        }

        @media only screen and (min-width: 360px) {
            body {
                font-size: 45%
            }
        }

        @media only screen and (min-width: 470px) {
            body {
                font-size: 48%
            }
        }

        @media only screen and (min-width: 470px) and (orientation: portrait) {
            body {
                font-size: 55%
            }
        }

        @media only screen and (min-width: 570px) {
            body {
                font-size: 65%
            }
        }

        @media only screen and (min-width: 650px) {
            body {
                font-size: 68%
            }
        }

        @media only screen and (min-width: 900px) {
            body {
                font-size: 81%
            }
        }

        @media only screen and (min-width: 1000px) {
            body {
                font-size: 84%
            }
        }

        @media only screen and (min-width: 1080px) and (orientation: portrait) {
            body {
                font-size: 98%
            }
        }

        @media only screen and (min-width: 1100px) {
            body {
                font-size: 87%
            }
        }

        @media only screen and (min-width: 1200px) {
            body {
                font-size: 90%
            }
        }

        @media only screen and (min-width: 1500px) {
            body {
                font-size: 105%
            }
        }

        @media only screen and (min-width: 1900px) {
            body {
                font-size: 130%
            }
        }

        @media only screen and (min-width: 2500px) {
            body {
                font-size: 140%
            }
        }

        #glftSspContainer {
            position: absolute;
            overflow: hidden;
        {% if adWidth is defined %}
            width: {{ adWidth }}px;
        {% endif %}
        {% if adHeight is defined %}
            height: {{ adHeight }}px;
        {% endif %}
            z-index: 1000;
        }
    </style>
    {[gl_tracking_js]}
    <script type="text/javascript" id="glftSspJsBase">
        // OS
        var _os = '{{ os }}';

        var glftSspIHttp = {
            iReq: function () {
                if (window.XMLHttpRequest) {
                    return new XMLHttpRequest()
                } else {
                    if (window.ActiveXObject) {
                        return new ActiveXObject("Microsoft.XMLHTTP")
                    }
                }
                return false
            }, async: true, call: function (a) {
                this.request = this.iReq();
                if (this.request) {
                    this.request.open("GET", a, this.async);
                    this.request.send()
                }
            }, post: function (a, b) {
                this.request = this.iReq();
                if (this.request) {
                    this.request.open("POST", a, this.async);
                    this.request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    this.request.send(b)
                }
            }
        };

        var glftSspTracker = {
            track: function (trackingUrl) {
                try {
                    glftSspIHttp.call(trackingUrl);
                    glftSspIHttp.request.timeout = 4000;

                    if (iHttp.request.readyState == 4) {
                        // do something?
                    }
                } catch (e) {
                }
            }
        };

        var glftSspRouter = {
            redirect: function (destination) {
                if (_os == 'win' || _os == 'winp' || _os == 'WINDOWS') {
                    window.external.notify(destination);
                }
                else {
                    window.location = destination;
                }
            }
        };

        // Prefixes and IDs
        var locationId = typeof glLocationId != 'undefined' ? glLocationId : '{[location_id]}';
        var statsURL = typeof glStatsUrl != 'undefined' ? glStatsUrl : '{[statsUrl]}';

        var glftImpressionHandler = {
            handle: function() {
                // Glads impression tracking url
                var gladsImpressionTrackingUrl = statsURL + '{[impTrackUrl]}';

                // Tracking Impression
                glftSspTracker.track(gladsImpressionTrackingUrl);

                {% if sspBeaconUrl is not empty %}
                // SSP Beacon URL
                var sspBeaconUrl = '{{ sspBeaconUrl }}';

                // Send Beacon tracking
                glftSspTracker.track(sspBeaconUrl);
                {% endif %}

                {% if partnerImpTrackUrls is not empty %}
                // Partner's impression tracking URLs
                var partnerImpressionTrackingUrls = {{ partnerImpTrackUrls }};

                // Tracking Partner Impressions
                if (partnerImpressionTrackingUrls && typeof(partnerImpressionTrackingUrls) == 'object') {
                    for (var key in partnerImpressionTrackingUrls) {
                        glftSspTracker.track(partnerImpressionTrackingUrls[key]);
                    }
                }
                {% endif %}

                // GLOT tracking
                var gladsGlotTrackingImpressionUrl = '{[gladsGlotTrackingImpressionUrl]}';
                gladsGlotTrackingImpressionUrl = gladsGlotTrackingImpressionUrl.replace('%%location_id%%', locationId);
                if (gladsGlotTrackingImpressionUrl.indexOf('track:') > -1) {
                    glftSspRouter.redirect(gladsGlotTrackingImpressionUrl);
                }
            }
        }
    </script>
</head>
<body>
{% if os == 'win' OR os == 'winp' OR os == 'WINDOWS' %}
<script type="text/javascript">
    document.body.style.backgroundColor = '#000000';
</script>
{% endif %}
<div id="overlay"></div>
<span id="advertismentLabel" class="advertismentLabel">
        {[i18n_advertisment]}{% if debugAlert is not empty %} - {{ debugAlert }}{% endif %}
</span>
<iframe id="glftSspContainer" src="about:blank" scrolling="no"></iframe>

<script text="text/javascript">
    // Interrupt Object used by interrupt partial
    var glftSspAdInterruptAdapter = function () {
        var _this = this;

        this.pause = function () {
            return true;
        }

        this.resume = function () {
            return true;
        }

        this.close = function () {
            {% if closeButton is not empty and closeButton == 'yes' %}
            glftSspRouter.redirect('exit:');
            {% endif %}
        }

        this.onBackPressed = function () {
            {% if closeButton is not empty and  closeButton == 'yes' %}
            glftSspRouter.redirect('exit:');
            {% endif %}
        }
    }

    var glftSspAdInterruptAdapterObject = new glftSspAdInterruptAdapter();
</script>

{# Include interrupt partial #}
{{ partial("shared/ads/partials/glftSspInterrupts") }}

<script type="text/javascript">
    var Base64 = {
        _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

        encode: function (input) {
            var output = "";
            var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
            var i = 0;

            input = Base64._utf8_encode(input);

            while (i < input.length) {

                chr1 = input.charCodeAt(i++);
                chr2 = input.charCodeAt(i++);
                chr3 = input.charCodeAt(i++);

                enc1 = chr1 >> 2;
                enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
                enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
                enc4 = chr3 & 63;

                if (isNaN(chr2)) {
                    enc3 = enc4 = 64;
                } else if (isNaN(chr3)) {
                    enc4 = 64;
                }

                output = output + this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) + this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

            }

            return output;
        },


        decode: function (input) {
            var output = "";
            var chr1, chr2, chr3;
            var enc1, enc2, enc3, enc4;
            var i = 0;

            input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

            while (i < input.length) {

                enc1 = this._keyStr.indexOf(input.charAt(i++));
                enc2 = this._keyStr.indexOf(input.charAt(i++));
                enc3 = this._keyStr.indexOf(input.charAt(i++));
                enc4 = this._keyStr.indexOf(input.charAt(i++));

                chr1 = (enc1 << 2) | (enc2 >> 4);
                chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
                chr3 = ((enc3 & 3) << 6) | enc4;

                output = output + String.fromCharCode(chr1);

                if (enc3 != 64) {
                    output = output + String.fromCharCode(chr2);
                }
                if (enc4 != 64) {
                    output = output + String.fromCharCode(chr3);
                }

            }

            output = Base64._utf8_decode(output);

            return output;

        },

        _utf8_encode: function (string) {
            string = string.replace(/\r\n/g, "\n");
            var utftext = "";

            for (var n = 0; n < string.length; n++) {

                var c = string.charCodeAt(n);

                if (c < 128) {
                    utftext += String.fromCharCode(c);
                }
                else if ((c > 127) && (c < 2048)) {
                    utftext += String.fromCharCode((c >> 6) | 192);
                    utftext += String.fromCharCode((c & 63) | 128);
                }
                else {
                    utftext += String.fromCharCode((c >> 12) | 224);
                    utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                    utftext += String.fromCharCode((c & 63) | 128);
                }

            }

            return utftext;
        },

        _utf8_decode: function (utftext) {
            var string = "";
            var i = 0;
            var c = c1 = c2 = 0;

            while (i < utftext.length) {

                c = utftext.charCodeAt(i);

                if (c < 128) {
                    string += String.fromCharCode(c);
                    i++;
                }
                else if ((c > 191) && (c < 224)) {
                    c2 = utftext.charCodeAt(i + 1);
                    string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                    i += 2;
                }
                else {
                    c2 = utftext.charCodeAt(i + 1);
                    c3 = utftext.charCodeAt(i + 2);
                    string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                    i += 3;
                }

            }

            return string;
        }

    }

    var glftSspProcessor = {
        addClose: function (closeImgUrl) {
            var closeAnchor = document.createElement('a');
            closeAnchor.href = 'exit:';
            closeAnchor.style.position = 'absolute';
            closeAnchor.style.right = 0;
            closeAnchor.style.top = 0;
            closeAnchor.style.zIndex = 1000005;

            var closeImage = document.createElement('img');
            closeImage.src = closeImgUrl;
            closeImage.id = 'glftSspAdClose';
            closeImage.className = 'glftSspAdClose';
            closeImage.style.position = 'relative';
            closeImage.style.cursor = 'pointer';
            closeImage.style.right = 0;
            closeImage.style.top = 0;

            closeAnchor.appendChild(closeImage);

            document.body.appendChild(closeAnchor);
        }
    };

    var glftSspAdjuster = {
        // Core IMG Object
        IMG_ELEM: 0,

        // Core IMG details - will be adapted on the fly based on detected ratio
        IMG_HEIGHT: 0,
        IMG_WIDTH: 0,

        // Resized width/height holders
        IMG_RESIZED_WIDTH: 0,
        IMG_RESIZED_HEIGHT: 0,

        // stored viewport dimensions
        STORED_VIEWPORT_HEIGHT: 0,
        STORED_VIEWPORT_WIDTH: 0,

        // Viewport dimensions getter
        getViewportDimensions: function () {
            var viewportWidth;
            var viewportHeight;

            // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
            if (typeof window.innerWidth != 'undefined') {
                viewportWidth = window.innerWidth;
                viewportHeight = window.innerHeight;
            }
            // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
            else if (typeof document.documentElement != 'undefined'
                    && typeof document.documentElement.clientWidth !=
                    'undefined' && document.documentElement.clientWidth != 0) {
                viewportWidth = document.documentElement.clientWidth;
                viewportHeight = document.documentElement.clientHeight;
            }
            // older versions of IE
            else {
                viewportWidth = document.getElementsByTagName('body')[0].clientWidth;
                viewportHeight = document.getElementsByTagName('body')[0].clientHeight;
            }

            return {
                width: viewportWidth,
                height: viewportHeight
            };
        },

        processOverlay: function (overlay) {
            if (typeof overlay.offsetHeight == 'undefined' || overlay.offsetHeight == null ||
                    typeof overlay.offsetWidth == 'undefined' || overlay.offsetWidth == null
            ) {
                overlay.style.display = 'none';
                return false;
            }

            viewportDimensions = this.getViewportDimensions();

            var currentViewportHeight = viewportDimensions['height'];
            var currentViewportWidth = viewportDimensions['width'];

            // Setting overlay
            overlay.style.height = currentViewportHeight + 'px';
            overlay.style.width = currentViewportWidth + 'px';

            var _this = this;
            setTimeout(
                    function () {
                        _this.processOverlay(overlay);
                    },
                    100
            );
        },

        alignSspContainer: function (container) {
            if (container == null || typeof container == 'undefined') {
                return false;
            }

            if (typeof container.offsetHeight == 'undefined' || container.offsetHeight == null ||
                    typeof container.offsetWidth == 'undefined' || container.offsetWidth == null
            ) {
                return false;
            }

            viewportDimensions = this.getViewportDimensions();

            var currentViewportHeight = viewportDimensions['height'];
            var currentViewportWidth = viewportDimensions['width'];

            calculatedScaleCoefficient = 1;
            adRatio = container.offsetWidth / container.offsetHeight;
            currentViewportRatio = currentViewportWidth / currentViewportHeight;
            if (currentViewportRatio > adRatio) {
                calculatedScaleCoefficient = currentViewportHeight / container.offsetHeight;
            } else {
                calculatedScaleCoefficient = currentViewportWidth / container.offsetWidth;
            }

            scaleCoefficient = 1;
            if (allowScale == true) {
                {% if scaleToFit is not empty %}
                scaleCoefficient = calculatedScaleCoefficient;

                {% if scaleCoefficient is not empty %}
                scaleCoefficient = {{ scaleCoefficient }};
                {% endif %}

                // CSS 3 transform
                container.style.transform = 'scale(' + scaleCoefficient + ')';
                container.style.transformOrigin = '0 0';
                // webkit transform
                container.style.webkitTransform = 'scale(' + scaleCoefficient + ')';
                container.style.webkitTransformOrigin = '0 0';
                // mozilla transform
                container.style.MozTransform = 'scale(' + scaleCoefficient + ')';
                container.style.MozTransformOrigin = '0 0';
            }
            {% endif %}

            //if (currentViewportHeight != this.STORED_VIEWPORT_HEIGHT || currentViewportWidth != this.STORED_VIEWPORT_WIDTH) {
                // Aligning to center
                containerTop = Math.round((currentViewportHeight - Math.round(parseInt(container.offsetHeight * scaleCoefficient))) / 2);
                containerLeft = Math.round((currentViewportWidth - Math.round(parseInt(container.offsetWidth * scaleCoefficient))) / 2);

                if (containerTop < 0) {
                    containerTop = 0;
                }

                if (containerLeft < 0) {
                    containerLeft = 0;
                }

                container.style.top = containerTop + 'px';
                container.style.left = containerLeft + 'px';

                // Storing new dimensions
                this.STORED_VIEWPORT_HEIGHT = currentViewportHeight;
                this.STORED_VIEWPORT_WIDTH = currentViewportWidth;
            //}

            var _this = this;
            setTimeout(
                    function () {
                        _this.alignSspContainer(container);
                    },
                    100
            );
        }
    }

    // Glads click tracking url
    var gladsClickTrackingUrl = statsURL + '{[clickTrackUrl]}';

    // Glads close image url
    var gladsCloseImageUrl = '{[closeImgUrl]}';

    // Markup
    var partnerMarkupBase64Encoded = '{{ ad_markup }}';

    /**
     * The iframe will seem to be the main window.
     * It's not working for IE.
     * 
     * @param  object iframeWindow
     * @return void
     */
    function deceiveIframe(iframeWindow) {
        if (iframeWindow && typeof(iframeWindow) == 'object') { 
            // make iframe to detect as main window
            try {
                iframeWindow.top = iframeWindow.self;
            } catch(e) {}

            // set owner document to the current iframe
            try {
                iframeWindow.document.head.ownerDocument = iframeWindow.document;
            } catch(e) {}

            // set the parent field
            try {
                iframeWindow.parent = {
                    // set location to the iframe
                    location: (iframeWindow.location) ?
                        iframeWindow.location :
                        (iframeWindow.document && iframeWindow.document.location) ?
                            iframeWindow.document.location :
                            undefined,
                    // add circular reference as normally it's set
                    parent: iframeWindow.parent,
                    document: iframeWindow.document,
                    window: iframeWindow
                };

            } catch(e) {}
        }
    }
    //glftImpressionHandlerDebug
    function glftImpressionHandlerDebug(partnerMarkupBase64Encoded)
    {
         var gladsImpressionTrackingUrl = statsURL + '{[impTrackUrl]}';
         var tmpPartnerMarkupBase64Decoded = Base64.decode(partnerMarkupBase64Encoded);
         var tmpStr = tmpPartnerMarkupBase64Decoded.substring(0,tmpPartnerMarkupBase64Decoded.lastIndexOf('\<\/script\>'));
         var enCodeResultStr = '';


         {% if sspBeaconUrl is not empty %}
         var sspBeaconUrl = '{{ sspBeaconUrl }}';
         {% else %}
         var sspBeaconUrl = '';
         {% endif %}

        
        {% if partnerImpTrackUrls is not empty %}      
          var partnerImpressionTrackingUrls = {{ partnerImpTrackUrls }};
          partnerImpressionTrackingUrls = window.JSON.stringify(partnerImpressionTrackingUrls);       
         {% else %}
          var partnerImpressionTrackingUrls = '';
         {% endif %}
         var scriptContent ='\<\/script\>\<script\>'  
                        +'var sspBeaconUrl = "'+ sspBeaconUrl +'";'
                        + 'var partnerImpressionTrackingUrls = ' + partnerImpressionTrackingUrls + ';'
                        + 'var gladsImpressionTrackingUrl ="'+ gladsImpressionTrackingUrl +'";'
                        + 'var images = new Array()'+';'
                        + 'if (partnerImpressionTrackingUrls.length > 0)'
                        + '{' 
                        + '  for (var i=0;i<partnerImpressionTrackingUrls.length;i++)'
                        + '    {'
                        + '       images.push(partnerImpressionTrackingUrls[i])'+';'
                        + '    }'
                        + '}'
                        + 'if (gladsImpressionTrackingUrl.length > 0)'
                        + '{'
                        + '  images.push(gladsImpressionTrackingUrl)'+';'
                        + '}'
                        + 'if (sspBeaconUrl.length > 0)'
                        + '{'
                        + '  images.push(sspBeaconUrl)'+';'
                        + '}'
                        + 'if (images.length > 0)'
                        + '{'
                        + '  for (var j=0;j<images.length;j++)'
                        + '   {'
                        + '      var imageObject = new Image()'+';'
                        + '      imageObject.src = images[j]' + ';'
                        + '   }'
                        + '}'
                        + '\<\/script\>\<\/body\>\<\/html\>';

         tmpStr +=  scriptContent;
         enCodeResultStr = Base64.encode(tmpStr);
         
         return enCodeResultStr;
    }

    {% if delayScale is not empty %}
    var allowScale = false;
    {% else %}
    var allowScale = true;
    {% endif %}

    window.addEventListener('load', function () {
        setTimeout(
                function () {
                    allowScale = true;
                },
                5000
        );

        // == Preparing iframe with ad content START ==

        // fetching base style
        baseStyle = document.getElementById('glftSspStyleBase').innerHTML;

        // fetching base js
        baseJs = document.getElementById('glftSspJsBase').innerHTML;

        // fetching iframe container
        iframeHtmlObject = document.getElementById('glftSspContainer');

        // fetching iframe content obj
        iframeContent = (iframeHtmlObject.contentWindow) ? iframeHtmlObject.contentWindow : (iframeHtmlObject.contentDocument.document) ? iframeHtmlObject.contentDocument.document : iframeHtmlObject.contentDocument;

        // fetching iframe window object
        iframeWindow = iframeHtmlObject.contentWindow || iframeHtmlObject;

        deceiveIframe(iframeWindow);

        // opening content to write
        iframeContent.document.open();

        // Intercept js alerts & js confirms and *remove* the unwanted ad
        iframeWindow.alert = iframeWindow.confirm = function() {
            iframeWindow.onbeforeunload = iframeWindow.onunload = null;
            iframeWindow.location.href = 'about:blank';
            // also empty the partner markup
            partnerMarkupBase64Encoded = '';
        }
        //add impression debug
       {% if requestType == 'fullscreen' %}
        var base64Code = glftImpressionHandlerDebug(partnerMarkupBase64Encoded);
        {% else %}
        var base64Code = partnerMarkupBase64Encoded
        {% endif %}
        // writing the AD with full container and style
        iframeContent.document.write(
            '<html>' +
            '<head>' +
                '<meta http-equiv="Content-Type" content="text/html, charset=UTF-8">' +
                '<style type="text/css">' + baseStyle + '</style>' +
            '</head>' +
            '<body>' +
                Base64.decode(base64Code) +
            '</body>' +
            '</html>'
        );

        // closing iframe document
        iframeContent.document.close();
        
        deceiveIframe(iframeWindow);

        // Call tracking
        {% if requestType != 'fullscreen' %}
        glftImpressionHandler.handle();
         {% endif %}
        // Override iframe open functionality to allow us to intercept link opening via javascript
        iframeWindow.open = function(url) {
            glftSspRouter.redirect('link:' + url);
        }

        // Parse through all images and hide 1x1 pixel trackers
        var trackingImagesParser = function(iframeContent) {
            iframeImages = iframeContent.document.getElementsByTagName('img');
            if (typeof iframeImages != 'undefined' && iframeImages != '' && iframeImages != null && iframeImages.length > 0) {
                for (var i = 0; i < iframeImages.length; i++) {
                    if (iframeImages[i].width === 1 && iframeImages[i].height === 1) {
                        iframeImages[i].width = iframeImages[i].height = 0;
                    }
                }
            }
        }(iframeContent);

        // looping on the iframe, attaching link: as needed
        var iframeAnchorParser = function (iframeContent, noRepeat) {
            iframeAnchors = iframeContent.document.getElementsByTagName('a');

            if (typeof iframeAnchors != 'undefined' && iframeAnchors != '' && iframeAnchors != null && iframeAnchors.length > 0) {
                for (var i = 0; i < iframeAnchors.length; i++) {
                    if (iframeAnchors[i].href.indexOf('http') != -1) {
                        if (iframeAnchors[i].href.indexOf('link:') == -1 && (_os != 'win' && _os != 'winp' && _os != 'WINDOWS')) {
                            iframeAnchors[i].href = 'link:' + iframeAnchors[i].href;
                        } else if (_os == 'win' || _os == 'winp' || _os == 'WINDOWS') {
                            // check not already bound
                            alreadyBoundAttribute = iframeAnchors[i].getAttribute('data-alreadybound');
                            if (alreadyBoundAttribute == null || typeof alreadyBoundAttribute == 'undefined' || alreadyBoundAttribute == '') {
                                // set already bound
                                iframeAnchors[i].setAttribute('data-alreadybound', 'yes');

                                // bind click to redirect and prevent default
                                iframeAnchors[i].addEventListener('click', function (e) {
                                    glftSspRouter.redirect('link:' + this.href);

                                    e.preventDefault();
                                    return false;
                                });
                            }
                        }
                    }
                }
            }

            if (!noRepeat) {
                setTimeout(
                        function () {
                            iframeAnchorParser(iframeContent);
                        },
                        100
                );
            }
        };
        
        /**
         * Attach callback function for a native function.
         *
         * @param  function originalFunc
         * @param  string callbackType  possible values: before, after
         * @param  function callbackAfter
         * 
         * @return function
         */
        function callbackDecorator(originalFunc, callbackType, callback) {
            return function() {

                // run the callback function before
                if (typeof (callback) == 'function' && typeof (callbackType) == 'string' && callbackType == 'before') {
                    try { callback(arguments); } catch (e) {}
                }

                // run decorated function
                var result = undefined;
                try {
                    result = originalFunc.apply(this, arguments);
                } catch (e) {}

                // run the callback function before
                if (typeof (callback) == 'function' && typeof (callbackType) == 'string' && callbackType == 'after') {
                    try { callback(result); } catch (e) {}
                }

                // return the original function result
                return result;
            };
        }

        // callback for appendChild function
        try {
            iframeWindow.Element.prototype.appendChild = callbackDecorator(
                iframeWindow.Element.prototype.appendChild, 'after',
                function (result) {
                    iframeAnchorParser(iframeContent, true);
                }
            );
        } catch(e) {}

        // callback for insertBefore function
        try {
            iframeWindow.Element.prototype.insertBefore = callbackDecorator(
                iframeWindow.Element.prototype.insertBefore, 'after',
                function (result) {
                    iframeAnchorParser(iframeContent, true);
                }
            );
        } catch(e) {}

        iframeAnchorParser(iframeContent);

        {% if imageSizeHackV1 is not empty %}
            // looping on the iframe, modifying
            var iframeImageParser = function (iframeContent) {
                iframeImages = iframeContent.document.getElementsByTagName('img');

                if (typeof iframeImages != 'undefined' && iframeImages != '' && iframeImages != null && iframeImages.length > 0) {
                    for (var i = 0; i < iframeImages.length; i++) {
                        var imageWidth = iframeImages[i].clientWidth;
                        var imageHeight = iframeImages[i].clientHeight;
                        var ratio = 0;
                        var windowWidth = iframeContent.window.innerWidth;
                        var windowHeight = iframeContent.window.innerHeight;

                        // Check if the current width is larger than the max
                        if(imageWidth > windowWidth){
                            ratio = windowWidth / imageWidth;   // get ratio for scaling image
                            iframeImages[i].style.maxHeight = imageHeight * ratio;
                            iframeImages[i].style.maxWidth = windowWidth;
                            imageHeight = imageHeight * ratio;    // Reset height to match scaled image
                            imageWidth = imageWidth * ratio;    // Reset width to match scaled image
                        }

                        // Check if current height is larger than max
                        if(imageHeight > windowHeight){
                            ratio = windowHeight / imageHeight; // get ratio for scaling image
                            iframeImages[i].style.maxHeight = windowHeight;
                            iframeImages[i].style.maxWidth = imageWidth * ratio;
                            imageWidth = imageWidth * ratio;    // Reset width to match scaled image
                            imageHeight = imageHeight * ratio;    // Reset height to match scaled image
                        }
                    }
                }

                setTimeout(
                        function () {
                            iframeImageParser(iframeContent);
                        },
                        100
                );
            };
            iframeImageParser(iframeContent);
        {% endif %}

        {% if loggerUrl is not empty %}

            /**
             * Keep track of already notified iframes to avoid duplicate debug.
             */
            var alreadyNotifiedIframes = [];

            /**
             * Logger url for tracking.
             */
            var loggerUrl = '{{ loggerUrl }}';
            
            /**
             * Partner name for tracking.
             */
            var partnerName = '{% if partnerName is not empty %}{{ partnerName }}{% endif %}';
            
            /**
             * Check for uncaught iFrames
             */
            var checkIframes = function (iframeContent) {
                if (!loggerUrl || loggerUrl == '') {
                    return false;
                }

                if (iframeContent && iframeContent.document && iframeContent.document.getElementsByTagName) {
                    var ifrs = iframeContent.document.getElementsByTagName('iframe');
                    for (i = 0; i < ifrs.length; i++) {
                        try {
                            if (
                                // is not already discovered
                                !ifrs[i].hasAttribute('src') ||
                                ifrs[i].getAttribute('src').indexOf('http') !== 0 ||
                                ifrs[i].getAttribute('src').indexOf('http://201205igp.gameloft.com/redir/ecomm/') == 0 ||
                                alreadyNotifiedIframes.indexOf(ifrs[i].getAttribute('src')) >= 0 ||
                                (
                                    ifrs[i].style &&
                                    (
                                        // is not visible
                                        ifrs[i].style.visibility == 'hidden' ||

                                        // is not displayed
                                        ifrs[i].style.display == 'none' ||

                                        // width or height is zero
                                        parseInt(ifrs[i].style.width) == 0 ||
                                        parseInt(ifrs[i].style.height) == 0 ||

                                        // max width or max height is zero
                                        parseInt(ifrs[i].style.maxWidth) == 0 ||
                                        parseInt(ifrs[i].style.maxHeight) == 0
                                    )
                                ) ||

                                // width or height attributes are zero
                                (
                                    ifrs[i].hasAttribute('width') && 
                                    parseInt(ifrs[i].getAttribute('width')) == 0
                                ) ||
                                (
                                    ifrs[i].hasAttribute('height') && 
                                    parseInt(ifrs[i].getAttribute('height')) == 0
                                )
                            ) {
                                continue;
                            }

                            var loggingRequest = new Image();
                            loggingRequest.src = loggerUrl + '?partner=' + encodeURIComponent(partnerName) + '&parent_src=' + encodeURIComponent(window.location.href) + '&uncaught_src=' + encodeURIComponent(ifrs[i].getAttribute('src'));
                            alreadyNotifiedIframes.push(ifrs[i].getAttribute('src'));
                        } catch (e) { }
                    }

                    window.setTimeout(checkIframes, 300);
                }
            }

            // Check for uncaught iFrames at run time
            checkIframes(iframeContent);
        {% endif %}
        
        // == Preparing iframe with ad content END ==

        // Can we pause music?
        var can_pause_music = '{[can_pause_music]}';

        {% if closeButton == 'yes' %}
        // Adding close button
        glftSspProcessor.addClose(gladsCloseImageUrl);

        // Check if we can pause music
        if (can_pause_music == '1') {
            if (_os == "win" || _os == "winp" || _os == "WINDOWS") {
                window.external.notify('pauseusermusic:');
            } else {
                document.location = 'pauseusermusic:';
            }
        }
        {% endif %}

        sspContainer = document.getElementById('glftSspContainer');
        glftSspAdjuster.alignSspContainer(sspContainer);

        clickTrackingDone = false;
        iframeContent.addEventListener('click', function () {
            if (clickTrackingDone == false) {
                clickTrackingDone = true;
                glftSspTracker.track(gladsClickTrackingUrl);

                {% if partnerClickTrackingUrl is not empty %}
                glftSspTracker.track('{{ partnerClickTrackingUrl }}');
                {% endif %}
            }

            {% if partnerFulfillmentUrl is not empty %}
            var partnerFulfillmentUrl = '{{ partnerFulfillmentUrl }}';
            glftSspRouter.redirect('link:' + partnerFulfillmentUrl);
            {% endif %}
        }, false);
    });
    var overlay = '{{ overlay }}';
    if (overlay == 'yes') {
        glftSspAdjuster.processOverlay(document.getElementById('overlay'));
    }
</script>
</body>
</html>