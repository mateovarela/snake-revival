package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Sprite;
   
   public class Battery extends §\x12\bHb\x03§
   {
      
      public static var LIMIT:int = 30;
      
      public static var ACTIVE:Boolean = false;
      
      public static var coef:Number;
       
      
      public var layer:Sprite;
      
      public function Battery(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(Battery.ACTIVE)
         {
            return;
         }
         super(param1);
         Battery.ACTIVE = true;
         Battery.coef = 1;
         layer = new Sprite();
         layer.blendMode = BlendMode.ADD;
         Stage.me.dm.add(layer,Stage.DP_BG);
      }
      
      override public function update() : void
      {
         super.update();
         var _loc1_:Number = Number(§nG4_\x02§(sn.x,sn.y));
         Battery.coef = Number(0.1 + Math.min(1,_loc1_ / Battery.LIMIT) * 0.9);
         §\fBQw\x03§();
      }
      
      public function §1gDh\x03§(param1:Object, param2:Object) : int
      {
         if(Number(param1.dist) < Number(param2.dist))
         {
            return -1;
         }
         return 1;
      }
      
      override public function kill() : void
      {
         layer.parent.removeChild(layer);
         Battery.ACTIVE = false;
         super.kill();
      }
      
      public function §nG4_\x02§(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Number(Math.min(param1,Number(Math.abs(Stage.me.width - param1))));
         var _loc4_:Number = Number(Math.min(param2,Number(Math.abs(Stage.me.height - param2))));
         return Number(Math.min(_loc3_,_loc4_));
      }
      
      public function §\fBQw\x03§() : void
      {
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         if(sn.queue == null)
         {
            return;
         }
         var _loc1_:Graphics = layer.graphics;
         _loc1_.clear();
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = sn.queue;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = Number(§nG4_\x02§(Number(_loc5_.x),Number(_loc5_.y)));
            if(_loc6_ < Battery.LIMIT)
            {
               _loc2_.push({
                  "dist":_loc6_,
                  "#\x16\x16\x01":_loc5_
               });
            }
         }
         _loc2_.sort(§1gDh\x03§);
         if(int(_loc2_.length) == 0)
         {
            return;
         }
         if(int(Game.me.§\x0e\b$\r§[0] % 1) == 0)
         {
            _loc6_ = Number(Math.pow(Number(Math.random()),2));
            _loc5_ = _loc2_[int(_loc6_ * int(_loc2_.length))].§#\x16\x16\x01§;
            new Arc(Number(_loc5_.pos),layer.graphics);
         }
      }
   }
}
