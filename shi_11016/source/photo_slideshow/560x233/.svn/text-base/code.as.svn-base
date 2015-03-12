
// ------------------------------------------------------------------
//	Imports
// ------------------------------------------------------------------
import com.greensock.TweenNano;
import com.greensock.easing.*;
import com.greensock.plugins.*;


// ------------------------------------------------------------------
//	Variables
// ------------------------------------------------------------------

var SPEED:Number = .35;
var EASE:Function = Quint.easeOut;

var _currPic:MovieClip;
var _prevPic:MovieClip;
var _picArray:Array = ["pic0", "pic1", "pic2", "pic3"];
var _count:Number = 0;

var _slideShowInterval:Number;
var _startSlideShowInterval:Number;
var _showIntroInterval:Number;

var _activeMC:MovieClip;
var _hasRolledOver:Boolean = false;


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------


init();


function init():Void
{
	hotspot.onRelease = defaultExit;
	
	_currentPic = _picOrder[0];
	
	initThumbs();
	
	arrow._alpha = 0;
		
	TweenNano.to(legal, 0.5, { _alpha:0, delay:3 });
	
	clearInterval(_startSlideShowInterval);
	_startSlideShowInterval = setInterval(this, "startSlideShow", 2500);
	// TweenNano.delayedCall(2.5, startSlideShow, [this]);
	
	clearInterval(_showIntroInterval);
	_showIntroInterval = setInterval(this, "showIntro", 12500);
	// TweenNano.delayedCall(12.5, showIntro);
};


function startSlideShow(scope:MovieClip):Void
{
	clearInterval(_startSlideShowInterval);
	
	toggleMc(intro, 0);
	
	clearInterval(_slideShowInterval);
	_slideShowInterval = setInterval(this, "showSlideShowPic", 1500);
};


function showSlideShowPic():Void
{	
	_prevPic = heroes["pic"+_count];
	TweenNano.to(_prevPic, SPEED, { _x:_prevPic._width, ease:EASE });
	
		
	if(_count == _picArray.length-1)
	{
		_currPic = heroes.pic0;
		clearInterval(_slideShowInterval);
		activateButtons();
		
		arrow._x -= 20;
		TweenNano.to(arrow, 0.75, { _alpha:100, _x:"20", delay:.75, ease:EASE });
	}
	else
	{
		_currPic = heroes["pic"+(_count+1)];
	};
	
	_currPic._x = -_currPic._width+10;
	TweenNano.to(_currPic, SPEED, { _x:0, ease:EASE });
		
	_count++;
};


function activateButtons():Void
{
	var mc:MovieClip;
	var num:Number;
	for(var i:Number = 0; i < _picArray.length; i++)
	{
		mc = this["btn"+i];
		mc.id = i;
		mc.onRollOver = function():Void { buttonOverHandler(this); };
		mc.onRollOut = showIntro;
	};

	hotspot.onRollOver = hideIntro;
	hotspot.onRollOut = showIntro;
};


function buttonOverHandler(mc:MovieClip):Void
{
	hideIntro();
	showPic(mc);
};


function showPic(mc:MovieClip):Void
{
	_prevPic = _currPic;
	_currPic = heroes[_picArray[mc.id]];
	
	if(_prevPic != _currPic)
	{
		TweenNano.to(_prevPic, SPEED, { _x:_prevPic._width, ease:EASE });
	
		_currPic._x = -_currPic._width+10;
		TweenNano.to(_currPic, SPEED, { _x:0, ease:EASE });
	};
};


function showIntro():Void
{
	clearInterval(_showIntroInterval);
	toggleMc(intro, 100);
	toggleMc(arrow, 0);
};


function hideIntro():Void
{
	if(_hasRolledOver == false)
	{
		_hasRolledOver = true;
	};
	
	toggleMc(intro, 0);
	toggleMc(arrow, 100);
};


function toggleMc(mc:MovieClip, a:Number):Void
{
	TweenNano.to(mc, SPEED, { _alpha:a, ease:EASE });
};


function initThumbs():Void
{
	var mc:MovieClip;
	for(var i:Number = 0; i < _picOrder.length; i++)
	{
		mc = this["btn"+i];
		mc.id = i;
		mc.onRelease = defaultExit;
	};
	
	/*
	var btn:MovieClip;
	var pic:MovieClip;
	
	for(var i:Number = 0; i < _picArray.length; i++)
	{
		btn = this["btn"+i];
		pic = btn["pic"+i];
		
		btn.pic.swapDepths(btn.getNextHighestDepth());
	};
	//*/
	
	//*
	btn1.pic1.swapDepths(btn1.getNextHighestDepth());
	btn2.pic2.swapDepths(btn2.getNextHighestDepth());
	btn3.pic3.swapDepths(btn3.getNextHighestDepth());
	
	
	btn0.pic1._visible = btn0.pic2._visible = btn0.pic3._visible = false;
	btn1.pic0._visible = btn1.pic2._visible = btn1.pic3._visible = false;
	btn2.pic0._visible = btn2.pic1._visible = btn2.pic3._visible = false;
	btn3.pic0._visible = btn3.pic1._visible = btn3.pic2._visible = false;
	
	//*/
};


function defaultExit():Void
{
	getURL(_root.clickTag, "_blank");
};