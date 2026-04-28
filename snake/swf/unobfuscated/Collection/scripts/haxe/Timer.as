package haxe
{
   import flash.§f$\n8\x01§;
   import flash.utils.clearInterval;
   import flash.utils.getTimer;
   import flash.utils.setInterval;
   
   public class Timer
   {
       
      
      public var run:Function;
      
      public var id:Object;
      
      public function Timer(param1:int = 0)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         if(!run)
         {
            run = function():void
            {
            };
         }
         var §{\x01§:Timer = this;
         id = setInterval(function():void
         {
            §{\x01§.run();
         },param1);
      }
      
      public static function delay(param1:Function, param2:int) : Timer
      {
         var f:Function = param1;
         var t:Timer = new Timer(param2);
         t.run = function():void
         {
            t.stop();
            f();
         };
         return t;
      }
      
      public static function §\x0fT*\n\x03§(param1:Function, param2:Object = undefined) : Object
      {
         var _loc3_:Number = Number(Timer.stamp());
         var _loc4_:Object = param1();
         Log.trace(Timer.stamp() - _loc3_ + "s",param2);
         return _loc4_;
      }
      
      public static function stamp() : Number
      {
         return getTimer() / 1000;
      }
      
      public function stop() : void
      {
         if(id == null)
         {
            return;
         }
         clearInterval(id);
         id = null;
      }
   }
}
