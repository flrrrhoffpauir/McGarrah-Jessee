
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

function toggleAssetsVisibility(b:Boolean):void
{
	var assetArray:Array = [header, footer.txt, footer.lines0, footer.lines1, exitBtn0, burst];
	
	for(var i:Number = 0; i < assetArray.length; i++)
	{
		assetArray[i].visible = b;
	};
};


function initBanner():void
{
	var dlay:Number = .5;
	
	toggleAssetsVisibility(false);
	
	// TweenLite.from(bg, 1, { alpha:0, delay:dlay, ease:Quart.easeInOut });
	TweenLite.from(hero, 12, { scaleX:.8, scaleY:.8, delay:dlay+.2, ease:Sine.easeOut });
	TweenLite.from(hero_mask, 1.5, { y:"40", scaleY:0, delay:dlay, ease:Quart.easeInOut });
	TweenLite.from(stripe_mask, 1, { x:stage.stageWidth+10, delay:1.4, ease:Quart.easeInOut });
	
	TweenLite.delayedCall(1.8, initHeader);
	TweenLite.delayedCall(3.4, initFooter);
	TweenLite.delayedCall(5.5, initBurst);
};


function initHeader():void
{	
	header.patty.visible = header.patty_shadow.visible = header.patty_lines.visible = false;
	header.melt_shadow.visible = header.melt.visible = header.melt_lines.visible = false;
	header.whataburger.visible = false;
	header.visible = true;
	
	TweenLite.from(header, .3, { alpha:0, ease:EASE });
	TweenLite.from(header.bg, SPEED, { x:"47", y:"30", ease:Quart.easeOut });
	TweenLite.from(header.bg_mask, SPEED, { x:"47", y:"30", ease:Quart.easeOut });
	
	TweenLite.delayedCall(.4, initHeaderCopy, ["whataburger"]);
	TweenLite.delayedCall(.9, initHeaderCopy, ["patty"]);
	TweenLite.delayedCall(1.3, initHeaderCopy, ["melt"]);
};


function initHeaderCopy(copy:String):void
{
	switch(copy)
	{
		case "whataburger":
			header.whataburger.visible = true;
			TweenLite.from(header.whataburger_mask, SPEED, { x:header.whataburger_mask.x - header.whataburger_mask.width, ease:Quart.easeOut });
		break;
		
		
		case "patty":
			header.patty.visible = header.patty_shadow.visible = header.patty_lines.visible = true;
			TweenLite.from(header.patty, .3, { alpha:0, ease:EASE });
			TweenLite.from(header.patty, SPEED, { x:"40", y:"40", overwrite:0, ease:Quart.easeOut });
			TweenLite.from(header.patty_mask, SPEED, { x:"40", y:"40", ease:Quart.easeOut });
			TweenLite.from(header.patty_lines_mask, 1, { scaleX:1.25, ease:Quart.easeOut });
		break;
		
		
		case "melt":
			header.melt_shadow.visible = header.melt.visible = header.melt_lines.visible = true;
			TweenLite.from(header.melt, .3, { alpha:0, ease:EASE });
			TweenLite.from(header.melt, SPEED, { x:"40", y:"40", overwrite:0, ease:Quart.easeOut });
			TweenLite.from(header.melt_mask, SPEED, { x:"40", y:"40", ease:Quart.easeOut });
			TweenLite.from(header.melt_lines_mask, 1, { scaleX:1.50, ease:Quart.easeOut });
		break;
	};
};


function initFooter():void
{
	footer.txt.visible = footer.lines0.visible = footer.lines1.visible = true;
		
	TweenLite.from(footer.lines0, 1.25, { width:0, ease:Quart.easeIn });
	TweenLite.from(footer.lines1, 1.25, { width:0, ease:Quart.easeIn });
	
	TweenLite.to(footer.lines0, 1.25, { width:56, delay:1.25, overwrite:0, ease:Quart.easeOut });
	TweenLite.to(footer.lines1, 1.25, { width:56, delay:1.25, overwrite:0, ease:Quart.easeOut });
	
	TweenLite.from(footer.txt, 1, { alpha:0, delay:1.6, overwrite:0, ease:Quart.easeInOut });
	
	exitBtn0.visible = true;
	TweenLite.from(exitBtn0, 1, { alpha:0, delay:2, ease:Quart.easeInOut, onComplete:initExitBtns, onCompleteScope:this });
};


function shimmerFooter(dlay:Number = 0):void
{	
	TweenLite.from(footer.shimmer, 4, { x:-footer.shimmer.width, delay:dlay, ease:EASE });
};


function initBurst():void
{
	burst.visible = true;
	
	TweenLite.from(burst.txt, SPEED, { alpha:0, delay:.2, ease:EASE });
	TweenLite.from(burst.bg, SPEED, { scaleX:0, scaleY:0, ease:Back.easeOut });
	TweenLite.from(burst.bg, SPEED*3, { rotation:-150, overwrite:0, ease:Quart.easeOut });
};


// ------------------------------------------------------------------
//	Handlers
// ------------------------------------------------------------------

function initExitBtns():void
{
	exitBtn0.addEventListener(MouseEvent.CLICK, exitBtn0ClickHandler);
};


function exitBtn0ClickHandler(e:MouseEvent):void
{
	navigateToURL(new URLRequest("/browse_build_a_meal_details.php"), "_self");
};
