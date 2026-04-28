package fx
{
   import flash.Boot;
   
   public class Chrono extends §\x12\bHb\x03§
   {
       
      
      public var time:int;
      
      public var action:Function;
      
      public function Chrono(param1:Card = undefined, param2:int = 0, param3:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         time = param2 * 1000;
         action = param3;
      }
      
      override public function update() : void
      {
         super.update();
         if(int(Game.me.getTime()) > time)
         {
            card.flip();
            kill();
            action();
         }
      }
   }
}
