package
{
   public class Lambda
   {
       
      
      public function Lambda()
      {
      }
      
      public static function array(param1:Object) : Array
      {
         var _loc4_:* = null as Object;
         var _loc2_:Array = [];
         var _loc3_:* = param1.iterator();
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      public static function list(param1:Object) : List
      {
         var _loc4_:* = null as Object;
         var _loc2_:List = new List();
         var _loc3_:* = param1.iterator();
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            _loc2_.add(_loc4_);
         }
         return _loc2_;
      }
      
      public static function map(param1:Object, param2:Function) : List
      {
         var _loc5_:* = null as Object;
         var _loc3_:List = new List();
         var _loc4_:* = param1.iterator();
         while(_loc4_.hasNext())
         {
            _loc5_ = _loc4_.next();
            _loc3_.add(param2(_loc5_));
         }
         return _loc3_;
      }
      
      public static function mapi(param1:Object, param2:Function) : List
      {
         var _loc6_:* = null as Object;
         var _loc3_:List = new List();
         var _loc4_:int = 0;
         var _loc5_:* = param1.iterator();
         while(_loc5_.hasNext())
         {
            _loc6_ = _loc5_.next();
            _loc4_++;
            _loc3_.add(param2(_loc4_,_loc6_));
         }
         return _loc3_;
      }
      
      public static function has(param1:Object, param2:Object, param3:Object = undefined) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null as Object;
         if(param3 == null)
         {
            _loc4_ = param1.iterator();
            while(_loc4_.hasNext())
            {
               _loc5_ = _loc4_.next();
               if(_loc5_ == param2)
               {
                  return true;
               }
            }
         }
         else
         {
            _loc4_ = param1.iterator();
            while(_loc4_.hasNext())
            {
               _loc5_ = _loc4_.next();
               if(param3(_loc5_,param2))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public static function exists(param1:Object, param2:Function) : Boolean
      {
         var _loc4_:* = null as Object;
         var _loc3_:* = param1.iterator();
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            if(param2(_loc4_))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function foreach(param1:Object, param2:Function) : Boolean
      {
         var _loc4_:* = null as Object;
         var _loc3_:* = param1.iterator();
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            if(!param2(_loc4_))
            {
               return false;
            }
         }
         return true;
      }
      
      public static function §D\nls\x01§(param1:Object, param2:Function) : void
      {
         var _loc4_:* = null as Object;
         var _loc3_:* = param1.iterator();
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            param2(_loc4_);
         }
      }
      
      public static function filter(param1:Object, param2:Function) : List
      {
         var _loc5_:* = null as Object;
         var _loc3_:List = new List();
         var _loc4_:* = param1.iterator();
         while(_loc4_.hasNext())
         {
            _loc5_ = _loc4_.next();
            if(param2(_loc5_))
            {
               _loc3_.add(_loc5_);
            }
         }
         return _loc3_;
      }
      
      public static function §\\Pq\n\x01§(param1:Object, param2:Function, param3:Object) : Object
      {
         var _loc5_:* = null as Object;
         var _loc4_:* = param1.iterator();
         while(_loc4_.hasNext())
         {
            _loc5_ = _loc4_.next();
            param3 = param2(_loc5_,param3);
         }
         return param3;
      }
      
      public static function count(param1:Object, param2:Object = undefined) : int
      {
         var _loc4_:* = null;
         var _loc5_:* = null as Object;
         var _loc3_:int = 0;
         if(param2 == null)
         {
            _loc4_ = param1.iterator();
            while(_loc4_.hasNext())
            {
               _loc5_ = _loc4_.next();
               _loc3_++;
            }
         }
         else
         {
            _loc4_ = param1.iterator();
            while(_loc4_.hasNext())
            {
               _loc5_ = _loc4_.next();
               if(param2(_loc5_))
               {
                  _loc3_++;
               }
            }
         }
         return _loc3_;
      }
      
      public static function empty(param1:Object) : Boolean
      {
         return !param1.iterator().hasNext();
      }
      
      public static function indexOf(param1:Object, param2:Object) : int
      {
         var _loc5_:* = null as Object;
         var _loc3_:int = 0;
         var _loc4_:* = param1.iterator();
         while(_loc4_.hasNext())
         {
            _loc5_ = _loc4_.next();
            if(param2 == _loc5_)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public static function concat(param1:Object, param2:Object) : List
      {
         var _loc5_:* = null as Object;
         var _loc3_:List = new List();
         var _loc4_:* = param1.iterator();
         while(_loc4_.hasNext())
         {
            _loc5_ = _loc4_.next();
            _loc3_.add(_loc5_);
         }
         _loc4_ = param2.iterator();
         while(_loc4_.hasNext())
         {
            _loc5_ = _loc4_.next();
            _loc3_.add(_loc5_);
         }
         return _loc3_;
      }
   }
}
