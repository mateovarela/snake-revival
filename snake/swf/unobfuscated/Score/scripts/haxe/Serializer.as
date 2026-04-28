package haxe
{
   import flash.Boot;
   import flash.utils.describeType;
   import haxe.io.Bytes;
   
   public class Serializer
   {
      
      public static var USE_CACHE:Boolean = false;
      
      public static var USE_ENUM_INDEX:Boolean = false;
      
      public static var BASE64:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%:";
       
      
      public var useEnumIndex:Boolean;
      
      public var useCache:Boolean;
      
      public var shash:Hash;
      
      public var scount:int;
      
      public var cache:Array;
      
      public var buf:StringBuf;
      
      public function Serializer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         buf = new StringBuf();
         cache = [];
         useCache = Serializer.USE_CACHE;
         useEnumIndex = Serializer.USE_ENUM_INDEX;
         shash = new Hash();
         scount = 0;
      }
      
      public static function run(param1:*) : String
      {
         var _loc2_:Serializer = new Serializer();
         _loc2_.serialize(param1);
         return _loc2_.toString();
      }
      
      public function toString() : String
      {
         return buf.b;
      }
      
      public function serializeString(param1:String) : void
      {
         var _loc2_:* = shash.get(param1);
         if(_loc2_ != null)
         {
            buf.b = buf.b + "R";
            buf.b = buf.b + _loc2_;
            return;
         }
         var _loc3_:int = scount;
         scount = scount + 1;
         shash.set(param1,_loc3_);
         buf.b = buf.b + "y";
         param1 = StringTools.urlEncode(param1);
         buf.b = buf.b + param1.length;
         buf.b = buf.b + ":";
         buf.b = buf.b + param1;
      }
      
      public function serializeRef(param1:*) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(cache.length);
         while(_loc2_ < _loc3_)
         {
            _loc2_++;
            _loc4_ = _loc2_;
            if(cache[_loc4_] == param1)
            {
               buf.b = buf.b + "r";
               buf.b = buf.b + _loc4_;
               return true;
            }
         }
         cache.push(param1);
         return false;
      }
      
      public function serializeFields(param1:*) : void
      {
         var _loc4_:* = null as String;
         var _loc2_:int = 0;
         var _loc3_:Array = Reflect.fields(param1);
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            serializeString(_loc4_);
            serialize(Reflect.field(param1,_loc4_));
         }
         buf.b = buf.b + "g";
      }
      
      public function serializeException(param1:*) : void
      {
         var _loc2_:* = null as Error;
         var _loc3_:* = null as String;
         buf.b = buf.b + "x";
         if(param1 is Error)
         {
            _loc2_ = param1;
            _loc3_ = _loc2_.getStackTrace();
            if(_loc3_ == null)
            {
               serialize(_loc2_.message);
            }
            else
            {
               serialize(_loc3_);
            }
            return;
         }
         serialize(param1);
      }
      
      public function serializeClassFields(param1:Object, param2:Class) : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as String;
         var _loc3_:XML = describeType(param2);
         var _loc4_:XMLList = _loc3_.factory[0].child("variable");
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc4_.length());
         while(_loc5_ < _loc6_)
         {
            _loc5_++;
            _loc7_ = _loc5_;
            _loc8_ = _loc4_[_loc7_].attribute("name").toString();
            if(param1.hasOwnProperty(_loc8_))
            {
               serializeString(_loc8_);
               serialize(Reflect.field(param1,_loc8_));
            }
         }
         buf.b = buf.b + "g";
      }
      
      public function serialize(param1:*) : void
      {
         var _loc4_:* = null as Class;
         var _loc5_:* = null as Class;
         var _loc6_:int = 0;
         var _loc7_:* = null as Array;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null as List;
         var _loc13_:* = null;
         var _loc14_:* = null as Date;
         var _loc15_:* = null as Hash;
         var _loc16_:* = null as String;
         var _loc17_:* = null as IntHash;
         var _loc18_:* = null as Bytes;
         var _loc19_:* = null as String;
         var _loc20_:int = 0;
         var _loc3_:Array = Type.§typeof§(param1).params;
         switch(int(Type.§typeof§(param1).index))
         {
            case 0:
               buf.b = buf.b + "n";
               break;
            case 1:
               if(param1 == 0)
               {
                  buf.b = buf.b + "z";
                  return;
               }
               buf.b = buf.b + "i";
               buf.b = buf.b + param1;
               break;
            case 2:
               if(Math.isNaN(param1))
               {
                  buf.b = buf.b + "k";
               }
               else if(!Math.isFinite(param1))
               {
                  buf.b = buf.b + (param1 < 0?"m":"p");
               }
               else
               {
                  buf.b = buf.b + "d";
                  buf.b = buf.b + param1;
               }
               break;
            case 3:
               buf.b = buf.b + (!!param1?"t":"f");
               break;
            case 4:
               if(!!useCache && Boolean(serializeRef(param1)))
               {
                  return;
               }
               buf.b = buf.b + "o";
               serializeFields(param1);
               break;
            case 5:
               Boot.lastError = new Error();
               throw "Cannot serialize function";
            case 6:
               _loc4_ = _loc3_[0];
               if(_loc4_ == String)
               {
                  serializeString(param1);
                  return;
               }
               if(!!useCache && Boolean(serializeRef(param1)))
               {
                  return;
               }
               _loc5_ = _loc4_;
               if(_loc5_ == Array)
               {
                  _loc6_ = 0;
                  buf.b = buf.b + "a";
                  _loc7_ = param1;
                  _loc8_ = int(_loc7_.length);
                  _loc9_ = 0;
                  while(_loc9_ < _loc8_)
                  {
                     _loc9_++;
                     _loc10_ = _loc9_;
                     if(_loc7_[_loc10_] == null)
                     {
                        _loc6_++;
                     }
                     else
                     {
                        if(_loc6_ > 0)
                        {
                           if(_loc6_ == 1)
                           {
                              buf.b = buf.b + "n";
                           }
                           else
                           {
                              buf.b = buf.b + "u";
                              buf.b = buf.b + _loc6_;
                           }
                           _loc6_ = 0;
                        }
                        serialize(_loc7_[_loc10_]);
                     }
                  }
                  if(_loc6_ > 0)
                  {
                     if(_loc6_ == 1)
                     {
                        buf.b = buf.b + "n";
                     }
                     else
                     {
                        buf.b = buf.b + "u";
                        buf.b = buf.b + _loc6_;
                     }
                  }
                  buf.b = buf.b + "h";
               }
               else if(_loc5_ == List)
               {
                  buf.b = buf.b + "l";
                  _loc11_ = param1;
                  var _loc12_:* = _loc11_.iterator();
                  while(_loc12_.hasNext())
                  {
                     _loc13_ = _loc12_.next();
                     serialize(_loc13_);
                  }
                  buf.b = buf.b + "h";
               }
               else if(_loc5_ == Date)
               {
                  _loc14_ = param1;
                  buf.b = buf.b + "v";
                  buf.b = buf.b + _loc14_.toString();
               }
               else if(_loc5_ == Hash)
               {
                  buf.b = buf.b + "b";
                  _loc15_ = param1;
                  _loc12_ = _loc15_.keys();
                  while(_loc12_.hasNext())
                  {
                     _loc16_ = _loc12_.next();
                     serializeString(_loc16_);
                     serialize(_loc15_.get(_loc16_));
                  }
                  buf.b = buf.b + "h";
               }
               else if(_loc5_ == IntHash)
               {
                  buf.b = buf.b + "q";
                  _loc17_ = param1;
                  _loc12_ = _loc17_.keys();
                  while(_loc12_.hasNext())
                  {
                     _loc6_ = _loc12_.next();
                     buf.b = buf.b + ":";
                     buf.b = buf.b + _loc6_;
                     serialize(_loc17_.get(_loc6_));
                  }
                  buf.b = buf.b + "h";
               }
               else if(_loc5_ == Bytes)
               {
                  _loc18_ = param1;
                  _loc6_ = 0;
                  _loc8_ = _loc18_.length - 2;
                  _loc16_ = "";
                  _loc19_ = Serializer.BASE64;
                  while(_loc6_ < _loc8_)
                  {
                     _loc6_++;
                     _loc9_ = int(_loc18_.b[_loc6_]);
                     _loc6_++;
                     _loc10_ = int(_loc18_.b[_loc6_]);
                     _loc6_++;
                     _loc20_ = int(_loc18_.b[_loc6_]);
                     _loc16_ = _loc16_ + (_loc19_.charAt(_loc9_ >> 2) + _loc19_.charAt((_loc9_ << 4 | _loc10_ >> 4) & 63) + _loc19_.charAt((_loc10_ << 2 | _loc20_ >> 6) & 63) + _loc19_.charAt(_loc20_ & 63));
                  }
                  if(_loc6_ == _loc8_)
                  {
                     _loc6_++;
                     _loc9_ = int(_loc18_.b[_loc6_]);
                     _loc6_++;
                     _loc10_ = int(_loc18_.b[_loc6_]);
                     _loc16_ = _loc16_ + (_loc19_.charAt(_loc9_ >> 2) + _loc19_.charAt((_loc9_ << 4 | _loc10_ >> 4) & 63) + _loc19_.charAt(_loc10_ << 2 & 63));
                  }
                  else if(_loc6_ == _loc8_ + 1)
                  {
                     _loc6_++;
                     _loc9_ = int(_loc18_.b[_loc6_]);
                     _loc16_ = _loc16_ + (_loc19_.charAt(_loc9_ >> 2) + _loc19_.charAt(_loc9_ << 4 & 63));
                  }
                  buf.b = buf.b + "s";
                  buf.b = buf.b + _loc16_.length;
                  buf.b = buf.b + ":";
                  buf.b = buf.b + _loc16_;
               }
               else
               {
                  cache.pop();
                  try
                  {
                  }
                  catch(_loc12_:*)
                  {
                  }
                  if(§§pop())
                  {
                     buf.b = buf.b + "C";
                     serializeString(Type.getClassName(_loc4_));
                     cache.push(param1);
                     param1.hxSerialize(this);
                     buf.b = buf.b + "g";
                  }
                  else
                  {
                     buf.b = buf.b + "c";
                     serializeString(Type.getClassName(_loc4_));
                     cache.push(param1);
                     serializeClassFields(param1,_loc4_);
                  }
               }
               break;
            case 7:
               _loc4_ = _loc3_[0];
               if(!!useCache && Boolean(serializeRef(param1)))
               {
                  return;
               }
               cache.pop();
               buf.b = buf.b + (!!useEnumIndex?"j":"w");
               serializeString(Type.getEnumName(_loc4_));
               if(useEnumIndex)
               {
                  buf.b = buf.b + ":";
                  buf.b = buf.b + param1.index;
               }
               else
               {
                  serializeString(param1.tag);
               }
               buf.b = buf.b + ":";
               _loc7_ = param1.params;
               if(_loc7_ == null)
               {
                  buf.b = buf.b + 0;
               }
               else
               {
                  buf.b = buf.b + int(_loc7_.length);
                  _loc6_ = 0;
                  while(_loc6_ < int(_loc7_.length))
                  {
                     _loc6_++;
                     serialize(_loc12_);
                  }
               }
               cache.push(param1);
               break;
         }
      }
   }
}
