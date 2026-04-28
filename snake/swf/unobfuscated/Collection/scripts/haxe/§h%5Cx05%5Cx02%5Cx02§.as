package haxe
{
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import haxe.io.Bytes;
   
   public class §h\x05\x02\x02§
   {
      
      public static var content:Array = [{"name":"6870d93ba2a5b442c7cbd120ae1485dc"},{"name":"text.ods"},{"name":"e46abf40e865dd2492a7843ceda578be"},{"name":"data.ods"}];
       
      
      public function §h\x05\x02\x02§()
      {
      }
      
      public static function §\x1cOu\x0b\x02§() : Array
      {
         var _loc4_:* = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = §h\x05\x02\x02§.content;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_.push(_loc4_.name);
         }
         return _loc1_;
      }
      
      public static function getString(param1:String) : String
      {
         var _loc2_:ByteArray = §h\x05\x02\x02§.resolve(param1);
         return _loc2_ == null?null:_loc2_.readUTFBytes(_loc2_.length);
      }
      
      public static function getBytes(param1:String) : Bytes
      {
         var _loc2_:ByteArray = §h\x05\x02\x02§.resolve(param1);
         return _loc2_ == null?null:Bytes.§3\x06\\\x03§(_loc2_);
      }
      
      public static function resolve(param1:String) : ByteArray
      {
         var _loc3_:* = null;
         _loc3_ = getDefinitionByName("_res._" + param1.split(".").join("_")) as Class;
         return new _loc3_();
      }
   }
}
