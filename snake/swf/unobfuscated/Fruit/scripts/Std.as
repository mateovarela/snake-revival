package
{
   import flash.§f$\n8\x01§;
   
   public class Std
   {
       
      
      public function Std()
      {
      }
      
      public static function §is§(param1:*, param2:*) : Boolean
      {
         return Boolean(§f$\n8\x01§.__instanceof(param1,param2));
      }
      
      public static function string(param1:*) : String
      {
         return §f$\n8\x01§.__string_rec(param1,"");
      }
      
      public static function _int(param1:Number) : int
      {
         return int(param1);
      }
      
      public static function §;@2\n\x01§(param1:String) : Object
      {
         var _loc2_:* = parseInt(param1);
         if(isNaN(_loc2_))
         {
            return null;
         }
         return _loc2_;
      }
      
      public static function parseFloat(param1:String) : Number
      {
         return parseFloat(param1);
      }
      
      public static function random(param1:int) : int
      {
         return int(Math.floor(Math.random() * param1));
      }
   }
}
