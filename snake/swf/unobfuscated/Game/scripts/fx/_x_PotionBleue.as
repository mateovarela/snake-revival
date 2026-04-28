package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   import mt.bumdum9.Col;
   import mt.bumdum9.Filt;
   import part.§zG\t9\x03§;
   import pix.Anim;
   import pix.Sprite;
   
   public class _x_PotionBleue extends Fx
   {
       
      
      public var timer:int;
      
      public function _x_PotionBleue()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         sn.§Pr;i\x02§ = [true];
         timer = 400;
         sn.§\x0171\t\x01§(1);
         var _loc1_:int = 32;
         var _loc2_:int = 4;
         Game.me.shake(0,8);
         var _loc3_:Array = [1,1,0,0,0,0,1,1,0,0,1,0,1,0,400,0,0,0,1,0];
         new §\x01mH4§(0.1,_loc3_);
      }
      
      override public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null as §zG\t9\x03§;
         super.update();
         if(Game.me.snake == null || Game.me.snake.length[0] == 0)
         {
            return;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            _loc1_++;
            _loc2_ = _loc1_;
            _loc3_ = §zG\t9\x03§.get();
            §R\x19q{§(_loc3_.sprite);
         }
         if(timer < 60)
         {
            _loc1_ = 3;
            sn.§\x0171\t\x01§(int(timer % (_loc1_ * 2)) < _loc1_?0:1);
         }
         _loc1_ = timer;
         timer = timer - 1;
         if(_loc1_ == 0)
         {
            kill();
         }
      }
      
      override public function kill() : void
      {
         sn.§Pr;i\x02§ = [false];
         sn.§\x0171\t\x01§(0);
         super.kill();
      }
      
      public function §R\x19q{§(param1:Sprite) : void
      {
         param1.setAnim(Gfx.fx.getAnim("spark_dust_pulse"),true);
         Stage.me.dm.add(param1,Stage.DP_FX);
         var _loc2_:int = int(Col.§73du\x02§({
            "r":0,
            "g":int(Std.random(100)),
            "b":int(Std.random(255))
         }));
         Filt.glow(param1,8,8,_loc2_);
         param1.blendMode = BlendMode.ADD;
         param1.alpha = 0.75;
      }
   }
}
