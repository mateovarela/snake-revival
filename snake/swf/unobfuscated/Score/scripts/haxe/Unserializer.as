package haxe
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import haxe.io.Bytes;
   
   public class Unserializer
   {
      
      public static var init__:Boolean;
      
      public static var DEFAULT_RESOLVER:Object;
      
      public static var BASE64:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%:";
      
      public static var CODES:ByteArray = null;
       
      
      public var scache:Array;
      
      public var resolver:Object;
      
      public var pos:int;
      
      public var length:int;
      
      public var cache:Array;
      
      public var buf:String;
      
      public function Unserializer(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         buf = param1;
         length = param1.length;
         pos = 0;
         scache = [];
         cache = [];
         var _loc2_:* = Unserializer.DEFAULT_RESOLVER;
         if(_loc2_ == null)
         {
            _loc2_ = Type;
            Unserializer.DEFAULT_RESOLVER = _loc2_;
         }
         setResolver(_loc2_);
      }
      
      public static function initCodes() : ByteArray
      {
         var _loc4_:int = 0;
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:int = 0;
         var _loc3_:int = Unserializer.BASE64.length;
         while(_loc2_ < _loc3_)
         {
            _loc2_++;
            _loc4_ = _loc2_;
            _loc1_[int(Unserializer.BASE64.charCodeAt(_loc4_))] = _loc4_;
         }
         return _loc1_;
      }
      
      public static function run(param1:String) : *
      {
         return new Unserializer(param1).unserialize();
      }
      
      public function unserializeObject(param1:Object) : void
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null;
         while(true)
         {
            if(true)
            {
               if(pos >= length)
               {
                  break;
               }
               if(int(buf.charCodeAt(pos)) != 103)
               {
                  _loc2_ = unserialize();
                  if(!Std.§is§(_loc2_,String))
                  {
                     Boot.lastError = new Error();
                     throw "Invalid object key";
                  }
                  _loc3_ = unserialize();
                  param1[_loc2_] = _loc3_;
                  continue;
               }
            }
            pos = pos + 1;
            return;
         }
         Boot.lastError = new Error();
         throw "Invalid object";
      }
      
      public function unserializeEnum(param1:Class, param2:String) : *
      {
         var _loc3_:* = Reflect.field(param1,param2);
         if(_loc3_ == null)
         {
            Boot.lastError = new Error();
            throw "Unknown enum tag " + Type.getEnumName(param1) + "." + param2;
         }
         var _loc4_:int = pos;
         pos = pos + 1;
         if(int(buf.charCodeAt(_loc4_)) != 58)
         {
            Boot.lastError = new Error();
            throw "Invalid enum format";
         }
         _loc4_ = int(readDigits());
         if(_loc4_ == 0)
         {
            cache.push(_loc3_);
            return _loc3_;
         }
         var _loc5_:Array = [];
         while(_loc4_ > 0)
         {
            _loc5_.push(unserialize());
            _loc4_ = _loc4_ - 1;
         }
         var _loc6_:* = _loc3_.apply(param1,_loc5_);
         cache.push(_loc6_);
         return _loc6_;
      }
      
      public function unserialize() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null as String;
         var _loc4_:* = null as Array;
         var _loc5_:* = null;
         var _loc6_:* = null as Class;
         var _loc7_:* = null as String;
         var _loc8_:* = null as List;
         var _loc9_:* = null as Hash;
         var _loc10_:* = null as IntHash;
         var _loc11_:int = 0;
         var _loc12_:* = null as Date;
         var _loc13_:* = null as ByteArray;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null as Bytes;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         _loc1_ = pos;
         pos = pos + 1;
         switch(int(buf.charCodeAt(_loc1_)))
         {
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               pos = pos - 1;
               Boot.lastError = new Error();
               throw "Invalid char " + buf.charAt(pos) + " at position " + pos;
            case 67:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               _loc3_ = unserialize();
               _loc6_ = resolver.resolveClass(_loc3_);
               if(_loc6_ == null)
               {
                  Boot.lastError = new Error();
                  throw "Class not found " + _loc3_;
               }
               _loc5_ = Type.createEmptyInstance(_loc6_);
               cache.push(_loc5_);
               _loc5_.hxUnserialize(this);
               _loc1_ = pos;
               pos = pos + 1;
               if(int(buf.charCodeAt(_loc1_)) != 103)
               {
                  Boot.lastError = new Error();
                  throw "Invalid custom data";
               }
               return _loc5_;
            case 82:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               _loc1_ = int(readDigits());
               if(_loc1_ < 0 || _loc1_ >= int(scache.length))
               {
                  Boot.lastError = new Error();
                  throw "Invalid string reference";
               }
               return scache[_loc1_];
            case 97:
               _loc3_ = buf;
               _loc4_ = [];
               cache.push(_loc4_);
               while(true)
               {
                  _loc1_ = int(buf.charCodeAt(pos));
                  if(_loc1_ == 104)
                  {
                     pos = pos + 1;
                     break;
                  }
                  if(_loc1_ == 117)
                  {
                     pos = pos + 1;
                     _loc2_ = int(readDigits());
                     _loc4_[int(_loc4_.length) + _loc2_ - 1] = null;
                  }
                  else
                  {
                     _loc4_.push(unserialize());
                  }
               }
               return _loc4_;
            case 98:
               _loc9_ = new Hash();
               cache.push(_loc9_);
               _loc3_ = buf;
               while(int(buf.charCodeAt(pos)) != 104)
               {
                  _loc7_ = unserialize();
                  _loc9_.set(_loc7_,unserialize());
               }
               pos = pos + 1;
               return _loc9_;
            case 99:
               _loc3_ = unserialize();
               _loc6_ = resolver.resolveClass(_loc3_);
               if(_loc6_ == null)
               {
                  Boot.lastError = new Error();
                  throw "Class not found " + _loc3_;
               }
               _loc5_ = Type.createEmptyInstance(_loc6_);
               cache.push(_loc5_);
               unserializeObject(_loc5_);
               return _loc5_;
            case 100:
            default:
               _loc1_ = pos;
               while(true)
               {
                  _loc2_ = int(buf.charCodeAt(pos));
                  if(_loc2_ >= 43 && _loc2_ < 58 || _loc2_ == 101 || _loc2_ == 69)
                  {
                     pos = pos + 1;
                     continue;
                  }
                  break;
               }
               return Number(Std.parseFloat(buf.substr(_loc1_,pos - _loc1_)));
            case 102:
            default:
            default:
               return false;
            case 105:
               return int(readDigits());
            case 106:
               _loc3_ = unserialize();
               _loc6_ = resolver.resolveEnum(_loc3_);
               if(_loc6_ == null)
               {
                  Boot.lastError = new Error();
                  throw "Enum not found " + _loc3_;
               }
               pos = pos + 1;
               _loc1_ = int(readDigits());
               _loc7_ = Type.getEnumConstructs(_loc6_)[_loc1_];
               if(_loc7_ == null)
               {
                  Boot.lastError = new Error();
                  throw "Unknown enum index " + _loc3_ + "@" + _loc1_;
               }
               return unserializeEnum(_loc6_,_loc7_);
            case 107:
               return Number(Math.NaN);
            case 108:
               _loc8_ = new List();
               cache.push(_loc8_);
               _loc3_ = buf;
               while(int(buf.charCodeAt(pos)) != 104)
               {
                  _loc8_.add(unserialize());
               }
               pos = pos + 1;
               return _loc8_;
            case 109:
               return Number(Math.NEGATIVE_INFINITY);
            case 110:
               return null;
            case 111:
               _loc5_ = {};
               cache.push(_loc5_);
               unserializeObject(_loc5_);
               return _loc5_;
            case 112:
               return Number(Math.POSITIVE_INFINITY);
            case 113:
               _loc10_ = new IntHash();
               cache.push(_loc10_);
               _loc3_ = buf;
               _loc2_ = pos;
               pos = pos + 1;
               _loc1_ = int(buf.charCodeAt(_loc2_));
               while(_loc1_ == 58)
               {
                  _loc2_ = int(readDigits());
                  _loc10_.set(_loc2_,unserialize());
                  _loc11_ = pos;
                  pos = pos + 1;
                  _loc1_ = int(buf.charCodeAt(_loc11_));
               }
               if(_loc1_ != 104)
               {
                  Boot.lastError = new Error();
                  throw "Invalid IntHash format";
               }
               return _loc10_;
            case 114:
               _loc1_ = int(readDigits());
               if(_loc1_ < 0 || _loc1_ >= int(cache.length))
               {
                  Boot.lastError = new Error();
                  throw "Invalid reference";
               }
               return cache[_loc1_];
            case 115:
               _loc1_ = int(readDigits());
               _loc3_ = buf;
               _loc2_ = pos;
               pos = pos + 1;
               if(int(buf.charCodeAt(_loc2_)) != 58 || length - pos < _loc1_)
               {
                  Boot.lastError = new Error();
                  throw "Invalid bytes length";
               }
               _loc13_ = Unserializer.CODES;
               if(_loc13_ == null)
               {
                  _loc13_ = Unserializer.initCodes();
                  Unserializer.CODES = _loc13_;
               }
               _loc2_ = pos;
               _loc11_ = _loc1_ & 3;
               _loc14_ = (_loc1_ >> 2) * 3 + (_loc11_ >= 2?_loc11_ - 1:0);
               _loc15_ = _loc2_ + (_loc1_ - _loc11_);
               _loc16_ = Bytes.alloc(_loc14_);
               _loc17_ = 0;
               while(_loc2_ < _loc15_)
               {
                  _loc2_++;
                  _loc18_ = int(_loc13_[int(_loc3_.charCodeAt(_loc2_))]);
                  _loc2_++;
                  _loc19_ = int(_loc13_[int(_loc3_.charCodeAt(_loc2_))]);
                  _loc17_++;
                  _loc16_.b[_loc17_] = _loc18_ << 2 | _loc19_ >> 4;
                  _loc2_++;
                  _loc20_ = int(_loc13_[int(_loc3_.charCodeAt(_loc2_))]);
                  _loc17_++;
                  _loc16_.b[_loc17_] = _loc19_ << 4 | _loc20_ >> 2;
                  _loc2_++;
                  _loc21_ = int(_loc13_[int(_loc3_.charCodeAt(_loc2_))]);
                  _loc17_++;
                  _loc16_.b[_loc17_] = _loc20_ << 6 | _loc21_;
               }
               if(_loc11_ >= 2)
               {
                  _loc2_++;
                  _loc18_ = int(_loc13_[int(_loc3_.charCodeAt(_loc2_))]);
                  _loc2_++;
                  _loc19_ = int(_loc13_[int(_loc3_.charCodeAt(_loc2_))]);
                  _loc17_++;
                  _loc16_.b[_loc17_] = _loc18_ << 2 | _loc19_ >> 4;
                  if(_loc11_ == 3)
                  {
                     _loc2_++;
                     _loc20_ = int(_loc13_[int(_loc3_.charCodeAt(_loc2_))]);
                     _loc17_++;
                     _loc16_.b[_loc17_] = _loc19_ << 4 | _loc20_ >> 2;
                  }
               }
               pos = pos + _loc1_;
               cache.push(_loc16_);
               return _loc16_;
            case 116:
            default:
               return true;
            case 118:
               _loc12_ = Date.fromString(buf.substr(pos,19));
               cache.push(_loc12_);
               pos = pos + 19;
               return _loc12_;
            case 119:
               _loc3_ = unserialize();
               _loc6_ = resolver.resolveEnum(_loc3_);
               if(_loc6_ == null)
               {
                  Boot.lastError = new Error();
                  throw "Enum not found " + _loc3_;
               }
               return unserializeEnum(_loc6_,unserialize());
            case 120:
               Boot.lastError = new Error();
               throw unserialize();
            case 121:
               _loc1_ = int(readDigits());
               _loc2_ = pos;
               pos = pos + 1;
               if(int(buf.charCodeAt(_loc2_)) != 58 || length - pos < _loc1_)
               {
                  Boot.lastError = new Error();
                  throw "Invalid string length";
               }
               _loc3_ = buf.substr(pos,_loc1_);
               pos = pos + _loc1_;
               _loc3_ = StringTools.urlDecode(_loc3_);
               scache.push(_loc3_);
               return _loc3_;
            case 122:
               return 0;
         }
      }
      
      public function setResolver(param1:Object) : void
      {
         if(param1 == null)
         {
            resolver = {
               "resolveClass":function(param1:String):Class
               {
                  return null;
               },
               "resolveEnum":function(param1:String):Class
               {
                  return null;
               }
            };
         }
         else
         {
            resolver = param1;
         }
      }
      
      public function readDigits() : int
      {
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:int = pos;
         while(true)
         {
            _loc4_ = int(buf.charCodeAt(pos));
            if(_loc4_ == 0)
            {
               break;
            }
            if(_loc4_ == 45)
            {
               if(pos != _loc3_)
               {
                  break;
               }
               _loc2_ = true;
               pos = pos + 1;
            }
            else
            {
               if(_loc4_ < 48 || _loc4_ > 57)
               {
                  break;
               }
               _loc1_ = _loc1_ * 10 + (_loc4_ - 48);
               pos = pos + 1;
            }
         }
         if(_loc2_)
         {
            _loc1_ = _loc1_ * -1;
         }
         return _loc1_;
      }
      
      public function §;A\x1c)§() : Object
      {
         return resolver;
      }
      
      public function get(param1:int) : int
      {
         return int(buf.charCodeAt(param1));
      }
   }
}
