package fx
{
   import flash.Boot;
   
   public class Brake extends Fx
   {
      
      public static var LIMIT:int = 30;
      
      public static var ACTIVE:Boolean = false;
      
      public static var coef:Number;
      
      public static var timer:int;
       
      
      public function Brake()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         Brake.timer = 200;
         if(Brake.ACTIVE)
         {
            return;
         }
         Brake.coef = 1;
         super();
         Brake.ACTIVE = true;
      }
      
      override public function update() : void
      {
         super.update();
         var _loc1_:Number = 0.5;
         var _loc2_:int = Brake.timer;
         Brake.timer = Brake.timer - 1;
         if(_loc2_ < 0)
         {
            _loc1_ = 1;
         }
         Brake.coef = Number(Brake.coef + (_loc1_ - Brake.coef) * 0.1);
         if(Brake.coef > 0.99)
         {
            kill();
         }
      }
      
      override public function kill() : void
      {
         Brake.ACTIVE = false;
         super.kill();
      }
   }
}
