package mt.flash
{
   import flash.Lib;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.LocalConnection;
   import haxe.Timer;
   
   public class §L\n\x01§
   {
       
      
      public function §L\n\x01§()
      {
      }
      
      public static function init() : void
      {
         var _loc1_:Timer = new Timer(1000);
         _loc1_.run = §L\n\x01§.run;
      }
      
      public static function run() : void
      {
         try
         {
            new LocalConnection().connect("foo");
            new LocalConnection().connect("foo");
            return;
         }
         catch(_loc2_:*)
         {
            return;
         }
      }
      
      public static function onError(param1:Function, param2:Boolean) : Boolean
      {
         var display:Function = param1;
         var §l\x05\x0e\x1f\x01§:Boolean = param2;
         var _loc4_:EventDispatcher = null;
         try
         {
            _loc4_ = Reflect.field(Lib.current.loaderInfo,"uncaughtErrorEvents");
         }
         catch(_loc5_:*)
         {
         }
         if(_loc4_ == null)
         {
            return false;
         }
         _loc4_.addEventListener("uncaughtError",function(param1:Event):void
         {
            if(!§l\x05\x0e\x1f\x01§)
            {
               param1.preventDefault();
            }
            display(Std.string(Reflect.field(param1,"error")));
         });
         return true;
      }
   }
}
