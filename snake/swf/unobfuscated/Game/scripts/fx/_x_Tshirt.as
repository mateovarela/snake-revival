package fx
{
   import flash.Boot;
   
   public class _x_Tshirt extends Fx
   {
      
      public static var INC:int = 1;
       
      
      public var type:int;
      
      public var timer:Number;
      
      public function _x_Tshirt(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         type = param1;
      }
      
      override public function update() : void
      {
         super.update();
         Game.me._x_augmenteFruitibar(-1);
         switch(type)
         {
            default:
               break;
            case 1:
               if(int(Game.me.§\x0e\b$\r§[0] % 2) == 0)
               {
                  Game.me._x_addPoints(750);
               }
               break;
            case 2:
               new Reduce(10,1);
         }
         if(Game.me.§\x01\x11l5\x02§[0] == int(Game.me.§-G\x1eA\x03§()) || sn.dead)
         {
            kill();
         }
      }
   }
}
