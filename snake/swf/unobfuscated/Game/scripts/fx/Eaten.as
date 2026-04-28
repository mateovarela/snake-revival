package fx
{
   import flash.Boot;
   import pix.Element;
   import pix.Frame;
   
   public class Eaten extends Fx
   {
       
      
      public var timer:int;
      
      public var spc:Number;
      
      public var fruit:Element;
      
      public var coef:Number;
      
      public var §[/\n1\x03§:_x_Reglisse;
      
      public function Eaten(param1:Fruit = undefined, param2:_x_Reglisse = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         §[/\n1\x03§ = param2;
         super();
         fruit = new Element();
         fruit.drawFrame(Gfx.fruits.get(param1.gid));
         fruit.x = param1.x;
         fruit.y = param1.y;
         Stage.me.dm.add(fruit,Stage.DP_BG);
         coef = 0;
         spc = 0.1;
         if(§[/\n1\x03§ != null)
         {
            spc = 0.2;
         }
      }
      
      override public function update() : void
      {
         coef = Number(Math.min(Number(coef + 0.1),1));
         var _loc1_:Number = sn.x;
         var _loc2_:Number = sn.y;
         if(§[/\n1\x03§ != null)
         {
            _loc1_ = §[/\n1\x03§.x;
            _loc2_ = §[/\n1\x03§.y;
         }
         var _loc3_:Number = _loc1_ - fruit.x;
         var _loc4_:Number = _loc2_ - fruit.y;
         fruit.x = Number(fruit.x + _loc3_ * coef);
         fruit.y = Number(fruit.y + _loc4_ * coef);
         var _loc5_:Number = 1 - coef;
         fruit.scaleY = _loc5_;
         fruit.scaleX = _loc5_;
         if(coef == 1)
         {
            kill();
            fruit.kill();
         }
      }
   }
}
