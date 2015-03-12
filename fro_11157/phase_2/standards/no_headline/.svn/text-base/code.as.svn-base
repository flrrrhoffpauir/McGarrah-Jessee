
// ------------------------------------------------------------------
//	Imports
// ------------------------------------------------------------------

import com.greensock.TweenLite;
import com.greensock.easing.*;
import com.greensock.plugins.*;


// ------------------------------------------------------------------
//	Variables
// ------------------------------------------------------------------

var _pauseTimer:Timer;
var _loaderInfoParams:Object = LoaderInfo(this.root.loaderInfo).parameters;

var SPEED:Number = 1.5;
var EASE:Function = Quart.easeInOut;

var _frame1:Number = 1;


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------

TweenPlugin.activate([RemoveTintPlugin, TintPlugin]);


function initBanner():void
{
	cta.alpha = 0;
};


function animateFrame1():void
{
	// frame 1
	// --------------------
	TweenLite.from(bg, 1.75, { alpha:0, ease:EASE });
	TweenLite.from(logo, 1.75, { alpha:0, ease:EASE });
	TweenLite.from(fdic, 1.75, { alpha:0, ease:EASE });
	cta.alpha = 1;
	TweenLite.from(cta, SPEED, { y:cta.y+bannerConfig.dist, alpha:0, delay:_frame1, ease:EASE, onComplete:shimmerCta, onCompleteScope:this });
};


function shimmerCta():void
{
	cta.gotoAndPlay("shimmer");
};


/*
function pauseTl(num:Number):void
{
	stop();
	_pauseTimer = new Timer(num*1000, 1);
	_pauseTimer.addEventListener(TimerEvent.TIMER, playTl);
	_pauseTimer.start();
};


function playTl(e:TimerEvent):void
{
	play();
	_pauseTimer.stop();
};
//*/


// ------------------------------------------------------------------
//	Handlers
// ------------------------------------------------------------------

hotspot.addEventListener(MouseEvent.CLICK, hotspotClickHandler);
hotspot.addEventListener(MouseEvent.MOUSE_OVER, hotspotOverHandler);
hotspot.addEventListener(MouseEvent.MOUSE_OUT, hotspotOutHandler);


function hotspotClickHandler(e:MouseEvent):void
{
	if(_loaderInfoParams.clickTag)
		navigateToURL(new URLRequest(_loaderInfoParams.clickTag), "_blank");
	else
		trace("-- Error: No clickTag found");
};


function hotspotOverHandler(e:MouseEvent):void
{
	shimmerCta();
	TweenLite.to(cta.txt, .5, { tint:0x0B5CA0, ease:Quart.easeOut });
};


function hotspotOutHandler(e:MouseEvent):void
{
	TweenLite.to(cta.txt, .5, { removeTint:true, ease:Quart.easeOut });
};