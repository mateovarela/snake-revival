package mt.bumdum9
{
   import flash.§f$\n8\x01§;
   
   public class Tween
   {
       
      
      public var sy:Number;
      
      public var sx:Number;
      
      public var ey:Number;
      
      public var ex:Number;
      
      public var coef:Number;
      
      public function Tween(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         sx = param1;
         sy = param2;
         ex = param3;
         ey = param4;
         coef = 0;
      }
      
      public function getVelocity(param1:Number) : Object
      {
         return {
            "vx":(ex - sx) * param1,
            "vy":(ey - sy) * param1
         };
      }
      
      public function getPos(param1:Object = undefined) : Object
      {
         if(param1 == null)
         {
            param1 = coef;
         }
         return {
            "x":Number(sx + (ex - sx) * param1),
            "y":Number(sy + (ey - sy) * param1)
         };
      }
      
      public function §}kQl§(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined) : Object
      {
         var _loc4_:Number = Number(Num.hMod(ex - sx,param2 * 0.5));
         var _loc5_:Number = Number(Num.hMod(ey - sy,param3 * 0.5));
         return {
            "x":Number(Num.sMod(Number(sx + _loc4_ * param1),param2)),
            "y":Number(Num.sMod(Number(sy + _loc5_ * param1),param3))
         };
      }
      
      public function getDist() : Number
      {
         var _loc1_:Number = ex - sx;
         var _loc2_:Number = ey - sy;
         return Number(Math.sqrt(Number(_loc1_ * _loc1_ + _loc2_ * _loc2_)));
      }
      
      public function §\x0bkc^\x02§() : Number
      {
         var _loc1_:Number = ex - sx;
         var _loc2_:Number = ey - sy;
         return Number(Math.atan2(_loc2_,_loc1_));
      }
   }
}
