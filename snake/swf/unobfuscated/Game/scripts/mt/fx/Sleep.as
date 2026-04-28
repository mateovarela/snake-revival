package mt.fx
{
   import flash.Boot;
   import flash.display.MovieClip;
   
   public class Sleep extends Fx
   {
       
      
      public var onWakeUp:Function;
      
      public var f:Fx;
      
      public var count:int;
      
      public function Sleep(param1:Fx = undefined, param2:Object = undefined, param3:int = 10)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         f = param1;
         onWakeUp = param2;
         count = param3;
         Fx.DEFAULT_MANAGER.remove(param1);
         super();
      }
      
      override public function update() : void
      {
         super.update();
         var _loc1_:int = count;
         count = count - 1;
         if(_loc1_ <= 0)
         {
            if(f != null)
            {
               Fx.DEFAULT_MANAGER.add(f);
               f.update();
            }
            if(onWakeUp != null)
            {
               onWakeUp();
            }
            kill();
         }
      }
      
      public function hide(param1:MovieClip, param2:Boolean = false) : void
      {
         var mc:MovieClip = param1;
         var play:Boolean = param2;
         mc.visible = false;
         if(play)
         {
            mc.stop();
         }
         onWakeUp = function():void
         {
            mc.visible = true;
            if(play)
            {
               mc.play();
            }
         };
      }
   }
}
