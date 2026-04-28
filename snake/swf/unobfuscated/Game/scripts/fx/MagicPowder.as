package fx
{
   import flash.Boot;
   import mt.Rand;
   import pix.Anim;
   
   public class MagicPowder extends Fx
   {
      
      public static var MAX:Array = [0];
      
      public static var LIST:Array = [];
       
      
      public function MagicPowder(param1:int = 0)
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as Part;
         var _loc6_:* = null as Rand;
         var _loc7_:Number = NaN;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         var _loc2_:int = param1 * 3;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc3_++;
            _loc4_ = _loc3_;
            _loc5_ = Part.get();
            _loc5_.sprite.setAnim(Gfx.fx.getAnim("spark_dust_pulse"));
            Stage.me.dm.add(_loc5_.sprite,Stage.DP_BG);
            _loc5_.§\nMo7§(Math.random() * 6.28,Number(0.5 + Math.random() * 5),-(2 + Math.random() * 3));
            _loc5_.x = sn.x;
            _loc5_.y = sn.y;
            _loc5_.weight = Number(0.1 + Math.random() * 0.3);
            _loc5_.ray = 5;
            _loc5_.frict = 0.96;
            _loc6_ = Game.me.seed;
            _loc7_ = _loc6_.seed * 16807 % 2147483647;
            _loc6_.seed = _loc7_;
            _loc5_.timer = 900 + int((int(_loc7_) & 1073741823) % 900);
            _loc5_.sprite.anim.gotoRandom();
            MagicPowder.LIST.push(_loc5_);
            MagicPowder.MAX = [MagicPowder.MAX[0] + 1];
         }
      }
      
      override public function update() : void
      {
         var _loc3_:* = null as Part;
         var _loc1_:Array = MagicPowder.LIST.copy();
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            if(_loc3_.timer < 2)
            {
               MagicPowder.LIST.remove(_loc3_);
               MagicPowder.MAX = [MagicPowder.MAX[0] - 1];
            }
         }
         if(int(MagicPowder.LIST.length) == 0)
         {
            kill();
         }
      }
   }
}
