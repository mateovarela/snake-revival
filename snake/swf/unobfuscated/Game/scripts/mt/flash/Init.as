package mt.flash
{
   import flash.Boot;
   import flash.Lib;
   
   public class Init
   {
       
      
      public function Init()
      {
      }
      
      public static function check() : void
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc1_:String = Lib.current.loaderInfo.loaderURL;
         var _loc2_:Array = _loc1_.split("?");
         _loc2_.shift();
         _loc2_ = _loc2_.join("?").split("&");
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc2_.length))
         {
            _loc4_ = _loc2_[_loc3_];
            _loc3_++;
            _loc5_ = _loc4_.split("=")[0];
            if(_loc5_ != "" && _loc5_ != "v")
            {
               Boot.lastError = new Error();
               throw "Vars not allowed";
            }
         }
      }
   }
}
