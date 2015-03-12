
// ------------------------------------------------------------------
//	Imports
// ------------------------------------------------------------------
import com.greensock.TweenLite;
import com.greensock.easing.*;
import com.greensock.plugins.*;

import eyeblaster.events.EBMetadataEvent;


// ------------------------------------------------------------------
//	Variables
// ------------------------------------------------------------------

var SPEED:Number = .5;
var EASE:Function = Quint.easeInOut;

var _mainVideoPlaying:Boolean = false;
var _isPaused:Boolean = false;

var _alreadyStarted:Boolean = false; // keeps track of looping video initialized status
var _loopInt:Number; // looping video interval

var _loadPoliteBannerInterval:Number;


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------

TweenPlugin.activate([RemoveTintPlugin, TintPlugin]);


function initDefaultBanner():Void
{
	var scope:MovieClip = frame0;
	var speed:Number = 1.5;
	scope._visible = true;

	TweenLite.from(scope.logo, speed, { _alpha:0, ease:EASE });
	TweenLite.from(scope.headline, speed, { _alpha:0, delay:1, ease:EASE });
	TweenLite.from(scope.cta, speed, { _alpha:0, delay:1, ease:EASE, onComplete:checkPoliteStatus, onCompleteScope:this });
	TweenLite.from(initbg, speed, { _alpha:0, delay:1, ease:EASE });
};


function checkPoliteStatus():Void
{
	clearInterval(_loadPoliteBannerInterval);
	_loadPoliteBannerInterval = setInterval(this, "tryPoliteLoad", 1000);
};


function tryPoliteLoad():Void
{
	EB.ShowRichBanner();
};


function initBanner():Void
{
	// hide frames	
	var mc:MovieClip;
	for(var i:Number = 0; i < 5; i++)
	{
		mc = this["frame"+i];
		mc._visible = false;
	};
	
	
	// hide video
	_videoLoaderInst._alpha = 0;
	
	
	// set bar coords
	if(!bar.oy)
	{
		bar.oy = bar._y;
		bar.ny = Stage.height;
		bar._y = bar.ny;
		bar._visible = false;
	};
	
	
	// init hotspot
	hotspot.onRollOver = hotspotRollOverHandler;
	hotspot.onRollOut = hotspotRollOutHandler;
	hotspot.onRelease = hotspotReleaseHandler;
};


function initFrame0():Void
{
	frame0._visible = true;
	initCtaFrame0();
};


function initBar():Void
{
	bar._visible = true;
	
	bar.pause.onRollOver = pauseRollOverHandler;
	bar.pause.onRollOut = pauseRollOutHandler;
	bar.pause.onRelease = pauseReleaseHandler;
	
	// bar.hotspot.onRollOver = barRollOverHandler;
	// bar.hotspot.onRollOut = barRollOutHandler;
	// bar.hotspot.onRelease = barReleaseHandler;
};


function initCtaFrame0():Void
{
	frame0.hs.onRollOver = frame0CtaRollOverHandler;
	frame0.hs.onRollOut = frame0CtaRollOutHandler;
	frame0.hs.onRelease = frame0CtaReleaseHandler;
};


function initCtaFrame4():Void
{
	shimmerCta(frame4.cta);
	frame4.cta.onRollOver = frame4CtaRollOverHandler;
	frame4.cta.onRelease = frame4CtaReleaseHandler;
};


function replayLoopingMovie():Void
{
	clearInterval(_loopInt);
	_videoLoaderInst.netStream.seek(0);
	_videoLoaderInst.play();
};


function shimmerCta(mc:MovieClip):Void
{
	if(mc._currentframe == 1)
		mc.gotoAndPlay("shimmer");
};


function loadMainVideo():Void
{
	_videoLoaderInst.loadAndPlay(2);
};


// ------------------------------------------------------------------
//	Handlers
// ------------------------------------------------------------------

/*
function hotspotRollOutHandler():Void
{
	if (!hotspot.hitTest( _root._xmouse, _root._ymouse, false) && !bar.hotspot.hitTest( _root._xmouse, _root._ymouse, false)  && !bar.pause.hitTest( _root._xmouse, _root._ymouse, false))
	{
		TweenLite.to(bar, SPEED, {  _y:bar.ny, ease:EASE });
	};	
};


function barRollOutHandler():Void
{
	if (!hotspot.hitTest( _root._xmouse, _root._ymouse, false) && !bar.hotspot.hitTest( _root._xmouse, _root._ymouse, false)  && !bar.pause.hitTest( _root._xmouse, _root._ymouse, false))
	{
		TweenLite.to(bar, SPEED, {  _y:bar.ny, ease:EASE });
	};	
};
//*/


function hotspotRollOverHandler():Void
{
	if(_mainVideoPlaying)
	{
		showBar();
	};
};


function hotspotRollOutHandler():Void
{
	hideBar();
};


function hotspotReleaseHandler():Void
{
	defaultExit();
};


function barRollOverHandler():Void
{
	showBar();
}

function barRollOutHandler():Void
{
	hideBar();
};


function barReleaseHandler():Void
{
	defaultExit();
};


function pauseRollOverHandler():Void
{
	// showBar();
};


function pauseRollOutHandler():Void
{
	 // hideBar();
};


