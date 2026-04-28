package fx
{
   import flash.Boot;
   
   public class Matches extends Fx
   {
       
      
      public var timer:int;
      
      public function Matches()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         timer = 90;
         if(Game.me.have(_CardType.ZIPPO))
         {
            timer = timer * 2;
         }
      }
      
      override public function update() : void
      {
         var _loc1_:* = null as §z\x1f)\x11\x01§;
         if(sn.dead)
         {
            kill();
            return;
         }
         if(int(Game.me.§\x0e\b$\r§[0] % 10) == 0)
         {
            _loc1_ = sn.cut(8);
            _loc1_.§/\x0b&T§();
         }
         var _loc2_:* = sn.§S=6 §(sn.length[0]).§#\x16\x16\x01§;
         var _loc3_:int = 8;
         var _loc4_:Part = Stage.me.§X\x0f;z\x03§("miniflame");
         _loc4_.x = Number(Number(_loc2_.x) + (Math.random() - 0.5) * _loc3_);
         _loc4_.y = Number(Number(_loc2_.y) + (Math.random() - 0.5) * _loc3_);
         _loc4_.weight = -0.1;
         var _loc5_:int = timer;
         timer = timer - 1;
         if(_loc5_ == 0)
         {
            kill();
         }
      }
   }
}
