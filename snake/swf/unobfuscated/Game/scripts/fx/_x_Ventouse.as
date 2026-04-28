package fx
{
   import flash.Boot;
   import flash.geom.Point;
   
   public class _x_Ventouse extends §\x12\bHb\x03§
   {
      
      public static var LIST:Array = [];
       
      
      public function _x_Ventouse(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _x_Ventouse.LIST.push(this);
         super(param1);
      }
      
      override public function update() : void
      {
         var _loc5_:* = null as Point;
         var _loc6_:* = null as Part;
         super.update();
         if(_x_Ventouse.LIST[0] != this)
         {
            return;
         }
         if(int(Game.me.§\x0e\b$\r§[0] % 12) != 0)
         {
            return;
         }
         var _loc1_:Number = 1;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = Game.me.§\x17\x06h'\x03§;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = Stage.me.§X\x0f;z\x03§("onde_slow",Stage.DP_BG);
            _loc6_.x = _loc5_.x;
            _loc6_.y = _loc5_.y;
            _loc6_.sprite.alpha = 1 / (_loc2_ + 1);
            _loc6_.updatePos();
            _loc2_++;
            if(_loc2_ == int(_x_Ventouse.LIST.length))
            {
               break;
            }
         }
      }
      
      override public function kill() : void
      {
         _x_Ventouse.LIST.remove(this);
         super.kill();
      }
   }
}
