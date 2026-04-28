package
{
   import flash.Boot;
   
   public final class ValueType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__ = ["TNull","TInt","TFloat","TBool","TObject","TFunction","TClass","TEnum","TUnknown"];
      
      public static var TUnknown:ValueType;
      
      public static var TObject:ValueType;
      
      public static var TNull:ValueType;
      
      public static var TInt:ValueType;
      
      public static var TFunction:ValueType;
      
      public static var TFloat:ValueType;
      
      public static var TBool:ValueType;
       
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ValueType(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function TEnum(param1:Class) : ValueType
      {
         return new ValueType("TEnum",7,[param1]);
      }
      
      public static function TClass(param1:Class) : ValueType
      {
         return new ValueType("TClass",6,[param1]);
      }
      
      public final function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}
