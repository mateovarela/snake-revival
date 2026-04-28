package mt.bumdum9
{
   public class En
   {
       
      
      public function En()
      {
      }
      
      public static function get(param1:Class, param2:int) : *
      {
         var _loc3_:Array = Type.getEnumConstructs(param1);
         return Type.createEnum(param1,_loc3_[param2]);
      }
      
      public static function next(param1:Object) : Object
      {
         return En.dec(param1,1);
      }
      
      public static function prev(param1:Object) : Object
      {
         return En.dec(param1,-1);
      }
      
      public static function dec(param1:Object, param2:int) : Object
      {
         var _loc3_:int = param1.index + param2;
         var _loc4_:Class = Type.getEnum(param1);
         var _loc5_:Array = Type.getEnumConstructs(_loc4_);
         var _loc6_:int = int(_loc5_.length);
         while(_loc3_ >= _loc6_)
         {
            _loc3_ = _loc3_ - _loc6_;
         }
         while(_loc3_ < 0)
         {
            _loc3_ = _loc3_ + _loc6_;
         }
         return Type.createEnum(_loc4_,_loc5_[_loc3_]);
      }
   }
}
