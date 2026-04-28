package part
{
   import flash.Boot;
   
   public class §zG\t9\x03§ extends Part
   {
      
      public static var POOL:Array = [];
       
      
      public var speed:Number;
      
      public var sn:Snake;
      
      public var qdy:Number;
      
      public var qdx:Number;
      
      public var pos:Number;
      
      public var cr:Number;
      
      public function §zG\t9\x03§()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         §GT\x0b\x01\x03§ = §zG\t9\x03§.POOL;
         init();
      }
      
      public static function get() : §zG\t9\x03§
      {
         if(int(§zG\t9\x03§.POOL.length) == 0)
         {
            return new §zG\t9\x03§();
         }
         var _loc1_:§zG\t9\x03§ = §zG\t9\x03§.POOL.pop();
         _loc1_.init();
         return _loc1_;
      }
      
      override public function updatePos() : void
      {
         var _loc1_:* = sn.§S=6 §(pos);
         x = Number(Number(_loc1_.§#\x16\x16\x01§.x) + qdx * _loc1_.§#\x16\x16\x01§.size * Snake.§tbQ\x02§ * cr);
         y = Number(Number(_loc1_.§#\x16\x16\x01§.y) + qdy * _loc1_.§#\x16\x16\x01§.size * Snake.§tbQ\x02§ * cr);
         super.updatePos();
      }
      
      override public function update() : void
      {
         pos = Number(pos + speed);
         if(pos < 0 || pos > sn.length[0])
         {
            kill();
            return;
         }
         super.update();
      }
      
      override public function init() : void
      {
         super.init();
         sn = Game.me.snake;
         pos = Math.random() * sn.length[0];
         speed = Number(0.5 + Math.random() * 4);
         timer = 30;
         cr = 3;
         var _loc1_:Number = Math.random() * 6.28;
         var _loc2_:Number = Number(Math.random());
         qdx = §\x19\n\t\x01§.cos(_loc1_) * _loc2_;
         qdy = §\x19\n\t\x01§.sin(_loc1_) * _loc2_;
         updatePos();
      }
   }
}
