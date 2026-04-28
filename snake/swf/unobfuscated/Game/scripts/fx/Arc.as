package fx
{
   import flash.Boot;
   import flash.display.Graphics;
   import mt.bumdum9.Num;
   
   public class Arc extends Fx
   {
      
      public static var LIFE:int = 10;
      
      public static var MARGIN:int = 2;
       
      
      public var §e\x01f{\x02§:Number;
      
      public var timer:int;
      
      public var spc:Number;
      
      public var pos:Number;
      
      public var gfx:Graphics;
      
      public var colors:Array;
      
      public function Arc(param1:Number = 0.0, param2:Graphics = undefined)
      {
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         if(Boot.skip_constructor)
         {
            return;
         }
         pos = param1;
         gfx = param2;
         super();
         colors = [16777215,16777215];
         timer = Arc.LIFE;
         spc = (Math.random() * 2 - 1) * 0.005;
         var _loc3_:* = sn.§S=6 §(param1).§#\x16\x16\x01§;
         var _loc4_:int = 200;
         var _loc5_:Number = 99999.9;
         §e\x01f{\x02§ = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc6_++;
            _loc7_ = _loc6_;
            _loc8_ = _loc7_ / _loc4_;
            _loc9_ = Stage.me.§j\x0fkz§(_loc8_);
            _loc10_ = _loc9_.x - _loc3_.x;
            _loc11_ = _loc9_.y - _loc3_.y;
            _loc12_ = Number(Math.sqrt(Number(_loc10_ * _loc10_ + _loc11_ * _loc11_)));
            if(_loc12_ < _loc5_)
            {
               _loc5_ = _loc12_;
               §e\x01f{\x02§ = _loc8_;
            }
         }
      }
      
      override public function update() : void
      {
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super.update();
         §e\x01f{\x02§ = Number(Num.sMod(Number(§e\x01f{\x02§ + spc),1));
         pos = Number(pos + spc * 200);
         var _loc1_:* = Stage.me.§j\x0fkz§(§e\x01f{\x02§,Arc.MARGIN);
         var _loc2_:* = sn.§S=6 §(pos).§#\x16\x16\x01§;
         if(!sn.§Di&b\x03§(_loc2_))
         {
            kill();
            return;
         }
         var _loc3_:Number = _loc1_.x - _loc2_.x;
         var _loc4_:Number = _loc1_.y - _loc2_.y;
         var _loc5_:Array = [];
         var _loc6_:int = 4;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc7_++;
            _loc8_ = _loc7_;
            _loc9_ = _loc8_ / (_loc6_ - 1);
            _loc10_ = 4;
            if(_loc8_ == _loc6_ - 1 || _loc8_ == 0)
            {
               _loc10_ = 0;
            }
            _loc5_.push({
               "x":Number(Number(Number(_loc2_.x) + _loc3_ * _loc9_) + (Math.random() * 2 - 1) * _loc10_),
               "y":Number(Number(Number(_loc2_.y) + _loc4_ * _loc9_) + (Math.random() * 2 - 1) * _loc10_)
            });
         }
         _loc7_ = 0;
         while(_loc7_ < 2)
         {
            _loc7_++;
            _loc8_ = _loc7_;
            _loc9_ = 2 - Math.abs(timer / Arc.LIFE * 2 - 1) * 1.5;
            _loc9_ = Number(_loc9_ + _loc8_ * 8);
            gfx.lineStyle(_loc9_,int(colors[_loc8_]),1 - _loc8_ * 0.94);
            _loc11_ = _loc5_.shift();
            gfx.moveTo(Number(_loc11_.x),Number(_loc11_.y));
            _loc10_ = 0;
            while(_loc10_ < int(_loc5_.length))
            {
               _loc12_ = _loc5_[_loc10_];
               _loc10_++;
               gfx.lineTo(Number(_loc12_.x),Number(_loc12_.y));
            }
            _loc10_ = timer;
            timer = timer - 1;
            if(_loc10_ == 0)
            {
               kill();
            }
         }
      }
   }
}
