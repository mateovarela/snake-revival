package fx
{
   import flash.Boot;
   import mt.bumdum9.Num;
   
   public class _x_Rebond extends Fx
   {
       
      
      public function _x_Rebond()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         var _loc1_:Number = sn.angle;
         var _loc2_:int = Snake.§`6c)§;
         if(sn.x <= _loc2_ || sn.x > Stage.me.width - _loc2_)
         {
            sn.x = Number(Num.mm(_loc2_,sn.x,Stage.me.width - _loc2_));
            sn.angle = Number(Math.atan2(Number(§\x19\n\t\x01§.sin(_loc1_)),-§\x19\n\t\x01§.cos(_loc1_)));
         }
         if(sn.y <= _loc2_ || sn.y > Stage.me.height - _loc2_)
         {
            sn.y = Number(Num.mm(_loc2_,sn.y,Stage.me.height - _loc2_));
            sn.angle = Number(Math.atan2(-§\x19\n\t\x01§.sin(_loc1_),Number(§\x19\n\t\x01§.cos(_loc1_))));
         }
         var _loc3_:Part = Stage.me.§X\x0f;z\x03§("onde");
         _loc3_.x = sn.x;
         _loc3_.y = sn.y;
         kill();
      }
   }
}
