package fx
{
   import flash.Boot;
   
   public class Exit extends Fx
   {
       
      
      public var timer:int;
      
      public var step:int;
      
      public var multi:Object;
      
      public function Exit(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         multi = param1;
         Game.me.stopPlay();
         timer = 0;
         step = 0;
      }
      
      override public function update() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         timer = timer + 1;
         switch(step)
         {
            case 0:
               _loc1_ = timer / 20;
               sn.§7\x04V,\x03§(_loc1_);
               if(timer == 20)
               {
                  if(multi != null)
                  {
                     _loc2_ = int(Game.me.score[0] * multi);
                     Game.me._x_addPoints(_loc2_,sn.x,sn.y);
                  }
                  sn.§U{\x04\\§();
                  sn.kill();
                  step = step + 1;
               }
               break;
            case 1:
               if(timer > 20)
               {
                  Game.me.endGame();
                  break;
               }
         }
      }
   }
}
