<!DOCTYPE html>
<!--<html dir="{[text_direction]}">-->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html, charset=UTF-8"/>

    {# Include circular timer #}
    {{ partial("../../../views/shared/ads/partials/glftSspVideoBaseCss") }}

    {[gl_tracking_js]}

    {# Include tools partial #}
    {{ partial("../../../views/shared/ads/partials/glftSspTools") }}

    <script type="text/javascript">
        var glftSspProcessor = {
            addDebugText: function () {
                var debugDiv = document.createElement('div');
                debugDiv.href = 'exit:';
                debugDiv.style.position = 'absolute';
                debugDiv.style.left = 0;
                debugDiv.style.top = 0;
                debugDiv.style.width = "50px";
                debugDiv.style.height = "50px";
                debugDiv.style.backgroundColor = "#FF0000";
                debugDiv.style.zIndex = 1000005;

                document.body.appendChild(debugDiv);
            }
        };

        function cancelYes() {
            glftSspRouter.redirect(videoStatus.exitString);
        }

        function cancelNo() {
            glftSspVideoStateHandlerObject.changePopupState('hide');

            videoStatus.paused = false;

            document.getElementById('videoObject').play();

            if (videoStatus.ended == true) {
                videoStatus.ended = false;
                glftPlayerUtils.counterControl();
            }
        }

        function manipulateClass(element, classString, typeOfAction) {
            if (typeof typeOfAction == 'undefined') {
                typeOfAction == 'add';
            }
            if (typeOfAction == 'add') {
                if (document.getElementById(element).className.indexOf(classString) == -1) {
                    document.getElementById(element).className += ' ' + classString;
                }
            } else if (typeOfAction == 'remove') {
                if (document.getElementById(element).className.indexOf(classString) != -1) {
                    var theNewClass = document.getElementById(element).className.replace(' ' + classString, '');
                    document.getElementById(element).className = theNewClass;
                }
            }
        }

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

        var videoStatus = {
            mediaFileUrl: "",
            vastMediaFileDuration: '00:00:01', // minimum of 1 second in vast media file duration
            loaded: false,

            popupCause: 'pause', // pause, timeout, etc

            paused: false,
            ended: false,
            storedPercent: -1,
            duration: 0,
            progress: 0,
            rewardAttempt: false,
            rewardDelivered: 0,
            rewarded: false,
            exitString: 'exit:',
            tracking_start_tracked: false,
            tracking_first_quartile_tracked: false,
            tracking_midpoint_tracked: false,
            tracking_third_quartile_tracked: false,
            tracking_complete_tracked: false,
            tracking_mute_tracked: false,
            tracking_unmute_tracked: false,
            tracking_pause_tracked: false,
            tracking_resume_tracked: false,
            tracking_fullscreen_tracked: false,

            trackVideoComplete: function () {
                if (videoStatus.tracking_complete_tracked == false) {
                    videoStatus.tracking_complete_tracked = true;

                    // GLOT video complete tracking
                    if (gladsGlotTrackingVideoCompleteUrl.indexOf('videocomplete:') > -1) {
                        glftSspRouter.redirect(gladsGlotTrackingVideoCompleteUrl);
                    }

                    if (typeof vastData['trackingEvents']['complete'] != 'undefined' &&
                            vastData['trackingEvents']['complete'] != null &&
                            vastData['trackingEvents']['complete'] != ''
                    ) {
                        //console.log('Vast data: Tracking video complete.');
                        for (var key in vastData['trackingEvents']['complete']) {
                            glftSspTracker.track(vastData['trackingEvents']['complete'][key]);
                        }
                    }

                    // track redirection cache
                    if (typeof redirectionCache['trackingEvents']['complete'] != 'undefined' &&
                            redirectionCache['trackingEvents']['complete'] != null &&
                            redirectionCache['trackingEvents']['complete'] != ''
                    ) {
                        for (var key in redirectionCache['trackingEvents']['complete']) {
                            glftSspTracker.track(redirectionCache['trackingEvents']['complete'][key]);
                        }
                    }

                    if (typeof gladsTrackingUrls['completeTrackingURL'] != 'undefined' &&
                            gladsTrackingUrls['completeTrackingURL'] != ''
                    ) {
                        glftSspTracker.track(gladsTrackingUrls['completeTrackingURL']);
                    }
                    videoStatus.tracking_complete_tracked = true;
                }
            }
        };

        //Read XML string
        var xmlDoc;

        var glftPlayerUtils = {
            showClose: function () {
                // hide skippable
                document.getElementById('skip_head').style.visibility = 'hidden';

                setTimeout(function () {
                    // show exit button
                    document.getElementById('head_close').style.visibility = 'visible';
                }, 600);
            },

            showInfo: function (ended) {
                // only proceed if there's a link under the learn more button
                if (displayingInfoButton == false) {
                    return false;
                }

                // show info button
                manipulateClass('head_info_btn', 'active', 'add');

                // animate/move info button to the middle
                if (ended == true) {
                    setTimeout(function () {
                        manipulateClass('head_info_btn', 'active', 'remove');
                        manipulateClass('head_info_btn', 'centered', 'add');
                        setTimeout(function() {
                            manipulateClass('head_info_btn', 'animate', 'add');
                        }, 200);
                    }, 200);
                }
            },

            isRewardable: function () {
                if (videoStatus.rewardDelivered == 1 ||
                        gladsRewardSettings['rewardUrl'].indexOf('[rewardUrl]') > -1 ||
                        gladsRewardSettings['rewardCurrency'].indexOf('[rewardCurrency]') > -1 ||
                        gladsRewardSettings['rewardUrl'] == '' ||
                        gladsRewardSettings['rewardCurrency'] == ''
                ) {
                    return false;
                }

                return true;
            },
            counterUpdate: function (receivedValue) {
                if (videoStatus.storedPercent == receivedValue) {
                    return false;
                }
                videoStatus.storedPercent = receivedValue;

                vPlayer = document.getElementById('videoObject');

                receivedValue = parseInt(receivedValue);

                if (receivedValue > 100) {
                    return false;
                }

                if (receivedValue % 5 != 0) {
                    while (receivedValue % 5 != 0) {
                        receivedValue -= 1;
                    }
                }

                if (receivedValue == 0) {
                    receivedValue = 1;
                }

                receivedValue = receivedValue / 10 * 2;

                radiusValues = [0];
                for (i = -0.4; i <= 1.4; i = Number((i + 0.1).toFixed(1))) {
                    radiusValues[radiusValues.length] = i;
                }
                radiusValues[radiusValues.length] = 2;

                var iconsDimension = 56;
                if (window.innerWidth > 1024) {
                    iconsDimension = 54;
                } else if (window.innerWidth > 768) {
                    iconsDimension = 44;
                } else {
                    iconsDimension = 34;
                }

                var border = 2,
                        lnWidth = 7;
                if (window.innerWidth < 768) {
                    border = 1;
                    lnWidth = 5;
                }

                var canvas = document.getElementById('counterCanvas');

                canvas.setAttribute('width', iconsDimension + 16);
                canvas.setAttribute('height', iconsDimension + 16);
                canvas.width = canvas.width;

                var arcObject = canvas.getContext('2d');
                arcObject.beginPath();

                arcObject.arc(iconsDimension / 2 + 10, iconsDimension / 2 + 10, iconsDimension / 2 + 2, 0, 2 * Math.PI);

                arcObject.strokeStyle = "rgba(255, 255, 255, 0.4)";
                arcObject.lineWidth = lnWidth;
                arcObject.stroke();

                var arcObject = canvas.getContext('2d');
                arcObject.beginPath();

                if (radiusValues[receivedValue] == 2) {
                    arcObject.arc(iconsDimension / 2 + 10, iconsDimension / 2 + 10, iconsDimension / 2 + 2, 0, radiusValues[receivedValue] * Math.PI);
                } else {
                    arcObject.arc(iconsDimension / 2 + 10, iconsDimension / 2 + 10, iconsDimension / 2 + 2, 1.5 * Math.PI, radiusValues[receivedValue] * Math.PI);
                }

                arcObject.strokeStyle = "rgba(0,255,0,1.0)";
                arcObject.lineWidth = lnWidth;
                arcObject.stroke();

                document.getElementById("counterNumber").setAttribute('style', 'top: 10px; left: 10px; font-size: ' + (iconsDimension / 2 + 2) + 'px; line-height: ' + (iconsDimension - (border * 2)) + 'px; width: ' + (iconsDimension - (border * 2)) + 'px; height: ' + (iconsDimension - (border * 2)) + 'px; border-width: ' + border + 'px;');

                return true;
            },

            counterControl: function () {
        var whetherImg = document.getElementById("endImg");
	var image = document.createElement("img");
        image.setAttribute("id","endImg");
        image.src = {{ endCardSrc }}; 
	var imageA = document.createElement("a");
	var transform = '{{ transform }}';
	var imageAsrc = 'link:{{ endCardClickThroughUrl }}';
        var CompainClickTracking = {{ endCardClickTrackingUrls }};
        var CompainImpTracking = {{ endCardImpTrackingUrls }};
                    			
					//Do rotate for image.
                    if(transform != '')
                    {
                        image.style.msTransform = transform;
                        image.style.mozTransform = transform;
                        image.style.webkitTransform = transform;
                        image.style.oTransform = transform;
                        image.style.transform = transform;
                    }
										
					//enlarge the impage to fullscreen:
		    image.style.width = "100%";
                    image.style.height = "100%";
                    image.style.position = "relative"; 
                    image.style.display="none"; 	
				
		    if(whetherImg === null){
                        document.body.appendChild(imageA);
                        imageA.appendChild(image);
                        if (CompainImpTracking && typeof(CompainImpTracking) == 'object') {
                                for (var key in CompainImpTracking) {
                                glftSspTracker.track(CompainImpTracking[key]);
                           }
                         }
                       imageA.addEventListener('click',function(e)
                       {
                               if (CompainClickTracking && typeof(CompainClickTracking) == 'object') {
                               for (var key in CompainClickTracking) {
                                  glftSspTracker.track(CompainClickTracking[key]);
                                  }
                               }
                               if (gladsClickTrackingUrl)
                               { 
                                    glftSspTracker.track(gladsClickTrackingUrl);
                               }
                              if (typeof vastData['clickTracking'] != 'undefined' &&
                                     vastData['clickTracking'] != null &&
                                     vastData['clickTracking'] != ''
                               ) {
                                 for (var key in vastData['clickTracking']) {
                                     glftSspTracker.track(vastData['clickTracking'][key]);
                                  }
                               }
                              if (typeof redirectionCache['clickTracking'] != 'undefined' &&
                                       redirectionCache['clickTracking'] != null &&
                                       redirectionCache['clickTracking'] != ''
                               ) {
                                      for (var key in redirectionCache['clickTracking']) {
                                         glftSspTracker.track(redirectionCache['clickTracking'][key]);
                                  }
                               }
                              if (typeof redirectionCache['clickThrough'] != 'undefined' &&
                                        redirectionCache['clickThrough'] != null &&
                                        redirectionCache['clickThrough'] != ''
                               ) {
                                        for (var key in redirectionCache['clickThrough']) {
                                        glftSspTracker.track(redirectionCache['clickThrough'][key]);
                                    }
                               }
                               glftSspRouter.redirect(imageAsrc);
                       });
                    }
                     if (videoStatus.ended === true)
                     {
                        whetherImg.style.display="block"; 
                      }
                var video_player = document.getElementById('videoObject');
                document.getElementById('counterContainer').style.display = 'block';

                var current_time = video_player.currentTime;
                var totalDuration = videoStatus.duration;

                remainingSeconds = totalDuration - current_time;
                remainingSecondsText = Math.ceil(totalDuration - current_time);

                if (remainingSecondsText < 0) {
                    remainingSecondsText = 0;
                }
                document.getElementById('counterNumber').innerHTML = remainingSecondsText;

                percent = Math.ceil(100 - (remainingSeconds) * 100 / totalDuration);
                if (percent < 0) {

                    percent = 0;
                }
                if (percent >= 99) {
                    percent = 100;
                }

                this.counterUpdate(percent);

                _this = this;
                setTimeout(
                        function () {
                            _this.counterControl();
                        },
                        10
                );
            },

            rewardHandler: function () {
                // prepare caller
                glftSspIHttpReturn.async = false;
                glftSspIHttpReturn.dataType = 'json';
                glftSspIHttpReturn.crossDomain = true;

                // call the reward url
                glftSspIHttpReturn.call(gladsRewardSettings['rewardUrl'], this.rewardNotification);
            },

            rewardNotification: function (iHttpObj) {
                if (gladsRewardSettings['notifyReward'] == 1) {
                    var tcall = iHttpObj.request;
                    iHttpObj.request.onreadystatechange = function () {
                        // hide cancel if present
                        glftSspVideoStateHandlerObject.changePopupState('hide');

                        // display loading in case this takes longer than necessary
                        //document.getElementById('loader_cont').style.display = 'block';

                        if (tcall.readyState == 4) {
                            if (tcall.status == 200 && videoStatus.rewardDelivered != 1) {
                                var myArr = JSON.parse(tcall.responseText);
                                if (myArr.status == "success") {
                                    videoStatus.rewardDelivered = 1;

                                    // building the reward exit string
                                    exitString = 'exit:checkreward:' + gladsRewardSettings['rewardCurrency'];
                                } else {
                                    exitString = 'exit:';
                                }
                            } else {
                                exitString = 'exit:';
                            }
                            // exiting ad
                            //glftSspRouter.redirect(exitString);
                            // change what the close button does
                            videoStatus.exitString = exitString;

                            glftPlayerUtils.showClose();

                            glftPlayerUtils.showInfo(true);
                        }
                        else
                        {
                            glftPlayerUtils.showClose();
                            glftPlayerUtils.showInfo(true);
                        }
                    }
                }
            },

            videoCompletedProcessing: function () {
                // if video ended was already called on current play, don't proceed
                if (videoStatus.ended == true) {
                    return false;
                }

                // complete tracking
                videoStatus.trackVideoComplete();

                // hide all possible splashes
                glftSspVideoStateHandlerObject.changePopupState('hide');

                videoStatus.ended = true;
                videoStatus.storedPercent = -1;
                glftPlayerUtils.counterUpdate(100);
                document.getElementById('counterNumber').innerHTML = '0';

                // hide counter container
                document.getElementById('counterContainer').style.display = 'none';

                // move advertisment text
                document.getElementById('advertismentLabel').style.right = '';
                document.getElementById('advertismentLabel').style.left = '6px';

                if (!glftPlayerUtils.isRewardable()) {
                    //glftSspRouter.redirect('exit:');
                } else {
                    glftPlayerUtils.rewardHandler();
                }

                glftPlayerUtils.showClose();

                glftPlayerUtils.showInfo(true);
            },

            durationHandlerTimePassedSinceLoaded: 0,
            durationHandlerStep: 10,
            durationHandler: function () {
                this.durationHandlerTimePassedSinceLoaded = this.durationHandlerTimePassedSinceLoaded + this.durationHandlerStep;

                _this = this;
                setTimeout(
                        function () {
                            _this.durationHandler();
                        },
                        _this.durationHandlerStep
                );
            },

            closeButtonHandlerInitialCall: true,
            closeButtonHandlerDone: false,
            closeButtonHandlerStartHandled: false,
            closeButtonHandlerShowDelay: 5000,
            closeButtonHandlerShowDelayExtra: 15000,
            closeButtonHandlerStep: 10,
            closeButtonHandlerTimePassed: 0,
            closeButtonHandler: function () {
                if (this.closeButtonHandlerInitialCall == true) {
                    document.getElementById('skip_head').className = 'active';

                    this.closeButtonHandlerInitialCall = false;
                    //console.log('Close button: Handler started.');
                } else {
                    if (videoStatus.paused != true) {
                        // increment passed time
                        this.closeButtonHandlerTimePassed = this.closeButtonHandlerTimePassed + this.closeButtonHandlerStep;

                        // check video status, if loaded, set current delay to
                        if (videoStatus.loaded == true && this.closeButtonHandlerStartHandled == false) {
                            this.closeButtonHandlerShowDelay = this.closeButtonHandlerShowDelayExtra;
                            this.closeButtonHandlerTimePassed = 0;

                            this.closeButtonHandlerStartHandled = true;

                            //console.log('Close button: Video loaded. Set delay extra as the show delay.');
                        }

                        if (videoStatus.loaded == true) {
                            skippableInPrecision = (this.closeButtonHandlerShowDelay - this.closeButtonHandlerTimePassed) / 1000;
                            skippableIn = Math.ceil(skippableInPrecision);

                            //console.log('skippableIn: ' + skippableIn);
                            videoTimeLeft = Math.ceil(videoStatus.duration - videoStatus.progress);
                            //console.log('videoTimeLeft: ' + videoTimeLeft);

                            if (!isNaN(videoTimeLeft) && skippableIn > videoTimeLeft) {
                                skippableIn = videoTimeLeft;
                            }
                            document.getElementById('skip_seconds').innerHTML = skippableIn;
                        }

                        // show button if maximum timer passed
                        if (this.closeButtonHandlerTimePassed >= this.closeButtonHandlerShowDelay) {
                            document.getElementById('skip_head').style.visibility = 'hidden';

                            glftPlayerUtils.showClose();
                            this.closeButtonHandlerDone = true;

                            //console.log('Close button: Showing close button.');
                            //console.log('Close button: this.closeButtonHandlerShowDelay = ' + this.closeButtonHandlerShowDelay);
                        }
                    }
                }

                if (this.closeButtonHandlerTimePassed % 1000 == 0) {
                    //console.log('Close button: ' + this.closeButtonHandlerTimePassed + ' ms passed.');
                }

                if (this.closeButtonHandlerDone == false) {
                    _this = this;
                    setTimeout(
                            function () {
                                _this.closeButtonHandler();
                            },
                            _this.closeButtonHandlerStep
                    );
                }
            },

            infoButtonHandlerInitialCall: true,
            infoButtonHandlerDone: false,
            infoButtonHandlerStartHandled: false,
            infoButtonHandlerShowDelay: 5000,
            infoButtonHandlerShowDelayExtra: 15000,
            infoButtonHandlerStep: 10,
            infoButtonHandlerTimePassed: 0,
            infoButtonHandler: function () {
                if (this.infoButtonHandlerInitialCall == true) {
                    this.infoButtonHandlerInitialCall = false;
                    //console.log('Info button: Handler started.');
                } else {
                    if (videoStatus.paused != true) {
                        // increment passed time
                        this.infoButtonHandlerTimePassed = this.infoButtonHandlerTimePassed + this.infoButtonHandlerStep;

                        // check video status, if loaded, set current delay to
                        if (videoStatus.loaded == true && this.infoButtonHandlerStartHandled == false) {
                            this.infoButtonHandlerShowDelay = this.infoButtonHandlerShowDelayExtra;
                            this.infoButtonHandlerTimePassed = 0;

                            this.infoButtonHandlerStartHandled = true;

                            //console.log('Info button: Video loaded. Set delay extra as the show delay.');
                        }

                        // show button if maximum timer passed
                        if (this.infoButtonHandlerTimePassed >= this.infoButtonHandlerShowDelay) {
                            glftPlayerUtils.showInfo();

                            document.getElementById('head_info_btn').style.visibility = 'visible';
                            this.infoButtonHandlerDone = true;

                            //console.log('Info button: Showing info button.');
                            //console.log('Info button: this.infoButtonHandlerShowDelay = ' + this.infoButtonHandlerShowDelay);
                        }
                    }
                }

                if (this.infoButtonHandlerTimePassed % 1000 == 0) {
                    //console.log('Info button: ' + this.infoButtonHandlerTimePassed + ' ms passed.');
                }

                if (this.infoButtonHandlerDone == false) {
                    _this = this;
                    setTimeout(
                            function () {
                                _this.infoButtonHandler();
                            },
                            _this.infoButtonHandlerStep
                    );
                }
            }
        }

        function html5vast(video_player_id, options) {
            var video_player = document.getElementById(video_player_id);

            //Default options
            var html5vast_options = {
                'media_type': 'video/mp4',
                'media_bitrate_min': 50,
                'media_bitrate_max': 160,
                'additionalQuartileTracking': '',
                'tracker': glftSspTracker,
                'router': glftSspRouter
            };
            for (var key in options) {
                html5vast_options[key] = options[key];
            }

            h5vPrepare(html5vast_options);
            h5vPreRoll(video_player_id, html5vast_options);
        }

        //Parse VAST XML
        function h5vPrepare(options) {
            // Media file
            if (typeof vastData['mediaFile']['url'] != 'undefined' && vastData['mediaFile']['url'] != null && vastData['mediaFile']['url'] != '') {
                //console.log('Vast data: Extracting url and duration.');
                videoStatus.mediaFileUrl = vastData['mediaFile']['url'];
                if (typeof vastData['mediaFile']['duration'] != 'undefined' &&
                        vastData['mediaFile']['duration'] != null &&
                        vastData['mediaFile']['duration'] != '' &&
                        vastData['mediaFile']['duration'] != 'N/A' &&
                        vastData['mediaFile']['duration'] != '00:00:00'
                ) {
                    videoStatus.vastMediaFileDuration = vastData['mediaFile']['duration'];
                }
            }

            // set video duration
            var arrD = videoStatus.vastMediaFileDuration.split(':');
            var strSecs = (+arrD[0]) * 60 * 60 + (+arrD[1]) * 60 + (+arrD[2]);
            if (isNaN(strSecs) || !isFinite(strSecs) || strSecs <= 0) {
                strSecs = 1;
            }
            videoStatus.duration = strSecs;
        }

        //Preroll
        function h5vPreRoll(video_player_id, options) {
            var video_player = document.getElementById(video_player_id);

            if (typeof videoStatus.mediaFileUrl == 'undefined' || videoStatus.mediaFileUrl == '' || videoStatus.mediaFileUrl == null) {
                options['router'].redirect('exit:');
            }

            var video_player_paused = function () {
                videoStatus.paused = true;

                if (videoStatus.tracking_pause_tracked == false) {
                    // Allow pause to trigger as many times as necessary
                    //videoStatus.tracking_pause_tracked = true;

                    if (typeof vastData['trackingEvents']['pause'] != 'undefined' &&
                            vastData['trackingEvents']['pause'] != null &&
                            vastData['trackingEvents']['pause'] != ''
                    ) {
                        //console.log('Vast data: Tracking pause.');
                        for (var key in vastData['trackingEvents']['pause']) {
                            options['tracker'].track(vastData['trackingEvents']['pause'][key]);
                        }
                    }

                    // track redirection cache
                    if (typeof options['redirectionCache']['trackingEvents']['pause'] != 'undefined' &&
                            options['redirectionCache']['trackingEvents']['pause'] != null &&
                            options['redirectionCache']['trackingEvents']['pause'] != ''
                    ) {
                        for (var key in options['redirectionCache']['trackingEvents']['pause']) {
                            options['tracker'].track(options['redirectionCache']['trackingEvents']['pause'][key]);
                        }
                    }

                    if (typeof options['additionalQuartileTracking']['pauseTrackingURL'] != 'undefined' &&
                            options['additionalQuartileTracking']['pauseTrackingURL'] != ''
                    ) {
                        options['tracker'].track(options['additionalQuartileTracking']['pauseTrackingURL']);
                    }
                }

                if (videoStatus.ended != true) {
                    glftSspVideoStateHandlerObject.changePopupState('show');
                }
            }

            var video_player_resumed = function () {
                window.popupPauseInterval = setInterval(function() {
                    if (glftSspVideoStateHandlerObject.popupDisplayed() || videoStatus.paused == true) {
                        // pause video
                        document.getElementById('videoObject').pause();

                        // flag video status as paused
                        videoStatus.paused = true;
                    }
                }, 100);

                if (glftSspVideoStateHandlerObject.popupDisplayed() || videoStatus.paused == true) {
                    return false;
                }

                videoStatus.paused = false;

                if (videoStatus.tracking_resume_tracked == false) {
                    // Allow resume track to happen as many times as necessary
                    //videoStatus.tracking_resume_tracked = true;

                    if (typeof vastData['trackingEvents']['resume'] != 'undefined' &&
                            vastData['trackingEvents']['resume'] != null &&
                            vastData['trackingEvents']['resume'] != ''
                    ) {
                        //console.log('Vast data: Tracking resume.');
                        for (var key in vastData['trackingEvents']['resume']) {
                            options['tracker'].track(vastData['trackingEvents']['resume'][key]);
                        }
                    }
                }

                // track redirection cache
                if (typeof options['redirectionCache']['trackingEvents']['resume'] != 'undefined' &&
                        options['redirectionCache']['trackingEvents']['resume'] != null &&
                        options['redirectionCache']['trackingEvents']['resume'] != ''
                ) {
                    for (var key in options['redirectionCache']['trackingEvents']['resume']) {
                        options['tracker'].track(options['redirectionCache']['trackingEvents']['resume'][key]);
                    }
                }

                glftSspVideoStateHandlerObject.changePopupState('hide');
            }

            var video_player_play = function (event) {
                //glftSspVideo.adjustVideoPosition(video_player);

                //Change source to PreRoll
                var d = new Date();
                video_player.src = videoStatus.mediaFileUrl + '?t=' + d.getTime(); // TODO: Remove this when finsihed testing !!!!!!!
                video_player.load();

                //On content load
                var video_player_loaded = function (event) {
                    // hide loader
                    document.getElementById('loader_cont').style.display = 'none';

                    // video data loaded flag
                    videoStatus.loaded = true;
                    glftPlayerUtils.durationHandler();

                    // set video duration from video header info
                    if (!isNaN(video_player.duration) && isFinite(video_player.duration) && video_player.duration >= videoStatus.duration) {
                        videoStatus.duration = Math.floor(video_player.duration);
                    }

                    // GLOT impression tracking
                    if (gladsGlotTrackingImpressionUrl.indexOf('track:') > -1) {
                        options['router'].redirect(gladsGlotTrackingImpressionUrl);
                    }

                    // Track partner impressions (from the vast file)
                    if (typeof vastData['impressions'] != 'undefined' &&
                            vastData['impressions'] != null &&
                            vastData['impressions'] != ''
                    ) {
                        //console.log('Vast data: Tracking impressions.');
                        for (var key in vastData['impressions']) {
                            options['tracker'].track(vastData['impressions'][key]);
                        }
                    }

                    // Tracking GLADS Impression
                    options['tracker'].track(gladsImpressionTrackingUrl);

                    {% if sspBeaconUrl is not empty %}
                    // SSP Beacon URL
                    var sspBeaconUrl = '{{ sspBeaconUrl }}';

                    // Send Beacon tracking
                    options['tracker'].track(sspBeaconUrl);
                    {% endif %}

                    // Can we pause music?
                    var can_pause_music = '{[can_pause_music]}';

                    // Check if we can pause music
                    if (can_pause_music == '1') {
                        if (_os == "win" || _os == "winp" || _os == "WINDOWS") {
                            window.external.notify('pauseusermusic:');
                        } else {
                            document.location = 'pauseusermusic:';
                        }
                    }

                    // Tracking Partner Impressions (in addition to the vast impressions)
                    if (partnerImpressionTrackingUrls && typeof(partnerImpressionTrackingUrls) == 'object') {
                        for (var key in partnerImpressionTrackingUrls) {
                            options['tracker'].track(partnerImpressionTrackingUrls[key]);
                        }
                    }

                    // Tracking Redirection cache impressions
                    if (typeof options['redirectionCache']['impressions'] != 'undefined' &&
                            options['redirectionCache']['impressions'] != null &&
                            options['redirectionCache']['impressions'] != ''
                    ) {
                        for (var key in options['redirectionCache']['impressions']) {
                            options['tracker'].track(options['redirectionCache']['impressions'][key]);
                        }
                    }

                    h5vAddClickthrough(video_player_id, options);

                    video_player.removeAttribute("controls"); //Remove Controls

                    video_player.play();

                    video_player.removeEventListener('loadedmetadata', video_player_loaded);
                }

                //On PreRoll End
                var video_player_ended = function (event) {
                    glftPlayerUtils.videoCompletedProcessing();
                }

                video_player.addEventListener('loadedmetadata', video_player_loaded);
                video_player.addEventListener('ended', video_player_ended);
                video_player.removeEventListener('play', video_player_play);

                video_player.addEventListener('play', video_player_resumed);

                glftPlayerUtils.counterControl();
            }

            //Ping Tracking URIs
            var video_player_timeupdate = function (event) {
                var img_track = new Image();
                var current_time = Math.floor(video_player.currentTime);

                // update progress
                videoStatus.progress = current_time;

                //console.log('Video activity detected: ' + current_time);
                glftSspVideoStateHandlerObject.setPlayedTime(video_player.currentTime);

                if ((current_time >= 0)) { //Start
                    if (videoStatus.tracking_start_tracked == false) {
                        videoStatus.tracking_start_tracked = true;

                        {# This will need to be modified if re-enable is needed
                        {% if eventBeacons is not empty %}{% if sspBeaconUrl is not empty %}// SSP Beacon URL
                        var sspBeaconUrl = '{{ sspBeaconUrl }}&event_type=VIDEO_START_TIMEUPDATE';

                        // Send Beacon tracking
                        options['tracker'].track(sspBeaconUrl);
                        {% endif %}{% endif %}
                        #}

                        if (typeof vastData['trackingEvents']['start'] != 'undefined' &&
                                vastData['trackingEvents']['start'] != null &&
                                vastData['trackingEvents']['start'] != ''
                        ) {
                            //console.log('Vast data: Tracking video start.');
                            for (var key in vastData['trackingEvents']['start']) {
                                options['tracker'].track(vastData['trackingEvents']['start'][key]);
                            }
                        }

                        // track redirection cache
                        if (typeof options['redirectionCache']['trackingEvents']['start'] != 'undefined' &&
                                options['redirectionCache']['trackingEvents']['start'] != null &&
                                options['redirectionCache']['trackingEvents']['start'] != ''
                        ) {
                            for (var key in options['redirectionCache']['trackingEvents']['start']) {
                                options['tracker'].track(options['redirectionCache']['trackingEvents']['start'][key]);
                            }
                        }

                        if (typeof options['additionalQuartileTracking']['startTrackingURL'] != 'undefined' &&
                                options['additionalQuartileTracking']['startTrackingURL'] != ''
                        ) {
                            options['tracker'].track(options['additionalQuartileTracking']['startTrackingURL']);
                        }
                    }
                }
                if ((current_time == (Math.floor(videoStatus.duration / 4)))) { //First Quartile
                    if (videoStatus.tracking_first_quartile_tracked == false) {
                        videoStatus.tracking_first_quartile_tracked = true;

                        if (typeof vastData['trackingEvents']['firstQuartile'] != 'undefined' &&
                                vastData['trackingEvents']['firstQuartile'] != null &&
                                vastData['trackingEvents']['firstQuartile'] != ''
                        ) {
                            //console.log('Vast data: Tracking video firstQuartile.');
                            for (var key in vastData['trackingEvents']['firstQuartile']) {
                                options['tracker'].track(vastData['trackingEvents']['firstQuartile'][key]);
                            }
                        }

                        // track redirection cache
                        if (typeof options['redirectionCache']['trackingEvents']['firstQuartile'] != 'undefined' &&
                                options['redirectionCache']['trackingEvents']['firstQuartile'] != null &&
                                options['redirectionCache']['trackingEvents']['firstQuartile'] != ''
                        ) {
                            for (var key in options['redirectionCache']['trackingEvents']['firstQuartile']) {
                                options['tracker'].track(options['redirectionCache']['trackingEvents']['firstQuartile'][key]);
                            }
                        }

                        if (typeof options['additionalQuartileTracking']['firstQuartileTrackingURL'] != 'undefined' &&
                                options['additionalQuartileTracking']['firstQuartileTrackingURL'] != ''
                        ) {
                            options['tracker'].track(options['additionalQuartileTracking']['firstQuartileTrackingURL']);
                        }
                    }
                }
                if ((current_time == (Math.floor(videoStatus.duration / 2)))) { //Mid Point
                    if (videoStatus.tracking_midpoint_tracked == false) {
                        videoStatus.tracking_midpoint_tracked = true;

                        if (typeof vastData['trackingEvents']['midpoint'] != 'undefined' &&
                                vastData['trackingEvents']['midpoint'] != null &&
                                vastData['trackingEvents']['midpoint'] != ''
                        ) {
                            //console.log('Vast data: Tracking midpoint.');
                            for (var key in vastData['trackingEvents']['midpoint']) {
                                options['tracker'].track(vastData['trackingEvents']['midpoint'][key]);
                            }
                        }

                        // track redirection cache
                        if (typeof options['redirectionCache']['trackingEvents']['midpoint'] != 'undefined' &&
                                options['redirectionCache']['trackingEvents']['midpoint'] != null &&
                                options['redirectionCache']['trackingEvents']['midpoint'] != ''
                        ) {
                            for (var key in options['redirectionCache']['trackingEvents']['midpoint']) {
                                options['tracker'].track(options['redirectionCache']['trackingEvents']['midpoint'][key]);
                            }
                        }

                        if (typeof options['additionalQuartileTracking']['midpointTrackingURL'] != 'undefined' &&
                                options['additionalQuartileTracking']['midpointTrackingURL'] != ''
                        ) {
                            options['tracker'].track(options['additionalQuartileTracking']['midpointTrackingURL']);
                        }
                    }
                }
                if ((current_time == ((Math.floor(videoStatus.duration / 2)) + (Math.floor(videoStatus.duration / 4))))) { //Third Quartile
                    if (videoStatus.tracking_third_quartile_tracked == false) {
                        videoStatus.tracking_third_quartile_tracked = true;

                        if (typeof vastData['trackingEvents']['thirdQuartile'] != 'undefined' &&
                                vastData['trackingEvents']['thirdQuartile'] != null &&
                                vastData['trackingEvents']['thirdQuartile'] != ''
                        ) {
                            //console.log('Vast data: Tracking thirdQuartile.');
                            for (var key in vastData['trackingEvents']['thirdQuartile']) {
                                options['tracker'].track(vastData['trackingEvents']['thirdQuartile'][key]);
                            }
                        }

                        // track redirection cache
                        if (typeof options['redirectionCache']['trackingEvents']['thirdQuartile'] != 'undefined' &&
                                options['redirectionCache']['trackingEvents']['thirdQuartile'] != null &&
                                options['redirectionCache']['trackingEvents']['thirdQuartile'] != ''
                        ) {
                            for (var key in options['redirectionCache']['trackingEvents']['thirdQuartile']) {
                                options['tracker'].track(options['redirectionCache']['trackingEvents']['thirdQuartile'][key]);
                            }
                        }

                        if (typeof options['additionalQuartileTracking']['thirdQuartileTrackingURL'] != 'undefined' &&
                                options['additionalQuartileTracking']['thirdQuartileTrackingURL'] != ''
                        ) {
                            options['tracker'].track(options['additionalQuartileTracking']['thirdQuartileTrackingURL']);
                        }
                    }
                }

                if ((current_time >= (videoStatus.duration - 1))) { //End
                    videoStatus.trackVideoComplete();
                }

                if ((current_time >= (videoStatus.duration - 0.5))) { //End
                    glftPlayerUtils.videoCompletedProcessing();

                    video_player.removeEventListener('timeupdate', video_player_timeupdate);
                }
            }

            video_player.addEventListener('pause', video_player_paused);
            video_player.addEventListener('play', video_player_play);
            video_player.addEventListener('timeupdate', video_player_timeupdate);
        }

        //Add Clickthrough
        function h5vAddClickthrough(video_player_id, options) {
            var clickThroughAction = function () {
                // internal tracking
                options['tracker'].track(gladsClickTrackingUrl);

                //Click through Tracking
                if (typeof vastData['clickTracking'] != 'undefined' &&
                        vastData['clickTracking'] != null &&
                        vastData['clickTracking'] != ''
                ) {
                    //console.log('Vast data: Clickthrough tracking.');
                    for (var key in vastData['clickTracking']) {
                        options['tracker'].track(vastData['clickTracking'][key]);
                    }
                }

                // track redirection cache
                if (typeof options['redirectionCache']['clickTracking'] != 'undefined' &&
                        options['redirectionCache']['clickTracking'] != null &&
                        options['redirectionCache']['clickTracking'] != ''
                ) {
                    for (var key in options['redirectionCache']['clickTracking']) {
                        options['tracker'].track(options['redirectionCache']['clickTracking'][key]);
                    }
                }

                // track redirection cache
                if (typeof options['redirectionCache']['clickThrough'] != 'undefined' &&
                        options['redirectionCache']['clickThrough'] != null &&
                        options['redirectionCache']['clickThrough'] != ''
                ) {
                    for (var key in options['redirectionCache']['clickThrough']) {
                        options['tracker'].track(options['redirectionCache']['clickThrough'][key]);
                    }
                }

                if (typeof vastData['clickThrough'][0] != 'undefined' &&
                        vastData['clickThrough'][0] != null &&
                        vastData['clickThrough'][0] != ''
                ) {
                    options['router'].redirect('link:' + vastData['clickThrough'][0]);
                }
            };

            // attaching click to clickthrough button
            options['clickthroughButton'].addEventListener(glftSspToolsObject.getClickEvent(), function () {
                clickThroughAction();
            });
            options['clickthroughButton'].addEventListener('keypress', function (event) {
                if (event.keyCode==13 || event.keyCode==96) {
                    this.blur()
                    clickThroughAction();
                };
            });

            /*options['clickthroughOverlay'].addEventListener(glftSspToolsObject.getClickEvent(), function () {
             clickThroughAction();
             });*/
        }

        //Remove Clickthrough
        function h5vRemoveClickthrough(video_player_id) {
            var elem = document.getElementById('h5vclickt_' + video_player_id);
            elem.parentNode.removeChild(elem);
        }

        //Get current video source src
        function h5vGetCurrentSrc(video_player_id) {
            return document.getElementById(video_player_id).getElementsByTagName("source")[0].getAttribute("src");
        }

        //Add pixel for firing impressions, tracking etc
        function h5vAddPixel(pixel_url, options) {
            options['tracker'].track(pixel_url);
        }
    </script>
    <script type="text/javascript">
        // == Internally received params (ssp) ==
        var _os = '{{ os }}';

        // == External received params (glads) ==

        // Prefixes and IDs
        var locationId = typeof glLocationId != 'undefined' ? glLocationId : '{[location_id]}';
        var statsURL = typeof glStatsUrl != 'undefined' ? glStatsUrl : '{[statsUrl]}';

        // Glads impression tracking url
        var gladsImpressionTrackingUrl = statsURL + '{[impTrackUrl]}';

        // GLOT tracking
        var gladsGlotTrackingImpressionUrl = '{[gladsGlotTrackingImpressionUrl]}';
        gladsGlotTrackingImpressionUrl = gladsGlotTrackingImpressionUrl.replace('%%location_id%%', locationId);
        var gladsGlotTrackingVideoCompleteUrl = '{[gladsGlotTrackingVideoCompleteUrl]}';

        // Partner's impression tracking url
        var partnerImpressionTrackingUrls = [];
        {% if partnerImpTrackUrls is not empty %}
        // Partner's impression tracking URLs
        var partnerImpressionTrackingUrls = {{ partnerImpTrackUrls }};
        {% endif %}

        // Redirection cache
        {% if redirectionCache is not empty %}
        var redirectionCache = {{ redirectionCache }};
        {% else %}
        var redirectionCache = {};
        {% endif %}

        if (typeof redirectionCache['trackingEvents'] == 'undefined') {
            redirectionCache['trackingEvents'] = {};
        }

        // Vast data
        {% if vastData is not empty %}
        var vastData = {{ vastData }};
        {% else %}
        var vastData = {};
        {% endif %}

        // Vast data defaults on some keys
        if (typeof vastData['mediaFile'] == 'undefined') {
            vastData['mediaFile'] = {};
        }
        if (typeof vastData['trackingEvents'] == 'undefined') {
            vastData['trackingEvents'] = {};
        }

        if (typeof vastData['clickThrough'] == 'undefined') {
            vastData['clickThrough'] = {};
        }

        var displayingInfoButton = false;
        /*if (typeof vastData['clickThrough'][0] != 'undefined' &&
                vastData['clickThrough'][0] != null &&
                vastData['clickThrough'][0] != ''
        ) {
            displayingInfoButton = true;
        }*/

        if (typeof vastData['clickTracking'] == 'undefined') {
            vastData['clickTracking'] = {};
        }

        // Glads click tracking url
        var gladsClickTrackingUrl = statsURL + '{[clickTrackUrl]}';

        // Glads close image url
        var gladsCloseImageUrl = '{[closeImgUrl]}';

        // Incentivised video settings
        var gladsRewardSettings = {
            'rewardUrl': '{[rewardUrl]}',
            'rewardCurrency': '{[rewardCurrency]}',
            'notifyReward': 1
        };

        // Glads video info button url
        var gladsVideoInfoButtonImageUrl = '{[videoInfoButtonImageUrl]}';
        var gladsVideoCloseButtonImageUrl = gladsCloseImageUrl;

        // Glads video tracking urls
        var gladsTrackingUrls = {
            clickTrackingUrl: gladsClickTrackingUrl,
            firstQuartileTrackingURL: statsURL + "{[videoFirstQuartileTrackURL]}",
            midpointTrackingURL: statsURL + "{[videoMidpointTrackURL]}",
            thirdQuartileTrackingURL: statsURL + "{[videoThirdQuartileTrackURL]}",
            completeTrackingURL: statsURL + "{[videoCompleteTrackURL]}"
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

        var glftSspIHttpReturn = {
            iReq: function () {
                if (window.XMLHttpRequest) {
                    return new XMLHttpRequest()
                }
                else {
                    if (window.ActiveXObject) {
                        return new ActiveXObject("Microsoft.XMLHTTP")
                    }
                }
                return false
            },
            async: true,
            call: function (a, callback) {
                this.request = this.iReq();
                if (this.request) {
                    if (typeof callback != 'undefined' && callback != null) {
                        callback(this);
                    }
                    this.request.open("GET", a, this.async);
                    this.request.send()
                }
            },
            post: function (a, b) {
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
    </script>

    {# Include element adjuster #}
    {{ partial("../../../views/shared/ads/partials/glftSspAdjuster") }}
</head>
<body>
<div id="videoPlayerContainer" style="visibility: hidden;">
    <video id="videoObject" width="100%" height="100%" autobuffer webkit-playsinline x-webkit-airplay="deny"
           preload="auto">
        <source src="" type="video/mp4"/>
    </video>
</div>

<div id="loader_cont"
     style="position: absolute;top: 50%;left: 50%;margin-left:-38px; margin-top:-38px;width:77px;height:77px"></div>

<div id="head_close"
     style="position: absolute; top:0.8em; right:0.8em; visibility:hidden; width:10em; height:10em; border: 0; z-index:9999999999999;"
     tabindex="0" ontouchmove="e.preventDefault()" ontouchend="">
    <img id="close_image"
         style="position: absolute !important; right: 0.8em; display: inline-block;cursor:pointer;position:static;width:100%;height:100%;"
         src="{[closeImgUrl]}"/>
</div>

<div id="cancel_video_popup" style="display: none;">
    <div class="info_cont radius5">
        <div class="title"><span>{[i18n_cancel]}</span></div>
        <div class="body" id="cancel_video_popup_body"><span>{[i18n_cancel_message]}</span></div>
        <div class="actions">
            <div id="cancel_yes" tabindex="0">
                <span>{[i18n_end]}</span>
            </div>
            <div id="cancel_no" tabindex="0">
                <span>{[i18n_resume]}</span>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

<div id="timeout_window">
    <div class="info_cont radius5">
        <div class="title"><span>{[i18n_cancel]}</span></div>
        <div class="body"><span>{[i18n_videos_cancel_timeout]}</span></div>
        <div class="actions">
            <div tabindex="0" id="pcEnd" class="pcEnd">
                <span>{[i18n_end]}</span>
            </div>
            <div tabindex="0" id="pcRetry" class="pcRetry">
                <span>{[i18n_retry]}</span>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

<!--
<div id="poor_connection">
    <div class="info_cont radius5">
        <div class="title"><span>{[i18n_cancel]}</span></div>
        <div class="body"><span>{[i18n_connection_lost]}</span></div>
        <div class="actions">
            <div onClickKeyPress="vPlayer.exit();" tabindex="0" class="pcEnd">
                <span>{[i18n_end]}</span>
            </div>
            <div onClickKeyPress="vPlayer.play();" tabindex="0" class="pcRetry">
                <span>{[i18n_retry]}</span>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div id="cnt_connection_lost" onClickKeyPress="vPlayer.retryAfterConnectionLost();" tabindex="0">
    <div class="dt">
        <span class="dtcVam">
		{[i18n_connection_lost]} <br/>
		{[i18n_tap_to_retry]}
		</span>
    </div>
</div>
-->

<div id="counterContainer">
    <div id="counterNumber"></div>
    <canvas id="counterCanvas" width="60" height="60"></canvas>
</div>

<span id="advertismentLabel" class="advertismentLabel" style="display: none;">
        {[i18n_advertisment]}{% if debugAlert is not empty %} - {{ debugAlert }}{% endif %}
</span>

<!--<div id="head_info_btn" class="info_button" tabindex="0"
     ontouchmove="e.preventDefault()"
     style="position:fixed; top:0.8em; left:0.8em; visibility:hidden; width:10em; height:10em;z-index:9999999999999;">
    <img id="info_image" src="{[videoInfoButtonImageUrl]}"
         style="display: inline-block;cursor:pointer;position:static;width:100%;height:100%;"/>
</div>-->

<div id="head_info_btn" class="info_button" tabindex="0"
     ontouchmove="e.preventDefault()">
    <span>{[i18n_moreinfo]}</span>
</div>

<div id="skip_head">{[i18n_skipad]} <span id="skip_seconds"></span></div>

<!-- IV Buddy Pack WS -->
<div id="wsOverlay"></div>
<div id="buddyPackWsContainer">
    <img id="buddyPackWsImage" src="{% if fakeBpRequest is not empty %}http://wapshop.gameloft.com/dg.d/ssp/sample_dirty.png{% else %}{[enterScreenSrc]}{% endif %}" />
    <div id="buddyPackWsCloseContainer" tabindex="0" ontouchmove="e.preventDefault()" ontouchend="">
        <img id="buddyPackWsCloseImage" src="{[closeImgUrl]}"/> <!-- http://ingameads.gameloft.com/un/web/fullscreen/images/newIcons/close_button_tp_bg.png -->
    </div>
    <span id="wsAdvertismentLabel" class="wsAdvertismentLabel">
        {[i18n_advertisment]}
    </span>
</div>

<script text="text/javascript">
    // Interrupt Object used by interrupt partial
    var glftSspAdInterruptAdapter = function () {
        var _this = this;

        this.pause = function () {
            if (videoStatus.ended == true) {
                return false; // don't pause a video that ended
            }

            videoStatus.popupCause = 'pause';

            // pause video
            document.getElementById('videoObject').pause();

            // flag video status as paused
            videoStatus.paused = true;

            return true;
        }

        this.resume = function () {
            if (videoStatus.ended == true || videoStatus.paused == false) {
                return false; // don't play a video that ended
            }

            // pause video
            document.getElementById('videoObject').play();

            // flag video status as resumed
            videoStatus.paused = false;

            return true;
        }

        this.close = function () {
            closeButton = document.getElementById('head_close');
            if (closeButton.style.display == 'block' && closeButton.style.visibility =='visible') {
                glftSspRouter.redirect(videoStatus.exitString);
            }
        }

        this.onBackPressed = function () {
            if (videoStatus.ended == true) {
                _this.close();
            } else {
                _this.pause();
            }
        }
    }

    var glftSspAdInterruptAdapterObject = new glftSspAdInterruptAdapter();
</script>

{# Include interrupt partial #}
{{ partial("../../../views/shared/ads/partials/glftSspInterrupts") }}

{# Include interrupt partial #}
{{ partial("../../../views/shared/ads/partials/glftSspVideoStateHandler") }}
<script text="text/javascript">
    var glftSspVideoStateHandlerObject = {};

    var startWs = function () {
        // attach close event to c
        document.getElementById('buddyPackWsCloseContainer').addEventListener(glftSspToolsObject.getClickEvent(), function (e) {
            e.stopPropagation();

            closeFunction();
        });

        document.getElementById('buddyPackWsImage').addEventListener(glftSspToolsObject.getClickEvent(), function (e) {
            e.stopPropagation();

            // hide buddy ad
            document.getElementById('buddyPackWsContainer').style.display = 'none';

            // displayloader
            document.getElementById('loader_cont').style.display = 'block';

            // hide overlay
            document.getElementById('wsOverlay').style.display = 'none';

            startAd();
        });

        // hide loader
        document.getElementById('loader_cont').style.display = 'none';

        // display overlay
        document.getElementById('wsOverlay').style.display = 'block';

        // display buddy ws
        document.getElementById('buddyPackWsContainer').style.display = 'block';

        var glftSspAdjusterObject = new glftSspAdjuster({
            adjustableElementObj: document.getElementById('buddyPackWsImage'),
            adjustableElementContainerObj: document.getElementById('buddyPackWsContainer'),
            adjustableElementHeight: document.getElementById('buddyPackWsImage').height,
            adjustableElementWidth: document.getElementById('buddyPackWsImage').width,
        });

        //glftSspAdjusterObject.alignElement();
        glftSspAdjusterObject.adjustElement();
    }

    var startAd = function () {
        // show video container
        document.getElementById('videoPlayerContainer').style.visibility = 'visible';

        // set the background for the ad as BLACK
        document.body.style.backgroundColor = "#000000";

        // display ad advertisment label
        document.getElementById('advertismentLabel').style.display = 'block';

        // trigger close button count down and display, give the video a chance to load
        if(!glftPlayerUtils.isRewardable()) {
            // start handling close button
            glftPlayerUtils.closeButtonHandler();

            // start handling info button
            glftPlayerUtils.infoButtonHandler();
        }

        glftSspVideoStateHandlerObject = new glftSspVideoStateHandler({
            videoDomObject: document.getElementById('videoObject'),
            videoStatus: videoStatus,
            timeoutPopupObject: document.getElementById('timeout_window'),
            cancelPopupObject: document.getElementById('cancel_video_popup'),
        });
        glftSspVideoStateHandlerObject.startStateMonitoring();

        html5vast('videoObject', {
            additionalQuartileTracking: gladsTrackingUrls,
            tracker: glftSspTracker,
            router: glftSspRouter,
            clickthroughButton: document.getElementById('head_info_btn'),
            clickthroughOverlay: document.getElementById('videoObject'), // use the video object itself
            redirectionCache: redirectionCache
        });

        var videoObject = document.getElementById('videoObject');
        videoObject.play();
    }

    var closeFunction = function () {
        glftSspRouter.redirect(videoStatus.exitString);
    }

    {% if isBpLocation is not empty %}
    var glftSspBuddyPackIV = true;
    {% else %}
    var glftSspBuddyPackIV = false;
    {% endif %}

    {% if fakeBpRequest is not empty %}
    var enterScreenSrc = 'test.png';
    {% else %}
    var enterScreenSrc = '{[enterScreenSrc]}';
    {% endif %}

    var glftSspToolsObject = new glftSspTools();

    document.addEventListener('DOMContentLoaded', function() {
        document.body.addEventListener('touchmove', function (e) {
            e.preventDefault();
        });
    });

    window.addEventListener('load', function () {
        cancelYesButton = document.getElementById('cancel_yes');
        cancelYesButton.addEventListener(glftSspToolsObject.getClickEvent(), cancelYes);
        cancelYesButton.addEventListener('keypress', function (event) {
            if (event.keyCode==13 || event.keyCode==96) {
                this.blur()
                cancelYes();
            };
        });

        cancelNoButton = document.getElementById('cancel_no');
        cancelNoButton.addEventListener(glftSspToolsObject.getClickEvent(event), cancelNo);
        cancelNoButton.addEventListener('keypress', function (event) {
            if (event.keyCode==13 || event.keyCode==96) {
                this.blur()
                cancelNo();
            };
        });

        cancelYesButtonTimeout = document.getElementById('pcEnd');
        cancelYesButtonTimeout.addEventListener(glftSspToolsObject.getClickEvent(), cancelYes);
        cancelYesButtonTimeout.addEventListener('keypress', function (event) {
            if (event.keyCode==13 || event.keyCode==96) {
                this.blur()
                cancelYes();
            };
        });

        cancelNoButtonTimeout = document.getElementById('pcRetry');
        cancelNoButtonTimeout.addEventListener(glftSspToolsObject.getClickEvent(event), cancelNo);
        cancelNoButtonTimeout.addEventListener('keypress', function (event) {
            if (event.keyCode==13 || event.keyCode==96) {
                this.blur()
                cancelNo();
            };
        });

        document.getElementById('head_close').addEventListener(glftSspToolsObject.getClickEvent(), closeFunction);
        document.getElementById('head_close').addEventListener('keypress', function () {
            if (event.keyCode==13 || event.keyCode==96) {
                this.blur()
                closeFunction();
            };
        });

        if (glftSspBuddyPackIV == true && enterScreenSrc.indexOf('[enterScreenSrc]') == -1 && enterScreenSrc != '') {
            startWs();
        } else {
            startAd();
        }
    });
</script>
</body>
</html>