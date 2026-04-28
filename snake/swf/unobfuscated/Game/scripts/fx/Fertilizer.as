package fx
{
   import flash.Boot;
   
   public class Fertilizer extends §\x12\bHb\x03§
   {
       
      
      public var timer:int;
      
      public function Fertilizer(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         timer = 20;
      }
      
      override public function update() : void
      {
         var _loc1_:int = 3;
         var _loc2_:int = timer;
         timer = timer - 1;
         if(_loc2_ < 0 && int(Game.me.getTime()) >= _loc1_ * 60 * 1000)
         {
            Game.me.§iD\b\x10§(_CardType.FERTILIZER).§\x1b\x03\x11K\x02§();
            Game.me._x_augmenteFruitibar(25);
            kill();
         }
         super.update();
      }
   }
}
