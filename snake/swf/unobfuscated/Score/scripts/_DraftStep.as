package
{
   import flash.Boot;
   
   public final class _DraftStep
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__ = ["\f?Ep","n,x-\x02","\ny\nQ\x03","4\x19c\x12"];
      
      public static var §\f?Ep§:_DraftStep;
      
      public static var §n,x-\x02§:_DraftStep;
      
      public static var §\ny\nQ\x03§:_DraftStep;
       
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function _DraftStep(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function §4\x19c\x12§(param1:Array) : _DraftStep
      {
         return new _DraftStep("4\x19c\x12",3,[param1]);
      }
      
      public final function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}
