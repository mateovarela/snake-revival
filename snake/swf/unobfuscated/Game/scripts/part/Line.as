package part
{
   import flash.Boot;
   import mt.bumdum9.Filt;
   
   public class Line extends Part
   {
      
      public static var POOL:Array = [];
       
      
      public var prev:Object;
      
      public var multi:Number;
      
      public var §1hjf\x02§:Object;
      
      public var color:int;
      
      public function Line()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         §GT\x0b\x01\x03§ = Line.POOL;
      }
      
      public static function get() : Line
      {
         if(int(Line.POOL.length) == 0)
         {
            return new Line();
         }
         var _loc1_:Line = Line.POOL.pop();
         _loc1_.init();
         return _loc1_;
      }
      
      override public function update() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:* = null;
         super.update();
         if(prev != null)
         {
            _loc1_ = prev.x - x;
            _loc2_ = prev.y - y;
            _loc1_ = _loc1_ * multi;
            _loc2_ = _loc2_ * multi;
            sprite.graphics.clear();
            sprite.graphics.lineStyle(0,color);
            sprite.graphics.moveTo(0,0);
            sprite.graphics.lineTo(_loc1_,_loc2_);
         }
         prev = {
            "x":x,
            "y":y
         };
         if(§1hjf\x02§ != null)
         {
            §1hjf\x02§ = Number(Math.max(§1hjf\x02§ - 0.05,0));
            _loc3_ = §1hjf\x02§;
            sprite.filters = [];
            Filt.glow(sprite,_loc3_ * 24,_loc3_ * 3,color);
            if(§1hjf\x02§ <= 0)
            {
               §1hjf\x02§ = null;
            }
         }
      }
      
      override public function init() : void
      {
         super.init();
         weight = 0.25;
         ray = 0;
         color = 16777215;
         multi = 1;
         prev = null;
         §1hjf\x02§ = null;
         Stage.me.dm.add(sprite,Stage.DP_FX);
      }
   }
}
