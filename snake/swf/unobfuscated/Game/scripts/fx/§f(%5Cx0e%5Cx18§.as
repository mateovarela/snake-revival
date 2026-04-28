package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   import mt.bumdum9.Filt;
   import part.Line;
   
   public class §f(\x0e\x18§ extends Fx
   {
       
      
      public var timer:int;
      
      public function §f(\x0e\x18§()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         timer = 70;
      }
      
      override public function update() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null as Line;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         Game.me.snake.boost = 3;
         var _loc1_:int = 2;
         if(sn.length[0] > 200)
         {
            _loc1_++;
         }
         if(sn.length[0] > 600)
         {
            _loc1_++;
         }
         if(sn.length[0] > 1000)
         {
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc2_++;
            _loc3_ = _loc2_;
            _loc4_ = sn.§S=6 §(int(Std.random(int(sn.length[0]))));
            if(!(_loc4_ == null || _loc4_.§#\x16\x16\x01§ == null))
            {
               _loc5_ = Line.get();
               _loc5_.x = Number(_loc4_.§#\x16\x16\x01§.x);
               _loc5_.y = Number(_loc4_.§#\x16\x16\x01§.y);
               _loc5_.timer = 10 + int(Std.random(10));
               _loc5_.x = Number(_loc5_.x + (int(Std.random(10)) - 5));
               _loc5_.y = Number(_loc5_.y + (int(Std.random(10)) - 5));
               _loc6_ = Number(Number(_loc4_.a) + 3.14);
               _loc7_ = Math.random() * 5;
               _loc5_.vx = §\x19\n\t\x01§.cos(_loc6_) * _loc7_;
               _loc5_.vy = §\x19\n\t\x01§.sin(_loc6_) * _loc7_;
               Filt.glow(_loc5_.sprite,4,1,65535);
               _loc5_.sprite.blendMode = BlendMode.ADD;
            }
         }
         _loc2_ = timer;
         timer = timer - 1;
         if(_loc2_ == 0)
         {
            kill();
         }
      }
   }
}
