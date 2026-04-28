package part
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import mt.bumdum9.Col;
   import pix.Element;
   import pix.Frame;
   
   public class §Y9u~\x03§ extends Part
   {
      
      public static var POOL:Array = [];
       
      
      public var prev:Object;
      
      public function §Y9u~\x03§()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         §GT\x0b\x01\x03§ = §Y9u~\x03§.POOL;
      }
      
      public static function get() : §Y9u~\x03§
      {
         if(int(§Y9u~\x03§.POOL.length) == 0)
         {
            return new §Y9u~\x03§();
         }
         var _loc1_:§Y9u~\x03§ = §Y9u~\x03§.POOL.pop();
         _loc1_.init();
         return _loc1_;
      }
      
      override public function update() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         super.update();
         if(prev != null)
         {
            _loc1_ = prev.x - x;
            _loc2_ = prev.y - y;
            sprite.graphics.clear();
            sprite.graphics.lineStyle(1,Game.me.§\x02,Rg\x01§);
            sprite.graphics.moveTo(0,0);
            sprite.graphics.lineTo(_loc1_,_loc2_);
         }
         prev = {
            "x":x,
            "y":y
         };
      }
      
      public function setColor(param1:int) : void
      {
         Col.setPercentColor(sprite,1,param1);
      }
      
      override public function init() : void
      {
         super.init();
         sprite.drawFrame(Gfx.fx.get(null,"blood_drop"));
         weight = 0.25;
         ray = 0;
         FFfR(true);
         prev = null;
         Stage.me.dm.add(sprite,Stage.DP_FX);
      }
      
      override public function §o\x1d\x16d\x01§() : void
      {
         var _loc1_:Element = new Element();
         _loc1_.drawFrame(Gfx.fx.get(1 + int(Std.random(4)),"blood_mini_spot"));
         var _loc2_:BitmapData = Stage.me.gore.bitmapData;
         var _loc3_:Matrix = new Matrix();
         _loc3_.translate(int(x),int(y));
         _loc2_.draw(_loc1_,_loc3_,sprite.transform.colorTransform);
         var _loc4_:int = 4;
         Stage.me.§~i\x18[\x02§(new Rectangle(x - _loc4_,y - _loc4_,_loc4_ * 2,_loc4_ * 2));
         kill();
      }
   }
}
