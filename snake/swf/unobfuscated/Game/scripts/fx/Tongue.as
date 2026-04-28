package fx
{
   import flash.Boot;
   
   public class Tongue extends Fx
   {
      
      public static var §7\x1c/d\x03§:int = 80;
       
      
      public var y:Number;
      
      public var x:Number;
      
      public var fruits:Array;
      
      public var coef:Number;
      
      public function Tongue()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(Game.me.snake.tongue != null)
         {
            return;
         }
         super();
         coef = 0;
         Game.me.snake.tongue = this;
         fruits = [];
         update();
      }
      
      override public function update() : void
      {
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:* = null as Array;
         var _loc11_:* = null as Fruit;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc1_:Snake = Game.me.snake;
         if(_loc1_ == null)
         {
            kill();
            return;
         }
         coef = Number(Math.min(Number(coef + 0.05),1));
         var _loc2_:Number = §\x19\n\t\x01§.sin(coef * 3.14) * Tongue.§7\x1c/d\x03§;
         var _loc3_:Number = §\x19\n\t\x01§.cos(_loc1_.angle) * _loc2_;
         var _loc4_:Number = §\x19\n\t\x01§.sin(_loc1_.angle) * _loc2_;
         x = Number(_loc1_.x + _loc3_);
         y = Number(_loc1_.y + _loc4_);
         var _loc5_:int = 4;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc6_++;
            _loc7_ = _loc6_;
            _loc8_ = 1 - _loc7_ / _loc5_;
            _loc9_ = 0;
            _loc10_ = Game.me.fruits;
            while(_loc9_ < int(_loc10_.length))
            {
               _loc11_ = _loc10_[_loc9_];
               _loc9_++;
               _loc12_ = Number(_loc1_.x + _loc3_ * _loc8_);
               _loc13_ = Number(_loc1_.y + _loc4_ * _loc8_);
               _loc14_ = _loc12_ - _loc11_.x;
               _loc15_ = _loc13_ - _loc11_.y;
               _loc16_ = 14;
               if(Number(Math.sqrt(Number(_loc14_ * _loc14_ + _loc15_ * _loc15_))) < _loc16_ && _loc11_.z > -1)
               {
                  _loc11_._x_coeffPoint = _loc11_._x_coeffPoint * 2;
                  _loc11_.unregister();
                  fruits.push({
                     "fr":_loc11_,
                     "fid":_loc11_.§8\x15J{\x02§,
                     "tc":_loc8_
                  });
               }
            }
         }
         _loc10_ = fruits.copy();
         _loc6_ = 0;
         while(_loc6_ < int(_loc10_.length))
         {
            _loc17_ = _loc10_[_loc6_];
            _loc6_++;
            if(_loc17_.fr.§8\x15J{\x02§ != int(_loc17_.fid) || _loc17_.fr.death)
            {
               fruits.remove(_loc17_);
            }
            else
            {
               _loc17_.fr.x = Number(_loc1_.x + _loc3_ * _loc17_.tc);
               _loc17_.fr.y = Number(_loc1_.y + _loc4_ * _loc17_.tc);
               _loc17_.fr.updatePos();
            }
         }
         if(coef > 0.9)
         {
            while(int(fruits.length) > 0)
            {
               Game.me.snake.eat(fruits.pop().fr);
            }
         }
         if(coef == 1)
         {
            kill();
         }
      }
      
      override public function kill() : void
      {
         Game.me.snake.tongue = null;
         super.kill();
      }
   }
}
