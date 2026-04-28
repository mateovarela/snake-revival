package fx
{
   import flash.Boot;
   
   public class Chausson extends Fx
   {
      
      public static var SLOW:Number = 0.3;
      
      public static var DURATION:int = 50;
      
      public static var ACTIVE:Boolean = false;
      
      public static var coef:Number;
       
      
      public var timer:int;
      
      public var matrix:Array;
      
      public function Chausson()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(Chausson.ACTIVE)
         {
            return;
         }
         super();
         Chausson.ACTIVE = true;
         timer = Chausson.DURATION;
         Chausson.coef = 1;
         var _loc1_:Number = 0.3;
         var _loc2_:Number = 0.1;
         var _loc3_:Number = 0.6;
         matrix = [_loc1_,_loc2_,_loc3_,0,50,_loc1_,_loc2_,_loc3_,0,40,_loc1_,_loc2_,_loc3_,0,0,0,0,0,1,0];
      }
      
      override public function update() : void
      {
         super.update();
         timer = timer - 1;
         var _loc1_:Number = timer / Chausson.DURATION;
         _loc1_ = 1 - §\x19\n\t\x01§.sin(_loc1_ * 3.14);
         Chausson.coef = Number(Chausson.SLOW + _loc1_ * (1 - Chausson.SLOW));
         var _loc2_:Number = Number(Math.min((1 - _loc1_) * 1.5,1));
         Game.me.screen.§4 A\x01§(matrix,_loc2_);
         if(timer == 0)
         {
            kill();
         }
      }
      
      override public function kill() : void
      {
         Chausson.ACTIVE = false;
         super.kill();
      }
   }
}
