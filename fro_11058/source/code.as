
// ------------------------------------------------------------------
//	Imports
// ------------------------------------------------------------------
import com.greensock.TweenLite;
import com.greensock.easing.*;
import com.greensock.plugins.*;


// ------------------------------------------------------------------
//	Variables
// ------------------------------------------------------------------

var _frame1:Number = 1;
var _frame2:Number = 6;


// ------------------------------------------------------------------
//	Methods
// ------------------------------------------------------------------

TweenPlugin.activate([RemoveTintPlugin, TintPlugin]);

function initBanner():Void
{
	switch(id)
	{
		case "160x600":
		
			TweenLite.from(bg, 1.75, {_alpha:0, ease:Quint.easeInOut});
			TweenLite.from(logo, 1.75, {_alpha:0, ease:Quint.easeInOut});
			TweenLite.from(line1, 2, {_alpha:0, _xscale:0, ease:Quint.easeInOut, delay:_frame1, overwrite:0});
			TweenLite.from(line2, 2, {_alpha:0, _xscale:0, ease:Quint.easeInOut, delay:_frame1, overwrite:0});

			TweenLite.from(txt1a, 1.5, {_alpha:0, ease:Quint.easeInOut, delay:_frame1 + 0.5, overwrite:0});

			var dist:String = "-36";

			TweenLite.to(line1, 1.25, {_y:dist, ease:Quart.easeInOut, delay:_frame2, overwrite:0});
			TweenLite.to(line2, 1.25, {_y:dist, ease:Quart.easeInOut, delay:_frame2, overwrite:0});
			TweenLite.to(txt1a, 1.25, {_y:dist, ease:Quart.easeInOut, delay:_frame2, overwrite:0});

			TweenLite.from(cta, 1.25, {_alpha:0, ease:Quint.easeInOut, delay:_frame2 + 0.25, overwrite:0});

			TweenLite.delayedCall(_frame2 + 1, playShimmer);
			
		break;
		
		
		case "300x60":
			
			TweenLite.from(bg, 1.75, {_alpha:0, ease:Quint.easeInOut});

			TweenLite.from(txt1a, 1.25, {_alpha:0, _y:"15", ease:Quint.easeOut, delay:_frame1 + 0.5, overwrite:0});
			TweenLite.from(txt1b, 1.25, {_alpha:0, _y:"15", ease:Quint.easeOut, delay:_frame1 + 0.5, overwrite:0});


			TweenLite.to(txt1a, 1.1, {_alpha:0, _y:"-10", ease:Quint.easeIn, delay:_frame2, overwrite:0});
			TweenLite.to(txt1b, 1.1, {_alpha:0, _y:"-10", ease:Quint.easeIn, delay:_frame2, overwrite:0});

			TweenLite.from(cta, 1.25, {_alpha:0, _y:"15", ease:Quint.easeOut, delay:_frame2 + 1, overwrite:0});
			TweenLite.from(logo, 1.25, {_alpha:0, _y:"15", ease:Quint.easeOut, delay:_frame2 + 1});

			TweenLite.delayedCall(_frame2 + .75, playShimmer);
			
		break;
		
		
		case "300x100":
			
			TweenLite.from(bg, 1.75, {_alpha:0, ease:Quint.easeInOut});
			TweenLite.from(logo, 1.75, {_alpha:0, ease:Quint.easeInOut});

			TweenLite.from(txt1a, 1.5, {_alpha:0, ease:Quint.easeInOut, delay:_frame1 + 0.5, overwrite:0});
			TweenLite.from(txt1b, 1.5, {_alpha:0, ease:Quint.easeInOut, delay:_frame1 + 0.5, overwrite:0});

			TweenLite.to(logo, 1.25, {_x:"80", ease:Quart.easeInOut, delay:_frame2, overwrite:0});

			TweenLite.from(cta, 1.25, {_alpha:0, ease:Quint.easeInOut, delay:_frame2 + 0.25, overwrite:0});

			TweenLite.delayedCall(_frame2 + 1, playShimmer);
			
		break;
		
		
		case "300x250":
		
			TweenLite.from(bg, 1.75, {_alpha:0, ease:Quint.easeInOut});
			TweenLite.from(logo, 1.75, {_alpha:0, ease:Quint.easeInOut});
			TweenLite.from(line1, 2, {_alpha:0, _xscale:0, ease:Quint.easeInOut, delay:_frame1, overwrite:0});
			TweenLite.from(line2, 2, {_alpha:0, _xscale:0, ease:Quint.easeInOut, delay:_frame1, overwrite:0});

			TweenLite.from(txt1a, 1.5, {_alpha:0, ease:Quint.easeInOut, delay:_frame1 + 0.5, overwrite:0});
			TweenLite.from(txt1b, 1.5, {_alpha:0, ease:Quint.easeInOut, delay:_frame1 + 0.5, overwrite:0});

			TweenLite.to(line1, 1.25, {_y:"-18", ease:Quart.easeInOut, delay:_frame2, overwrite:0});
			TweenLite.to(line2, 1.25, {_y:"-18", ease:Quart.easeInOut, delay:_frame2, overwrite:0});
			TweenLite.to(txt1a, 1.25, {_y:"-18", ease:Quart.easeInOut, delay:_frame2, overwrite:0});
			TweenLite.to(txt1b, 1.25, {_y:"-18", ease:Quart.easeInOut, delay:_frame2, overwrite:0});

			TweenLite.from(cta, 1.25, {_alpha:0, ease:Quint.easeInOut, delay:_frame2 + 0.25, overwrite:0});

			TweenLite.delayedCall(_frame2 + 1, playShimmer);
			
		break;
		
		
		case "300x600":
			
			TweenLite.from(bg, 1.75, {_alpha:0, ease:Quint.easeInOut});
			TweenLite.from(logo, 1.75, {_alpha:0, ease:Quint.easeInOut});
			TweenLite.from(line1, 2, {_alpha:0, _xscale:0, ease:Quint.easeInOut, delay:_frame1, overwrite:0});
			TweenLite.from(line2, 2, {_alpha:0, _xscale:0, ease:Quint.easeInOut, delay:_frame1, overwrite:0});

			TweenLite.from(txt1a, 1.5, {_alpha:0, ease:Quint.easeInOut, delay:_frame1 + 0.5, overwrite:0});

			var dist:String = "-24";

			TweenLite.to(txt1a, 1.25, {_y:dist, ease:Quart.easeInOut, delay:_frame2, overwrite:0});
			TweenLite.to(line1, 1.25, {_y:dist, ease:Quart.easeInOut, delay:_frame2, overwrite:0});
			TweenLite.to(line2, 1.25, {_y:dist, ease:Quart.easeInOut, delay:_frame2, overwrite:0});

			TweenLite.from(cta, 1.25, {_alpha:0, ease:Quint.easeInOut, delay:_frame2 + 0.25, overwrite:0});

			TweenLite.delayedCall(_frame2 + 1, playShimmer);
			
		break;
		
		
		case "638x60":
			
			TweenLite.from(bg, 1.75, {_alpha:0, ease:Quint.easeInOut});
			TweenLite.from(logo, 1.75, {_alpha:0, ease:Quint.easeInOut});

			TweenLite.from(txt1a, 1.5, {_alpha:0, _x:"-35", ease:Quint.easeOut, delay:_frame1 + 0.5, overwrite:0});

			TweenLite.to(txt1a, 1, {_y:"-12", ease:Quint.easeIn, delay:_frame2, overwrite:0});

			TweenLite.from(cta, 1.25, {_alpha:0, _x:"-30", ease:Quint.easeOut, delay:_frame2 + 1, overwrite:0});

			TweenLite.delayedCall(_frame2 + .75, playShimmer);
			
		break;
		
		
		case "728x90":
			
			TweenLite.from(bg, 1.75, {_alpha:0, ease:Quint.easeInOut});
			TweenLite.from(logo, 1.75, {_alpha:0, ease:Quint.easeInOut});

			TweenLite.from(txt1a, 1.5, {_alpha:0, _x:"-35", ease:Quint.easeOut, delay:_frame1 + 0.5, overwrite:0});
			TweenLite.from(txt1b, 1.5, {_alpha:0, _x:"-35", ease:Quint.easeOut, delay:_frame1 + 0.5, overwrite:0});

			TweenLite.to(txt1a, 1, {_y:"-17", ease:Quint.easeIn, delay:_frame2, overwrite:0});
			TweenLite.to(txt1b, 1, {_y:"-17", ease:Quint.easeIn, delay:_frame2, overwrite:0});

			TweenLite.from(cta, 1.25, {_alpha:0, _x:"-30", ease:Quint.easeOut, delay:_frame2 + 1, overwrite:0});

			TweenLite.delayedCall(_frame2 + .75, playShimmer);
			
		break;
	};
};


function playShimmer():Void
{
	cta.gotoAndPlay(2);	
};


// ------------------------------------------------------------------
//	Handlers
// ------------------------------------------------------------------

bg.onRelease = function():Void
{
	getURL(_root.clickTag, "_blank");
};


bg.onRollOver = function():Void
{
	playShimmer();
	TweenLite.to(cta.txt, .5, { tint:0x00567E, ease:Quart.easeOut });
};


bg.onRollOut = function():Void
{
	TweenLite.to(cta.txt, .5, { removeTint:true, ease:Quart.easeOut });
};
