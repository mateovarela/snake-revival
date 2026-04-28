package fx
{
   import flash.Boot;
   import haxe.Timer;
   
   public class Sponge extends Fx
   {
       
      
      public function Sponge()
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as Function;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         var _loc1_:Array = Game.me.fruits.copy();
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            var fr:Array = [_loc1_[_loc2_]];
            _loc2_++;
            var ray:Array = [fr[0].getRay() * 0.25];
            _loc3_ = 0;
            while(_loc3_ < 4)
            {
               _loc3_++;
               var i:Array = [_loc3_];
               _loc4_ = function(param1:Array, param2:Array, param3:Array):Function
               {
                  var i:Array = param1;
                  var ray:Array = param2;
                  var fr:Array = param3;
                  return function():void
                  {
                     var _loc1_:Part = Stage.me.§X\x0f;z\x03§("soap");
                     _loc1_.x = Number(fr[0].x + (Math.random() * 2 - 1) * ray[0]);
                     _loc1_.y = Number(fr[0].y + (Math.random() * 2 - 1) * ray[0]);
                     _loc1_.§Hp@\x0f\x01§(int(i[0]) * 2);
                     _loc1_.§I\\\x1a=\x03§();
                     _loc1_.updatePos();
                  };
               }(i,ray,fr);
               Timer.delay(_loc4_,int(i[0]) * 100);
            }
            fr[0].kill();
         }
         kill();
      }
   }
}
