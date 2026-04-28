package fx
{
   import flash.Boot;
   
   public class _x_EtirerJeu extends Fx
   {
       
      
      public var timer:int;
      
      public var inc:Number;
      
      public var coef:Number;
      
      public function _x_EtirerJeu(param1:int = 0, param2:int = 10)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         timer = param2;
         inc = param1 / param2;
         coef = 0;
      }
      
      override public function update() : void
      {
         coef = Number(coef + inc);
         var _loc1_:int = int(coef);
         if(_loc1_ != 0)
         {
            Stage.me.§$\rV2§(_loc1_,0);
            coef = coef - _loc1_;
         }
         var _loc2_:int = timer;
         timer = timer - 1;
         if(_loc2_ == 0)
         {
            kill();
         }
      }
   }
}
