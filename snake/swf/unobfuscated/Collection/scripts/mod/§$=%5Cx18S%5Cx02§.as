package mod
{
   import flash.Lib;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.external.ExternalInterface;
   import flash.§f$\n8\x01§;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import haxe.Timer;
   import mt.bumdum9.Num;
   import mt.deepnight.SuperMovie;
   import mt.fx.Flash;
   import mt.fx.Tween;
   import pix.Element;
   import pix.Frame;
   
   public class §$=\x18S\x02§ extends §k\f_(\x02§
   {
      
      public static var §7\x13\x0b(\x01§:int = 90;
      
      public static var §rP\fb\x01§:int = 80;
       
      
      public var timer:int;
      
      public var step:int;
      
      public var page:flash.display.Sprite;
      
      public var fieldDesc:TextField;
      
      public var cards:Array;
      
      public function §$=\x18S\x02§()
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super();
         step = 0;
         §H\x04l\x02\x02§();
      }
      
      override public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as §#UX^\x01§;
         var _loc6_:Number = NaN;
         var _loc7_:* = null as Tween;
         super.update();
         switch(step)
         {
            case 0:
               break;
            case 1:
               timer = timer + 1;
               _loc1_ = 0;
               _loc2_ = true;
               _loc3_ = 0;
               _loc4_ = cards;
               while(_loc3_ < int(_loc4_.length))
               {
                  _loc5_ = _loc4_[_loc3_];
                  _loc3_++;
                  _loc6_ = Number(Num.mm(0,(timer - (_loc1_ + 3) * 16) / 20,1));
                  if(_loc6_ < 1)
                  {
                     _loc2_ = false;
                  }
                  _loc5_.coef = 0.75 - _loc6_ * 0.5;
                  _loc5_.§]Pzm\x03§();
                  _loc1_++;
               }
               if(_loc2_)
               {
                  step = step + 1;
                  timer = 0;
                  fieldDesc.visible = true;
                  _loc3_ = 0;
                  _loc4_ = cards;
                  while(_loc3_ < int(_loc4_.length))
                  {
                     _loc5_ = _loc4_[_loc3_];
                     _loc3_++;
                     var §{\x01§:Array = [this];
                     SuperMovie.onClick(_loc5_,function(param1:Array):Function
                     {
                        var §{\x01§:Array = param1;
                        return function():void
                        {
                           §{\x01§[0].step = §{\x01§[0].step + 1;
                        };
                     }(§{\x01§));
                  }
               }
               break;
            case 2:
               break;
            case 3:
               _loc1_ = timer;
               timer = timer + 1;
               if(_loc1_ > 3 && int(cards.length) > 0)
               {
                  timer = 0;
                  _loc5_ = cards.shift();
                  _loc7_ = new Tween(_loc5_,-42,35);
                  _loc7_.curveInOut();
                  _loc7_.onFinish = function(param1:Function, param2:§#UX^\x01§):Function
                  {
                     var f:Function = param1;
                     var a1:§#UX^\x01§ = param2;
                     return function():void
                     {
                        return f(a1);
                     };
                  }(§^(P~\x03§,_loc5_);
               }
               if(timer > 20)
               {
                  removeChild(page);
                  §H\x04l\x02\x02§();
                  step = 0;
                  break;
               }
         }
      }
      
      public function §\x1c_xC\x01§(param1:Object) : void
      {
         if(param1._a == null)
         {
            Lib.getURL(new URLRequest(Main.domain + "/card"),"_self");
            return;
         }
         switch(int(param1._a.length))
         {
            case 0:
               §§push(int(Main.data._priceTicket));
               break;
            case 1:
               §§push(int(Main.data._priceCard));
         }
         var _loc2_:int = §§pop();
         ExternalInterface.call("_ut",Std.string(-1 * _loc2_));
         removeChild(page);
         if(int(param1._a.length) == 0)
         {
            Main.data._tickets = int(Main.data._tickets) + 1;
            Main.data._totalTickets = int(Main.data._totalTickets) + 1;
            §\x13pn\x15\x02§.§{\x01§.buts[2].select(null);
            return;
         }
         §A3Y\x14\x01§(param1._a);
      }
      
      public function §l5\x19Y\x02§() : void
      {
         page = new flash.display.Sprite();
         addChild(page);
      }
      
      public function §iD\b\x10§(param1:_CardType) : §#UX^\x01§
      {
         var _loc2_:§#UX^\x01§ = new §#UX^\x01§(2);
         _loc2_.§)QR\x01§(param1);
         page.addChild(_loc2_);
         cards.push(_loc2_);
         SuperMovie.onOver(_loc2_,function(param1:Function, param2:String):Function
         {
            var f:Function = param1;
            var a1:String = param2;
            return function():void
            {
               return f(a1);
            };
         }(§\x13pcA\x03§,Data.TEXT[int(param1.index)].desc));
         SuperMovie.§\x10GB\x02§(_loc2_,function(param1:Function, param2:String):Function
         {
            var f:Function = param1;
            var a1:String = param2;
            return function():void
            {
               return f(a1);
            };
         }(§\x13pcA\x03§,""));
         return _loc2_;
      }
      
      public function §^(P~\x03§(param1:§#UX^\x01§) : void
      {
         page.removeChild(param1);
         Main.§GFB*\x02§(param1.type);
         new Flash(§\x13pn\x15\x02§.§{\x01§.buts[0].icon,0.2);
      }
      
      public function §H\x04l\x02\x02§() : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as TextField;
         var _loc9_:* = null as TextField;
         var _loc10_:* = null as Element;
         var _loc11_:* = null as But;
         §l5\x19Y\x02§();
         var _loc1_:* = Gfx.col("green_0");
         var _loc2_:* = Gfx.col("green_0",-10);
         var _loc3_:Graphics = page.graphics;
         _loc3_.beginFill(_loc1_);
         _loc3_.drawRect(0,0,mcw,mch);
         _loc3_.beginFill(_loc2_);
         _loc3_.drawRect(0,0,mcw,24);
         _loc3_.beginFill(_loc2_);
         _loc3_.drawRect(0,§$=\x18S\x02§.§7\x13\x0b(\x01§,mcw,§$=\x18S\x02§.§rP\fb\x01§);
         var _loc4_:TextField = §\x19\n\t\x01§.getField(Gfx.col("green_0",50),20,-1,"upheaval");
         _loc4_.text = Lang.§,}\x04\x19\x02§;
         _loc4_.width = Number(_loc4_.textWidth + 4);
         _loc4_.x = int((mcw - _loc4_.width) * 0.5);
         page.addChild(_loc4_);
         var _loc5_:Array = [int(Main.data._priceCard),int(Main.data._pricePack),int(Main.data._priceTicket)];
         var _loc6_:int = 0;
         while(_loc6_ < 3)
         {
            _loc6_++;
            _loc7_ = _loc6_;
            _loc8_ = §\x19\n\t\x01§.getField(16777215,8,-1,"nokia");
            _loc8_.text = Lang.§\x17b?~\x01§[_loc7_];
            _loc8_.width = 240;
            _loc8_.x = 40;
            _loc8_.y = 30 + _loc7_ * 20;
            _loc9_ = §\x19\n\t\x01§.getField(16777215,8,-1,"nokia");
            _loc9_.text = Std.string(int(_loc5_[_loc7_]));
            _loc9_.width = Number(_loc9_.textWidth + 3);
            _loc9_.x = Number(_loc8_.x + 130);
            _loc9_.y = _loc8_.y;
            _loc10_ = new Element();
            _loc10_.drawFrame(Gfx.main.get(null,"token"));
            _loc10_.x = Number(Number(_loc9_.x + _loc9_.width) + 4);
            _loc10_.y = Number(_loc9_.y + 6);
            _loc10_.alpha = 0.8;
            _loc11_ = new But(Lang.BUY,function(param1:Function, param2:int):Function
            {
               var f1:Function = param1;
               var a1:int = param2;
               return function():void
               {
                  return f1(a1);
               };
            }(buy,_loc7_),"icon_play");
            _loc11_.x = Number(_loc9_.x + 70);
            _loc11_.y = _loc9_.y;
            _loc11_.§i\x1b06\x03§ = function(param1:Function, param2:String):Function
            {
               var f1:Function = param1;
               var a1:String = param2;
               return function():void
               {
                  return f1(a1);
               };
            }(displayHint,Lang.§\x12%\x18§[_loc7_]);
            page.addChild(_loc8_);
            page.addChild(_loc9_);
            page.addChild(_loc10_);
            page.addChild(_loc11_);
         }
         fieldDesc = §\x19\n\t\x01§.getField(Gfx.col("green_0",50),8,-1,"nokia");
         fieldDesc.x = 50;
         fieldDesc.y = §$=\x18S\x02§.§7\x13\x0b(\x01§;
         fieldDesc.width = 400;
         fieldDesc.height = 100;
         page.addChild(fieldDesc);
         _loc10_ = new Element();
         _loc10_.drawFrame(Gfx.collection.get(0,"perso"),1,1);
         _loc10_.x = mcw;
         _loc10_.y = mch;
         page.addChild(_loc10_);
      }
      
      public function §\x15g;\x1e\x03§() : void
      {
         §l5\x19Y\x02§();
         var _loc1_:Graphics = page.graphics;
         _loc1_.beginFill(Gfx.col("green_1"));
         _loc1_.drawRect(0,0,mcw,mch);
         var _loc2_:pix.Sprite = Main.§,\x13\x14X\x03§();
         _loc2_.x = mcw * 0.5;
         _loc2_.y = mch * 0.5;
         page.addChild(_loc2_);
      }
      
      public function displayHint(param1:String) : void
      {
         fieldDesc.width = 180;
         fieldDesc.text = param1;
         fieldDesc.width = Number(fieldDesc.textWidth + 3);
         fieldDesc.height = Number(fieldDesc.textHeight + 5);
         fieldDesc.x = int((mcw - fieldDesc.width) * 0.5) - 50;
         fieldDesc.y = §$=\x18S\x02§.§7\x13\x0b(\x01§ + int((§$=\x18S\x02§.§rP\fb\x01§ - fieldDesc.height) * 0.5);
      }
      
      public function §\x13pcA\x03§(param1:String) : void
      {
         fieldDesc.width = 260;
         fieldDesc.text = param1;
         fieldDesc.width = Number(fieldDesc.textWidth + 5);
         fieldDesc.height = Number(fieldDesc.textHeight + 5);
         fieldDesc.x = int((mcw - fieldDesc.width) * 0.5);
         fieldDesc.y = mch - 20 - int(fieldDesc.height * 0.5);
      }
      
      public function §A3Y\x14\x01§(param1:Array) : void
      {
         var _loc3_:* = null as §#UX^\x01§;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         §l5\x19Y\x02§();
         var _loc2_:int = 40;
         page.graphics.beginFill(Gfx.col("green_0",-10));
         page.graphics.drawRect(0,mch - _loc2_,mcw,_loc2_);
         cards = [];
         if(int(param1.length) == 1)
         {
            _loc3_ = §iD\b\x10§(param1[0]);
            _loc3_.x = mcw * 0.5;
            _loc3_.y = mch * 0.5;
         }
         else
         {
            _loc4_ = 0;
            _loc5_ = 3;
            _loc6_ = 0;
            while(_loc6_ < 2)
            {
               _loc6_++;
               _loc7_ = _loc6_;
               _loc8_ = 0;
               while(_loc8_ < 5)
               {
                  _loc8_++;
                  _loc9_ = _loc8_;
                  _loc3_ = §iD\b\x10§(param1[_loc4_]);
                  _loc3_.x = 74 + _loc9_ * (§#UX^\x01§.§;\x057\x02§ + _loc5_);
                  _loc3_.y = 50 + _loc7_ * (§#UX^\x01§.HEIGHT + _loc5_);
                  _loc4_++;
               }
            }
         }
         fieldDesc = §\x19\n\t\x01§.getField(Gfx.col("green_0",50),8,-1,"nokia");
         fieldDesc.x = 50;
         fieldDesc.y = 5 + mch - _loc2_;
         fieldDesc.width = 400;
         fieldDesc.height = _loc2_;
         fieldDesc.multiline = true;
         fieldDesc.wordWrap = true;
         fieldDesc.visible = false;
         page.addChild(fieldDesc);
         step = 1;
         timer = 0;
      }
      
      public function buy(param1:int) : void
      {
         var _loc2_:* = null as _ShopRequestType;
         var _loc3_:* = null as Function;
         var id:int = param1;
         removeChild(page);
         §\x15g;\x1e\x03§();
         if(Main.domain != null)
         {
            switch(id)
            {
               case 0:
                  §§push(_ShopRequestType.§]z\x1fF\x02§);
                  break;
               case 1:
                  §§push(_ShopRequestType.§b\x12\x02@\x01§);
                  break;
               case 2:
                  §§push(_ShopRequestType.§Z\x11k2§);
            }
            _loc2_ = §§pop();
            Codec.load(Main.domain + "/buyCard",{"_type":_loc2_},§\x1c_xC\x01§);
         }
         else
         {
            var §{\x01§:§$=\x18S\x02§ = this;
            _loc3_ = function():void
            {
               var _loc4_:int = 0;
               var _loc1_:* = {"_a":[]};
               var _loc2_:int = 0;
               if(id == 0)
               {
                  _loc2_ = 1;
               }
               if(id == 1)
               {
                  _loc2_ = 10;
               }
               var _loc3_:int = 0;
               while(_loc3_ < _loc2_)
               {
                  _loc3_++;
                  _loc4_ = _loc3_;
                  _loc1_._a.push(§\x19\n\t\x01§.getEnum(_CardType,int(Std.random(80))));
               }
               §{\x01§.§\x1c_xC\x01§(_loc1_);
            };
            Timer.delay(_loc3_,1000);
         }
      }
   }
}
