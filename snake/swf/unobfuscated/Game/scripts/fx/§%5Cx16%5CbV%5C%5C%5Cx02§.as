package fx
{
   import flash.Boot;
   
   public class §\x16\bV\\\x02§ extends Fx
   {
       
      
      public var y:Number;
      
      public var x:Number;
      
      public var timer:int;
      
      public var speed:Number;
      
      public var rank:int;
      
      public var §\x0e-EY\x01§:int;
      
      public var an:Number;
      
      public function §\x16\bV\\\x02§(param1:Number = 0.0, param2:Number = 0.0, param3:Number = 0.0, param4:int = 0, param5:int = 4)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         x = param1;
         y = param2;
         an = param3;
         rank = param4;
         speed = 5;
         timer = 0;
         §\x0e-EY\x01§ = param5;
      }
      
      override public function update() : void
      {
         var _loc1_:* = null as Fruit;
         super.update();
         x = Number(x + §\x19\n\t\x01§.cos(an) * speed);
         y = Number(y + §\x19\n\t\x01§.sin(an) * speed);
         timer = timer + 1;
         if(int(timer % §\x0e-EY\x01§) == 0)
         {
            _loc1_ = Fruit.get(rank);
            _loc1_.x = x;
            _loc1_.y = y;
            _loc1_._x_creerFruitType();
            rank = rank + 1;
            rank = int(Fruit.§FZ\x017\x03§(rank));
         }
         if(!Stage.me.isIn(x,y,10) || rank >= int(__fruitList.LIST.length))
         {
            kill();
         }
      }
   }
}
