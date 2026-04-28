package mod
{
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.external.ExternalInterface;
   import flash.§f$\n8\x01§;
   import flash.text.TextField;
   import haxe.Timer;
   import mt.fx.Spawn;
   import mt.fx.Tween;
   import mt.fx.Vanish;
   import pix.Element;
   import pix.Frame;
   
   public class §;R\x16v\x01§ extends §k\f_(\x02§
   {
      
      public static var §\x12DT8\x01§:int = 98;
      
      public static var §;b)`§:int = 88;
      
      public static var §b\x01\f\r\x03§:int = 2500;
       
      
      public var step:int;
      
      public var §(EnX\x02§:Element;
      
      public var current:Object;
      
      public var cid:int;
      
      public var card:§#UX^\x01§;
      
      public var buts:Array;
      
      public var §O=X\x10\x02§:TextField;
      
      public var §o\x1cR#\x02§:flash.display.Sprite;
      
      public var bub:flash.display.Sprite;
      
      public var box:flash.display.Sprite;
      
      public function §;R\x16v\x01§()
      {
         var _loc8_:* = null;
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super();
         buts = [];
         var _loc1_:* = Gfx.col("green_0");
         var _loc2_:* = Gfx.col("green_0",-10);
         var _loc3_:Graphics = graphics;
         _loc3_.beginFill(_loc1_);
         _loc3_.drawRect(0,0,mcw,mch);
         _loc3_.beginFill(_loc2_);
         _loc3_.drawRect(0,0,mcw,24);
         _loc3_.beginFill(_loc2_);
         _loc3_.drawRect(0,§;R\x16v\x01§.§\x12DT8\x01§,mcw,§;R\x16v\x01§.§;b)`§);
         §o\x1cR#\x02§ = new flash.display.Sprite();
         addChild(§o\x1cR#\x02§);
         var _loc4_:TextField = §)O\x1f\x16§(Lang.§;Fxz§);
         addChild(_loc4_);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = Main.data._cards;
         while(_loc6_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc6_];
            _loc6_++;
            _loc5_ = _loc5_ + int(_loc8_._num);
         }
         if(_loc5_ < 20)
         {
            §_\x02MB\x03§(Lang.rep(Lang.§6\x1d)m\x03§,Std.string(Data.§~vFJ\x02§)));
         }
         else if(Main.data._deal == null)
         {
            §_\x02MB\x03§(Lang.§F&Aj\x03§);
         }
         else
         {
            §l\x1f4N\x02§();
         }
      }
      
      public function §+r\x1a\x12§() : void
      {
         while(int(buts.length) > 0)
         {
            buts.pop().kill();
         }
      }
      
      public function §'\f$q\x03§() : void
      {
         if(bub == null)
         {
            return;
         }
         new Vanish(bub,5,5,true);
         bub = null;
      }
      
      public function §\x1c_xC\x01§(param1:Object) : void
      {
         removeChild(box);
         if(int(param1._price) == -1)
         {
            if(param1._next == null)
            {
               §j\r\x1c\x17§(null,Lang.§UG=d\x02§);
               Timer.delay(leave,§;R\x16v\x01§.§b\x01\f\r\x03§);
               Main.data._deal = null;
               §//O\x1a§();
            }
            else
            {
               §j\r\x1c\x17§(null,Lang.§\x1b\x0e%\n\x03§);
               §\x06Z\x0e)§(param1._next);
            }
         }
         else if(int(param1._price) == int(current._price))
         {
            switch(cid)
            {
               case 0:
                  §j\r\x1c\x17§(null,Lang.§+\x1e\x12\t\x02§);
                  §\x06Z\x0e)§(param1._next);
                  §//O\x1a§();
                  break;
               case 1:
                  §j\r\x1c\x17§(null,Lang.§\r\x01\x06\x12§);
                  §!FjW\x01§();
                  break;
               case 2:
                  §j\r\x1c\x17§(null,Lang.§PZl?\x01§);
                  ExternalInterface.call("_ut",Std.string(int(param1._price)));
                  §\x0f\x1b5v\x02§();
                  §\x06Z\x0e)§(param1._next);
            }
         }
         else if(int(param1._price) > int(current._price))
         {
            current._price = int(param1._price);
            §j\r\x1c\x17§(null,Lang.§X\x1fJ\x12\x01§);
            §!FjW\x01§();
         }
      }
      
      public function §&2yd\x02§() : void
      {
         §j\r\x1c\x17§(null,Lang.§\x07wq8\x03§);
         Timer.delay(leave,§;R\x16v\x01§.§b\x01\f\r\x03§);
      }
      
      public function §\x06Z\x0e)§(param1:Object) : void
      {
         Main.data._deal = param1;
         if(param1 != null)
         {
            Timer.delay(§;+L\\\x02§,§;R\x16v\x01§.§b\x01\f\r\x03§);
         }
         else
         {
            Timer.delay(§&2yd\x02§,§;R\x16v\x01§.§b\x01\f\r\x03§);
         }
      }
      
      public function §J\r=J\x02§() : void
      {
         §j\r\x1c\x17§(null,Lang.§'Bs\x14\x01§);
         §!FjW\x01§();
      }
      
      public function leave() : void
      {
         var _loc1_:Tween = new Tween(§(EnX\x02§,Number(§(EnX\x02§.x + 120),§(EnX\x02§.y);
         _loc1_.curveIn(2);
         var §{\x01§:§;R\x16v\x01§ = this;
         _loc1_.onFinish = function():void
         {
            §{\x01§.§_\x02MB\x03§(Lang.§F&Aj\x03§);
            §{\x01§.§'\f$q\x03§();
         };
      }
      
      public function §;+L\\\x02§() : void
      {
         step = 10;
         current = Main.data._deal;
         §'\f$q\x03§();
         if(card != null)
         {
            §//O\x1a§();
         }
         card = new §#UX^\x01§(2);
         card.§)QR\x01§(current._card);
         card.x = -42;
         card.y = 35;
         card.coef = 0.25;
         card.§]Pzm\x03§();
         addChild(card);
         var _loc1_:Tween = new Tween(card,int(mcw * 0.5),§;R\x16v\x01§.§\x12DT8\x01§ - 37,0.05);
         _loc1_.curveInOut();
         _loc1_.onFinish = §J\r=J\x02§;
      }
      
      override public function init() : void
      {
         if(§(EnX\x02§ != null)
         {
            §;+L\\\x02§();
         }
      }
      
      public function §~{Z,\x03§(param1:String = undefined, param2:Array = undefined) : String
      {
         var _loc3_:String = "#55BB00";
         var _loc4_:String = "#AA8800";
         var _loc5_:int = int(current._card.index);
         var _loc6_:* = Data.CARDS[_loc5_];
         var _loc7_:String = Lang.col(Data.TEXT[_loc5_].name,_loc3_);
         var _loc8_:String = Lang.col(Data.TEXT[int(Std.random(100))].name,_loc4_);
         var _loc9_:String = Lang.col(Data.TEXT[int(Std.random(100))].name,_loc4_);
         var _loc10_:String = Lang.col(Std.string(int(current._price)),"#FF4444");
         var _loc12_:String = _loc6_.§\x0e-EY\x01§;
         var _loc11_:int = _loc12_ == "C"?0:_loc12_ == "U"?1:_loc12_ == "R"?2:int(null);
         _loc12_ = Lang.__CARD_RARITY[_loc11_];
         if(param2 != null)
         {
            param1 = param2[int(Std.random(int(param2.length)))];
         }
         param1 = Lang.rep(param1,_loc7_,_loc10_,_loc12_,_loc8_,_loc9_);
         return param1;
      }
      
      public function §j\r\x1c\x17§(param1:String = undefined, param2:Array = undefined) : void
      {
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc3_:String = §~{Z,\x03§(param1,param2);
         var _loc4_:int = 12;
         var _loc5_:int = 116;
         var _loc6_:int = 4;
         var _loc7_:int = mcw - (_loc4_ + _loc5_);
         var _loc8_:int = 20;
         if(bub != null)
         {
            §'\f$q\x03§();
         }
         bub = new flash.display.Sprite();
         bub.x = _loc4_;
         bub.y = §;R\x16v\x01§.§\x12DT8\x01§ + _loc4_ + _loc8_;
         bub.blendMode = BlendMode.LAYER;
         §o\x1cR#\x02§.addChild(bub);
         var _loc9_:TextField = §\x19\n\t\x01§.getField(17408,8,-1,"nokia");
         _loc9_.x = _loc6_;
         _loc9_.multiline = true;
         _loc9_.wordWrap = true;
         _loc9_.width = _loc7_ - 2 * _loc6_;
         _loc9_.htmlText = _loc3_;
         _loc9_.height = Number(_loc9_.textHeight + 5);
         bub.addChild(_loc9_);
         var _loc10_:Number = _loc9_.height;
         var _loc11_:Graphics = bub.graphics;
         _loc11_.clear();
         _loc11_.lineStyle(1,17408);
         var _loc12_:int = 0;
         while(_loc12_ < 2)
         {
            _loc12_++;
            _loc13_ = _loc12_;
            _loc11_.beginFill(int([15650047,16777215][_loc13_]));
            _loc14_ = 3;
            _loc11_.drawRoundRect(_loc13_ * _loc14_ * 0.5,_loc13_ * _loc14_ * 0.5,_loc7_ - _loc13_ * _loc14_,_loc10_ - _loc13_ * _loc14_,8 - _loc13_ * _loc14_,8 - _loc13_ * _loc14_);
            _loc11_.endFill();
            _loc11_.lineStyle();
         }
         new Tween(bub,bub.x,bub.y - _loc8_).curveIn(0.5);
         new Spawn(bub,0.1,true).curveIn(0.5);
      }
      
      public function §l\x1f4N\x02§() : void
      {
         §(EnX\x02§ = new Element();
         §(EnX\x02§.drawFrame(Gfx.collection.get(2,"perso"),1,1);
         §(EnX\x02§.x = mcw;
         §(EnX\x02§.y = mch;
         addChild(§(EnX\x02§);
      }
      
      public function §\x15g;\x1e\x03§() : void
      {
         box = Main.§,\x13\x14X\x03§();
         box.x = int((mcw - 70) * 0.5);
         box.y = §;R\x16v\x01§.§\x12DT8\x01§ + §;R\x16v\x01§.§;b)`§ + 16;
         box.alpha = 0.5;
         addChild(box);
      }
      
      public function §_\x02MB\x03§(param1:String) : void
      {
         var _loc2_:int = 36;
         var _loc3_:int = mcw - 2 * _loc2_;
         var _loc4_:TextField = §\x19\n\t\x01§.getField(Gfx.col("green_0",50),8,-1,"nokia");
         _loc4_.multiline = true;
         _loc4_.wordWrap = true;
         _loc4_.width = _loc3_;
         _loc4_.htmlText = param1;
         _loc4_.width = Number(_loc4_.textWidth + 3);
         _loc4_.x = int((mcw - _loc4_.width) * 0.5);
         addChild(_loc4_);
         _loc4_.y = §;R\x16v\x01§.§\x12DT8\x01§ - 50;
      }
      
      public function §!FjW\x01§() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as But;
         §+r\x1a\x12§();
         var _loc1_:Number = mcw - 98;
         var _loc2_:int = 0;
         while(_loc2_ < 3)
         {
            _loc2_++;
            _loc3_ = _loc2_;
            _loc4_ = new But(Lang.__BAZAR_OPTIONS[_loc3_],function(param1:Function, param2:int):Function
            {
               var f:Function = param1;
               var a1:int = param2;
               return function():void
               {
                  return f(a1);
               };
            }(choose,_loc3_),"icon_play");
            _loc4_.y = §;R\x16v\x01§.§\x12DT8\x01§ + §;R\x16v\x01§.§;b)`§ + 5;
            addChild(_loc4_);
            _loc1_ = _loc1_ - _loc4_.width;
            buts.push(_loc4_);
         }
         var _loc5_:Number = _loc1_ / (int(buts.length) + 1);
         var _loc6_:Number = _loc5_;
         _loc2_ = 0;
         var _loc7_:Array = buts;
         while(_loc2_ < int(_loc7_.length))
         {
            _loc4_ = _loc7_[_loc2_];
            _loc2_++;
            _loc4_.x = int(Number(_loc6_ + _loc4_.width * 0.5));
            _loc6_ = Number(_loc6_ + (Number(_loc4_.width + _loc5_)));
         }
      }
      
      public function choose(param1:int) : void
      {
         var _loc2_:* = null as Function;
         cid = param1;
         step = -1;
         §+r\x1a\x12§();
         §\x15g;\x1e\x03§();
         if(Main.domain != null)
         {
            Codec.load(Main.domain + "/sellCard",§\x19\n\t\x01§.getEnum(_BazarRequest,param1),§\x1c_xC\x01§);
         }
         else
         {
            var §{\x01§:§;R\x16v\x01§ = this;
            _loc2_ = function():void
            {
               var _loc1_:* = {
                  "_price":int(§{\x01§.current._price),
                  "_next":null
               };
               §{\x01§.§\x1c_xC\x01§(_loc1_);
            };
            Timer.delay(_loc2_,1000);
         }
      }
      
      public function §\x0f\x1b5v\x02§() : void
      {
         var _loc1_:Tween = new Tween(card,§(EnX\x02§.x - §(EnX\x02§.width * 0.5,§(EnX\x02§.y - §(EnX\x02§.height * 0.5,0.05);
         _loc1_.curveInOut();
         _loc1_.onFinish = card.kill;
         card = null;
      }
      
      public function §//O\x1a§() : void
      {
         var _loc1_:Tween = new Tween(card,-38,35,0.05);
         _loc1_.curveInOut();
         _loc1_.onFinish = card.kill;
         card = null;
      }
   }
}
