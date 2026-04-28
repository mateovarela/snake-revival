package fx
{
   import flash.Boot;
   import pix.§Mdc\n\x02§;
   import pix.Text;
   
   public class Score extends Text
   {
       
      
      public var timer:int;
      
      public function Score(param1:Number = 0.0, param2:Number = 0.0, param3:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc4_:String = Std.string(param3);
         var _loc5_:§Mdc\n\x02§ = Gfx.§sO?5\x01§;
         if(param3 < 0)
         {
            _loc5_ = Gfx.§8Caq\x03§;
         }
         super(_loc5_);
         x = param1;
         y = param2;
         pxx();
         align = 0.5;
         ec = ec - 2;
         setText(_loc4_);
         Stage.me.dm.add(this,Stage.DP_FX);
         §[o\x02\r§(6,0,60,80,0.9);
         timer = 40;
      }
      
      override public function update() : void
      {
         var _loc1_:int = timer - 1;
         timer = _loc1_;
         if(_loc1_ == 0)
         {
            squeeze(-0.15);
         }
         if(timer < 0 && coef == 0)
         {
            kill();
         }
         super.update();
      }
   }
}
