
// ------------------------------------------------------------------
//	Imports
// ------------------------------------------------------------------

import com.greensock.TweenLite;
import com.greensock.easing.*;


// ------------------------------------------------------------------
//	Variables
// ------------------------------------------------------------------

var _pauseInterval:Number;

var SPEED:Number = 1;
var EASE:Function = Quart.easeOut;


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------

function initBanner():void
{
	// TweenLite.from(bg, SPEED, { y:0, delay:.5, ease:EASE });
	
	// TweenLite.from(food_mask0, SPEED, { scaleY:0, delay:.5, ease:EASE });
	// TweenLite.from(shake, .6, { x:567, y:"50", scaleX:.8, scaleY:.8, delay:.5, ease:EASE });
	
	
	TweenLite.from(food_mask1, SPEED, { scaleY:0, delay:.5, ease:EASE });
	TweenLite.from(stroke, SPEED, { y:349, delay:.5, ease:EASE });
	
	initHeader();
};


function initHeader():void
{
	TweenLite.from(header.bg, .7, { scaleX:0, scaleY:0, delay:.5, ease:Back.easeOut });
	
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
			dlay = .7;
			TweenLite.from(scope, .5, { alpha:1, scaleX:0, scaleY:0, delay:dlay, ease:Back.easeOut });
		break;
		
		
		// "pineapple"
		case 1:
			dlay = 1;
			var mc:MovieClip;
			var count:Number = 1;
			
			for(var i:Number = 0; i < scope.numChildren; i++)
			{
				mc = scope["letter"+i];
				TweenLite.from(mc, .5, { scaleX:0, scaleY:0, delay:dlay+count*.08, ease:EASE });
				count++;
			};
			
		break;
		
		
		// "pies & shakes"
		case 2:
			dlay = 2;
			TweenLite.from(scope.word0, .7, { alpha:0, scaleX:3, scaleY:3, delay:dlay, ease:EASE });
			TweenLite.from(scope.word1, .7, { alpha:0, delay:dlay+.1, ease:EASE });
			TweenLite.from(scope.word2, .7, { alpha:0, scaleX:3, scaleY:3, delay:dlay, ease:EASE });
			// TweenLite.from(shake, .6, { x:567, y:"50", scaleX:.8, scaleY:.8, delay:dlay, ease:EASE });
			
			TweenLite.from(shake, 1.8, { x:-shake.width, delay:dlay+.4, ease:EASE });
			TweenLite.from(footer_mask, 1.8, { x:-footer_mask.width, delay:dlay+.4, ease:EASE });
			TweenLite.from(nutriBtn1, 1, { alpha:0, delay:dlay+2, ease:EASE });
			TweenLite.from(nutriBtn2, 1.8, { alpha:0, delay:dlay+2, ease:EASE });
			TweenLite.from(nutriBtn3, 2.5, { alpha:0, delay:dlay+2, ease:EASE });
			shimmerFooter(dlay+1);
			
			initHeaderLines(dlay+.1);
		break;
	};
};


function initHeaderLines(dlay:Number):void
{
	TweenLite.from(header.lines.mask, .7, { scaleX:.5, delay:dlay, ease:EASE });
	
	// initFooter(dlay+.4);
};


function initFooter(dlay:Number):void
{
	var scope:MovieClip = footer;
	var mc:MovieClip;
	var count:Number = 1;
	
	for(var i:Number = 0; i < 4; i++)
	{
		mc = scope["word"+i];
		TweenLite.from(mc, .7, { y:"30", scaleY:.4, delay:dlay+count*.1, ease:EASE });
		count++;
	};
	
	shimmerFooter(dlay+.3);
};


function shimmerFooter(dlay:Number = 0):void
{
	/*
	if(footer.shimmer.x == 568)
	{
		TweenLite.from(footer.shimmer, 1, { x:-footer.shimmer.width, delay:dlay, ease:EASE });
	};
	*/
	
	TweenLite.from(footer.shimmer, 4, { x:-footer.shimmer.width, delay:dlay, ease:EASE });
};



// ------------------------------------------------------------------
//	Handlers
// ------------------------------------------------------------------

nutriBtn2.addEventListener(MouseEvent.CLICK, nutriBtn2ClickHandler);
nutriBtn3.addEventListener(MouseEvent.CLICK, nutriBtn3ClickHandler);


function nutriBtn2ClickHandler(e:MouseEvent):void
{
	navigateToURL(new URLRequest("/browse_build_a_meal_details.php?menuitem=275"), "_self");
};


function nutriBtn3ClickHandler(e:MouseEvent):void
{
	navigateToURL(new URLRequest("/browse_build_a_meal_details.php?menuitem=273"), "_self");
};
