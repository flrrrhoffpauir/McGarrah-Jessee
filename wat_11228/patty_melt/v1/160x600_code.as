
// ------------------------------------------------------------------
//	Imports
// ------------------------------------------------------------------
import com.greensock.TweenLite;
import com.greensock.easing.*;
import com.greensock.plugins.*;


// ------------------------------------------------------------------
//	Variables
// ------------------------------------------------------------------

var SPEED:Number = .8;
var EASE:Function = Quart.easeInOut;


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------

TweenPlugin.activate([TintPlugin]);


function initLogo():Void
{
	// get current placements
	
	logo.ox = logo._x;
	logo.oy = logo._y;
	logo.os = logo._xscale;
	
	/*
	logobg.ox = logobg._x;
	logobg.oy = logobg._y;
	logobg.oh = logobg._height;
	logobg.ow = logobg._width;
	//*/
	
	
	// set new placements
	logo._xscale = logo._yscale = 21;
	logo._x = Stage.width/2 - logo._width/2;
	logo._y = Stage.height/2 - logo._height/2;

	/*
	logobg._x = 0;
	logobg._y = 0;
	logobg._width = Stage.width;
	logobg._height = Stage.height;
	//*/
};


function toggleAssetsVisibility(b:Boolean):Void
{
	var assetArray:Array = [bg, hero, hero_mask, footer, header, stripe, footer.txt, footer.lines0, footer.lines1, burst];
	
	for(var i:Number = 0; i < assetArray.length; i++)
	{
		assetArray[i]._visible = b;
	};
};


function initBanner():Void
{
	initHotspot();
	
	var dlay:Number = .5;
	
	bg._visible = hero._visible = hero_mask._visible = footer._visible = stripe._visible = true;
	
	TweenLite.to(logo, 1, { tint:0xF96A0C, _x:logo.ox, _y:logo.oy, _xscale:logo.os, _yscale:logo.os, delay:dlay, ease:Quart.easeInOut });
	TweenLite.from(bg, 1, { _alpha:0, delay:dlay, ease:Quart.easeInOut });
	TweenLite.from(hero, 12, { _xscale:87, _yscale:87, delay:dlay+.2, ease:Sine.easeOut });
	TweenLite.from(hero_mask, 1.5, { _y:"10", _yscale:0, delay:dlay, ease:Quart.easeInOut });
	TweenLite.from(stripe_mask, 1, { _x:Stage.width+10, delay:1.4, ease:Quart.easeInOut });
	
	TweenLite.delayedCall(1.8, initHeader);
	TweenLite.delayedCall(3.4, initFooter);
	TweenLite.delayedCall(5.5, initBurst);
};


function initHeader():Void
{	
	header.patty._visible = header.patty_shadow._visible = header.patty_lines._visible = false;
	header.melt_shadow._visible = header.melt._visible = header.melt_lines._visible = false;
	header.whataburger._visible = false;
	header._visible = true;
	
	TweenLite.from(header, .3, { _alpha:0, ease:EASE });
	TweenLite.from(header.bg, SPEED, { _x:"57", _y:"40", ease:Quart.easeOut });
	TweenLite.from(header.bg_mask, SPEED, { _x:"57", _y:"40", ease:Quart.easeOut });
	
	TweenLite.delayedCall(.4, initHeaderCopy, ["whataburger"]);
	TweenLite.delayedCall(.9, initHeaderCopy, ["patty"]);
	TweenLite.delayedCall(1.3, initHeaderCopy, ["melt"]);
};


function initHeaderCopy(copy:String):Void
{
	switch(copy)
	{
		case "whataburger":
			header.whataburger._visible = true;
			TweenLite.from(header.whataburger_mask, SPEED, { _x:header.whataburger_mask._x - header.whataburger_mask._width, ease:Quart.easeOut });
		break;
		
		
		case "patty":
			header.patty._visible = header.patty_shadow._visible = header.patty_lines._visible = true;
			TweenLite.from(header.patty, .3, { _alpha:0, ease:EASE });
			TweenLite.from(header.patty, SPEED, { _x:"40", _y:"40", overwrite:0, ease:Quart.easeOut });
			TweenLite.from(header.patty_mask, SPEED, { _x:"40", _y:"40", ease:Quart.easeOut });
			TweenLite.from(header.patty_lines_mask, 1, { _xscale:125, ease:Quart.easeOut });
			/*
			TweenLite.from(header.patty, .5, { _x:"40", _y:"40", overwrite:0, ease:EASE });
			TweenLite.from(header.patty_mask, .5, { _x:"40", _y:"40", ease:EASE });
			TweenLite.from(header.patty_lines_mask, .5, { _xscale:125, ease:EASE });
			//*/
		break;
		
		
		case "melt":
			header.melt_shadow._visible = header.melt._visible = header.melt_lines._visible = true;
			TweenLite.from(header.melt, .3, { _alpha:0, ease:EASE });
			TweenLite.from(header.melt, SPEED, { _x:"40", _y:"40", overwrite:0, ease:Quart.easeOut });
			TweenLite.from(header.melt_mask, SPEED, { _x:"40", _y:"40", ease:Quart.easeOut });
			TweenLite.from(header.melt_lines_mask, 1, { _xscale:150, ease:Quart.easeOut });
		break;
	};
};


function initFooter():Void
{
	footer.txt._visible = footer.lines0._visible = footer.lines1._visible = true;
	
	// TweenLite.from(footer.txt, SPEED, { _alpha:0, ease:EASE });
	// TweenLite.from(footer.lines_mask, SPEED, { _xscale:60, ease:EASE });
	
	TweenLite.from(footer.lines0, 1.25, { _width:0, ease:Quart.easeIn });
	TweenLite.from(footer.lines1, 1.25, { _width:0, ease:Quart.easeIn });
	
	TweenLite.to(footer.lines0, 1.25, { _width:29, delay:1.25, overwrite:0, ease:Quart.easeOut });
	TweenLite.to(footer.lines1, 1.25, { _width:29, delay:1.25, overwrite:0, ease:Quart.easeOut });
	
	TweenLite.from(footer.txt, 1, { _alpha:0, delay:1.6, overwrite:0, ease:Quart.easeInOut });
};


function initBurst():Void
{
	burst._visible = true;
	
	TweenLite.from(burst.txt, SPEED, { _alpha:0, delay:.2, ease:EASE });
	TweenLite.from(burst.bg, SPEED, { _xscale:0, _yscale:0, ease:Back.easeOut });
	TweenLite.from(burst.bg, SPEED*3, { _rotation:-150, overwrite:0, ease:Quart.easeOut });
};


function animateLogo():Void
{
	if(logo.currentFrame >= 36) 
	{
		logo.gotoAndPlay("replay");
	};
};


function initHotspot():Void
{
	hotspot.onRollOver = hotspotOverHandler;
};


// ------------------------------------------------------------------
//	Handlers
// ------------------------------------------------------------------

hotspot.onRelease = hotspotClickHandler;


function hotspotClickHandler():Void
{
	// getURL(_root.clickTag, "_blank");
	EB.Clickthrough();
};


function hotspotOverHandler():Void
{
	animateLogo();
};
