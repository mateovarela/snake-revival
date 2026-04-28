package pix
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Frame
   {
       
      
      public var y:int;
      
      public var x:int;
      
      public var width:int;
      
      public var texture:BitmapData;
      
      public var swapY:Boolean;
      
      public var swapX:Boolean;
      
      public var rot:Object;
      
      public var rectangle:Rectangle;
      
      public var height:int;
      
      public var ddy:int;
      
      public var ddx:int;
      
      public function Frame(param1:BitmapData = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Boolean = false, param7:Boolean = false, param8:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         texture = param1;
         x = param2;
         y = param3;
         rot = param8;
         width = param4;
         height = param5;
         rectangle = new Rectangle(param2,param3,param4,param5);
         swapX = param6;
         swapY = param7;
         ddx = 0;
         ddy = 0;
      }
      
      public function slice(param1:int, param2:int, param3:Object, param4:Object) : Frame
      {
         return new Frame(texture,x + param1,y + param2,param3,param4,swapX,swapY,rot);
      }
      
      public function drawAtWithAlpha(param1:BitmapData, param2:int, param3:int) : void
      {
         var _loc4_:Element = new Element();
         _loc4_.drawFrame(this,0,0);
         var _loc5_:Matrix = new Matrix();
         _loc5_.translate(param2,param3);
         param1.draw(_loc4_,_loc5_);
      }
      
      public function §V,o\x03§(param1:BitmapData, param2:int, param3:int) : void
      {
         var _loc4_:Point = new Point(param2,param3);
         param1.copyPixels(texture,rectangle,_loc4_);
      }
   }
}
