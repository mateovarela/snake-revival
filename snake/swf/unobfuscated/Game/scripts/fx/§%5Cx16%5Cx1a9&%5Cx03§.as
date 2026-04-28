package fx
{
   import flash.Boot;
   import mt.bumdum9.Tween;
   
   public class §\x16\x1a9&\x03§ extends Fx
   {
       
      
      public var tw:Tween;
      
      public var spc:Number;
      
      public var fr:Fruit;
      
      public var coef:Number;
      
      public function §\x16\x1a9&\x03§(param1:Fruit = undefined, param2:Number = 0.0, param3:Number = 0.0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         fr = param1;
         tw = new Tween(param1.x,param1.y,param2,param3);
         coef = 0;
         param1.dummy = true;
         var _loc4_:int = 4;
         spc = _loc4_ / tw.getDist();
         Stage.me.dm.over(param1.sprite);
      }
      
      override public function update() : void
      {
         super.update();
         coef = Number(Math.min(Number(coef + spc),1));
         var _loc1_:* = tw.getPos(coef);
         fr.setPos(Number(_loc1_.x),Number(_loc1_.y));
         var _loc2_:Number = Number(20 + 1 / spc);
         fr.z = -Math.sin(coef * 3.14) * _loc2_;
         if(coef == 1)
         {
            fr.dummy = false;
            kill();
         }
      }
   }
}
