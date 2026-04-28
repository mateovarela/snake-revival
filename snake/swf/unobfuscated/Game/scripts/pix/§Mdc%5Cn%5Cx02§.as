package pix
{
   import flash.Boot;
   import flash.display.BitmapData;
   
   public class §Mdc\n\x02§ extends Store
   {
       
      
      public var ww:int;
      
      public var specials:Array;
      
      public var hh:int;
      
      public function §Mdc\n\x02§(param1:BitmapData = undefined, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 10, param7:int = 4)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ww = param2;
         hh = param3;
         super(param1);
         slice(param4,param5,ww,hh,param6,param7);
         specials = [];
      }
      
      public function §;CjU\x03§(param1:String, param2:Object) : void
      {
         var _loc3_:* = param1.charCodeAt(0);
         specials[_loc3_] = param2;
      }
      
      public function §@(\\\x17\x01§(param1:int) : Frame
      {
         var _loc2_:* = specials[param1];
         if(_loc2_ != null)
         {
            return get(_loc2_);
         }
         if(param1 >= 48 && param1 < 58)
         {
            return get(param1 - 48);
         }
         if(param1 >= 97 && param1 < 123)
         {
            return get(10 + param1 - 97);
         }
         return get(0);
      }
   }
}
