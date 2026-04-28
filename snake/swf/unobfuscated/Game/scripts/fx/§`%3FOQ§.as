package fx
{
   import flash.Boot;
   import flash.geom.Rectangle;
   import mt.Rand;
   import pix.Anim;
   
   public class §`?OQ§ extends Fx
   {
      
      public static var SPEED:int = 6;
       
      
      public var timer:int;
      
      public var ball:Part;
      
      public function §`?OQ§(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         ball = Part.get();
         ball.sprite.setAnim(Gfx.fx.getAnim("tennis_ball"));
         Stage.me.dm.add(ball.sprite,Stage.DP_FX);
         var _loc2_:int = 2;
         ball.x = Number(sn.x + ball.vx * _loc2_);
         ball.y = Number(sn.y + ball.vy * _loc2_);
         ball.z = -(3 + param1 * 3);
         var _loc3_:Rand = Game.me.seed;
         var _loc4_:Number = _loc3_.seed * 16807 % 2147483647;
         _loc3_.seed = _loc4_;
         ball.§\nMo7§(Number(sn.angle + (int((int(_loc4_) & 1073741823) % 10007) / 10007 * 2 - 1) * (0.1 + param1 * 0.2)),§`?OQ§.SPEED,-2);
         ball.weight = 0.2;
         ball.§\x188\x1b(\x03§ = 0.82;
         ball.§u!H7\x01§ = 0.95;
         ball.FFfR();
      }
      
      override public function update() : void
      {
         var _loc3_:int = 0;
         var _loc5_:* = null as Fruit;
         var _loc6_:* = null as Smiley;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = null as Rand;
         var _loc12_:Number = NaN;
         super.update();
         var _loc1_:int = 2;
         var _loc2_:Rectangle = new Rectangle(ball.x - _loc1_,ball.y - _loc1_,_loc1_,_loc1_);
         _loc3_ = 0;
         var _loc4_:Array = Game.me.fruits;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.§oO~Y\x02§(_loc2_,ball.z))
            {
               §oadO\x01§(_loc5_);
               break;
            }
         }
         _loc3_ = 0;
         _loc4_ = Smiley.list;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc6_ = _loc4_[_loc3_];
            _loc3_++;
            _loc7_ = ball.x - _loc6_.sprite.x;
            _loc8_ = ball.y - _loc6_.sprite.y;
            _loc9_ = Smiley.RAY - Math.sqrt(Number(_loc7_ * _loc7_ + _loc8_ * _loc8_));
            if(_loc9_ > 0)
            {
               _loc10_ = Number(Math.atan2(_loc8_,_loc7_));
               _loc11_ = Game.me.seed;
               _loc12_ = _loc11_.seed * 16807 % 2147483647;
               _loc11_.seed = _loc12_;
               _loc10_ = Number(_loc10_ + (int((int(_loc12_) & 1073741823) % 10007) / 10007 * 2 - 1) * 0.1);
               ball.x = Number(ball.x + §\x19\n\t\x01§.cos(_loc10_) * _loc9_);
               ball.y = Number(ball.y + §\x19\n\t\x01§.sin(_loc10_) * _loc9_);
               ball.§\nMo7§(_loc10_,§`?OQ§.SPEED,-2);
               _loc6_.collide();
            }
         }
         _loc7_ = Number(Math.sqrt(Number(ball.vx * ball.vx + ball.vy * ball.vy)));
         if(_loc7_ < 2)
         {
            _loc3_ = timer;
            timer = timer - 1;
            if(_loc3_ == 0)
            {
               kill();
            }
            ball.sprite.visible = int(timer % 8) < 4;
         }
         else
         {
            timer = 30;
            ball.sprite.visible = true;
         }
         ball.§T\n8\x02§.visible = ball.sprite.visible;
      }
      
      override public function kill() : void
      {
         super.kill();
         ball.kill();
      }
      
      public function §oadO\x01§(param1:Fruit) : void
      {
         var _loc2_:Number = Number(Math.atan2(ball.x - param1.x,ball.y - param1.y));
         ball.§\nMo7§(_loc2_,§`?OQ§.SPEED,-2);
         if(ball.vz < -2)
         {
            ball.vz = -2;
         }
         var _loc3_:Part = Stage.me.§X\x0f;z\x03§("onde");
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         param1.light = true;
         new §P\x1f%\x1d\x02§(param1,10,sn);
      }
   }
}
