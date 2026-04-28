package mt.fx
{
   import flash.§f$\n8\x01§;
   
   public class Fx
   {
      
      public static var DEFAULT_MANAGER:Manager;
       
      
      public var poolBack:Function;
      
      public var onFinish:Function;
      
      public var dead:Boolean;
      
      public var curve:Function;
      
      public var coef:Number;
      
      public function Fx()
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         Fx.DEFAULT_MANAGER.add(this);
         curve = function(param1:Number):Number
         {
            return param1;
         };
         coef = 0;
         dead = false;
      }
      
      public function update() : void
      {
      }
      
      public function uTurn() : void
      {
         coef = 1 - coef;
         §,\x04\x19\x02§();
      }
      
      public function §,\x04\x19\x02§() : void
      {
         var old:Function = curve;
         curve = function(param1:Number):Number
         {
            return 1 - old(param1);
         };
      }
      
      public function kill() : void
      {
         dead = true;
         if(onFinish != null)
         {
            onFinish();
         }
         if(poolBack != null)
         {
            poolBack();
         }
         Fx.DEFAULT_MANAGER.remove(this);
      }
      
      public function curveInOut(param1:Number = 1.0) : void
      {
         var pow:Number = param1;
         curve = function(param1:Number):Number
         {
            return Number(Math.pow(0.5 - Math.cos(param1 * 3.14) * 0.5,pow));
         };
      }
      
      public function curveIn(param1:Number) : void
      {
         var pow:Number = param1;
         curve = function(param1:Number):Number
         {
            return Number(Math.pow(param1,pow));
         };
      }
   }
}
