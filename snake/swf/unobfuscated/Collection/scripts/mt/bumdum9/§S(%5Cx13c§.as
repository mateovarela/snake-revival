package mt.bumdum9
{
   public class §S(\x13c§
   {
       
      
      public function §S(\x13c§()
      {
      }
      
      public static function bresenham(param1:int, param2:int, param3:int, param4:int) : Array
      {
         var _loc6_:int = 0;
         var _loc5_:Array = [];
         var _loc7_:int = param3 - param1;
         var _loc8_:int = param4 - param2;
         var _loc9_:int = 1;
         if(_loc7_ < _loc8_)
         {
            param1 = param1 ^ param3;
            param3 = param3 ^ param1;
            param1 = param1 ^ param3;
            param2 = param2 ^ param4;
            param4 = param4 ^ param2;
            param2 = param2 ^ param4;
         }
         if(_loc7_ < 0)
         {
            _loc7_ = -_loc7_;
            _loc9_ = -_loc9_;
         }
         if(_loc8_ < 0)
         {
            _loc8_ = -_loc8_;
            _loc9_ = -_loc9_;
         }
         if(_loc8_ > _loc7_)
         {
            _loc6_ = -(_loc8_ >> 1);
            while(param4 <= param2)
            {
               _loc5_.push({
                  "x":param3,
                  "y":param4
               });
               _loc6_ = _loc6_ + _loc7_;
               if(_loc6_ > 0)
               {
                  param3 = param3 + _loc9_;
                  _loc6_ = _loc6_ - _loc8_;
               }
               param4++;
            }
         }
         else
         {
            _loc6_ = -(_loc7_ >> 1);
            while(param1 <= param3)
            {
               _loc5_.push({
                  "x":param1,
                  "y":param2
               });
               _loc6_ = _loc6_ + _loc8_;
               if(_loc6_ > 0)
               {
                  param2 = param2 + _loc9_;
                  _loc6_ = _loc6_ - _loc7_;
               }
               param1++;
            }
         }
         return _loc5_;
      }
   }
}
