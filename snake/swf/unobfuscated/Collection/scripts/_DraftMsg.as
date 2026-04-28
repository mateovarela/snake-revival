package
{
   import flash.§f$\n8\x01§;
   
   public final class _DraftMsg
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__ = ["z(UB\x01","\x015R\\\x01","\x06\x1chs\x01","h9i\'","p\x0bA\'\x01","B\x1bHt\x01","_{2\x1d\x01","(i7=","2~EN\x01","VPE`","\x1bRU\n"];
      
      public static var §2~EN\x01§:_DraftMsg;
      
      public static var §B\x1bHt\x01§:_DraftMsg;
      
      public static var §VPE`§:_DraftMsg;
       
      
      public var tag:String;
      
      public var index:int;
      
      public var §N\nM\x03§:Array;
      
      public const __enum__:Boolean = true;
      
      public function _DraftMsg(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         §N\nM\x03§ = param3;
      }
      
      public static function §\x1bRU\n§(param1:Boolean, param2:Boolean, param3:Boolean) : _DraftMsg
      {
         return new _DraftMsg("\x1bRU\n",10,[param1,param2,param3]);
      }
      
      public static function §(i7=§(param1:int) : _DraftMsg
      {
         return new _DraftMsg("(i7=",7,[param1]);
      }
      
      public static function §\x06\x1chs\x01§(param1:_CardType, param2:int) : _DraftMsg
      {
         return new _DraftMsg("\x06\x1chs\x01",2,[param1,param2]);
      }
      
      public static function §h9i'§(param1:int, param2:int, param3:int) : _DraftMsg
      {
         return new _DraftMsg("h9i\'",3,[param1,param2,param3]);
      }
      
      public static function §\x015R\\\x01§(param1:Array, param2:int, param3:Number) : _DraftMsg
      {
         return new _DraftMsg("\x015R\\\x01",1,[param1,param2,param3]);
      }
      
      public static function §p\x0bA'\x01§(param1:Object) : _DraftMsg
      {
         return new _DraftMsg("p\x0bA\'\x01",4,[param1]);
      }
      
      public static function §_{2\x1d\x01§(param1:Array) : _DraftMsg
      {
         return new _DraftMsg("_{2\x1d\x01",6,[param1]);
      }
      
      public static function §z(UB\x01§(param1:Array, param2:Array) : _DraftMsg
      {
         return new _DraftMsg("z(UB\x01",0,[param1,param2]);
      }
      
      public final function toString() : String
      {
         return §f$\n8\x01§.enum_to_string(this);
      }
   }
}
