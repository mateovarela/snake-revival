package mod
{
   import flash.display.Graphics;
   import flash.§f$\n8\x01§;
   import flash.text.TextField;
   import mt.deepnight.SuperMovie;
   import pix.Element;
   import pix.Frame;
   
   public class §W+\x0b(\x01§ extends §k\f_(\x02§
   {
      
      public static var §\x0e\x01\x02§:int = 42;
      
      public static var BH:int = 80;
      
      public static var §^\x06\x02§:int = 12;
       
      
      public var desc:TextField;
      
      public function §W+\x0b(\x01§()
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super();
         var _loc1_:Graphics = graphics;
         _loc1_.beginFill(Gfx.col("green_0",-10));
         _loc1_.drawRect(0,§W+\x0b(\x01§.§\x0e\x01\x02§,mcw,§W+\x0b(\x01§.BH);
         _loc1_.drawRect(0,mch - §W+\x0b(\x01§.§^\x06\x02§,mcw,§W+\x0b(\x01§.§^\x06\x02§);
         var _loc2_:TextField = §\x19\n\t\x01§.getField(Gfx.col("green_0",30),8,-1,"nokia");
         _loc2_.width = 180;
         _loc2_.height = 80;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         addChild(_loc2_);
         desc = _loc2_;
         §&If;\x01§(Lang.§b^u(§);
         var _loc3_:TextField = §\x19\n\t\x01§.getField(Gfx.col("green_0",50),20,-1,"upheaval");
         _loc3_.text = Lang.§@Pq(§;
         _loc3_.width = Number(_loc3_.textWidth + 4);
         _loc3_.x = int((mcw - _loc3_.width) * 0.5);
         addChild(_loc3_);
         var _loc4_:TextField = §\x19\n\t\x01§.getField(Gfx.col("green_0",50),8,-1,"nokia");
         _loc4_.y = mch - (§W+\x0b(\x01§.§^\x06\x02§ + 1);
         _loc4_.x = 2;
         _loc4_.width = 200;
         _loc4_.htmlText = Lang.YESTERDAY_WINNER + "<font color=\'#FFFFFF\'><a href=\'" + Main.data._lotteryWinner._url + "\'>" + Main.data._lotteryWinner._name + "</a></font>";
         addChild(_loc4_);
         var _loc5_:Element = new Element();
         _loc5_.drawFrame(Gfx.collection.get(1,"perso"),1,1);
         _loc5_.x = mcw;
         _loc5_.y = mch;
         addChild(_loc5_);
         §/sK6\x01§();
      }
      
      public function §&If;\x01§(param1:String) : void
      {
         desc.text = param1;
         desc.width = 200;
         desc.height = Number(desc.textHeight + 4);
         desc.x = int((mcw - desc.width) * 0.5) - 30;
         desc.y = §W+\x0b(\x01§.§\x0e\x01\x02§ + §W+\x0b(\x01§.BH + int((76 - desc.height) * 0.5);
      }
      
      public function §/sK6\x01§() : void
      {
         var _loc8_:int = 0;
         var _loc9_:* = null as TextField;
         var _loc10_:* = null as TextField;
         var _loc11_:* = null as String;
         var _loc12_:* = null as Array;
         var _loc13_:* = null as Element;
         var _loc1_:§#UX^\x01§ = new §#UX^\x01§(2);
         _loc1_.§)QR\x01§(Main.data._lotteryCard);
         _loc1_.x = 48;
         _loc1_.y = §W+\x0b(\x01§.§\x0e\x01\x02§ + 40;
         _loc1_.coef = 0.25;
         _loc1_.§]Pzm\x03§();
         SuperMovie.onOver(_loc1_,function(param1:Function, param2:String):Function
         {
            var f:Function = param1;
            var a1:String = param2;
            return function():void
            {
               return f(a1);
            };
         }(§&If;\x01§,Data.TEXT[int(Main.data._lotteryCard.index)].desc));
         SuperMovie.§\x10GB\x02§(_loc1_,function(param1:Function, param2:String):Function
         {
            var f:Function = param1;
            var a1:String = param2;
            return function():void
            {
               return f(a1);
            };
         }(§&If;\x01§,Lang.§b^u(§));
         var _loc2_:TextField = §\x19\n\t\x01§.getField(16777215,20,-1,"upheaval");
         _loc2_.text = Lang.§,~&\x02\x02§;
         _loc2_.width = _loc2_.textWidth;
         _loc2_.x = Number(_loc1_.x + 30);
         _loc2_.y = _loc1_.y - 34;
         var _loc3_:* = Main.data;
         var _loc4_:Array = Lang.§\x11\x07\x1dJ\x02§;
         var _loc5_:Number = 0;
         if(int(_loc3_._tickets) > 0 && int(_loc3_._totalTickets) > 0)
         {
            _loc5_ = int(_loc3_._tickets) / int(_loc3_._totalTickets);
         }
         var _loc6_:Array = [int(_loc3_._tickets),int(_loc3_._totalTickets),_loc5_ * 100];
         var _loc7_:int = 0;
         while(_loc7_ < 3)
         {
            _loc7_++;
            _loc8_ = _loc7_;
            _loc9_ = §\x19\n\t\x01§.getField(16777215,8,-1,"nokia");
            _loc9_.text = _loc4_[_loc8_];
            _loc9_.x = _loc2_.x;
            _loc9_.y = Number(Number(_loc2_.y + (_loc8_ + 1) * 12) + 10);
            _loc10_ = §\x19\n\t\x01§.getField(16777215,8,-1,"nokia");
            _loc10_.x = Number(_loc9_.x + 100);
            _loc10_.y = _loc9_.y;
            _loc10_.text = Std.string(Number(_loc6_[_loc8_]));
            _loc10_.width = Number(_loc10_.textWidth + 4);
            if(_loc8_ == 2)
            {
               _loc11_ = _loc10_.text;
               _loc12_ = _loc11_.split(".");
               if(int(_loc12_.length) > 1)
               {
                  _loc12_[1] = _loc12_[1].substr(0,2);
                  _loc11_ = _loc12_.join(".");
               }
               _loc10_.text = _loc11_ + "%";
               _loc10_.width = Number(_loc10_.textWidth + 4);
            }
            else
            {
               _loc13_ = new Element();
               _loc13_.drawFrame(Gfx.collection.get(null,"ticket"),0,0);
               _loc13_.x = Number(_loc10_.x + _loc10_.width);
               _loc13_.y = Number(_loc10_.y + 2);
               addChild(_loc13_);
            }
            addChild(_loc9_);
            addChild(_loc10_);
         }
         addChild(_loc2_);
         addChild(_loc1_);
      }
   }
}
