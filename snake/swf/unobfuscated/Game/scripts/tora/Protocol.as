package tora
{
   import flash.Boot;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   
   public class Protocol
   {
      
      public static var init__:Boolean;
      
      public static var CODES:Array;
       
      
      public var uri:String;
      
      public var sock:Socket;
      
      public var §I\n_M\x01§:int;
      
      public var §N\nM\x03§:Array;
      
      public var onError:Function;
      
      public var onDisconnect:Function;
      
      public var onData:Function;
      
      public var lastMessage:Code;
      
      public var host:String;
      
      public var headers:Array;
      
      public var §)\x04\n)\x03§:int;
      
      public function Protocol(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(!onData)
         {
            onData = function(param1:String):void
            {
            };
         }
         if(!onDisconnect)
         {
            onDisconnect = function():void
            {
            };
         }
         if(!onError)
         {
            onError = function(param1:String):void
            {
               Boot.lastError = new Error();
               throw param1;
            };
         }
         headers = [];
         §N\nM\x03§ = [];
         var _loc2_:EReg = new EReg("^http://([^/:]+)(:[0-9]+)?(.*)$","");
         if(!_loc2_.match(param1))
         {
            Boot.lastError = new Error();
            throw "Invalid url " + param1;
         }
         host = _loc2_.matched(1);
         var _loc3_:String = _loc2_.matched(2);
         uri = _loc2_.matched(3);
         if(uri == "")
         {
            uri = "/";
         }
         §I\n_M\x01§ = _loc3_ == null?6667:Std.parseInt(_loc3_.substr(1));
      }
      
      public function wait() : void
      {
      }
      
      public function send(param1:Code, param2:String) : void
      {
         sock.writeByte(param1.index + 1);
         var _loc3_:int = param2.length;
         sock.writeByte(_loc3_ & 255);
         sock.writeByte(_loc3_ >> 8 & 255);
         sock.writeByte(_loc3_ >> 16);
         sock.writeUTFBytes(param2);
      }
      
      public function §\nc\x15^\x02§() : void
      {
         headers = [];
         §N\nM\x03§ = [];
      }
      
      public function onSocketData(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:* = null as ByteArray;
         var _loc7_:* = null as Code;
         if(sock == null)
         {
            return;
         }
         loop0:
         while(true)
         {
            if(false)
            {
               return;
            }
            if(lastMessage == null)
            {
               if(sock.bytesAvailable < 4)
               {
                  return;
               }
               _loc2_ = uint(sock.readUnsignedByte()) - 1;
               lastMessage = Protocol.CODES[_loc2_];
               if(lastMessage == null)
               {
                  error("Unknown Code #" + _loc2_);
                  return;
               }
               _loc3_ = uint(sock.readUnsignedByte());
               _loc4_ = uint(sock.readUnsignedByte());
               _loc5_ = uint(sock.readUnsignedByte());
               §)\x04\n)\x03§ = _loc3_ | _loc4_ << 8 | _loc5_ << 16;
            }
            _loc2_ = sock.bytesAvailable;
            if(_loc2_ < §)\x04\n)\x03§)
            {
               return;
            }
            _loc6_ = new ByteArray();
            if(§)\x04\n)\x03§ > 0)
            {
               sock.readBytes(_loc6_,0,§)\x04\n)\x03§);
            }
            _loc7_ = lastMessage;
            lastMessage = null;
            switch(int(_loc7_.index))
            {
               default:
               default:
               default:
               default:
               default:
                  break loop0;
               case 5:
               case 6:
               case 7:
               default:
               default:
               default:
               default:
                  continue;
               case 12:
                  continue;
               case 13:
                  error(_loc6_.toString());
                  return;
               case 14:
               case 15:
               default:
               default:
               default:
               default:
               default:
               default:
               default:
               default:
               default:
               case 25:
                  onData(_loc6_.toString());
                  continue;
            }
         }
         error("Can\'t handle " + _loc7_);
      }
      
      public function onConnect(param1:*) : void
      {
         var _loc4_:* = null;
         if(sock == null)
         {
            return;
         }
         send(Code.CHostResolve,host);
         send(Code.CUri,uri);
         var _loc2_:int = 0;
         var _loc3_:Array = headers;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            send(Code.§2$`\x01§,_loc4_.key);
            send(Code.§e,q\x03§,_loc4_.value);
         }
         var _loc5_:String = "";
         _loc2_ = 0;
         _loc3_ = §N\nM\x03§;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc5_ != "")
            {
               _loc5_ = _loc5_ + ";";
            }
            _loc5_ = _loc5_ + (StringTools.urlEncode(_loc4_.key) + "=" + StringTools.urlEncode(_loc4_.value));
            send(Code.CParamKey,_loc4_.key);
            send(Code.CParamValue,_loc4_.value);
         }
         send(Code.CGetParams,_loc5_);
         send(Code.CExecute,"");
         sock.flush();
      }
      
      public function onClose(param1:Event) : void
      {
         try
         {
            sock.close();
         }
         catch(_loc3_:*)
         {
         }
         sock = null;
         onDisconnect();
      }
      
      public function error(param1:String) : void
      {
         try
         {
            sock.close();
         }
         catch(_loc3_:*)
         {
         }
         sock = null;
         onError(param1);
      }
      
      public function connect() : void
      {
         sock = new Socket();
         sock.addEventListener(Event.CONNECT,onConnect);
         sock.addEventListener(Event.CLOSE,onClose);
         sock.addEventListener(IOErrorEvent.IO_ERROR,onClose);
         sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onClose);
         sock.addEventListener(ProgressEvent.SOCKET_DATA,onSocketData);
         sock.connect(host,§I\n_M\x01§);
      }
      
      public function close() : void
      {
         sock.removeEventListener(Event.CLOSE,onClose);
         try
         {
            sock.close();
         }
         catch(_loc2_:*)
         {
         }
         sock = null;
      }
      
      public function call(param1:String) : void
      {
         if(sock == null)
         {
            error("Not connected");
            return;
         }
         var _loc2_:EReg = new EReg("^http://([^/:]+)(:[0-9]+)?(.*)$","");
         if(!_loc2_.match(param1))
         {
            Boot.lastError = new Error();
            throw "Invalid url " + param1;
         }
         uri = _loc2_.matched(3);
         if(uri == "")
         {
            uri = "/";
         }
         onConnect(null);
      }
      
      public function addParameter(param1:String, param2:String) : void
      {
         §N\nM\x03§.push({
            "key":param1,
            "value":param2
         });
      }
      
      public function addHeader(param1:String, param2:String) : void
      {
         headers.push({
            "key":param1,
            "value":param2
         });
      }
   }
}
