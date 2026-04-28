package fx
{
   import flash.Boot;
   import flash.geom.Rectangle;
   import pix.Element;
   import pix.Frame;
   
   public class _x_Ruban extends §\x12\bHb\x03§
   {
       
      
      public var §\x10\x05\x1e\x02§:Element;
      
      public function _x_Ruban(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         §\x10\x05\x1e\x02§ = new Element();
         §\x10\x05\x1e\x02§.drawFrame(Gfx.fx.get(null,"pink_ribbon"));
         Stage.me.dm.add(§\x10\x05\x1e\x02§,Stage.§|r;h§);
      }
      
      override public function update() : void
      {
         super.update();
         var _loc1_:Number = sn.length[0] - 10;
         var _loc2_:* = sn.§S=6 §(_loc1_);
         §\x10\x05\x1e\x02§.visible = Boolean(sn.§Di&b\x03§(_loc2_.§#\x16\x16\x01§));
         §\x10\x05\x1e\x02§.x = Number(_loc2_.§#\x16\x16\x01§.x);
         §\x10\x05\x1e\x02§.y = Number(_loc2_.§#\x16\x16\x01§.y);
         §\x10\x05\x1e\x02§.rotation = Number(_loc2_.a / 0.0174 + 90);
         var _loc3_:Number = 0.75 * _loc2_.§#\x16\x16\x01§.size;
         §\x10\x05\x1e\x02§.scaleY = _loc3_;
         §\x10\x05\x1e\x02§.scaleX = _loc3_;
         §#\tO\x01\x01§();
      }
      
      override public function kill() : void
      {
         §\x10\x05\x1e\x02§.kill();
         super.kill();
      }
      
      public function §#\tO\x01\x01§() : void
      {
         var _loc5_:* = null as Fruit;
         var _loc7_:* = null as Bonus;
         var _loc1_:Number = 10 * §\x10\x05\x1e\x02§.scaleX;
         var _loc2_:Rectangle = new Rectangle(§\x10\x05\x1e\x02§.x - _loc1_,§\x10\x05\x1e\x02§.y - _loc1_,_loc1_ * 2,_loc1_ * 2);
         var _loc3_:Array = Game.me.fruits.copy();
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc3_.length))
         {
            _loc5_ = _loc3_[_loc4_];
            _loc4_++;
            if(_loc5_.§oO~Y\x02§(_loc2_) && !_loc5_.dummy)
            {
               Game.me.have(_CardType._x_RUBAN,true);
               new §P\x1f%\x1d\x02§(_loc5_,10,sn);
            }
         }
         var _loc6_:Array = Game.me.bonus.copy();
         _loc4_ = 0;
         while(_loc4_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc4_];
            _loc4_++;
            if(_loc7_.§oO~Y\x02§(_loc2_))
            {
               _loc7_.trig();
            }
         }
      }
   }
}
