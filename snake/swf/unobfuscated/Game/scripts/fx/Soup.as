package fx
{
   import flash.Boot;
   import flash.geom.Point;
   import mt.fx.§qR))\x03§;
   import pix.Anim;
   
   public class Soup extends Fx
   {
       
      
      public var §a\t&\x05\x02§:Array;
      
      public var timer:int;
      
      public var step:int;
      
      public var sprite:Part;
      
      public var plate:Part;
      
      public var max:int;
      
      public function Soup()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         step = 0;
         timer = 0;
         plate = Part.get();
         Stage.me.dm.add(plate.sprite,Stage.§p\x1fLp\x03§);
         plate.sprite.setAnim(Gfx.fx.getAnim("soup"));
         var _loc1_:Point = Stage.me.§;*\x13(\x02§(60,20);
         plate.setPos(_loc1_.x,_loc1_.y,-20);
         plate.weight = 0.2;
         plate.§\x188\x1b(\x03§ = 0.5;
         plate.FFfR(true);
      }
      
      override public function update() : void
      {
         var _loc1_:* = null as Fruit;
         var _loc2_:* = null as §\x16\x1a9&\x03§;
         var _loc3_:* = null as §qR))\x03§;
         super.update();
         timer = timer + 1;
         switch(step)
         {
            case 0:
               if(timer > 36)
               {
                  step = step + 1;
                  §a\t&\x05\x02§ = Game.me.fruits.copy();
               }
               break;
            case 1:
               _loc1_ = §a\t&\x05\x02§.pop();
               if(!_loc1_.death && !_loc1_.dummy)
               {
                  _loc2_ = new §\x16\x1a9&\x03§(_loc1_,plate.x,plate.y);
                  _loc2_.onFinish = function(param1:Function, param2:Fruit):Function
                  {
                     var f:Function = param1;
                     var a1:Fruit = param2;
                     return function():void
                     {
                        return f(a1);
                     };
                  }(add,_loc1_);
                  _loc1_.timer = _loc1_.timer + 200;
                  _loc1_.edible = false;
               }
               if(int(§a\t&\x05\x02§.length) == 0)
               {
                  timer = 0;
                  step = step + 1;
               }
               break;
            case 2:
               if(timer > 50)
               {
                  plate.kill();
                  _loc3_ = new §qR))\x03§(32,64,0.1);
                  _loc3_.setPos(plate.x,plate.y);
                  Stage.me.dm.add(_loc3_.root,Stage.§l\x10|-\x02§);
                  kill();
                  break;
               }
         }
      }
      
      public function add(param1:Fruit) : void
      {
         param1.kill();
         Game.me._x_augmenteFruitibar(1.5);
      }
   }
}
