package mt
{
   import flash.§f$\n8\x01§;
   
   public class Rand
   {
       
      
      public var seed:Number;
      
      public function Rand(param1:int = 0)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         seed = (param1 < 0?-param1:param1) + 131;
      }
      
      public function random(param1:int) : int
      {
         var _loc2_:Number = seed * 16807 % 2147483647;
         seed = _loc2_;
         return int((int(_loc2_) & 1073741823) % param1);
      }
      
      public function rand() : Number
      {
         var _loc1_:Number = seed * 16807 % 2147483647;
         seed = _loc1_;
         return int((int(_loc1_) & 1073741823) % 10007) / 10007;
      }
      
      public function _int() : int
      {
         var _loc1_:Number = seed * 16807 % 2147483647;
         seed = _loc1_;
         return int(_loc1_) & 1073741823;
      }
      
      public function initSeed(param1:int, param2:int = 5) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc3_++;
            _loc4_ = _loc3_;
            param1 = param1 ^ param1 << 7 & 727393536;
            param1 = param1 ^ param1 << 15 & 462094336;
            param1 = param1 ^ param1 >>> 16;
            param1 = param1 & 1073741823;
            _loc5_ = 5381;
            _loc5_ = (_loc5_ << 5) + _loc5_ + (param1 & 255);
            _loc5_ = (_loc5_ << 5) + _loc5_ + (param1 >> 8 & 255);
            _loc5_ = (_loc5_ << 5) + _loc5_ + (param1 >> 16 & 255);
            _loc5_ = (_loc5_ << 5) + _loc5_ + (param1 >> 24);
            param1 = _loc5_ & 1073741823;
         }
         seed = (param1 & 536870911) + 131;
      }
      
      public function getSeed() : int
      {
         return int(seed) - 131;
      }
      
      public function clone() : Rand
      {
         var _loc1_:Rand = new Rand(0);
         _loc1_.seed = seed;
         return _loc1_;
      }
      
      public function addSeed(param1:int) : void
      {
         seed = int((seed + param1) % 2147483647) & 1073741823;
         if(seed == 0)
         {
            seed = param1 + 1;
         }
      }
   }
}
