package
{
   import flash.Boot;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class Avatar extends Sprite
   {
       
      
      public var size:int;
      
      public var loaded:int;
      
      public var fdl:Loader;
      
      public function Avatar(param1:int = 0, param2:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         size = param1;
         loaded = 0;
         load(param2);
      }
      
      public function §_I\x17Y§(param1:*) : void
      {
         loaded = loaded + 1;
         if(loaded == 2)
         {
            addChild(fdl);
            fdl.width = size;
            fdl.height = size;
         }
      }
      
      public function load(param1:String) : void
      {
         var _loc2_:LoaderContext = new LoaderContext();
         _loc2_.checkPolicyFile = true;
         loaded = 0;
         fdl = new Loader();
         fdl.contentLoaderInfo.addEventListener(Event.COMPLETE,§_I\x17Y§);
         fdl.contentLoaderInfo.addEventListener(Event.INIT,§_I\x17Y§);
         fdl.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,error);
         fdl.load(new URLRequest(param1),_loc2_);
      }
      
      public function error(param1:*) : void
      {
      }
   }
}
