package fx
{
   import flash.Boot;
   import flash.display.Sprite;
   
   public class Volt extends Fx
   {
       
      
      public var sprite:Sprite;
      
      public var spc:Number;
      
      public var ry:Number;
      
      public var rx:Number;
      
      public var coef:Number;
      
      public function Volt(param1:Sprite = undefined, param2:Number = 10.0, param3:Number = 10.0, param4:Number = 0.1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         spc = param4;
         rx = param2;
         ry = param3;
         sprite = param1;
         coef = 0;
      }
      
      override public function update() : void
      {
         var _loc1_:* = null as Part;
         super.update();
         coef = Number(Math.min(Number(coef + spc),1));
         if(Number(Math.random()) > coef)
         {
            _loc1_ = Stage.me.§X\x0f;z\x03§("volt");
            _loc1_.x = sprite.x + Math.random() * 2 * rx - rx;
            _loc1_.y = sprite.y + Math.random() * 2 * ry - ry;
            _loc1_.§I\\\x1a=\x03§();
         }
         if(coef == 1)
         {
            kill();
         }
      }
   }
}
