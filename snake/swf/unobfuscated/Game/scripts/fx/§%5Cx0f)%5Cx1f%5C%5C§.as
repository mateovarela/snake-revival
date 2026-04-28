package fx
{
   import flash.Boot;
   
   public class §\x0f)\x1f\\§ extends §\x12\bHb\x03§
   {
       
      
      public function §\x0f)\x1f\\§(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function update() : void
      {
         var _loc4_:* = null as Fruit;
         var _loc5_:* = null as Fruit;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         super.update();
         var _loc1_:Array = Game.me.fruits.copy();
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc1_.length))
         {
            _loc4_ = _loc1_[_loc3_];
            _loc3_++;
            _loc5_ = _loc2_[int(_loc4_.data.rank)];
            if(_loc5_ == null)
            {
               _loc2_[int(_loc4_.data.rank)] = _loc4_;
            }
            else
            {
               _loc2_[int(_loc4_.data.rank)] = null;
               if(!(_loc4_.z < -5 || _loc5_.z < -5 || Number(Math.abs(_loc4_.vy)) > 1 || Number(Math.abs(_loc5_.vy)) > 1))
               {
                  _loc6_ = _loc5_.x - _loc4_.x;
                  _loc7_ = _loc5_.y - _loc4_.y;
                  _loc8_ = Number(Math.atan2(_loc7_,_loc6_));
                  _loc9_ = 3;
                  _loc10_ = Math.cos(_loc8_) * _loc9_;
                  _loc11_ = Math.sin(_loc8_) * _loc9_;
                  _loc4_.x = Number(_loc4_.x + _loc10_);
                  _loc4_.y = Number(_loc4_.y + _loc11_);
                  _loc5_.x = _loc5_.x - _loc10_;
                  _loc5_.y = _loc5_.y - _loc11_;
                  if(Number(Number(Math.abs(_loc6_)) + Number(Math.abs(_loc7_))) < 5)
                  {
                     _loc5_.kill();
                     _loc4_.evolve(12);
                     card.§\x0fB}F\x03§();
                  }
               }
            }
         }
      }
      
      override public function kill() : void
      {
         super.kill();
      }
   }
}
