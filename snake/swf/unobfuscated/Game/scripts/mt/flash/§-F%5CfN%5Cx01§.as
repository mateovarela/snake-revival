package mt.flash
{
   import flash.display.BitmapData;
   
   public class §-F\fN\x01§
   {
       
      
      public function §-F\fN\x01§()
      {
      }
      
      public static function run(param1:BitmapData) : void
      {
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:int = param1.width + param1.height * 51 & 1048575;
         var _loc3_:int = 5381;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < 11)
         {
            _loc5_++;
            _loc6_ = _loc5_;
            _loc3_ = (_loc3_ << 5) + _loc3_ + (_loc2_ & 255);
            _loc3_ = (_loc3_ << 5) + _loc3_ + (_loc2_ >> 8 & 255);
            _loc3_ = (_loc3_ << 5) + _loc3_ + (_loc2_ >> 16 & 255);
            _loc3_ = (_loc3_ << 5) + _loc3_ + (_loc2_ >> 24);
            _loc2_ = _loc3_ + _loc6_ & 1073741823;
            _loc4_[_loc6_] = _loc2_ & 16777215;
         }
         param1.lock();
         _loc5_ = 0;
         _loc6_ = 0;
         var _loc7_:int = param1.height;
         while(_loc6_ < _loc7_)
         {
            _loc6_++;
            _loc8_ = _loc6_;
            _loc9_ = 0;
            _loc10_ = param1.width;
            while(_loc9_ < _loc10_)
            {
               _loc9_++;
               _loc11_ = _loc9_;
               param1.setPixel32(_loc11_,_loc8_,uint(param1.getPixel32(_loc11_,_loc8_)) ^ int(_loc4_[int(_loc5_ % 11)]));
               _loc5_++;
            }
         }
         param1.unlock();
      }
   }
}
