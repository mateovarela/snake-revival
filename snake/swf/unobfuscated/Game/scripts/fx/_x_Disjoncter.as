package fx
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import mt.Rand;
   import mt.bumdum9.Col;
   import part.§Y9u~\x03§;
   import pix.Element;
   import pix.Frame;
   
   public class _x_Disjoncter extends Fx
   {
       
      
      public function _x_Disjoncter()
      {
         var _loc3_:* = null as Fruit;
         var _loc4_:int = 0;
         var _loc5_:* = null as Fruit;
         var _loc6_:* = null as Rand;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         var _loc1_:Array = Game.me.fruits.copy();
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            _loc4_ = int(Game.me._x_genererIdFruit());
            if(_loc3_.has(_x_TYPE.Shit))
            {
               _x_exploser(_loc3_);
            }
            else
            {
               _loc5_ = Fruit.get(_loc4_);
               _loc5_.setPos(_loc3_.x,_loc3_.y,_loc3_.z);
               _loc6_ = Game.me.seed;
               _loc7_ = _loc6_.seed * 16807 % 2147483647;
               _loc6_.seed = _loc7_;
               _loc6_ = Game.me.seed;
               _loc7_ = _loc6_.seed * 16807 % 2147483647;
               _loc6_.seed = _loc7_;
               _loc6_ = Game.me.seed;
               _loc7_ = _loc6_.seed * 16807 % 2147483647;
               _loc6_.seed = _loc7_;
               _loc5_.§\nMo7§(int((int(_loc7_) & 1073741823) % 10007) / 10007 * 6.28,int((int(_loc7_) & 1073741823) % 10007) / 10007,-(int((int(_loc7_) & 1073741823) % 10007) / 10007 + 1.5));
               _loc8_ = 16;
               new Volt(_loc5_.sprite,_loc8_,_loc8_,0.05);
               new Flash(_loc5_.sprite,0.1);
               _loc3_.kill();
            }
         }
         kill();
      }
      
      public function _x_exploser(param1:Object) : void
      {
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = null as §Y9u~\x03§;
         param1.kill();
         var _loc2_:Number = Number(1 + Math.random() * 0.5);
         _loc2_ = 1;
         var _loc3_:Element = new Element();
         _loc3_.drawFrame(Gfx.fx.get(0,"blood"));
         _loc3_.x = Number(param1.x);
         _loc3_.y = Number(param1.y);
         Stage.me.ground.addChild(_loc3_);
         var _loc4_:BitmapData = Stage.me.gore.bitmapData;
         var _loc5_:Matrix = new Matrix();
         var _loc6_:int = int(Std.random(2)) * 2 - 1;
         var _loc7_:int = int(Std.random(2)) * 2 - 1;
         _loc5_.scale(_loc2_ * _loc6_,_loc2_ * _loc7_);
         _loc5_.translate(_loc3_.x,_loc3_.y);
         _loc4_.draw(_loc3_,_loc5_,new ColorTransform(0,0,0,1,90 + int(Std.random(40)),50 + int(Std.random(30)),0));
         _loc3_.kill();
         Stage.me.§~i\x18[\x02§(_loc3_.getBounds(Stage.me.bg));
         var _loc8_:int = 8;
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc9_++;
            _loc10_ = _loc9_;
            _loc11_ = 6.28 * _loc10_ / _loc8_;
            _loc12_ = Math.random() * 2.5;
            _loc13_ = §Y9u~\x03§.get();
            _loc13_.setColor(int(Col.shuffle(8943360,30)));
            _loc13_.x = Number(param1.x);
            _loc13_.y = Number(param1.y);
            _loc13_.vx = §\x19\n\t\x01§.cos(_loc11_) * _loc12_;
            _loc13_.vy = §\x19\n\t\x01§.sin(_loc11_) * _loc12_;
            _loc13_.vz = -(1 + Math.random() * 2);
         }
      }
   }
}
