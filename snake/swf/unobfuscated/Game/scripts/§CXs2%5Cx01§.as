package
{
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import mt.DepthManager;
   import mt.bumdum9.Col;
   import pix.Frame;
   
   public class §CXs2\x01§ extends flash.display.Sprite
   {
       
      
      public var ww:int;
      
      public var stop:int;
      
      public var menu:Array;
      
      public var hh:int;
      
      public var fruits:Array;
      
      public var fl:GlowFilter;
      
      public var dm:DepthManager;
      
      public var board:Bitmap;
      
      public function §CXs2\x01§(param1:int = 0, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ww = param1;
         hh = param2;
         super();
         stop = -10;
         dm = new DepthManager(this);
         board = new Bitmap();
         board.bitmapData = new BitmapData(ww,hh,true,0);
         dm.add(board,1);
         fruits = [];
         fl = null;
         if(Game.me.have(_CardType.POTION_PINK) && Boolean(Game.me.have(_CardType.REGLISSE)))
         {
            fl = new GlowFilter(0,0.02,2,2,4);
         }
         if(fl != null)
         {
            board.filters = [fl];
         }
      }
      
      public function update() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null as BitmapData;
         var _loc5_:* = null as Matrix;
         if(stop > 40)
         {
            return;
         }
         if(int(Game.me.§^\x02JU\x03§[0] % 6) == 0)
         {
            §S\x04d\f\x02§();
         }
         stop = stop + 2;
         var _loc1_:Array = fruits.copy();
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            _loc3_.y = Number(Number(_loc3_.y) + Number(_loc3_.speed));
            _loc3_.sp.y = Number(_loc3_.y);
            _loc3_.life = int(_loc3_.life) + 1;
            if(int(_loc3_.life) > 5)
            {
               stop = stop - 1;
            }
            if(_loc3_.sp.y > hh || Boolean(hit(_loc3_.sp.x,_loc3_.sp.y)))
            {
               _loc4_ = board.bitmapData.clone();
               _loc5_ = new Matrix();
               _loc5_.translate(_loc3_.sp.x,_loc3_.sp.y);
               board.bitmapData.draw(_loc3_.sp,_loc5_);
               board.bitmapData.draw(_loc4_);
               _loc4_.dispose();
               fruits.remove(_loc3_);
               removeChild(_loc3_.sp);
            }
         }
         if(stop < 0)
         {
            stop = 0;
         }
      }
      
      public function §S\x04d\f\x02§() : void
      {
         var _loc1_:pix.Sprite = new pix.Sprite();
         var _loc2_:int = int(Std.random(__fruitList.MAX));
         if(menu != null)
         {
            _loc2_ = int(menu[int(Std.random(int(menu.length)))]);
         }
         _loc1_.drawFrame(Gfx.fruits.get(_loc2_));
         _loc1_.x = int(Std.random(Cs.mcw));
         _loc1_.y = -32;
         dm.add(_loc1_,0);
         fruits.push({
            "sp":_loc1_,
            "speed":Number(0.5 + Number(Math.random())),
            "y":-16,
            "life":0
         });
         if(fl != null)
         {
            _loc1_.filters = [fl];
         }
      }
      
      public function hit(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:int = int(param1);
         var _loc4_:int = int(param2);
         var _loc5_:uint = uint(board.bitmapData.getPixel32(_loc3_,_loc4_));
         var _loc6_:* = Col._x_setRVBAValues(_loc5_);
         return int(_loc6_.a) > 0;
      }
   }
}
