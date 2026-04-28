package fx
{
   import flash.Boot;
   import mt.Rand;
   import pix.Anim;
   
   public class _x_Collier extends Fx
   {
       
      
      public var type:_x_TYPE;
      
      public function _x_Collier(param1:Number = 0.0, param2:Number = 0.0, param3:_x_TYPE = undefined, param4:int = 0)
      {
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:* = null as Rand;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(Boot.skip_constructor)
         {
            return;
         }
         type = param3;
         super();
         var _loc5_:int = 3;
         var _loc6_:int = 0;
         while(_loc6_ < param4)
         {
            _loc6_++;
            _loc7_ = _loc6_;
            _loc9_ = Game.me.seed;
            _loc10_ = _loc9_.seed * 16807 % 2147483647;
            _loc9_.seed = _loc10_;
            _loc8_ = (_loc7_ + int((int(_loc10_) & 1073741823) % 10007) / 10007) / param4 * 6.28;
            _loc9_ = Game.me.seed;
            _loc11_ = _loc9_.seed * 16807 % 2147483647;
            _loc9_.seed = _loc11_;
            _loc10_ = Number(3 + int((int(_loc11_) & 1073741823) % 10007) / 10007 * 2);
            var p:Array = [Part.get()];
            p[0].sprite.setAnim(Gfx.fx.getAnim("spark_dust_pulse"));
            Stage.me.dm.add(p[0].sprite,Stage.DP_FX);
            _loc9_ = Game.me.seed;
            _loc11_ = _loc9_.seed * 16807 % 2147483647;
            _loc9_.seed = _loc11_;
            p[0].§\nMo7§(_loc8_,_loc10_,-(4 + int((int(_loc11_) & 1073741823) % 10007) / 10007 * 2));
            p[0].x = param1;
            p[0].y = param2;
            p[0].FFfR();
            p[0].weight = 0.2;
            p[0].frict = 0.95;
            var me:Array = [this];
            p[0].§\x183h)\x03§ = function(param1:Array, param2:Array):Function
            {
               var me:Array = param1;
               var p:Array = param2;
               return function():void
               {
                  me[0].bounce(p[0]);
               };
            }(me,p);
         }
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      public function bounce(param1:Part) : void
      {
         var _loc2_:int = int(Game.me._x_genererIdFruit());
         _loc2_ = int(Fruit.getNearest(_loc2_,type));
         var _loc3_:Fruit = Fruit.get(_loc2_);
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.updatePos();
         _loc3_._x_creerFruitType();
         param1.kill();
      }
   }
}
