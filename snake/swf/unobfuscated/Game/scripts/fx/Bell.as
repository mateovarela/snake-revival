package fx
{
   import flash.Boot;
   import mt.Rand;
   import mt.bumdum9.vyy;
   
   public class Bell extends Fx
   {
      
      public static var EC:int = 14;
       
      
      public var timer:Array;
      
      public var green:Array;
      
      public function Bell()
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null as Rand;
         var _loc5_:Number = NaN;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         timer = [int(sn.length[0] / (3 * Bell.EC))];
         green = [];
         var _loc1_:int = 0;
         while(_loc1_ < 160)
         {
            _loc1_++;
            _loc2_ = _loc1_;
            _loc3_ = Fruit.getData(_loc2_);
            if(Lambda.has(_loc3_.tags,_x_TYPE.Green) && int((int(_loc5_) & 1073741823) % int(_loc3_.§\x0e-EY\x01§)) == 0)
            {
               green.push(_loc2_);
            }
         }
         vyy.shuffle(green,Game.me.seed);
      }
      
      override public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null as Fruit;
         super.update();
         if(int(Game.me.§\x0e\b$\r§[0] % 3) != 0)
         {
            return;
         }
         if(sn.length[0] > 20)
         {
            _loc1_ = green.pop();
            green.unshift(_loc1_);
            _loc2_ = sn.§S=6 §(sn.length[0]).§#\x16\x16\x01§;
            _loc3_ = Fruit.get(_loc1_);
            _loc3_.x = Number(_loc2_.x);
            _loc3_.y = Number(_loc2_.y);
            _loc3_._x_creerFruitType();
            sn.length = [sn.length[0] - Bell.EC];
         }
         var _loc4_:int = timer[0];
         timer = [timer[0] - 1];
         if(_loc4_ == 0)
         {
            kill();
         }
      }
   }
}
