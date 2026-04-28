package mt.fx
{
   import flash.Boot;
   import flash.display.DisplayObject;
   
   public class Blink extends Fx
   {
       
      
      public var timer:int;
      
      public var on:int;
      
      public var off:int;
      
      public var mc:DisplayObject;
      
      public function Blink(param1:DisplayObject = undefined, param2:int = 10, param3:int = 2, param4:int = 2)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         mc = param1;
         timer = param2;
         on = param3;
         off = param4;
      }
      
      override public function update() : void
      {
         mc.visible = Number(Math.abs(timer)) % (on + off) < on;
         var _loc1_:int = timer;
         timer = timer - 1;
         if(_loc1_ == 0)
         {
            kill();
         }
      }
   }
}
