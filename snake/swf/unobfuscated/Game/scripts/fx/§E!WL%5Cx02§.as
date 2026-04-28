package fx
{
   import flash.Boot;
   import §q'2§.Control;
   
   public class §E!WL\x02§ extends Fx
   {
       
      
      public var timer:int;
      
      public var step:int;
      
      public var prec:Function;
      
      public function §E!WL\x02§()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         step = 0;
         timer = 0;
      }
      
      override public function update() : void
      {
         super.update();
         Game.me.timer = [0];
         switch(step)
         {
            case 0:
               if(int(sn.queue.length) == 0)
               {
                  prec = Game.me.action;
                  new Control(reborn);
                  step = step + 1;
               }
               break;
            case 1:
               break;
            case 2:
               timer = timer + 1;
               if(timer == 20)
               {
                  sn.init();
                  Game.me.initPlay();
                  sn.speed = Cs.§0'`;\x01§;
                  kill();
                  Game.me.§dA;e\x02§();
                  break;
               }
         }
      }
      
      public function reborn() : void
      {
         Game.me.action = prec;
         step = step + 1;
         timer = 0;
      }
   }
}
