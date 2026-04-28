package fx
{
   import flash.Boot;
   import mt.Rand;
   
   public class _x_PotionRose extends §\x12\bHb\x03§
   {
       
      
      public function _x_PotionRose(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function update() : void
      {
         var _loc3_:* = null as Fruit;
         var _loc4_:* = null as Rand;
         var _loc5_:Number = NaN;
         var _loc6_:* = null as Part;
         super.update();
         if(int(Game.me.§\x0e\b$\r§[0] % 4) != 0)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:Array = Game.me.fruits;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.z == 0 && int((int(_loc5_) & 1073741823) % 20) == 0)
            {
               _loc4_ = Game.me.seed;
               _loc5_ = _loc4_.seed * 16807 % 2147483647;
               _loc4_.seed = _loc5_;
               _loc4_ = Game.me.seed;
               _loc5_ = _loc4_.seed * 16807 % 2147483647;
               _loc4_.seed = _loc5_;
               _loc4_ = Game.me.seed;
               _loc5_ = _loc4_.seed * 16807 % 2147483647;
               _loc4_.seed = _loc5_;
               _loc3_.§\nMo7§(int((int(_loc5_) & 1073741823) % 10007) / 10007 * 6.28,int((int(_loc5_) & 1073741823) % 10007) / 10007 * 5,-(1 + int((int(_loc5_) & 1073741823) % 10007) / 10007 * 3));
               _loc6_ = Stage.me.§X\x0f;z\x03§("onde_slow",Stage.DP_BG);
               _loc6_.x = _loc3_.x;
               _loc6_.y = _loc3_.y;
            }
         }
      }
   }
}
