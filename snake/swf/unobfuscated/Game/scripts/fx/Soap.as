package fx
{
   import flash.Boot;
   
   public class Soap extends Fx
   {
      
      public static var ACTIVE:Boolean = false;
      
      public static var speedCoef:Number;
       
      
      public var coef:Number;
      
      public function Soap()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(Soap.ACTIVE)
         {
            return;
         }
         super();
         Soap.ACTIVE = true;
         coef = 0;
         Soap.speedCoef = 1;
      }
      
      override public function update() : void
      {
         super.update();
         coef = Number(Math.min(Number(coef + 0.1),1));
         Soap.speedCoef = Number(1 + §\x19\n\t\x01§.sin(coef * 3.14) * 2);
         var _loc1_:int = 4;
         var _loc2_:Part = Stage.me.§X\x0f;z\x03§("soap");
         Stage.me.dm.add(_loc2_.sprite,Stage.§l\x10|-\x02§);
         _loc2_.x = Number(sn.x + (Math.random() * 2 - 1) * _loc1_);
         _loc2_.y = Number(sn.y + (Math.random() * 2 - 1) * _loc1_);
         _loc2_.§I\\\x1a=\x03§();
         _loc2_.updatePos();
         if(coef == 1 || sn.dead)
         {
            kill();
         }
      }
      
      override public function kill() : void
      {
         super.kill();
         Soap.ACTIVE = false;
      }
   }
}
