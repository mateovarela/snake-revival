package pix
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObjectContainer;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   
   public class Element extends flash.display.Sprite
   {
      
      public static var init__:Boolean;
      
      public static var NEUTRAL_CT:ColorTransform;
      
      public static var MAT:Matrix;
       
      
      public var store:Store;
      
      public var frameAlignY:Number;
      
      public var frameAlignX:Number;
      
      public var currentFrame:Frame;
      
      public function Element()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         frameAlignX = 0.5;
         frameAlignY = 0.5;
      }
      
      public function setAlign(param1:Number, param2:Number) : void
      {
         frameAlignX = param1;
         frameAlignY = param2;
      }
      
      public function pxx() : void
      {
         x = int(Math.round(x));
         y = int(Math.round(y));
      }
      
      public function kill() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function drawText(param1:BitmapData, param2:Number, param3:Number) : void
      {
         graphics.clear();
         graphics.lineStyle();
         graphics.beginBitmapFill(param1,new Matrix());
         graphics.moveTo(0,0);
         graphics.lineTo(param2,0);
         graphics.lineTo(param2,param3);
         graphics.lineTo(0,param3);
         graphics.lineTo(0,0);
         graphics.endFill();
      }
      
      public function drawFrame(param1:Frame, param2:Object = undefined, param3:Object = undefined) : void
      {
         if(param2 != null)
         {
            frameAlignX = param2;
         }
         if(param3 != null)
         {
            frameAlignY = param3;
         }
         var _loc4_:int = -(int(param1.width * frameAlignX));
         var _loc5_:int = -(int(param1.height * frameAlignY));
         _loc4_ = _loc4_ + param1.ddx;
         _loc5_ = _loc5_ + param1.ddy;
         var _loc6_:Matrix = Element.MAT;
         _loc6_.identity();
         var _loc7_:int = -(param1.x - _loc4_);
         var _loc8_:int = -(param1.y - _loc5_);
         _loc6_.translate(_loc7_,_loc8_);
         if(param1.swapX)
         {
            _loc6_.scale(-1,1);
         }
         if(param1.swapY)
         {
            _loc6_.scale(1,-1);
         }
         if(param1.rot != null)
         {
            _loc6_.rotate(param1.rot);
         }
         graphics.clear();
         graphics.lineStyle();
         graphics.beginBitmapFill(param1.texture,_loc6_);
         graphics.drawRect(_loc4_,_loc5_,param1.width,param1.height);
         graphics.endFill();
         currentFrame = param1;
      }
      
      public function clear() : void
      {
         frameAlignX = 0.5;
         frameAlignY = 0.5;
         graphics.clear();
         blendMode = BlendMode.NORMAL;
         transform.colorTransform = Element.NEUTRAL_CT;
         scaleX = 1;
         scaleY = 1;
         rotation = 0;
         alpha = 1;
         x = -100;
         y = -100;
         visible = true;
         filters = [];
      }
   }
}
