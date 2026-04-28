package pix
{
   import flash.Boot;
   import mt.bumdum9.Num;
   
   public class Text extends Sprite
   {
       
      
      public var fx:§a\x18\tX\x02§;
      
      public var font:§Mdc\n\x02§;
      
      public var ec:Number;
      
      public var coef:Number;
      
      public var chars:Array;
      
      public var align:Number;
      
      public function Text(param1:§Mdc\n\x02§ = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         font = param1;
         chars = [];
         ec = param1.ww;
         align = 0;
      }
      
      override public function update() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:* = null as Array;
         var _loc11_:* = null;
         var _loc12_:Number = NaN;
         if(fx == null)
         {
            return;
         }
         var _loc1_:Array = fx.§N\nM\x03§;
         loop3:
         switch(int(fx.index))
         {
            case 0:
               _loc2_ = _loc1_[0];
               _loc3_ = _loc1_[1];
               _loc4_ = _loc1_[2];
               _loc5_ = _loc1_[3];
               _loc6_ = _loc1_[4];
               _loc7_ = _loc1_[5];
               _loc2_ = (_loc2_ + _loc3_) % 628;
               _loc8_ = _loc2_;
               _loc9_ = 0;
               _loc10_ = chars;
               while(_loc9_ < int(_loc10_.length))
               {
                  _loc11_ = _loc10_[_loc9_];
                  _loc9_++;
                  _loc12_ = Number(Math.sin(_loc8_ * 0.01));
                  _loc11_.e.x = Number(Number(_loc11_.bx) + _loc12_ * _loc4_);
                  _loc11_.e.y = Number(Number(_loc11_.by) + _loc12_ * _loc5_);
                  _loc11_.e.pxx();
                  _loc8_ = Number(_loc8_ + _loc6_);
               }
               _loc4_ = _loc4_ * _loc7_;
               _loc5_ = _loc5_ * _loc7_;
               fx = §a\x18\tX\x02§.§)E#E§(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
               if(Number(Math.abs(_loc4_)) < 0.1 && Number(Math.abs(_loc5_)) < 0.1)
               {
                  fx = null;
               }
               break;
            case 1:
               _loc2_ = _loc1_[0];
               coef = Number(Num.mm(0,Number(coef + _loc2_),1));
               _loc3_ = coef;
               visible = true;
               _loc9_ = 0;
               _loc10_ = chars;
               while(_loc9_ < int(_loc10_.length))
               {
                  _loc11_ = _loc10_[_loc9_];
                  _loc9_++;
                  _loc11_.e.x = _loc11_.bx * _loc3_;
                  _loc11_.e.y = _loc11_.by * _loc3_;
                  _loc11_.e.pxx();
               }
               break;
            case 2:
               _loc2_ = _loc1_[0];
               coef = Number(Num.mm(0,Number(coef + _loc2_),1));
               _loc3_ = coef;
               visible = true;
               _loc9_ = 0;
               _loc10_ = chars;
               while(true)
               {
                  if(_loc9_ >= int(_loc10_.length))
                  {
                     break loop3;
                  }
                  _loc11_ = _loc10_[_loc9_];
                  _loc9_++;
                  _loc11_.e.scaleX = _loc3_;
                  _loc11_.e.scaleY = _loc3_;
               }
         }
      }
      
      public function squeeze(param1:Number = -0.1) : void
      {
         coef = param1 > 0?0:1;
         fx = §a\x18\tX\x02§.§!=2o§(param1);
      }
      
      public function §[o\x02\r§(param1:int = 0, param2:int = 4, param3:int = 50, param4:int = 80, param5:Number = 1.0) : void
      {
         coef = 0;
         fx = §a\x18\tX\x02§.§)E#E§(0,param3,param1,param2,param4,param5);
      }
      
      public function setText(param1:String) : void
      {
         var _loc6_:* = null as String;
         var _loc7_:* = null as Element;
         var _loc8_:* = null as Frame;
         while(int(chars.length) > 0)
         {
            chars.pop().e.kill();
         }
         var _loc2_:Array = param1.split("");
         var _loc3_:Number = param1.length * ec;
         var _loc4_:Number = -_loc3_ * align;
         var _loc5_:int = 0;
         while(_loc5_ < int(_loc2_.length))
         {
            _loc6_ = _loc2_[_loc5_];
            _loc5_++;
            _loc7_ = new Element();
            _loc8_ = font.§@(\\\x17\x01§(_loc6_.charCodeAt(0));
            _loc7_.drawFrame(_loc8_);
            _loc7_.x = Number(_loc4_ + ec * 0.5);
            addChild(_loc7_);
            _loc4_ = Number(_loc4_ + ec);
            chars.push({
               "e":_loc7_,
               "bx":_loc7_.x,
               "by":_loc7_.y
            });
         }
      }
      
      override public function kill() : void
      {
         var _loc3_:* = null;
         var _loc1_:int = 0;
         var _loc2_:Array = chars;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.e.kill();
         }
         super.kill();
      }
      
      public function §MIvi\x03§(param1:Number = 0.1) : void
      {
         coef = param1 > 0?0:1;
         if(coef == 0)
         {
            visible = false;
         }
         fx = §a\x18\tX\x02§.§tMR\x12\x01§(param1);
      }
   }
}
