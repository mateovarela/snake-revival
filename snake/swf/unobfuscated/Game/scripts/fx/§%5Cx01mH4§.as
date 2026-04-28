package fx
{
   import flash.Boot;
   
   public class §\x01mH4§ extends Fx
   {
       
      
      public var speed:Number;
      
      public var matrix:Array;
      
      public var coef:Number;
      
      public function §\x01mH4§(param1:Number = 0.1, param2:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(param2 == null)
         {
            param2 = [0,0,0,0,255,0,0,0,0,255,0,0,0,0,255,0,0,0,1,0];
         }
         super();
         speed = param1;
         coef = 1;
         matrix = param2;
         maj();
      }
      
      override public function update() : void
      {
         coef = Number(Math.max(coef - speed,0));
         maj();
         if(coef == 0)
         {
            kill();
         }
      }
      
      public function maj() : void
      {
         Game.me.screen.§4 A\x01§(matrix,coef);
      }
   }
}
