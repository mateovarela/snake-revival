package mod
{
   import flash.display.BlendMode;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.§f$\n8\x01§;
   import flash.text.TextField;
   import flash.ui.Mouse;
   import mt.bumdum9.Col;
   import mt.fx.Flash;
   import mt.fx.Tween;
   import pix.Element;
   import pix.Frame;
   
   public class SU4g extends §k\f_(\x02§
   {
      
      public static var §#A\bT§:Number = 0.025;
      
      public static var §*y\x1e\x1c§:int = 100;
      
      public static var BH:int = 12;
      
      public static var EC:int = 3;
       
      
      public var ymax:int;
      
      public var xmax:int;
      
      public var tot:int;
      
      public var timer:int;
      
      public var §{t\b\x02§:int;
      
      public var §a\x19p~\x02§:Sprite;
      
      public var §g\x13vo\x02§:Sprite;
      
      public var page:Sprite;
      
      public var my:int;
      
      public var mx:int;
      
      public var §@cI/\x02§:TextField;
      
      public var §\x0b\x14A\x17\x01§:TextField;
      
      public var comp:Number;
      
      public var cards:Array;
      
      public var arrow:Element;
      
      public function SU4g(param1:Array = undefined)
      {
         var _loc4_:* = null;
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         cards = param1;
         super();
         mch = mch - SU4g.BH;
         graphics.beginFill(Gfx.col("green_0"));
         graphics.drawRect(0,0,mcw,mch);
         graphics.beginFill(Gfx.col("green_1"));
         graphics.drawRect(0,mch,mcw,SU4g.BH);
         xmax = int((mcw + SU4g.EC) / (§#UX^\x01§.§;\x057\x02§ + SU4g.EC));
         ymax = int((mch + SU4g.EC) / (§#UX^\x01§.HEIGHT + SU4g.EC));
         mx = mcw - (xmax * §#UX^\x01§.§;\x057\x02§ + (xmax - 1) * SU4g.EC);
         my = mch - (ymax * §#UX^\x01§.HEIGHT + (ymax - 1) * SU4g.EC);
         mx = int(mx * 0.5);
         my = int(my * 0.5);
         tot = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = cards;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(int(_loc4_._num) > 0)
            {
               tot = tot + 1;
            }
         }
         comp = tot / int(cards.length);
         §g\x13vo\x02§ = new Sprite();
         §a\x19p~\x02§ = new Sprite();
         §a\x19p~\x02§.graphics.beginFill(16711680);
         §a\x19p~\x02§.graphics.drawRect(0,0,mcw,mch);
         §g\x13vo\x02§.mask = §a\x19p~\x02§;
         addChild(§g\x13vo\x02§);
         addChild(§a\x19p~\x02§);
         arrow = new Element();
         arrow.drawFrame(Gfx.collection.get(null,"arrow"));
         addChild(arrow);
         cards.sort(§xx\n5§);
         timer = 0;
         §{t\b\x02§ = 0;
         §\x05$y5\x01§();
         §kQ\x1aI\x03§();
         addEventListener(MouseEvent.CLICK,click);
      }
      
      public function white(param1:String) : String
      {
         return "<font color=\'#FFFFFF\'>" + param1 + "</font>";
      }
      
      override public function update() : void
      {
         timer = timer + 1;
         arrow.x = int(mouseX);
         arrow.y = int(mouseY);
         arrow.visible = false;
         Mouse.show();
         if(int(timer % 32) == 0)
         {
            new Flash(arrow);
         }
         if(arrow.x > 0 && arrow.x < SU4g.§*y\x1e\x1c§)
         {
            arrow.visible = true;
            arrow.scaleX = -1;
            Mouse.hide();
         }
         if(arrow.x > mcw - SU4g.§*y\x1e\x1c§)
         {
            arrow.visible = true;
            arrow.scaleX = 1;
            Mouse.hide();
         }
      }
      
      public function §Jg\x11e\x03§(param1:Sprite) : void
      {
         §g\x13vo\x02§.removeChild(page);
         page = param1;
         mouseEnabled = true;
         page.x = int(page.x);
      }
      
      public function §\f\x03h§(param1:int) : void
      {
         if(§{t\b\x02§ + param1 < 0)
         {
            return;
         }
         if((§{t\b\x02§ + param1) * xmax * ymax > int(cards.length))
         {
            return;
         }
         §{t\b\x02§ = §{t\b\x02§ + param1;
         var _loc2_:Sprite = §S^\x01 \x01§(§{t\b\x02§);
         _loc2_.x = param1 * mcw;
         var _loc3_:Tween = new Tween(_loc2_,0,0,SU4g.§#A\bT§);
         _loc3_.curveInOut();
         var _loc4_:Tween = new Tween(page,-mcw * param1,0,SU4g.§#A\bT§);
         _loc4_.curveInOut();
         _loc4_.onFinish = function(param1:Function, param2:Sprite):Function
         {
            var f:Function = param1;
            var a1:Sprite = param2;
            return function():void
            {
               return f(a1);
            };
         }(§Jg\x11e\x03§,_loc2_);
         §?_#W\x02§();
         mouseEnabled = false;
      }
      
      public function §xx\n5§(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1._type.index);
         var _loc4_:int = int(param2._type.index);
         var _loc5_:int = int(§\t\x0exo§(Data.CARDS[_loc3_].§\x0e-EY\x01§)) * 400 + _loc3_;
         var _loc6_:int = int(§\t\x0exo§(Data.CARDS[_loc4_].§\x0e-EY\x01§)) * 400 + _loc4_;
         if(_loc5_ < _loc6_)
         {
            return -1;
         }
         return 1;
      }
      
      public function §?_#W\x02§() : void
      {
         §\x0b\x14A\x17\x01§.text = Lang.PAGE + " : " + (§{t\b\x02§ + 1) + "/" + int(Math.ceil(int(cards.length) / (xmax * ymax)));
      }
      
      public function §\x05$y5\x01§() : void
      {
         var _loc1_:* = Gfx.col("green_0");
         _loc1_ = int(Col.§!x\fV\x02§(_loc1_,50));
         §\x0b\x14A\x17\x01§ = §\x19\n\t\x01§.getField(_loc1_,8,-1,"nokia");
         §\x0b\x14A\x17\x01§.x = 1;
         §\x0b\x14A\x17\x01§.y = mch - 1;
         addChild(§\x0b\x14A\x17\x01§);
         §@cI/\x02§ = §\x19\n\t\x01§.getField(_loc1_,8,1,"nokia");
         §@cI/\x02§.width = 180;
         §@cI/\x02§.x = mcw - §@cI/\x02§.width;
         §@cI/\x02§.y = mch - 1;
         addChild(§@cI/\x02§);
         §@cI/\x02§.htmlText = Lang.CARDS + " : " + ("<font color=\'#FFFFFF\'>" + Std.string(tot) + "</font>") + "  " + Lang.COMPLETION + " : " + ("<font color=\'#FFFFFF\'>" + (int(comp * 100) + "%") + "</font>");
         §?_#W\x02§();
      }
      
      public function §S^\x01 \x01§(param1:int) : Sprite
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null as §#UX^\x01§;
         var _loc2_:int = param1 * xmax * ymax;
         var _loc3_:Sprite = new Sprite();
         §g\x13vo\x02§.addChild(_loc3_);
         var _loc4_:int = 0;
         var _loc5_:int = ymax;
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc7_ = 0;
            _loc8_ = xmax;
            while(_loc7_ < _loc8_)
            {
               _loc7_++;
               _loc9_ = _loc7_;
               _loc10_ = cards[_loc2_ + _loc6_ * xmax + _loc9_];
               if(_loc10_ == null)
               {
                  break;
               }
               _loc11_ = new §#UX^\x01§(2);
               _loc11_.§)QR\x01§(_loc10_._type);
               _loc11_.x = Number(Number(mx + (_loc9_ + 0.5) * §#UX^\x01§.§;\x057\x02§) + _loc9_ * SU4g.EC);
               _loc11_.y = Number(Number(my + (_loc6_ + 0.5) * §#UX^\x01§.HEIGHT) + _loc6_ * SU4g.EC);
               _loc11_.x = int(_loc11_.x);
               _loc11_.y = int(_loc11_.y);
               if(int(_loc10_._num) > 1)
               {
                  _loc11_.§\x05c'u§(int(_loc10_._num));
               }
               _loc11_.coef = 0.25;
               _loc11_.§]Pzm\x03§();
               _loc11_.alpha = int(_loc10_._num) == 0?0.25:Number(1);
               _loc11_.blendMode = BlendMode.LAYER;
               _loc3_.addChild(_loc11_);
            }
         }
         return _loc3_;
      }
      
      public function §\t\x0exo§(param1:String) : int
      {
         if(param1 == "C")
         {
            return 0;
         }
         if(param1 == "U")
         {
            return 1;
         }
         if(param1 == "R")
         {
            return 2;
         }
         return 0;
      }
      
      public function §kQ\x1aI\x03§() : void
      {
         if(page != null)
         {
            removeChild(page);
         }
         page = §S^\x01 \x01§(§{t\b\x02§);
      }
      
      public function click(param1:*) : void
      {
         if(!mouseEnabled)
         {
            return;
         }
         if(mouseX < SU4g.§*y\x1e\x1c§)
         {
            §\f\x03h§(-1);
         }
         if(mouseX > mcw - SU4g.§*y\x1e\x1c§)
         {
            §\f\x03h§(1);
         }
      }
   }
}
