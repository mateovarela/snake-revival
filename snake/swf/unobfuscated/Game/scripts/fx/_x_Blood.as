package fx
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import pix.Anim;
   import pix.Sprite;
   
   public class _x_Blood extends Fx
   {
       
      
      public var brush:Sprite;
      
      public function _x_Blood(param1:Number = 0.2)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         brush = new Sprite();
         brush.setAnim(Gfx.fx.getAnim("blood_trace"),false);
         brush.anim.onFinish = kill;
         brush.anim.play(param1);
      }
      
      override public function update() : void
      {
         var _loc1_:BitmapData = Stage.me.gore.bitmapData;
         var _loc2_:Matrix = new Matrix();
         var _loc3_:Array = Game.me.snake.queue;
         if(int(_loc3_.length) < 2)
         {
            return;
         }
         var _loc4_:* = _loc3_[int(_loc3_.length) - 1];
         var _loc5_:* = _loc3_[int(_loc3_.length) - 2];
         var _loc6_:Number = _loc5_.x - _loc4_.x;
         var _loc7_:Number = _loc5_.y - _loc4_.y;
         var _loc8_:Number = Number(Math.atan2(_loc7_,_loc6_));
         _loc2_.rotate(_loc8_);
         _loc2_.translate(Number(_loc4_.x),Number(_loc4_.y));
         _loc1_.draw(brush,_loc2_);
         var _loc9_:int = 8;
         Stage.me.§~i\x18[\x02§(new Rectangle(_loc4_.x - _loc9_,_loc4_.y - _loc9_,_loc9_ * 2,_loc9_ * 2));
      }
      
      override public function kill() : void
      {
         super.kill();
         brush.kill();
      }
   }
}
