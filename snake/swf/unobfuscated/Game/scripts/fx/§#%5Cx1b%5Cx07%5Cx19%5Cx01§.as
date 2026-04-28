package fx
{
   import flash.Boot;
   import mt.bumdum9.Col;
   
   public class §#\x1b\x07\x19\x01§ extends Fx
   {
       
      
      public var timer:int;
      
      public var step:int;
      
      public function §#\x1b\x07\x19\x01§()
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
         var _loc1_:int = 0;
         super.update();
         Game.me.timer = [0];
         switch(step)
         {
            case 0:
               _loc1_ = int(Number(Math.max(255 - int(sn.queue.length) * 20,0)));
               Col.setColor(Game.me.screen,0,_loc1_);
               if(int(sn.queue.length) == 0 && Boolean(Game.me.have(_CardType.ANKH)))
               {
                  step = step + 1;
               }
               break;
            case 1:
               if(Game.me.have(_CardType.ANKH) && _loc1_ == 6)
               {
                  §}\x0ejG§();
                  break;
               }
         }
      }
      
      public function §}\x0ejG§() : void
      {
         Game.me.§iD\b\x10§(_CardType.ANKH).§\x1b\x03\x11K\x02§();
         Col.setColor(Game.me.screen,0,0);
         sn.init();
         Game.me.initPlay();
         kill();
         var _loc1_:Array = [0,1,1,0,0,1,0,1,0,0,1,1,0,0,0,0,0,0,1,0];
         new §\x01mH4§(0.1,_loc1_);
      }
   }
}
