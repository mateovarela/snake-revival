package fx
{
   import flash.Boot;
   
   public class Horn extends Fx
   {
       
      
      public var coef:Number;
      
      public function Horn(param1:Number = 0.0, param2:Number = 0.0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         coef = 1;
      }
      
      override public function update() : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         super.update();
         coef = coef * 0.95;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = sn.trq;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_++;
            if(_loc1_ >= 10)
            {
               _loc5_ = _loc4_.x - sn.x;
               _loc6_ = _loc4_.y - sn.y;
               _loc7_ = Number(Math.atan2(_loc6_,_loc5_));
               _loc8_ = Number(Math.sqrt(Number(_loc5_ * _loc5_ + _loc6_ * _loc6_)));
               _loc9_ = 550;
               _loc10_ = Math.max((_loc9_ - _loc8_) / _loc9_,0) * 3 * coef;
               _loc4_.x = Number(Number(_loc4_.x) + §\x19\n\t\x01§.cos(_loc7_) * _loc10_);
               _loc4_.y = Number(Number(_loc4_.y) + §\x19\n\t\x01§.sin(_loc7_) * _loc10_);
               _loc11_ = Stage.me.clamp(Number(_loc4_.x),Number(_loc4_.y),4);
               _loc4_.x = Number(_loc11_.x);
               _loc4_.y = Number(_loc11_.y);
            }
         }
         if(coef < 0.05)
         {
            kill();
         }
      }
   }
}
