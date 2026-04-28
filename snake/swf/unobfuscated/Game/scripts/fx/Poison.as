package fx
{
   import flash.Boot;
   
   public class Poison extends Fx
   {
      
      public static var §4\x10H]\x02§:int = 20;
       
      
      public var timer:Array;
      
      public var cycle:int;
      
      public function Poison()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         timer = [0];
         cycle = 18 * Poison.§4\x10H]\x02§;
      }
      
      override public function update() : void
      {
         if(sn.dead)
         {
            kill();
            return;
         }
         var _loc1_:int = timer[0];
         timer = [timer[0] + 1];
         if(_loc1_ == int(cycle / Poison.§4\x10H]\x02§))
         {
            cycle = cycle - 1;
            sn.explode(10);
            new _x_Blood(1);
            timer = [0];
         }
         if(sn.length[0] <= 0)
         {
            kill();
            Game.me.§\x07~\x016\x01§();
         }
      }
   }
}
