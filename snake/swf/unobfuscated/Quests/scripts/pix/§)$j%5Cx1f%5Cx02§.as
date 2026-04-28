package pix
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.§f$\n8\x01§;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §)$j\x1f\x02§ extends Bitmap
   {
      
      public static var §{\x01§:§)$j\x1f\x02§;
       
      
      public var trg:flash.display.Sprite;
      
      public var scale:Number;
      
      public var §3]j'\x01§:Array;
      
      public function §)$j\x1f\x02§(param1:flash.display.Sprite = undefined, param2:int = 0, param3:int = 0, param4:Number = 1.0)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         §)$j\x1f\x02§.§{\x01§ = this;
         super();
         trg = param1;
         scale = param4;
         bitmapData = new BitmapData(int(param2 / param4),int(param3 / param4),false,0);
         scaleX = param4;
         scaleY = param4;
         §3]j'\x01§ = [];
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         bitmapData.fillRect(bitmapData.rect,-65536);
         bitmapData.draw(trg,null,null,null,null,false);
         while(int(§3]j'\x01§.length) > 0)
         {
            _loc1_ = §3]j'\x01§.shift();
            bitmapData.applyFilter(bitmapData,bitmapData.rect,new Point(0,0),_loc1_);
         }
      }
      
      public function §4 A\x01§(param1:Array, param2:Number) : void
      {
         var _loc7_:int = 0;
         var _loc3_:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc3_.length);
         while(_loc5_ < _loc6_)
         {
            _loc5_++;
            _loc7_ = _loc5_;
            _loc4_.push(Number(_loc3_[_loc7_] * (1 - param2) + param1[_loc7_] * param2));
         }
         §3]j'\x01§.push(new ColorMatrixFilter(_loc4_));
      }
      
      public function kill() : void
      {
         bitmapData.dispose();
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}
