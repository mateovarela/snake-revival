package fx
{
   import flash.Boot;
   import flash.geom.Point;
   import pix.Anim;
   
   public class §'\x18H\x14\x01§ extends Fx
   {
      
      public static var GRAVEYARD:Array = [];
       
      
      public function §'\x18H\x14\x01§()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(int(§'\x18H\x14\x01§.GRAVEYARD.length) == 0)
         {
            kill();
         }
      }
      
      override public function update() : void
      {
         super.update();
         if(int(Game.me.§\x0e\b$\r§[0] % 6) > 0 || int(Game.me.fruits.length) > 100)
         {
            return;
         }
         var _loc1_:Fruit = Fruit.get(§'\x18H\x14\x01§.GRAVEYARD.pop());
         _loc1_._x_creerFruitType();
         _loc1_.light = true;
         var _loc2_:Point = Stage.me.§;*\x13(\x02§(20,40);
         _loc1_.setPos(_loc2_.x,_loc2_.y);
         if(int(§'\x18H\x14\x01§.GRAVEYARD.length) == 0)
         {
            kill();
         }
         var _loc3_:Part = Part.get();
         _loc3_.sprite.setAlign(0.5,0.8);
         _loc3_.sprite.setAnim(Gfx.fx.getAnim("wisp"));
         Stage.me.dm.add(_loc3_.sprite,Stage.DP_FX);
         _loc3_.x = _loc1_.x;
         _loc3_.y = Number(_loc1_.y + 4);
         _loc3_.timer = 40;
         _loc3_.fadeType = 2;
         _loc3_.fadeLimit = 20;
      }
   }
}
