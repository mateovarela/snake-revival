package haxe
{
   public class Log
   {
      
      public static function trace(param1:*, param2:Object = undefined):void
      {
         Boot.__trace(param1,param2);
      }
      public static function clear():void
      {
         Boot.__clear_trace();
      }
      public static function setColor(param1:int):void
      {
         Boot.__set_trace_color(param1);
      } 
      
      public function Log()
      {
      }
   }
}
