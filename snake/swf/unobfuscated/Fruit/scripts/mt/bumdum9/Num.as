package mt.bumdum9
{
   import haxe.Log;
   
   public class Num
   {
       
      
      public function Num()
      {
      }
      
      public static function mm(param1:Number, param2:Number, param3:Number) : Number
      {
         return Number(Math.min(Number(Math.max(param1,param2)),param3));
      }
      
      public static function clamp(param1:int, param2:int, param3:int) : int
      {
         if(param2 < param1)
         {
            return param1;
         }
         if(param2 > param3)
         {
            return param3;
         }
         return param2;
      }
      
      public static function sMod(param1:Number, param2:Number) : Number
      {
         if(param2 == 0)
         {
            Log.trace("sMod ERROR! (" + param1 + "," + param2 + ")",{
               "fileName":"Lib.hx",
               "lineNumber":461,
               "v2z\x01":"mt.bumdum9.Num",
               "methodName":"sMod"
            });
            return param1;
         }
         while(param1 >= param2)
         {
            param1 = param1 - param2;
         }
         while(param1 < 0)
         {
            param1 = Number(param1 + param2);
         }
         return param1;
      }
      
      public static function hMod(param1:Number, param2:Number) : Number
      {
         while(param1 > param2)
         {
            param1 = param1 - param2 * 2;
         }
         while(param1 < -param2)
         {
            param1 = Number(param1 + param2 * 2);
         }
         return param1;
      }
   }
}
