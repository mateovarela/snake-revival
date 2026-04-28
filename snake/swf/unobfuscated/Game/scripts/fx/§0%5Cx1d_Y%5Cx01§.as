package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.filters.GlowFilter;
   import gfx.Light;
   
   public class §0\x1d_Y\x01§ extends Fx
   {
       
      
      public var light:Light;
      
      public var coef:Number;
      
      public function §0\x1d_Y\x01§()
      {
         var _loc3_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         sn.angle = Number(Math.atan2(Stage.me.height * 0.5 - sn.y,Stage.me.width * 0.5 - sn.x));
         sn.trq = [];
         coef = 0;
         var _loc1_:int = 200;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc2_++;
            _loc3_ = _loc2_;
            pop(_loc3_ * 6.28 / _loc1_,Math.random() * 6);
         }
         light = new Light();
         Stage.me.dm.add(light,Stage.DP_FX);
         light.x = sn.x;
         light.y = sn.y;
         light.blendMode = BlendMode.ADD;
      }
      
      override public function update() : void
      {
         var _loc2_:int = 0;
         super.update();
         coef = Number(Math.min(Number(coef + 0.01),1));
         var _loc1_:int = 0;
         while(_loc1_ < 2)
         {
            _loc1_++;
            _loc2_ = _loc1_;
            if(Number(Math.random()) > coef)
            {
               pop(Math.random() * 6.28,Math.random() * 2);
            }
         }
         var _loc3_:Number = Math.pow(1 - coef,4) * 2;
         light.scaleY = _loc3_;
         light.scaleX = _loc3_;
         light.alpha = 1 - coef;
         if(coef == 1)
         {
            kill();
         }
      }
      
      public function pop(param1:Number, param2:Number) : void
      {
         var _loc3_:Part = Stage.me.§X\x0f;z\x03§("spark_dust");
         _loc3_.sprite.anim.loop = true;
         _loc3_.sprite.anim.gotoRandom();
         _loc3_.x = sn.x + int(Std.random(7)) - 3;
         _loc3_.y = sn.y + int(Std.random(7)) - 3;
         _loc3_.vx = §\x19\n\t\x01§.cos(param1) * param2;
         _loc3_.vy = §\x19\n\t\x01§.sin(param1) * param2;
         _loc3_.timer = 10 + int(Std.random(80));
         _loc3_.frict = 0.95;
         _loc3_.sprite.filters = [new GlowFilter(16776960,0.5,4,4,2)];
         _loc3_.sprite.blendMode = BlendMode.ADD;
      }
   }
}
