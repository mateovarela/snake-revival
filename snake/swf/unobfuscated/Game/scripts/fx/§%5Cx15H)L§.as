package fx
{
   import flash.Boot;
   
   public class §\x15H)L§ extends Fx
   {
       
      
      public var timer:int;
      
      public var inc:Number;
      
      public var coef:Number;
      
      public function §\x15H)L§(param1:int = 0, param2:int = 10)
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
            Stage.me.§$\rV2§(0,_loc1_);
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
