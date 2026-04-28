package fx
{
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Sprite;
   import flash.filters.BlurFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import mt.fx.Vanish;
   
   public class Fog extends §\x12\bHb\x03§
   {
       
      
      public var ray:int;
      
      public var light:Sprite;
      
      public var display:BitmapData;
      
      public var board:Sprite;
      
      public var bmp:BitmapData;
      
      public function Fog(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         board = new Sprite();
         Stage.me.dm.add(board,Stage.DP_FX);
         display = new BitmapData(Stage.me.width,Stage.me.height,true,-1);
         bmp = new BitmapData(Stage.me.width,Stage.me.height,true,16777215);
         board.addChild(new Bitmap(display));
         ray = 32;
         ray = ray + int(Game.me.§2~\f#\x03§(_CardType.vdgc)) * 20;
         light = new Sprite();
         light.graphics.beginFill(16711680);
         light.graphics.drawCircle(0,0,ray);
      }
      
      override public function update() : void
      {
         var _loc2_:* = null as Array;
         var _loc3_:* = null as ColorMatrixFilter;
         super.update();
         var _loc1_:Matrix = new Matrix();
         _loc1_.translate(sn.x,sn.y);
         bmp.draw(light,_loc1_,null,BlendMode.ERASE);
         display.draw(light,_loc1_,null,BlendMode.ERASE);
         if(int(Game.me.§\x0e\b$\r§[0] % 2) == 0)
         {
            _loc2_ = [0,0,0,0,255,0,0,0,0,255,0,0,0,0,255,0,0,0,1,2];
            _loc3_ = new ColorMatrixFilter(_loc2_);
            bmp.applyFilter(bmp,bmp.rect,new Point(0,0),_loc3_);
            §)\frV\x01§();
         }
      }
      
      public function pw(param1:int, param2:int) : int
      {
         return int(param1 % 4) + int(param2 % 4);
      }
      
      public function §)\frV\x01§() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc1_:BitmapData = bmp.clone();
         var _loc2_:BlurFilter = new BlurFilter(16,16);
         _loc1_.applyFilter(_loc1_,_loc1_.rect,new Point(),_loc2_);
         var _loc3_:int = 0;
         var _loc4_:int = bmp.width;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            _loc6_ = 0;
            _loc7_ = bmp.height;
            while(_loc6_ < _loc7_)
            {
               _loc6_++;
               _loc8_ = _loc6_;
               _loc9_ = uint(_loc1_.getPixel32(_loc5_,_loc8_)) >>> 24;
               _loc10_ = (int(_loc5_ % 4) + int(_loc8_ % 4)) * 32 > _loc9_ - 10;
               display.setPixel32(_loc5_,_loc8_,!!_loc10_?0:-1);
            }
         }
         _loc1_.dispose();
      }
      
      override public function kill() : void
      {
         super.kill();
         new Vanish(board,5,5);
      }
   }
}
