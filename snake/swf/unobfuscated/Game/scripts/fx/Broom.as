package fx
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   
   public class Broom extends §\x12\bHb\x03§
   {
       
      
      public var timer:int;
      
      public function Broom(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         timer = 0;
      }
      
      override public function update() : void
      {
         var _loc2_:* = null as BitmapData;
         var _loc3_:* = null as ColorTransform;
         super.update();
         var _loc1_:int = timer;
         timer = timer + 1;
         if(int(_loc1_ % 5) == 0)
         {
            _loc2_ = Stage.me.gore.bitmapData;
            _loc3_ = new ColorTransform(1,1,1,1,0,0,0,-10);
            _loc2_.colorTransform(_loc2_.rect,_loc3_);
            Stage.me.§~i\x18[\x02§(_loc2_.rect);
         }
      }
   }
}
