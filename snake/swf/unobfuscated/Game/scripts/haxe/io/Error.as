package haxe.io
{
   import flash.Boot;
   
   public final class Error
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__ = ["Blocked","Overflow","OutsideBounds","Custom"];
      
      public static var Overflow:Error;
      
      public static var OutsideBounds:Error;
      
      public static var Blocked:Error;
       
      
      public var tag:String;
      
      public var index:int;
      
      public var §N\nM\x03§:Array;
      
      public const __enum__:Boolean = true;
      
      public function Error(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         §N\nM\x03§ = param3;
      }
      
      public static function Custom(param1:*) : Error
      {
         return new Error("Custom",3,[param1]);
      }
      
      public final function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}
