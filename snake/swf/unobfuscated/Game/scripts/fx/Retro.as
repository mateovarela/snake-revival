package fx
{
   import flash.Boot;
   
   public class Retro extends Fx
   {
       
      
      public function Retro()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      override public function update() : void
      {
         super.update();
         Game.me.§\x0e\b$\r§ = [Game.me.§\x0e\b$\r§[0] - 20];
         if(Game.me.§\x0e\b$\r§[0] <= 0)
         {
            Game.me.§\x0e\b$\r§ = [0];
            kill();
         }
      }
   }
}
