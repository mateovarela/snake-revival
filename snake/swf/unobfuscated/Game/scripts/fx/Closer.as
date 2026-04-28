package fx
{
   import flash.Boot;
   
   public class Closer extends §\x12\bHb\x03§
   {
       
      
      public function Closer(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function update() : void
      {
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:* = null;
         super.update();
         var _loc1_:Number = 0.3;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = sn.trq;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_++;
            if(_loc2_ >= 10)
            {
               _loc6_ = _loc5_.x - sn.x;
               _loc7_ = _loc5_.y - sn.y;
               _loc8_ = Number(Math.atan2(_loc7_,_loc6_));
               _loc9_ = Number(Math.sqrt(Number(_loc6_ * _loc6_ + _loc7_ * _loc7_)));
               _loc10_ = 300;
               _loc11_ = Math.max((_loc10_ - _loc9_) / _loc10_,0) * _loc1_;
               _loc5_.x = _loc5_.x - §\x19\n\t\x01§.cos(_loc8_) * _loc11_;
               _loc5_.y = _loc5_.y - §\x19\n\t\x01§.sin(_loc8_) * _loc11_;
               _loc12_ = Stage.me.clamp(Number(_loc5_.x),Number(_loc5_.y),4);
               _loc5_.x = Number(_loc12_.x);
               _loc5_.y = Number(_loc12_.y);
            }
         }
      }
   }
}
