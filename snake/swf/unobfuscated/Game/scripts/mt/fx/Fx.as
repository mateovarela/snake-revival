package mt.fx
{
   import flash.Boot;
   
   public class Fx
   {
      
      public static var DEFAULT_MANAGER:Manager;
       
      
      public var poolBack:Function;
      
      public var onFinish:Function;
      
      public var manager:Manager;
      
      public var dead:Boolean;
      
      public var curve:Function;
      
      public var coef:Number;
      
      public function Fx()
      {
         if(Boot.skip_constructor)
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
         if(dead)
         {
            Boot.lastError = new Error();
            throw "fx already dead";
         }
         dead = true;
         if(onFinish != null)
         {
            onFinish();
         }
         if(poolBack != null)
         {
            poolBack();
         }
         manager.remove(this);
      }
      
      public function curveInOut() : void
      {
         curve = function(param1:Number):Number
         {
            return 0.5 - Math.cos(param1 * 3.14) * 0.5;
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
