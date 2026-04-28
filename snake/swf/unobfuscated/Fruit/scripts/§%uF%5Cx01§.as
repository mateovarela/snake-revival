package
{
   import flash.display.Sprite;
   import flash.§f$\n8\x01§;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import mt.DepthManager;
   import mt.bumdum9.Col;
   import pix.Frame;
   
   public class §%uF\x01§ extends flash.display.Sprite
   {
      
      public static var §;\x057\x02§:int = 219;
      
      public static var HEIGHT:int = 48;
       
      
      public var dm:DepthManager;
      
      public var data:Object;
      
      public function §%uF\x01§(param1:int = 0, param2:int = 0)
      {
         var _loc9_:int = 0;
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super();
         data = __fruitList.LIST[param1];
         Main.root.addChild(this);
         dm = new DepthManager(this);
         var _loc3_:pix.Sprite = new pix.Sprite();
         _loc3_.drawFrame(Gfx.bg.get(0),0,0);
         dm.add(_loc3_,0);
         var _loc4_:int = 0;
         var _loc5_:Array = __fruitList.__fruitLevelUnlock;
         var _loc6_:int = param2;
         var _loc7_:Number = 1;
         var _loc8_:int = 0;
         while(_loc8_ < int(_loc5_.length))
         {
            _loc9_ = int(_loc5_[_loc8_]);
            _loc8_++;
            if(_loc6_ >= _loc9_)
            {
               _loc4_++;
            }
         }
         _loc7_ = _loc6_ / int(_loc5_[int(_loc5_.length) - 1]);
         var _loc10_:TextField = getField(3,0,8,"nokia");
         _loc8_ = 28;
         _loc10_.x = §%uF\x01§.§;\x057\x02§ - (_loc8_ - 2);
         _loc10_.width = _loc8_;
         _loc10_.y = 6;
         _loc10_.text = Std.string(param2);
         _loc9_ = int(Math.min(_loc7_,1) * 27);
         var _loc11_:flash.display.Sprite = new flash.display.Sprite();
         dm.add(_loc11_,1);
         _loc11_.graphics.beginFill(16665419);
         _loc11_.graphics.drawRect(0,0,7,_loc9_);
         _loc11_.x = §%uF\x01§.§;\x057\x02§ - 11;
         _loc11_.y = 47 - _loc9_;
         §\x18pdZ\x01§(_loc4_,data,param1,_loc7_);
      }
      
      public function kill() : void
      {
         Main.root.removeChild(this);
      }
      
      public function getField(param1:int = 0, param2:int = 0, param3:int = 8, param4:String = undefined) : TextField
      {
         if(param4 == null)
         {
            param4 = "04b03";
         }
         var _loc5_:TextField = new TextField();
         _loc5_.selectable = false;
         _loc5_.embedFonts = true;
         var _loc6_:TextFormat = _loc5_.getTextFormat();
         _loc6_.color = int([16777215,13107063,3248642,16768477,5419806][param1]);
         _loc6_.font = param4;
         _loc6_.size = param3;
         _loc6_.align = [TextFormatAlign.LEFT,TextFormatAlign.CENTER,TextFormatAlign.RIGHT][param2 + 1];
         _loc5_.defaultTextFormat = _loc6_;
         dm.add(_loc5_,1);
         return _loc5_;
      }
      
      public function §\x18pdZ\x01§(param1:int, param2:Object, param3:int, param4:Number) : void
      {
         var _loc8_:* = null as pix.Sprite;
         var _loc9_:* = null as Array;
         var _loc10_:* = null as Array;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null as TextField;
         var _loc14_:* = null as TextField;
         var _loc15_:* = null as String;
         var _loc16_:* = null as §Y\x11`5\x01§;
         var _loc5_:TextField = getField(param1 > 1?0:4,-1,8,"nokia");
         _loc5_.x = 0;
         _loc5_.y = -2;
         _loc5_.text = Lang.FRUIT_UNKNOWN;
         if(param1 > 1)
         {
            _loc5_.text = Data.TEXT[param3].fruit;
            _loc5_.width = Number(Math.min(180,Number(_loc5_.textWidth + 4)));
         }
         var _loc6_:TextField = getField(2,1,8);
         _loc6_.x = 144;
         _loc6_.y = 8;
         _loc6_.width = 50;
         _loc6_.text = "no." + Std.string(int(param2.rank) + 1);
         var _loc7_:pix.Sprite = new pix.Sprite();
         _loc7_.drawFrame(Gfx.fruits.get(param3));
         _loc7_.x = 19;
         _loc7_.y = 29;
         dm.add(_loc7_,1);
         if(param1 == 0)
         {
            Col.setPercentColor(_loc7_,1,5419806);
         }
         else
         {
            _loc8_ = new pix.Sprite();
            _loc8_.drawFrame(Gfx.fruits.get(param3));
            _loc8_.x = Number(_loc7_.x + 2);
            _loc8_.y = Number(_loc7_.y + 2);
            dm.add(_loc8_,0);
            Col.setPercentColor(_loc8_,1,5419806);
         }
         if(param1 >= 3)
         {
            _loc9_ = Lang.§flUg\x02§;
            _loc10_ = [int(int(__fruitList.§\x06`l[\x03§(int(param2.rank))) * int(param2.score) * 0.1),int(param2.vit) + " " + Lang.§fi1#\x01§,int(param2.cal) + " " + Lang.§\x06\x1ed[\x02§,int(param2.sta) + " " + Lang.§JU\t~\x02§];
            _loc11_ = 0;
            while(_loc11_ < 4)
            {
               _loc11_++;
               _loc12_ = _loc11_;
               _loc13_ = getField(1,-1);
               _loc13_.x = 38;
               _loc13_.y = 9 + _loc12_ * 7;
               _loc13_.text = _loc9_[_loc12_] + " :";
               _loc13_.width = Number(_loc13_.textWidth + 4);
               _loc14_ = getField(0,-1);
               _loc14_.x = 108;
               _loc14_.y = _loc13_.y;
               _loc14_.text = Std.string(_loc10_[_loc12_]);
            }
         }
         _loc13_ = getField(2,-1,8);
         _loc13_.x = 38;
         _loc13_.y = 38;
         _loc13_.width = 200;
         if(param1 >= 4)
         {
            _loc15_ = "";
            _loc11_ = 0;
            _loc9_ = param2.tags;
            while(_loc11_ < int(_loc9_.length))
            {
               _loc16_ = _loc9_[_loc11_];
               _loc11_++;
               if(_loc15_.length > 0)
               {
                  _loc15_ = _loc15_ + ",";
               }
               _loc15_ = _loc15_ + Lang.§$\x02\rQ§[int(_loc16_.index)];
            }
            _loc13_.text = _loc15_;
         }
      }
   }
}
