
// ------------------------------------------------------------------
//	Imports
// ------------------------------------------------------------------

import com.greensock.TweenLite;
import com.greensock.easing.*;


// ------------------------------------------------------------------
//	Variables
// ------------------------------------------------------------------

var _pauseTimer:Timer;
var _loaderInfoParams:Object = LoaderInfo(this.root.loaderInfo).parameters;

var SPEED:Number = 1;
var EASE:Function = Quart.easeOut;


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------

function initLogo():void
{
	// get current placements
	
	logo.ox = logo.x;
	logo.oy = logo.y;
	logo.os = logo.scaleX;
	
	logobg.ox = logobg.x;
	logobg.oy = logobg.y;
	logobg.oh = logobg.height;
	logobg.ow = logobg.width;
	
	
	// set new placements
	
	// logo.scaleX = logo.scaleY = .45;
	logo.x = stage.stageWidth/2 - logo.width/2;
	logo.y = stage.stageHeight/2 - logo.height/2;

	logobg.x = 0;
	logobg.y = 0;
	logobg.width = stage.stageWidth;
	logobg.height = stage.stageHeight;
};


function hideBannerItems():void
{
	food_mask.visible = header.visible = bg.visible = pie.visible = shake.visible = false;
};


function initBanner():void
{
	food_mask.visible = header.visible = bg.visible = pie.visible = shake.visible = true;
	
	TweenLite.to(logo, SPEED, { x:logo.ox, y:logo.oy, scaleX:logo.os, scaleY:logo.os, delay:.5, ease:Quart.easeInOut });
	TweenLite.from(bgmask, SPEED, { scaleX:0, delay:.85, ease:EASE });
	TweenLite.from(pie, 12.5, { scaleX:1.25, scaleY:1.25, delay:1, ease:Sine.easeOut });
	TweenLite.from(food_mask, SPEED, { scaleX:0, delay:1, ease:EASE });
	
	TweenLite.delayedCall(7, animateLogo);
	
	initHeader();
};


function initHeader():void
{
	TweenLite.from(header.bg, .7, { scaleX:0, scaleY:0, delay:1.2, ease:Back.easeOut });
	
	initHeaderCopy(0);
	initHeaderCopy(1);
	initHeaderCopy(2);
};


function initHeaderCopy(n:Number):void
{
	var dlay:Number;
	var scope:MovieClip = header["copy"+n];
	

	switch(n)
	{
		// "try our new"
		case 0:
			dlay = 1.4;
			TweenLite.from(scope, .5, { alpha:1, scaleX:0, scaleY:0, delay:dlay, ease:Back.easeOut });
		break;
		
		
		// "pineapple"
		case 1:
			dlay = 1.5;
			var mc:MovieClip;
			var count:Number = 1;
			
			for(var i:Number = 0; i < scope.numChildren; i++)
			{
				mc = scope["letter"+i];
				TweenLite.from(mc, .5, { scaleX:0, scaleY:0, delay:dlay+count*.05, ease:EASE });
				count++;
			};
			
		break;
		
		
		// "pies & shakes"
		case 2:
			dlay = 2.5;
			TweenLite.from(scope.word0, .7, { alpha:0, scaleX:3, scaleY:3, delay:dlay, ease:EASE });
			TweenLite.from(scope.word1, .7, { alpha:0, delay:dlay+.2, ease:EASE });
			TweenLite.from(scope.word2, .7, { alpha:0, scaleX:3, scaleY:3, delay:dlay, ease:EASE });
			
			TweenLite.from(shake, 1.5, { x:stage.stageWidth/2, delay:dlay+.4, ease:EASE });
						
			initHeaderLines(dlay+.1);
		break;
	};
};


function initHeaderLines(dlay:Number):void
{
	TweenLite.from(header.lines.mask, .7, { scaleX:.5, delay:dlay, ease:EASE });
};


function animateLogo():void
{
	if(logo.currentFrame >= 36) 
	{
		logo.gotoAndPlay("replay");
	};
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


function hotspotClickHandler(e:MouseEvent):void
{
	/*
	if(_loaderInfoParams.clickTag)
		navigateToURL(new URLRequest(_loaderInfoParams.clickTag), "_blank");
	else
		trace("-- Error: No clickTag found");
	*/
	
	EBStd.Clickthrough();
};


function hotspotOverHandler(e:MouseEvent):void
{
	animateLogo();
};