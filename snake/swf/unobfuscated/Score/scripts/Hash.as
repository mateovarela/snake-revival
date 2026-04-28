package
{
   import flash.Boot;
   import flash.utils.Dictionary;
   
   public class Hash
   {
       
      
      public var h:Dictionary;
      
      public function Hash()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         h = new Dictionary();
      }
      
      public function toString() : String
      {
         var _loc4_:* = null as String;
         var _loc1_:StringBuf = new StringBuf();
         _loc1_.b = _loc1_.b + "{";
         var _loc2_:* = keys();
         var _loc3_:* = _loc2_;
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            _loc1_.b = _loc1_.b + _loc4_;
            _loc1_.b = _loc1_.b + " => ";
            _loc1_.b = _loc1_.b + Std.string(get(_loc4_));
            if(_loc2_.hasNext())
            {
               _loc1_.b = _loc1_.b + ", ";
            }
         }
         _loc1_.b = _loc1_.b + "}";
         return _loc1_.b;
      }
      
      public function set(param1:String, param2:Object) : void
      {
         h["$" + param1] = param2;
      }
      
      public function remove(param1:String) : Boolean
      {
         param1 = "$" + param1;
         if(!h.hasOwnProperty(param1))
         {
            return false;
         }
         delete h[param1];
         return true;
      }
      
      public function keys() : Object
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         var _loc3_:* = h;
         while(§§hasnext(h,_loc2_))
         {
            _loc1_.push((§§nextname(_loc2_,_loc3_)).substr(1));
         }
         return _loc1_.iterator();
      }
      
      public function iterator() : Object
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         var _loc3_:* = h;
         while(§§hasnext(h,_loc2_))
         {
            _loc1_.push(§§nextname(_loc2_,_loc3_));
         }
         return {
            "ref":h,
            "it":_loc1_.iterator(),
            "hasNext":function():*
            {
               return this.it.hasNext();
            },
            "next":function():*
            {
               var _loc1_:* = this.it.next();
               return this.ref[_loc1_];
            }
         };
      }
      
      public function get(param1:String) : Object
      {
         return h["$" + param1];
      }
      
      public function exists(param1:String) : Boolean
      {
         return Boolean(h.hasOwnProperty("$" + param1));
      }
   }
}
