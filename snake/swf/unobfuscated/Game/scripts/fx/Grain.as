package fx
{
   import flash.Boot;
   import mt.Rand;
   import pix.Frame;
   
   public class Grain extends Fx
   {
       
      
      public var list:Array;
      
      public function Grain(param1:Number = 0.0, param2:Number = 0.0, param3:int = 16)
      {
         var _loc5_:int = 0;
         var _loc6_:* = null as Part;
         var _loc7_:* = null as Rand;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         list = [];
         var _loc4_:int = 0;
         while(_loc4_ < param3)
         {
            _loc4_++;
            _loc5_ = _loc4_;
            _loc6_ = Part.get();
            _loc6_.sprite.drawFrame(Gfx.fx.get(0,"grain"));
            Stage.me.dm.add(_loc6_.sprite,Stage.§p\x1fLp\x03§);
            _loc6_.x = param1;
            _loc6_.y = param2;
            _loc7_ = Game.me.seed;
            _loc8_ = _loc7_.seed * 16807 % 2147483647;
            _loc7_.seed = _loc8_;
            _loc7_ = Game.me.seed;
            _loc8_ = _loc7_.seed * 16807 % 2147483647;
            _loc7_.seed = _loc8_;
            _loc6_.§\nMo7§(_loc5_ / param3 * 6.28,int((int(_loc8_) & 1073741823) % 10007) / 10007 * 5,-(2 + int((int(_loc8_) & 1073741823) % 10007) / 10007 * 3));
            _loc6_.weight = 0.2;
            _loc6_.FFfR();
            _loc6_.frict = 0.96;
            _loc7_ = Game.me.seed;
            _loc8_ = _loc7_.seed * 16807 % 2147483647;
            _loc7_.seed = _loc8_;
            _loc9_ = {
               "part":_loc6_,
               "timer":0,
               "max":40 + int((int(_loc8_) & 1073741823) % 600)
            };
            list.push(_loc9_);
            if(Game.me.have(_CardType.BUCKET))
            {
               _loc7_ = Game.me.seed;
               _loc8_ = _loc7_.seed * 16807 % 2147483647;
               _loc7_.seed = _loc8_;
               _loc9_.max = 20 + int((int(_loc8_) & 1073741823) % 40);
            }
         }
      }
      
      override public function update() : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc1_:Array = list.copy();
         var _loc2_:int = 1 + int(Game.me.§2~\f#\x03§(_CardType.FERTILIZER)) * 3;
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc1_.length))
         {
            _loc4_ = _loc1_[_loc3_];
            _loc3_++;
            if(_loc4_.part.z >= -1)
            {
               _loc4_.timer = int(_loc4_.timer) + _loc2_;
               _loc5_ = Number(Math.min(int(_loc4_.timer) / int(_loc4_.max),1));
               if(_loc5_ == 1)
               {
                  §S\x04d\f\x02§(_loc4_);
               }
               else
               {
                  _loc6_ = int(_loc5_ * 5);
                  _loc4_.part.sprite.drawFrame(Gfx.fx.get(_loc6_,"grain"));
               }
            }
         }
      }
      
      public function §S\x04d\f\x02§(param1:Object) : void
      {
         list.remove(param1);
         param1.part.kill();
         var _loc2_:int = int(Game.me._x_genererIdFruit());
         var _loc3_:Fruit = Fruit.get(_loc2_);
         _loc3_.x = param1.part.x;
         _loc3_.y = param1.part.y;
         _loc3_.updatePos();
         _loc3_._x_creerFruitType();
      }
   }
}
