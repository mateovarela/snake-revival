package fx
{
   import flash.Boot;
   
   public class Reduce extends Fx
   {
       
      
      public var spc:Number;
      
      public var quant:Number;
      
      public function Reduce(param1:int = 0, param2:Number = 0.0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         quant = param1;
         spc = param2;
      }
      
      override public function update() : void
      {
         super.update();
         quant = quant - spc;
         sn.length = [sn.length[0] - spc];
         if(sn.length[0] < Snake.§R8&\x05\x03§ && !sn.dead)
         {
            sn.length = [Snake.§R8&\x05\x03§];
         }
         var _loc1_:* = sn.§S=6 §(sn.length[0]);
         var _loc2_:Part = Stage.me.§X\x0f;z\x03§("spark_onde");
         _loc2_.x = Number(_loc1_.§#\x16\x16\x01§.x) + int(Std.random(10)) - 5;
         _loc2_.y = Number(_loc1_.§#\x16\x16\x01§.y) + int(Std.random(10)) - 5;
         _loc2_.weight = -(0.1 + Math.random() * 0.1);
         if(quant <= 0 || sn.length[0] == Snake.§R8&\x05\x03§)
         {
            kill();
         }
      }
      
      public function spark() : void
      {
      }
   }
}
