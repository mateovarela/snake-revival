package mt.data
{
   import flash.§f$\n8\x01§;
   import haxe.Unserializer;
   import haxe.io.Bytes;
   import haxe.§h\x05\x02\x02§;
   
   public class §v\x13\x0bH\x01§
   {
      
      public static var ENCODE:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_";
       
      
      public function §v\x13\x0bH\x01§()
      {
      }
      
      public static function §&7\x16d\x03§(param1:String) : Bytes
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:Bytes = Bytes.alloc(256);
         var _loc3_:int = 0;
         while(_loc3_ < 256)
         {
            _loc3_++;
            _loc4_ = _loc3_;
            _loc2_.b[_loc4_] = _loc4_ & 127;
         }
         _loc3_ = 0;
         _loc4_ = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < 256)
         {
            _loc5_++;
            _loc6_ = _loc5_;
            _loc3_ = int(_loc3_ + int(_loc2_.b[_loc6_]) + param1.charCodeAt(int(_loc6_ % _loc4_))) & 127;
            _loc7_ = int(_loc2_.b[_loc6_]);
            _loc2_.b[_loc6_] = int(_loc2_.b[_loc3_]);
            _loc2_.b[_loc3_] = _loc7_;
         }
         return _loc2_;
      }
      
      public static function decode(param1:Bytes) : String
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:Bytes = §v\x13\x0bH\x01§.§&7\x16d\x03§(param1.sub(0,5).toString());
         var _loc3_:String = param1.sub(5,4).toString();
         var _loc4_:int = int(_loc2_.b[0]);
         var _loc5_:int = int(_loc2_.b[1]);
         var _loc6_:Bytes = param1.sub(9,param1.§_^\nv\x03§ - 9);
         var _loc7_:int = 0;
         var _loc8_:int = _loc6_.§_^\nv\x03§;
         while(_loc7_ < _loc8_)
         {
            _loc7_++;
            _loc9_ = _loc7_;
            _loc10_ = int(_loc6_.b[_loc9_]);
            _loc11_ = _loc10_ ^ int(_loc2_.b[_loc9_ & 255]);
            _loc6_.b[_loc9_] = _loc11_ == 0?_loc10_:_loc11_;
            if(_loc11_ == 0)
            {
               _loc10_ = 0;
            }
            _loc4_ = int((_loc4_ + _loc10_) % 65521);
            _loc5_ = int((_loc5_ + _loc4_) % 65521);
         }
         _loc7_ = _loc4_ ^ _loc5_ << 8;
         if(_loc3_.charCodeAt(0) != §v\x13\x0bH\x01§.ENCODE.charCodeAt(_loc7_ & 63) || _loc3_.charCodeAt(1) != §v\x13\x0bH\x01§.ENCODE.charCodeAt(_loc7_ >> 6 & 63) || _loc3_.charCodeAt(2) != §v\x13\x0bH\x01§.ENCODE.charCodeAt(_loc7_ >> 12 & 63) || _loc3_.charCodeAt(3) != §v\x13\x0bH\x01§.ENCODE.charCodeAt(_loc7_ >> 18 & 63))
         {
            §f$\n8\x01§.lastError = new Error();
            throw "Corrupted data";
         }
         return _loc6_.toString();
      }
      
      public static function extract(param1:String, param2:Array, param3:Array) : Array
      {
         var _loc11_:* = null as Object;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var §S[vi\x03§:Array = param3;
         var _loc4_:Bytes = §h\x05\x02\x02§.getBytes(param1);
         var _loc5_:String = §v\x13\x0bH\x01§.decode(_loc4_);
         var _loc6_:Unserializer = new Unserializer(_loc5_);
         _loc6_.setResolver({
            ")u^\x02":function(param1:String):Class
            {
               return null;
            },
            "resolveEnum":function(param1:String):Class
            {
               return §S[vi\x03§[Std.§;@2\n\x01§(param1.substr(1))];
            }
         });
         var _loc7_:Array = _loc6_.unserialize();
         var _loc8_:Array = [];
         var _loc9_:int = int(param2.length);
         var _loc10_:int = 0;
         while(_loc10_ < int(_loc7_.length))
         {
            _loc11_ = {};
            _loc12_ = 0;
            while(_loc12_ < _loc9_)
            {
               _loc12_++;
               _loc13_ = _loc12_;
               _loc10_++;
               _loc11_[param2[_loc13_]] = _loc7_[_loc10_];
            }
            _loc8_.push(_loc11_);
         }
         return _loc8_;
      }
   }
}
