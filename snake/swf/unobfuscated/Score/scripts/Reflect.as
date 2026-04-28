package
{
   public class Reflect
   {
       
      
      public function Reflect()
      {
      }
      
      public static function hasField(param1:*, param2:String) : Boolean
      {
         return param1.hasOwnProperty(param2);
      }
      
      public static function field(param1:*, param2:String) : *
      {
         try
         {
            return param1[param2];
         }
         catch(_loc4_:*)
         {
            return null;
         }
         return §§pop();
      }
      
      public static function setField(param1:*, param2:String, param3:*) : void
      {
         param1[param2] = param3;
      }
      
      public static function callMethod(param1:*, param2:*, param3:Array) : *
      {
         return param2.apply(param1,param3);
      }
      
      public static function fields(param1:*) : Array
      {
         if(param1 == null)
         {
            return [];
         }
         var _loc4_:int = 0;
         var _loc3_:Array = [];
         var _loc5_:* = param1;
         while(§§hasnext(param1,_loc4_))
         {
            _loc3_.push(§§nextname(_loc4_,_loc5_));
         }
         var _loc2_:Array = _loc3_;
         _loc4_ = 0;
         while(_loc4_ < int(_loc2_.length))
         {
            if(!param1.hasOwnProperty(_loc2_[_loc4_]))
            {
               _loc2_.splice(_loc4_,1);
            }
            else
            {
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public static function isFunction(param1:*) : Boolean
      {
         return typeof param1 == "function";
      }
      
      public static function compare(param1:Object, param2:Object) : int
      {
         var _loc3_:* = param1;
         var _loc4_:* = param2;
         return _loc3_ == _loc4_?0:_loc3_ > _loc4_?1:-1;
      }
      
      public static function compareMethods(param1:*, param2:*) : Boolean
      {
         return param1 == param2;
      }
      
      public static function isObject(param1:*) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:String = typeof param1;
         if(_loc3_ == "object")
         {
            try
            {
               if(param1.__enum__ == true)
               {
                  return false;
               }
            }
            catch(_loc4_:*)
            {
            }
            return true;
         }
         return _loc3_ == "string";
      }
      
      public static function deleteField(param1:*, param2:String) : Boolean
      {
         if(param1.hasOwnProperty(param2) != true)
         {
            return false;
         }
         delete param1[param2];
         return true;
      }
      
      public static function copy(param1:Object) : Object
      {
         var _loc5_:* = null as String;
         var _loc2_:* = {};
         var _loc3_:int = 0;
         var _loc4_:Array = Reflect.fields(param1);
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_[_loc5_] = Reflect.field(param1,_loc5_);
         }
         return _loc2_;
      }
      
      public static function makeVarArgs(param1:Function) : *
      {
         var f:Function = param1;
         return function(... rest):*
         {
            return f(rest);
         };
      }
   }
}
