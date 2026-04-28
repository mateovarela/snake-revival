package
{
   import flash.§f$\n8\x01§;
   
   public final class _DraftCmd
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__ = ["1\\\'Y\x01","]]~a\x03","T\x1fw\x1a\x02","D\x10^*\x01"];
      
      public static var §1\\'Y\x01§:_DraftCmd;
       
      
      public var tag:String;
      
      public var index:int;
      
      public var §N\nM\x03§:Array;
      
      public const __enum__:Boolean = true;
      
      public function _DraftCmd(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         §N\nM\x03§ = param3;
      }
      
      public static function §D\x10^*\x01§(param1:String) : _DraftCmd
      {
         return new _DraftCmd("D\x10^*\x01",3,[param1]);
      }
      
      public static function §T\x1fw\x1a\x02§(param1:int) : _DraftCmd
      {
         return new _DraftCmd("T\x1fw\x1a\x02",2,[param1]);
      }
      
      public static function §]]~a\x03§(param1:_CardType) : _DraftCmd
      {
         return new _DraftCmd("]]~a\x03",1,[param1]);
      }
      
      public final function toString() : String
      {
         return §f$\n8\x01§.enum_to_string(this);
      }
   }
}
