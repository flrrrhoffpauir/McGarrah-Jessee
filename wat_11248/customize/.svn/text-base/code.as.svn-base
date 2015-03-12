
// ------------------------------------------------------------------
//	Imports
// ------------------------------------------------------------------

import com.greensock.TweenLite;
import com.greensock.easing.*;
import com.greensock.plugins.*;


// ------------------------------------------------------------------
//	Variables
// ------------------------------------------------------------------

var _pauseInterval:Number;

var SPEED:Number = 1;
var EASE:Function = Quart.easeInOut;


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------

TweenPlugin.activate([BlurFilterPlugin]);


function initBanner():void
{	
	logo.oxs = logo.scaleX;
	logo.oys = logo.scaleY;
	
	play();
};


function hideLogo():void
{
	TweenLite.to(logo, SPEED, { scaleX:.8, scaleY:.8, alpha:0, ease:EASE });
};


function initFrame2():void
{
	var scope:MovieClip = frame2;
	
	TweenLite.from(scope.lines, .7, { alpha:0, scaleX:.05, ease:EASE });
	TweenLite.from(scope.copy0, SPEED, { alpha:0, x:"60", delay:.1, ease:EASE });
	TweenLite.from(scope.copy1, SPEED, { alpha:0, x:"-60", delay:.1, ease:EASE });
	TweenLite.from(scope.copy2, SPEED, { alpha:0, x:"60", delay:.2, ease:EASE });
	TweenLite.from(scope.copy3, .8, { alpha:0, y:"40", delay:1.2, ease:EASE });		
	TweenLite.from(scope.bg, .7, { alpha:0, scaleX:.55, scaleY:.55, ease:EASE });
	TweenLite.delayedCall(1.7, initFrame2Handwriting);
};


function initFrame2Handwriting():void
{
	frame2.copy4.copy.play();
	frame2.copy4.shadow.play();
};


function hideFrame2():void
{
	var scope:MovieClip = frame2;
	
	TweenLite.to(scope.lines, .7, { alpha:0, scaleX:.05, scaleY:.5, ease:EASE });
	TweenLite.to(scope.copy0, .5, { alpha:0, x:"60", ease:EASE });
	TweenLite.to(scope.copy1, .5, { alpha:0, x:"-60", ease:EASE });
	TweenLite.to(scope.copy2, .5, { alpha:0, x:"60", ease:EASE });
	TweenLite.to(scope.copy3, .5, { alpha:0, y:"20", ease:EASE });
	TweenLite.to(scope.copy4, .5, { alpha:0, ease:EASE });
	TweenLite.to(scope.bg, .7, { alpha:0, scaleX:.55, scaleY:.55, delay:.1, ease:EASE });
};


function initFrame3():void
{
	var scope:MovieClip = frame3;
	
	TweenLite.from(scope.copy0, SPEED, { alpha:0, x:"-60", delay:.5, ease:EASE });
	TweenLite.from(scope.hero, SPEED, { y:stage.stageHeight+scope.hero.height/2, blurFilter:{ blurY:100, remove:true }, ease:Quint.easeOut });
	TweenLite.from(scope.bg, SPEED, { alpha:0, scaleX:.05, scaleY:.05, ease:Quint.easeOut });
	TweenLite.delayedCall(1.2, initFrame3Handwriting);	
};


function initFrame3Handwriting():void
{
	frame3.copy1.copy.play();
	frame3.copy1.shadow.play();
};


function hideFrame3():void
{
	var scope:MovieClip = frame3;
	
	// Move copy down for frame 4
	// ------------------------------
	TweenLite.to(frame3.copy0, SPEED, { y:"53", ease:EASE });
	TweenLite.to(frame3.copy1, SPEED, { y:"53", ease:EASE });
	
	TweenLite.to(scope.hero, SPEED, { y:stage.stageHeight+scope.hero.height, scaleY:.8, blurFilter:{ blurY:100, remove:true }, ease:EASE });
	TweenLite.to(scope.bg, SPEED, { alpha:0, scaleX:.05, scaleY:.05, ease:EASE });
};


function initFrame4():void
{
	var scope:MovieClip = frame4;
	
	scope.copy0.visible = scope.copy1.visible = scope.copy2.visible = scope.copy3.visible = false;	
	TweenLite.delayedCall(.3, showPointer, [scope.copy0]);
	TweenLite.delayedCall(.5, showPointer, [scope.copy1]);
	TweenLite.delayedCall(.7, showPointer, [scope.copy2]);
	TweenLite.delayedCall(.9, showPointer, [scope.copy3]);
	
	TweenLite.from(scope.hero, SPEED, { y:stage.stageHeight+scope.hero.height/2, blurFilter:{ blurY:100, remove:true }, ease:Quint.easeOut });
	TweenLite.from(scope.bg, SPEED, { alpha:0, scaleX:.05, scaleY:.05, ease:Quint.easeOut });
};


function showPointer(mc:MovieClip):void
{
	mc.visible = true;
	TweenLite.from(mc, SPEED/2, { blurFilter:{ blurX:20, blurY:20 }, overwrite:0, ease:EASE });
	TweenLite.from(mc, SPEED/2, { scaleX:.01, scaleY:.01, overwrite:0, ease:Back.easeOut });
};


function hideFrame4():void
{
	var scope:MovieClip = frame4;
	
	hidePointer(scope.copy0);
	hidePointer(scope.copy1);
	hidePointer(scope.copy2);
	hidePointer(scope.copy3);
	
	TweenLite.to(frame3.copy0, SPEED, { alpha:0, y:"-53", blurFilter:{ blurY:20 }, delay:.2, ease:EASE });
	TweenLite.to(frame3.copy1, SPEED, { alpha:0, y:"-53", blurFilter:{ blurY:20 }, delay:.2, ease:EASE });
	
	TweenLite.to(scope.hero, SPEED, { y:stage.stageHeight+scope.hero.height, scaleY:.8, blurFilter:{ blurY:100, remove:true }, delay:.2, ease:EASE });
	TweenLite.to(scope.bg, SPEED, { alpha:0, scaleX:.05, scaleY:.05, delay:.2, ease:EASE });
};


function hidePointer(mc:MovieClip):void
{
	TweenLite.to(mc, SPEED/2, { blurFilter:{ blurX:20, blurY:20 }, ease:EASE })
	// TweenLite.to(mc, SPEED/2, { alpha:0, overwrite:0, ease:Quint.easeOut });
	TweenLite.to(mc, SPEED/2, { scaleX:.01, scaleY:.01, overwrite:0, ease:Back.easeIn });
};


function showLogo():void
{
	TweenLite.to(logo, SPEED, { alpha:1, scaleX:logo.oxs, scaleY:logo.oys, ease:EASE });
	TweenLite.delayedCall(1, replayLogo);
};


function replayLogo():void
{
	logo.gotoAndPlay("replay");
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