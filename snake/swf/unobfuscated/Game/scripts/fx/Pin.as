package fx
{
   import flash.Boot;
   import mt.Rand;
   import pix.Element;
   import pix.Frame;
   
   public class Pin extends §\x12\bHb\x03§
   {
       
      
      public var timer:int;
      
      public var pins:Array;
      
      public function Pin(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         pins = [];
         timer = 0;
      }
      
      override public function update() : void
      {
         var _loc5_:* = null as Element;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         timer = timer + 1;
         var _loc1_:Rand = new Rand(Game.me.§S-x;\x03§);
         var _loc2_:int = 30;
         var _loc3_:Snake = Game.me.snake;
         var _loc4_:int = 0;
         while(_loc2_ < _loc3_.length[0])
         {
            if(_loc4_ == int(pins.length))
            {
               _loc5_ = new Element();
               _loc5_.drawFrame(Gfx.fx.get(int(Std.random(2)),"pin"));
               Stage.me.dm.add(_loc5_,Stage.§|r;h§);
               pins.push(_loc5_);
            }
            _loc5_ = pins[_loc4_];
            _loc6_ = _loc3_.§S=6 §(_loc2_);
            _loc5_.x = int(Number(_loc6_.§#\x16\x16\x01§.x));
            _loc5_.y = int(_loc6_.§#\x16\x16\x01§.y - _loc6_.§#\x16\x16\x01§.size * 3);
            _loc5_.visible = Boolean(_loc3_.§Di&b\x03§(_loc6_.§#\x16\x16\x01§));
            _loc4_++;
            _loc7_ = _loc1_.seed * 16807 % 2147483647;
            _loc1_.seed = _loc7_;
            _loc2_ = _loc2_ + (10 + int((int(_loc7_) & 1073741823) % 50));
         }
         while(int(pins.length) > _loc4_)
         {
            pins.pop().kill();
         }
         if(int(timer % 10) == 0)
         {
            Game.me._x_augmenteFruitibar(-0.05);
         }
         super.update();
      }
      
      override public function kill() : void
      {
         while(int(pins.length) > 0)
         {
            pins.pop().kill();
         }
         super.kill();
      }
   }
}
