package
{
   import flash.§f$\n8\x01§;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   
   public class Type
   {
       
      
      public function Type()
      {
      }
      
      public static function getClass(param1:Object) : Class
      {
         var _loc2_:String = getQualifiedClassName(param1);
         if(_loc2_ == "null" || _loc2_ == "Object" || _loc2_ == "int" || _loc2_ == "Number" || _loc2_ == "Boolean")
         {
            return null;
         }
         if(param1.hasOwnProperty("prototype"))
         {
            return null;
         }
         var _loc3_:* = getDefinitionByName(_loc2_) as Class;
         if(_loc3_.__isenum)
         {
            return null;
         }
         return _loc3_;
      }
      
      public static function getEnum(param1:*) : Class
      {
         var _loc2_:String = getQualifiedClassName(param1);
         if(_loc2_ == "null" || _loc2_.substr(0,8) == "builtin.")
         {
            return null;
         }
         if(param1.hasOwnProperty("prototype"))
         {
            return null;
         }
         var _loc3_:* = getDefinitionByName(_loc2_) as Class;
         if(!_loc3_.__isenum)
         {
            return null;
         }
         return _loc3_;
      }
      
      public static function getSuperClass(param1:Class) : Class
      {
         var _loc2_:String = getQualifiedSuperclassName(param1);
         if(_loc2_ == null || _loc2_ == "Object")
         {
            return null;
         }
         return getDefinitionByName(_loc2_) as Class;
      }
      
      public static function §\nzv\t\x01§(param1:Class) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:String = _loc2_;
         if(_loc3_ == "int")
         {
            return "Int";
         }
         if(_loc3_ == "Number")
         {
            return "Float";
         }
         if(_loc3_ == "Boolean")
         {
            return "Bool";
         }
         return _loc2_.split("::").join(".");
      }
      
      public static function getEnumName(param1:Class) : String
      {
         return Type.§\nzv\t\x01§(param1);
      }
      
      public static function §)u^\x02§(param1:String) : Class
      {
         var _loc3_:* = null as Class;
         var _loc4_:* = null;
         var _loc5_:* = null as String;
         _loc3_ = getDefinitionByName(param1) as Class;
         if(_loc3_.__isenum)
         {
            return null;
         }
         return _loc3_;
      }
      
      public static function resolveEnum(param1:String) : Class
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc3_ = getDefinitionByName(param1);
         if(!_loc3_.__isenum)
         {
            return null;
         }
         return _loc3_;
      }
      
      public static function createInstance(param1:Class, param2:Array) : Object
      {
         switch(int(param2.length))
         {
            case 0:
               §§push(new param1());
               break;
            case 1:
               §§push(new param1(param2[0]));
               break;
            case 2:
               §§push(new param1(param2[0],param2[1]));
               break;
            case 3:
               §§push(new param1(param2[0],param2[1],param2[2]));
               break;
            case 4:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3]));
               break;
            case 5:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4]));
               break;
            case 6:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5]));
               break;
            case 7:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6]));
               break;
            case 8:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7]));
               break;
            case 9:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8]));
               break;
            case 10:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9]));
               break;
            case 11:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10]));
               break;
            case 12:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11]));
               break;
            case 13:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12]));
               break;
            case 14:
               §§push(new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13]));
         }
         return §§pop();
      }
      
      public static function createEmptyInstance(param1:Class) : Object
      {
         var _loc3_:* = null as Object;
         var _loc4_:* = null;
         §f$\n8\x01§.skip_constructor = true;
         _loc3_ = new param1();
         §f$\n8\x01§.skip_constructor = false;
         return _loc3_;
      }
      
      public static function createEnum(param1:Class, param2:String, param3:Array = undefined) : Object
      {
         var _loc4_:Object = Reflect.field(param1,param2);
         if(_loc4_ == null)
         {
            §f$\n8\x01§.lastError = new Error();
            throw "No such constructor " + param2;
         }
         if(Reflect.isFunction(_loc4_))
         {
            if(param3 == null)
            {
               §f$\n8\x01§.lastError = new Error();
               throw "Constructor " + param2 + " need parameters";
            }
            return _loc4_.apply(param1,param3);
         }
         if(param3 != null && int(param3.length) != 0)
         {
            §f$\n8\x01§.lastError = new Error();
            throw "Constructor " + param2 + " does not need parameters";
         }
         return _loc4_;
      }
      
      public static function createEnumIndex(param1:Class, param2:int, param3:Array = undefined) : Object
      {
         var _loc4_:String = param1.__constructs__[param2];
         if(_loc4_ == null)
         {
            §f$\n8\x01§.lastError = new Error();
            throw param2 + " is not a valid enum constructor index";
         }
         return Type.createEnum(param1,_loc4_,param3);
      }
      
      public static function describe(param1:*, param2:Boolean) : Array
      {
         var _loc8_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:XML = describeType(param1);
         if(param2)
         {
            _loc4_ = _loc4_.factory[0];
         }
         var _loc5_:XMLList = _loc4_.child("method");
         var _loc6_:int = 0;
         var _loc7_:int = int(_loc5_.length());
         while(_loc6_ < _loc7_)
         {
            _loc6_++;
            _loc8_ = _loc6_;
            _loc3_.push(Std.string(_loc5_[_loc8_].attribute("name")));
         }
         var _loc9_:XMLList = _loc4_.child("variable");
         _loc6_ = 0;
         _loc7_ = int(_loc9_.length());
         while(_loc6_ < _loc7_)
         {
            _loc6_++;
            _loc8_ = _loc6_;
            _loc3_.push(Std.string(_loc9_[_loc8_].attribute("name")));
         }
         var _loc10_:XMLList = _loc4_.child("accessor");
         _loc6_ = 0;
         _loc7_ = int(_loc10_.length());
         while(_loc6_ < _loc7_)
         {
            _loc6_++;
            _loc8_ = _loc6_;
            _loc3_.push(Std.string(_loc10_[_loc8_].attribute("name")));
         }
         return _loc3_;
      }
      
      public static function getInstanceFields(param1:Class) : Array
      {
         return Type.describe(param1,true);
      }
      
      public static function §\x01q\nY\x03§(param1:Class) : Array
      {
         var _loc2_:Array = Type.describe(param1,false);
         _loc2_.remove("__construct__");
         _loc2_.remove("prototype");
         return _loc2_;
      }
      
      public static function getEnumConstructs(param1:Class) : Array
      {
         var _loc2_:Array = param1.__constructs__;
         return _loc2_.copy();
      }
      
      public static function §hJo\n\x02§(param1:*) : ValueType
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:String = _loc3_;
         if(_loc4_ == "null")
         {
            return ValueType.TNull;
         }
         if(_loc4_ == "void")
         {
            return ValueType.TNull;
         }
         if(_loc4_ == "int")
         {
            return ValueType.TInt;
         }
         if(_loc4_ == "Number")
         {
            if((param1 < -268435456 || param1 >= 268435456) && int(param1) == param1)
            {
               return ValueType.TInt;
            }
            return ValueType.TFloat;
         }
         if(_loc4_ == "Boolean")
         {
            return ValueType.§\nxB{§;
         }
         if(_loc4_ == "Object")
         {
            return ValueType.TObject;
         }
         if(_loc4_ == "Function")
         {
            return ValueType.TFunction;
         }
         _loc5_ = null;
         _loc5_ = getDefinitionByName(_loc3_);
         if(param1.hasOwnProperty("prototype"))
         {
            return ValueType.TObject;
         }
         if(_loc5_.__isenum)
         {
            return ValueType.TEnum(_loc5_);
         }
         return ValueType.TClass(_loc5_);
      }
      
      public static function enumEq(param1:Object, param2:Object) : Boolean
      {
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param1 == param2)
         {
            return true;
         }
         try
         {
            if(param1.index != param2.index)
            {
               return false;
            }
            _loc4_ = param1.§N\nM\x03§;
            _loc5_ = param2.§N\nM\x03§;
            _loc6_ = 0;
            _loc7_ = int(_loc4_.length);
            while(_loc6_ < _loc7_)
            {
               _loc6_++;
               _loc8_ = _loc6_;
               if(!Type.enumEq(_loc4_[_loc8_],_loc5_[_loc8_]))
               {
                  return false;
               }
            }
         }
         catch(_loc9_:*)
         {
            return false;
         }
         return true;
      }
      
      public static function §;\n\x12w\x03§(param1:*) : String
      {
         return param1.tag;
      }
      
      public static function enumParameters(param1:*) : Array
      {
         return param1.§N\nM\x03§ == null?[]:param1.§N\nM\x03§;
      }
      
      public static function §\x16\x01M\x03§(param1:*) : int
      {
         return param1.index;
      }
      
      public static function allEnums(param1:Class) : Array
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as Object;
         var _loc2_:Array = [];
         var _loc3_:Array = param1.__constructs__;
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc3_.length))
         {
            _loc5_ = _loc3_[_loc4_];
            _loc4_++;
            _loc6_ = Reflect.field(param1,_loc5_);
            if(!Reflect.isFunction(_loc6_))
            {
               _loc2_.push(_loc6_);
            }
         }
         return _loc2_;
      }
   }
}
