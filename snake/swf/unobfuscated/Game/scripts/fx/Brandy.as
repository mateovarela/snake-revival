package fx
{
   import flash.Boot;
   import mt.Rand;
   
   public class Brandy extends Fx
   {
      
      public static var DECAL:Object = {
         "x":0,
         "y":0
      };
      
      public static var TIME:int = 80;
       
      
      public var turn:Number;
      
      public var timer:int;
      
      public function Brandy()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         timer = Brandy.TIME;
         turn = 0;
         new Reduce(50,5);
      }
      
      override public function update() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc6_:* = null as Part;
         super.update();
         if(!int(Game.me.controlType.index))
         {
            _loc2_ = 1 - timer / Brandy.TIME;
            _loc3_ = Math.sin(_loc2_ * 3.14) * 60;
            _loc4_ = int(timer * 20 % 628);
            Brandy.DECAL.x = Math.cos(_loc4_ * 0.01) * _loc3_;
            Brandy.DECAL.y = Math.sin(_loc4_ * 0.01) * _loc3_;
         }
         var _loc5_:Rand = Game.me.seed;
         _loc2_ = _loc5_.seed * 16807 % 2147483647;
         _loc5_.seed = _loc2_;
         turn = Number(turn + (int((int(_loc2_) & 1073741823) % 10007) / 10007 * 2 - 1) * 0.02);
         turn = turn * 0.95;
         sn.angle = Number(sn.angle + turn);
         if(int(Game.me.§\x0e\b$\r§[0] % 4) == 0)
         {
            _loc6_ = Stage.me.§X\x0f;z\x03§("bubble");
            _loc6_.x = sn.x + int(Std.random(11)) - 5;
            _loc6_.y = sn.y + int(Std.random(11)) - 8;
            _loc6_.weight = -0.2;
            _loc6_.vy = -1;
            _loc6_.frict = 0.92;
         }
         _loc4_ = timer;
         timer = timer - 1;
         if(_loc4_ < 0)
         {
            kill();
         }
      }
      
      override public function kill() : void
      {
         super.kill();
         Brandy.DECAL.x = 0;
         Brandy.DECAL.y = 0;
      }
   }
}
