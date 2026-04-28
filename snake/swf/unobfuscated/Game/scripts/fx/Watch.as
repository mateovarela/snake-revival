package fx
{
   import flash.Boot;
   
   public class Watch extends Fx
   {
       
      
      public var parc:Number;
      
      public var matrix:Array;
      
      public var coef:Number;
      
      public function Watch()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         coef = 0;
         sn.freeze = [true];
         parc = 0;
         var _loc1_:Number = 0.3;
         var _loc2_:Number = 0.1;
         var _loc3_:Number = 0.6;
         matrix = [_loc1_,_loc2_,_loc3_,0,0,_loc1_,_loc2_,_loc3_,0,0,_loc1_,_loc2_,_loc3_,0,0,0,0,0,1,0];
      }
      
      override public function update() : void
      {
         super.update();
         coef = Number(Math.min(Number(coef + 0.01),1));
         var _loc1_:Number = Number(§\x19\n\t\x01§.sin(coef * 3.14));
         parc = Number(parc + _loc1_ * 2);
         while(parc > 0)
         {
            sn.§O\no%\x01§();
            parc = parc - 1;
         }
         Game.me.screen.§4 A\x01§(matrix,_loc1_);
         Game.me.§\x0e\b$\r§ = [Game.me.§\x0e\b$\r§[0] - (1 + int(_loc1_ * 5))];
         if(Game.me.§\x0e\b$\r§[0] < 0)
         {
            Game.me.§\x0e\b$\r§ = [0];
         }
         if(coef == 1 || int(sn.trq.length) < 5)
         {
            sn.freeze = [false];
            kill();
         }
      }
   }
}
