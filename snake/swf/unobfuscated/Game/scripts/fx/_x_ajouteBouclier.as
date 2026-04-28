package fx
{
   import flash.Boot;
   
   public class _x_ajouteBouclier extends Fx
   {
      
      public static var INC:Number = 0.05;
       
      
      public var timer:Number;
      
      public function _x_ajouteBouclier(param1:Number = 1.0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         timer = param1 / _x_ajouteBouclier.INC;
      }
      
      override public function update() : void
      {
         super.update();
         Game.me._x_remplirBouclier(_x_ajouteBouclier.INC);
         var _loc1_:Number = timer;
         timer = timer - 1;
         if(_loc1_ <= 0)
         {
            kill();
         }
      }
   }
}
