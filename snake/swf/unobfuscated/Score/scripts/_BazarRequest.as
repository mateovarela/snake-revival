package
{
   import flash.Boot;
   
   public final class _BazarRequest
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__ = ["8s\x04Y\x01","\x0exNN","2}s\x16\x02"];
      
      public static var §2}s\x16\x02§:_BazarRequest;
      
      public static var §8s\x04Y\x01§:_BazarRequest;
      
      public static var §\x0exNN§:_BazarRequest;
       
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function _BazarRequest(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public final function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}
