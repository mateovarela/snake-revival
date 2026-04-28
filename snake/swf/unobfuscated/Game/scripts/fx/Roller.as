package fx
{
   import flash.Boot;
   
   public class Roller extends §\x12\bHb\x03§
   {
       
      
      public function Roller(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function update() : void
      {
         var _loc1_:Snake = Game.me.snake;
         super.update();
      }
   }
}
