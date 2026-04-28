package
{
   import flash.Boot;
   import flash.Lib;
   import flash.text.TextField;
   import haxe.Http;
   import haxe.Serializer;
   import haxe.Unserializer;
   import haxe.io.Bytes;
   import tora.Protocol;
   
   public class Codec
   {
      
      public static var init__:Boolean;
      
      public static var FAKE:Boolean = false;
      
      public static var ENCODE:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_";
      
      public static var VERSION:String = null;
      
      public static var types:Hash;
      
      public static var tf:TextField;
      
      public static function displayError(param1:*):void
      {
         var _loc2_:* = null as Shape;
         if(Codec.tf == null)
         {
            _loc2_ = new Shape();
            _loc2_.graphics.beginFill(16777215);
            _loc2_.graphics.drawRect(0,0,1000,1000);
            Lib.current.addChild(_loc2_);
            Codec.tf = new TextField();
            Codec.tf.width = 500;
            Codec.tf.height = 1000;
            Lib.current.addChild(Codec.tf);
            Codec.tf.selectable = true;
            Codec.tf.multiline = true;
            Codec.tf.wordWrap = true;
            Codec.tf.textColor = 16711680;
         }
         Codec.tf.text = Codec.tf.text + (Std.string(param1) + "\n");
      }
      public static var protocols:Array;
      
      public static var last:Http = null;
       
      
      public var §\n\x01§:Bytes;
      
      public var key:String;
      
      public function Codec()
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         if(Codec.VERSION == null)
         {
            Codec.VERSION = "";
         }
         key = Codec.getParam("k");
         if(key == null)
         {
            Boot.lastError = new Error();
            throw "Missing key";
         }
         var _loc1_:String = Codec.VERSION + key;
         var _loc2_:Bytes = Bytes.alloc(256);
         var _loc3_:int = 0;
         while(_loc3_ < 256)
         {
            _loc3_++;
            _loc4_ = _loc3_;
            _loc2_.b[_loc4_] = _loc4_ & 127;
         }
         _loc3_ = 0;
         _loc4_ = _loc1_.length;
         var _loc5_:int = 0;
         while(_loc5_ < 256)
         {
            _loc5_++;
            _loc6_ = _loc5_;
            _loc3_ = int(_loc3_ + int(_loc2_.b[_loc6_]) + _loc1_.charCodeAt(int(_loc6_ % _loc4_))) & 127;
            _loc7_ = int(_loc2_.b[_loc6_]);
            _loc2_.b[_loc6_] = int(_loc2_.b[_loc3_]);
            _loc2_.b[_loc3_] = _loc7_;
         }
         §\n\x01§ = _loc2_;
      }
      
      public static function §Ym\x0eU\x02§(param1:String, param2:*) : void
      {
         Codec.types.set(param1,param2);
      }
      
      public static function getParam(param1:String) : String
      {
         return Reflect.field(Lib.current.stage.loaderInfo.parameters,param1);
      }
      
      public static function connect(param1:String, param2:*, param3:Function) : Protocol
      {
         var onData:Function = param3;
         var _loc4_:String = Codec.getParam("sid");
         if(_loc4_ == null)
         {
            Boot.lastError = new Error();
            throw "Missing sid";
         }
         var p:Protocol = new Protocol(param1);
         var c:Codec = new Codec();
         p.addHeader("Cookie",(!!Codec.FAKE?"local_sid":"sid") + "=" + StringTools.urlEncode(_loc4_));
         p.addParameter("__d",c.serialize(param2));
         p.onDisconnect = function():void
         {
            Codec.protocols.remove(p);
            Codec.displayError("Disconnected");
         };
         p.onError = function(param1:String):void
         {
            Codec.protocols.remove(p);
            Codec.displayError(param1);
         };
         p.onData = function(param1:String):void
         {
            var _loc3_:* = null;
            try
            {
               _loc3_ = c.unserialize(param1);
            }
            catch(_loc4_:*)
            {
               if(_loc4_ as Error)
               {
                  Boot.lastError = _loc4_;
               }
               Codec.displayError(_loc4_);
               return;
            }
            onData(_loc3_);
         };
         Codec.protocols.push(p);
         p.connect();
         return p;
      }
      
      public static function send(param1:Protocol, param2:String, param3:*) : void
      {
         var _loc4_:String = Codec.getParam("sid");
         var _loc5_:Codec = new Codec();
         param1.§\nc\x15^\x02§();
         param1.addHeader("Cookie",(!!Codec.FAKE?"local_sid":"sid") + "=" + StringTools.urlEncode(_loc4_));
         param1.addParameter("__d",_loc5_.serialize(param3));
         param1.call(param2);
      }
      
      public static function call(param1:String, param2:*, param3:Function, param4:Object = undefined) : Protocol
      {
         var onData:Function = param3;
         var onError:Object = param4;
         var _loc5_:String = Codec.getParam("sid");
         if(_loc5_ == null)
         {
            Boot.lastError = new Error();
            throw "Missing sid";
         }
         if(onError == null)
         {
            onError = Codec.displayError;
         }
         var §G;fJ\x02§:Boolean = false;
         var p:Protocol = new Protocol(param1);
         var c:Codec = new Codec();
         p.addHeader("Cookie",(!!Codec.FAKE?"local_sid":"sid") + "=" + StringTools.urlEncode(_loc5_));
         p.addParameter("__d",c.serialize(param2));
         p.onDisconnect = function():void
         {
            Codec.protocols.remove(p);
            if(!§G;fJ\x02§)
            {
               onError("Disconnected");
            }
         };
         p.onError = function(param1:String):void
         {
            Codec.protocols.remove(p);
            Codec.displayError(param1);
         };
         p.onData = function(param1:String):void
         {
            var _loc3_:* = null;
            try
            {
               if(§G;fJ\x02§)
               {
                  Boot.lastError = new Error();
                  throw "Duplicate data";
               }
               _loc3_ = c.unserialize(param1);
            }
            catch(_loc4_:*)
            {
               if(_loc4_ as Error)
               {
                  Boot.lastError = _loc4_;
               }
               onError(_loc4_);
               return;
            }
            §G;fJ\x02§ = true;
            onData(_loc3_);
         };
         Codec.protocols.push(p);
         p.connect();
         return p;
      }
      
      public static function load(param1:String, param2:*, param3:Function, param4:Object = undefined) : void
      {
         var url:String = param1;
         var §N\nM\x03§:* = param2;
         var onData:Function = param3;
         §§push(§§newactivation());
         if(param4 == null)
         {
            param4 = 0;
         }
         var /*UnknownSlot*/:* = param4;
         var _loc5_:Http = new Http(url);
         var c:Codec = new Codec();
         _loc5_.setParameter("__d",c.serialize(§N\nM\x03§));
         _loc5_.onData = function(param1:String):void
         {
            var _loc3_:* = null;
            try
            {
               _loc3_ = c.unserialize(param1);
            }
            catch(_loc4_:*)
            {
               if(_loc4_ as Error)
               {
                  Boot.lastError = _loc4_;
               }
               Codec.displayError(_loc4_);
               return;
            }
            onData(_loc3_);
         };
         _loc5_.onError = function(param1:String):void
         {
            if(§\x12\x11p\x02§ > 0)
            {
               Codec.load(url,§N\nM\x03§,onData,§\x12\x11p\x02§ - 1);
            }
            else
            {
               Codec.displayError(param1);
            }
         };
         _loc5_.request(true);
         Codec.last = _loc5_;
      }
      
      public static function getData(param1:String) : *
      {
         var _loc2_:String = Codec.getParam(param1);
         if(_loc2_ == null)
         {
            Boot.lastError = new Error();
            throw "Missing data \'" + param1 + "\'";
         }
         return new Codec().unserialize(_loc2_);
      }
      
      public function unserialize(param1:String) : *
      {
         var _loc3_:* = null as Bytes;
         var _loc4_:* = null as StringBuf;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null as EReg;
         var _loc2_:Boolean = param1.substr(0,key.length) == key;
         if(_loc2_)
         {
            Codec.FAKE = true;
         }
         if(Codec.FAKE)
         {
            if(param1.substr(0,key.length) != key)
            {
               Boot.lastError = new Error();
               throw "Invalid key";
            }
            param1 = param1.substr(key.length);
         }
         else
         {
            _loc3_ = §\n\x01§;
            _loc4_ = new StringBuf();
            _loc5_ = param1.length - 4;
            _loc6_ = int(_loc3_.b[0]);
            _loc7_ = int(_loc3_.b[1]);
            _loc8_ = 0;
            while(_loc8_ < _loc5_)
            {
               _loc8_++;
               _loc9_ = _loc8_;
               _loc10_ = param1.charCodeAt(_loc9_);
               _loc11_ = _loc10_ ^ int(_loc3_.b[_loc9_ & 255]);
               _loc12_ = _loc11_ == 0?_loc10_:_loc11_;
               _loc4_.b = _loc4_.b + String.fromCharCode(_loc12_);
               if(_loc11_ == 0)
               {
                  _loc10_ = 0;
               }
               _loc6_ = int((int(_loc6_ + _loc10_)) % 65521);
               _loc7_ = int((_loc7_ + _loc6_) % 65521);
            }
            _loc8_ = _loc6_ ^ _loc7_ << 8;
            _loc5_++;
            if(param1.charCodeAt(_loc5_) != Codec.ENCODE.charCodeAt(_loc8_ & 63) || param1.charCodeAt(_loc5_) != Codec.ENCODE.charCodeAt(_loc8_ >> 6 & 63) || param1.charCodeAt(_loc5_) != Codec.ENCODE.charCodeAt(_loc8_ >> 12 & 63) || param1.charCodeAt(_loc5_) != Codec.ENCODE.charCodeAt(_loc8_ >> 18 & 63))
            {
               if(int(param1.indexOf("Maximum POST data")) != -1)
               {
                  Boot.lastError = new Error();
                  throw param1;
               }
               if(param1.substr(0,5) == "<!DOC")
               {
                  _loc13_ = new EReg("id=\"error_msg\">([^<]+)</","");
                  if(_loc13_.match(param1))
                  {
                     Boot.lastError = new Error();
                     throw _loc13_.matched(1);
                  }
               }
               Boot.lastError = new Error();
               throw "FCHK";
            }
            param1 = _loc4_.b;
         }
         var _loc14_:Unserializer = new Unserializer(param1);
         _loc14_.setResolver({
            "resolveEnum":function(param1:String):*
            {
               var _loc2_:* = Codec.types.get(param1);
               if(_loc2_ != null)
               {
                  return _loc2_;
               }
               return Type.resolveEnum(param1);
            },
            ")u^\x02":function(param1:String):*
            {
               var _loc2_:* = Codec.types.get(param1);
               if(_loc2_ != null)
               {
                  return _loc2_;
               }
               return Type.§)u^\x02§(param1);
            }
         });
         return _loc14_.unserialize();
      }
      
      public function serializeString(param1:String) : String
      {
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(Codec.FAKE)
         {
            return key + param1;
         }
         var _loc2_:Bytes = §\n\x01§;
         var _loc3_:StringBuf = new StringBuf();
         var _loc4_:int = int(_loc2_.b[0]);
         var _loc5_:int = int(_loc2_.b[1]);
         var _loc6_:int = 0;
         var _loc7_:int = param1.length;
         while(_loc6_ < _loc7_)
         {
            _loc6_++;
            _loc8_ = _loc6_;
            _loc9_ = param1.charCodeAt(_loc8_);
            _loc10_ = _loc9_ ^ int(_loc2_.b[_loc8_ & 255]);
            _loc11_ = _loc10_ == 0?_loc9_:_loc10_;
            _loc3_.b = _loc3_.b + String.fromCharCode(_loc11_);
            _loc4_ = int((_loc4_ + _loc10_) % 65521);
            _loc5_ = int((_loc5_ + _loc4_) % 65521);
         }
         _loc6_ = _loc4_ ^ _loc5_ << 8;
         _loc7_ = Codec.ENCODE.charCodeAt(_loc6_ & 63);
         _loc3_.b = _loc3_.b + String.fromCharCode(_loc7_);
         _loc7_ = Codec.ENCODE.charCodeAt(_loc6_ >> 6 & 63);
         _loc3_.b = _loc3_.b + String.fromCharCode(_loc7_);
         _loc7_ = Codec.ENCODE.charCodeAt(_loc6_ >> 12 & 63);
         _loc3_.b = _loc3_.b + String.fromCharCode(_loc7_);
         _loc7_ = Codec.ENCODE.charCodeAt(_loc6_ >> 18 & 63);
         _loc3_.b = _loc3_.b + String.fromCharCode(_loc7_);
         return _loc3_.b;
      }
      
      public function serialize(param1:*, param2:Object = undefined) : String
      {
         var _loc3_:Serializer = new Serializer();
         _loc3_.useEnumIndex = true;
         if(param2)
         {
            _loc3_.serializeException(param1);
         }
         else
         {
            _loc3_.serialize(param1);
         }
         return serializeString(_loc3_.toString());
      }
   }
}
