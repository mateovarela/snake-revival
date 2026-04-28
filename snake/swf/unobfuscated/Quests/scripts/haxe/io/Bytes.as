package haxe.io
{
   import flash.§f$\n8\x01§;
   import flash.utils.ByteArray;
   
   public class Bytes
   {
       
      
      public var §_^\nv\x03§:int;
      
      public var b:ByteArray;
      
      public function Bytes(param1:int = 0, param2:ByteArray = undefined)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         §_^\nv\x03§ = param1;
         b = param2;
      }
      
      public static function alloc(param1:int) : Bytes
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.length = param1;
         return new Bytes(param1,_loc2_);
      }
      
      public static function ofString(param1:String) : Bytes
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(param1);
         return new Bytes(_loc2_.length,_loc2_);
      }
      
      public static function §3\x06\\\x03§(param1:ByteArray) : Bytes
      {
         return new Bytes(param1.length,param1);
      }
      
      public function toString() : String
      {
         b.position = 0;
         return b.readUTFBytes(§_^\nv\x03§);
      }
      
      public function toHex() : String
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:StringBuf = new StringBuf();
         var _loc2_:Array = [];
         var _loc3_:String = "0123456789abcdef";
         var _loc4_:int = 0;
         var _loc5_:int = _loc3_.length;
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc2_.push(_loc3_.charCodeAt(_loc6_));
         }
         _loc4_ = 0;
         _loc5_ = §_^\nv\x03§;
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc7_ = int(b[_loc6_]);
            _loc8_ = _loc2_[_loc7_ >> 4];
            _loc1_.b = _loc1_.b + String.fromCharCode(_loc8_);
            _loc8_ = _loc2_[_loc7_ & 15];
            _loc1_.b = _loc1_.b + String.fromCharCode(_loc8_);
         }
         return _loc1_.b;
      }
      
      public function sub(param1:int, param2:int) : Bytes
      {
         if(param1 < 0 || param2 < 0 || param1 + param2 > §_^\nv\x03§)
         {
            §f$\n8\x01§.lastError = new Error();
            throw haxe.io.Error.OutsideBounds;
         }
         b.position = param1;
         var _loc3_:ByteArray = new ByteArray();
         b.readBytes(_loc3_,0,param2);
         return new Bytes(param2,_loc3_);
      }
      
      public function set(param1:int, param2:int) : void
      {
         b[param1] = param2;
      }
      
      public function readString(param1:int, param2:int) : String
      {
         if(param1 < 0 || param2 < 0 || param1 + param2 > §_^\nv\x03§)
         {
            §f$\n8\x01§.lastError = new Error();
            throw haxe.io.Error.OutsideBounds;
         }
         b.position = param1;
         return b.readUTFBytes(param2);
      }
      
      public function getData() : ByteArray
      {
         return b;
      }
      
      public function get(param1:int) : int
      {
         return int(b[param1]);
      }
      
      public function §T\t\x11\x01§(param1:Bytes) : int
      {
         var _loc7_:int = 0;
         var _loc2_:int = §_^\nv\x03§ < param1.§_^\nv\x03§?§_^\nv\x03§:param1.§_^\nv\x03§;
         var _loc3_:ByteArray = b;
         var _loc4_:ByteArray = param1.b;
         _loc3_.position = 0;
         _loc4_.position = 0;
         var _loc5_:int = 0;
         var _loc6_:int = _loc2_ >> 2;
         while(_loc5_ < _loc6_)
         {
            _loc5_++;
            _loc7_ = _loc5_;
            if(uint(_loc3_.readUnsignedInt()) != uint(_loc4_.readUnsignedInt()))
            {
               _loc3_.position = _loc3_.position - 4;
               _loc4_.position = _loc4_.position - 4;
               return uint(_loc3_.readUnsignedInt()) - uint(_loc4_.readUnsignedInt());
            }
         }
         _loc5_ = 0;
         _loc6_ = _loc2_ & 3;
         while(_loc5_ < _loc6_)
         {
            _loc5_++;
            _loc7_ = _loc5_;
            if(uint(_loc3_.readUnsignedByte()) != uint(_loc4_.readUnsignedByte()))
            {
               return int(_loc3_[_loc3_.position - 1]) - int(_loc4_[_loc4_.position - 1]);
            }
         }
         return §_^\nv\x03§ - param1.§_^\nv\x03§;
      }
      
      public function blit(param1:int, param2:Bytes, param3:int, param4:int) : void
      {
         if(param1 < 0 || param3 < 0 || param4 < 0 || param1 + param4 > §_^\nv\x03§ || param3 + param4 > param2.§_^\nv\x03§)
         {
            §f$\n8\x01§.lastError = new Error();
            throw haxe.io.Error.OutsideBounds;
         }
         b.position = param1;
         b.writeBytes(param2.b,param3,param4);
      }
   }
}
