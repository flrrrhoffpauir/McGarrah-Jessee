
// ------------------------------------------------------------------
//	Imports
// ------------------------------------------------------------------

import com.greensock.TweenNano;
import com.greensock.easing.*;


// ------------------------------------------------------------------
//	Variables
// ------------------------------------------------------------------

var _pauseInterval:Number;

var SPEED:Number = .5;
var EASE:Function = Quad.easeOut;


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------

function initBanner():Void
{
	TweenNano.from(frame0, SPEED, { _x:-20-frame0._width, delay:.5, ease:EASE });
	TweenNano.from(frame1, SPEED, { _x:-20-frame1._width, delay:.3, ease:EASE });
	TweenNano.from(frame2, SPEED, { _x:-20-frame2._width, delay:.1, ease:EASE });
};


function initStamp():Void
{
	TweenNano.from(stamp, SPEED, { _alpha:0, _xscale:200, _yscale:200, _rotation:-20, ease:Quad.easeIn });
};


function showImage(frameNum:Number, imgNum:Number):Void
{
	pauseTl(1);
	
	var frame:MovieClip = this["frame"+frameNum];
	var img:MovieClip = frame["img"+imgNum];
	
	var mc:MovieClip;
	for(var i:Number = 0; i < 2; i++)
	{
		mc = frame["img"+i];
		if(mc == img)
		{
			TweenNano.to(img, SPEED, { _alpha:100, ease:EASE });
		}
		else
		{
			TweenNano.to(mc, SPEED, { _alpha:0, ease:EASE });
		};
	};
};


function initCta():Void
{
	cta.onRollOver = playShimmer;
	cta.onRelease = defaultExit;
	
	TweenNano.from(cta, SPEED, { _y:Stage.height+10, ease:EASE, onComplete:playShimmer, onCompleteScope:this });
};


function hideLegal():Void
{
	TweenNano.to(legal, 0.5, {_alpha:0});
};


function playShimmer():Void
{
	if(cta._currentframe == 1)
		cta.gotoAndPlay(2);	
};


function loopBanner():Void
{
	if(_currentframe == 95)
		gotoAndPlay("loop");
};


function pauseTl(num:Number):Void
{
	stop();
	clearInterval(_pauseInterval);
	_pauseInterval = setInterval(this, "playTl", num*1000);
};


function playTl():Void
{
	play();
	clearInterval(_pauseInterval);
};


// ------------------------------------------------------------------
//	Handlers
// ------------------------------------------------------------------

hotspot.onRelease = defaultExit;
hotspot.onRollOver = loopBanner;


function defaultExit():Void
{
	// getURL(_root.clickTag, "_blank");
	EB.Clickthrough();
};