function pauseReleaseHandler():Void
{
	if(_isPaused)
	{
		_isPaused = false;
		_videoLoaderInst.play();
		bar.pause.gotoAndStop("pause");
	}
	else
	{
		_isPaused = true;
		_videoLoaderInst.pause(0);
		bar.pause.gotoAndStop("play");
	};
};


function showBar():Void
{
	TweenLite.to(bar, SPEED, {  _y:bar.oy, ease:EASE, onComplete:shimmerCta, overwrite:0, onCompleteScope:this, onCompleteParams:[bar.cta] });
};


function hideBar():Void
{
	if(!hotspot.hitTest( _root._xmouse, _root._ymouse, false) && !bar.pause.hitTest( _root._xmouse, _root._ymouse, false))
	{
		TweenLite.to(bar, SPEED, { _y:bar.ny, ease:EASE, overwrite:0 });
	};
};


function frame0CtaRollOverHandler():Void
{
	TweenLite.to(frame0.cta.copy, SPEED, { tint:0x000000, ease:Expo.easeOut });
	
	_hasInteracted = true;
};


function frame0CtaRollOutHandler():Void
{
	TweenLite.to(frame0.cta.copy, SPEED, { tint:0x3F7189, ease:Expo.easeOut });
};


function frame0CtaReleaseHandler():Void
{
	clearInterval(_loopInt);
		
	TweenLite.to(_videoLoaderInst, SPEED, { _alpha:0, ease:EASE });
	TweenLite.to(initbg, SPEED, { _alpha:0, ease:EASE });
	TweenLite.to(frame0, SPEED, { _alpha:0, ease:EASE, onComplete:loadMainVideo, onCompleteScope:this });
};


function frame4CtaRollOverHandler():Void
{
	shimmerCta(this);
};


function frame4CtaReleaseHandler():Void
{
	defaultExit();
};


function replayOverHandler():Void
{
	TweenLite.to(frame4.replay.arrow, 1, { _rotation:360, ease:Expo.easeOut });
};


function replayReleaseHandler():Void
{
	initBanner();
	frame0CtaReleaseHandler();
};


function videoStatusHandler(s:String):Void
{
	if(s == "Ready" && !_alreadyStarted)
	{
		_alreadyStarted = true;
		//TweenLite.to(_videoLoaderInst, SPEED, {_alpha:100, ease:EASE });
		//TweenLite.to(initbg, SPEED, { _alpha:0, delay:.2, ease:EASE });
		
		_videoLoaderInst._alpha = 100;
		initbg._alpha = 0;
	};
};


function cuePointHandler(e):Void
{
	switch(e.name)
	{
		case "movieStart":
			logo._visible = true;
			logo._alpha = 100;
			TweenLite.to(_videoLoaderInst, SPEED, { _alpha:100, ease:EASE });
			frame0._visible = false;
			frame1._visible = true;
			_mainVideoPlaying = true;
			_videoLoaderInst.stopLoop();
			initBar();
		break;
		
		
		case "hideFrame1":
			frame1._visible = false;
		break;
		
		
		case "showFrame2":
			frame2._visible = true;
			TweenLite.from(frame2, SPEED, { _alpha:0, ease:EASE });
		break;
		
		
		case "showFrame3":
			frame3._visible = true;
			TweenLite.from(frame3, SPEED, { _alpha:0, ease:EASE });
			frame2._visible = false;
		break;
		
		
		case "hideFrame3":
			frame3._visible = false
		break;
		
		
		case "showFrame4":
		
			bar._visible = false;
			//logo._visible = false;
			TweenLite.to(logo, 1, { _alpha:0, ease:EASE });
			
			var scope:MovieClip = frame4;
			var speed:Number = 1.5;
			scope._visible = true;

			TweenLite.from(scope.logo, speed, { _alpha:0, ease:EASE });
			TweenLite.from(scope.line0, speed, { _alpha:0, _xscale:0, delay:1, ease:EASE });
			TweenLite.from(scope.line1, speed, { _alpha:0, _xscale:0, delay:1, ease:EASE });
			TweenLite.from(scope.headline, speed, { _alpha:0, delay:1.5, ease:EASE });
			TweenLite.from(scope.cta, speed, { _alpha:0, delay:1.5, ease:EASE, onComplete:initCtaFrame4, onCompleteScope:this });
			TweenLite.from(scope.replay, speed, { _alpha:0, delay:2, ease:EASE });
			TweenLite.from(scope.member, speed, { _alpha:0, ease:EASE });
			scope.replay.onRelease = replayReleaseHandler;
			scope.replay.onRollOver = replayOverHandler;
		break;
		
		
		case "movieEnd":
			
			// calls this at the end of both videos
			clearInterval(_loopInt);
			//if(!_mainVideoPlaying && _hasInteracted)
			if(!_mainVideoPlaying)
			{
				_videoLoaderInst.pause(1);
				
				_loopInt = setInterval(this, "replayLoopingMovie", 10000);
			}
			else
			{
				// pause the main video so it doesn't call movieStart
				_videoLoaderInst.pause(1);
			};
			_mainVideoPlaying = false;
		break;
	};
};


function defaultExit():Void
{
	if(_mainVideoPlaying)
	{
		_isPaused = true;
		_videoLoaderInst.pause(0);
		bar.pause.gotoAndStop("play");
	};
	
	EB.Clickthrough();
};
