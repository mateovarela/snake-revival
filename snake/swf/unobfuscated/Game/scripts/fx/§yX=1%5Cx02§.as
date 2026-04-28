package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   
   public class §yX=1\x02§ extends Fx
   {
       
      
      public var speed:Number;
      
      public var fruit:Fruit;
      
      public var frict:Number;
      
      public var fid:int;
      
      public function §yX=1\x02§(param1:Fruit = undefined, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         fruit = param1;
         fid = fruit.§8\x15J{\x02§;
         super();
         speed = Number(3 + param2 * 0.5);
         frict = 0.95;
         switch(param2)
         {
            default:
               frict = 0.98;
               break;
            case 1:
               frict = 0.91;
               break;
            case 2:
               frict = 0.95;
               break;
            case 3:
               frict = 0.97;
         }
      }
      
      override public function update() : void
      {
         var _loc5_:* = null as Fruit;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(fruit.death || fruit.§8\x15J{\x02§ != fid)
         {
            kill();
            return;
         }
         var _loc1_:Fruit = null;
         var _loc2_:Number = 9999.9;
         var _loc3_:int = 0;
         var _loc4_:Array = Game.me.fruits;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_ != fruit)
            {
               _loc6_ = _loc5_.x - fruit.x;
               _loc7_ = _loc5_.y - fruit.y;
               _loc8_ = Number(Math.sqrt(Number(_loc6_ * _loc6_ + _loc7_ * _loc7_)));
               if(_loc8_ < _loc2_)
               {
                  _loc1_ = _loc5_;
                  _loc2_ = _loc8_;
               }
            }
         }
         if(_loc1_ != null)
         {
            if(_loc2_ > 18)
            {
               _loc6_ = _loc1_.x - fruit.x;
               _loc7_ = _loc1_.y - fruit.y;
               _loc8_ = Number(Math.atan2(_loc7_,_loc6_));
               fruit.x = Number(fruit.x + §\x19\n\t\x01§.cos(_loc8_) * speed);
               fruit.y = Number(fruit.y + §\x19\n\t\x01§.sin(_loc8_) * speed);
               fruit.updatePos();
               fruit.sprite.pxx();
               if(int(Game.me.§\x0e\b$\r§[0] % 3) == 0)
               {
                  fruit.§D\x01V5\x01§(Gfx.col("green_0"),BlendMode.ADD);
               }
            }
            speed = speed * frict;
         }
         if(speed < 0.5)
         {
            kill();
         }
      }
   }
}
