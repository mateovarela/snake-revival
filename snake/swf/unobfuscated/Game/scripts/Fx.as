package
{
   import flash.Boot;
   
   public class Fx
   {
       
      
      public var stg:Stage;
      
      public var sn:Snake;
      
      public var onFinish:Function;
      
      public function Fx()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sn = Game.me.snake;
         stg = Stage.me;
         Game.me.effects.push(this);
      }
      
      public function update() : void
      {
      }
      
      public function kill() : void
      {
         Game.me.effects.remove(this);
         if(onFinish != null)
         {
            onFinish();
         }
      }
   }
}
