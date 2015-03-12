
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
var _pauseTimes:Array = [2.5, 2];


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------

TweenPlugin.activate([RemoveTintPlugin, TintPlugin]);


function initBanner():void
{
	headline.oy = headline.y;
	headline.y += bannerConfig.dist;
	cta.alpha = 0;
	
	var mc:MovieClip;
	for(var i:Number = 1; i < bannerConfig.numClips; i++)
	{
		mc = headline.getChildByName("text"+i) as MovieClip;
		mc.alpha = 0;
	};
};


function animateFrame1():void
{
	// frame 1
	// --------------------
	TweenLite.from(bg, 1.75, { alpha:0, ease:EASE });
	TweenLite.from(logo, 1.75, { alpha:0, ease:EASE });
	TweenLite.from(fdic, 1.75, { alpha:0, ease:EASE });
	TweenLite.from(headline, .5, { scaleX:2, scaleY:2, alpha:0, y:"-30", delay:_frame1, overwrite:0, ease:Quart.easeIn });
};


function animateFrame2():void
{
	var dist:String = String(Math.ceil(-(bannerConfig.dist / bannerConfig.numClips)) * (bannerConfig.numClips-1));
	
	switch(bannerConfig.id)
	{
		case "160x600":
		case "300x100":
		case "300x250":
		case "300x600":
		case "468x60":
		case "728x90":
			TweenLite.to(headline, SPEED, { y:headline.oy, ease:EASE });
			TweenLite.to(headline.text1, SPEED, { alpha:1, ease:EASE });
			TweenLite.to(headline.text2, SPEED, { alpha:1, ease:EASE });
		break;		
	};
};


function animateFrame3():void
{
	var dist:String = String(Math.ceil(-(bannerConfig.dist / bannerConfig.numClips)));
	
	switch(bannerConfig.id)
	{
		case "160x600":
		case "300x250":		
		case "300x600":
			// TweenLite.to(headline, SPEED, { y:dist, ease:EASE });
			cta.alpha = 1;
			TweenLite.from(cta, SPEED, { y:cta.y+bannerConfig.dist/bannerConfig.numClips, alpha:0, ease:EASE, onComplete:shimmerCta, onCompleteScope:this });
		break;
		
		
		case "300x100":
			TweenLite.to(logo, SPEED, { x:177, ease:EASE });
			cta.alpha = 1;
			TweenLite.from(cta, SPEED, { y:cta.y+bannerConfig.dist, alpha:0, delay:.3, ease:EASE, onComplete:shimmerCta, onCompleteScope:this });
		break;
		
		
		case "468x60":
			TweenLite.to(logo, SPEED, { x:333, y:8, ease:EASE });
			cta.alpha = 1;
			TweenLite.from(cta, SPEED, { y:cta.y+bannerConfig.dist, alpha:0, ease:EASE, onComplete:shimmerCta, onCompleteScope:this });
		break;
		
		
		case "728x90":
			TweenLite.to(logo, SPEED, { y:16, ease:EASE });
			cta.alpha = 1;
			TweenLite.from(cta, SPEED, { y:cta.y+bannerConfig.dist, alpha:0, ease:EASE, onComplete:shimmerCta, onCompleteScope:this });
		break;
	};
};


function shimmerCta():void
{
	cta.gotoAndPlay("shimmer");
};


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