package haxe
{
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.§f$\n8\x01§;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLVariables;
   
   public class Http
   {
       
      
      public var url:String;
      
      public var §N\nM\x03§:§_g\nX\x01§;
      
      public var onStatus:Function;
      
      public var onError:Function;
      
      public var onData:Function;
      
      public var headers:§_g\nX\x01§;
      
      public function Http(param1:String = undefined)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         if(!onData)
         {
            onData = function(param1:String):void
            {
            };
         }
         if(!onError)
         {
            onError = function(param1:String):void
            {
            };
         }
         if(!onStatus)
         {
            onStatus = function(param1:int):void
            {
            };
         }
         url = param1;
         headers = new §_g\nX\x01§();
         §N\nM\x03§ = new §_g\nX\x01§();
      }
      
      public function setParameter(param1:String, param2:String) : void
      {
         §N\nM\x03§.set(param1,param2);
      }
      
      public function §jG\x12\x1f§(param1:String, param2:String) : void
      {
         headers.set(param1,param2);
      }
      
      public function request(param1:Boolean) : void
      {
         var _loc6_:* = null as String;
         var _loc7_:* = null as Array;
         var _loc9_:* = null as String;
         var §{\x01§:Http = this;
         var loader:URLLoader = new URLLoader();
         loader.addEventListener("complete",function(param1:*):void
         {
            §{\x01§.onData(loader.data);
         });
         loader.addEventListener("httpStatus",function(param1:HTTPStatusEvent):void
         {
            if(param1.status != 0)
            {
               §{\x01§.onStatus(param1.status);
            }
         });
         loader.addEventListener("ioError",function(param1:IOErrorEvent):void
         {
            §{\x01§.onError(param1.text);
         });
         loader.addEventListener("securityError",function(param1:SecurityErrorEvent):void
         {
            §{\x01§.onError(param1.text);
         });
         var _loc3_:Boolean = false;
         var _loc4_:URLVariables = new URLVariables();
         while(_loc5_.hasNext())
         {
            _loc6_ = _loc5_.next();
            _loc3_ = true;
            _loc4_[_loc6_] = §N\nM\x03§.get(_loc6_);
         }
         _loc6_ = url;
         if(!!_loc3_ && !param1)
         {
            _loc7_ = url.split("?");
            if(int(_loc7_.length) > 1)
            {
               _loc6_ = _loc7_.shift();
               _loc4_.decode(_loc7_.join("?"));
            }
         }
         _loc7_ = _loc6_.split("xxx");
         var _loc8_:URLRequest = new URLRequest(_loc6_);
         while(_loc5_.hasNext())
         {
            _loc9_ = _loc5_.next();
            _loc8_.requestHeaders.push(new URLRequestHeader(_loc9_,headers.get(_loc9_)));
         }
         _loc8_.data = _loc4_;
         _loc8_.method = !!param1?"POST":"GET";
         try
         {
            loader.load(_loc8_);
            return;
         }
         catch(_loc5_:*)
         {
            if(_loc5_ as Error)
            {
               §f$\n8\x01§.lastError = _loc5_;
            }
            onError("Exception: " + Std.string(_loc5_));
            return;
         }
      }
   }
}
