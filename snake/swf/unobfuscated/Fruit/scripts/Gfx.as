package
{
   import flash.display.BitmapData;
   import pix.§W\x1bSS\x01§;
   
   public class Gfx
   {
      
      public static var BLACK:Number = 4278190080;
      
      public static var WHITE:Number = 4294967295;
      
      public static var BLUE:Number = 4283267837;
      
      public static var §L{v\x0e\x01§:Number = 4284492967;
      
      public static var bg:§W\x1bSS\x01§;
      
      public static var fruits:§W\x1bSS\x01§;
      
      public static var textures:Array;
       
      
      public function Gfx()
      {
      }
      
      public static function init() : void
      {
         var _loc1_:__mcFruits = new __mcFruits(0,0);
         Gfx.§\x1eEIO\x03§(_loc1_,Gfx.WHITE);
         Gfx.fruits = new §W\x1bSS\x01§(_loc1_);
         Gfx.fruits.addIndex("main");
         Gfx.fruits.slice(0,0,32,32,20,16);
         var _loc2_:__mcBlankBackground = new __mcBlankBackground(0,0);
         Gfx.bg = new §W\x1bSS\x01§(_loc2_);
         Gfx.bg.addIndex("main");
         Gfx.bg.slice(0,0,§%uF\x01§.§;\x057\x02§,§%uF\x01§.HEIGHT);
         Gfx.bg.addIndex("arrow");
         Gfx.bg.slice(0,§%uF\x01§.HEIGHT,21,12,6);
      }
      
      public static function §\x1eEIO\x03§(param1:BitmapData, param2:Number) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = param1.width;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            _loc6_ = 0;
            _loc7_ = param1.height;
            while(_loc6_ < _loc7_)
            {
               _loc6_++;
               _loc8_ = _loc6_;
               if(uint(param1.getPixel32(_loc5_,_loc8_)) == param2)
               {
                  param1.setPixel32(_loc5_,_loc8_,0);
               }
            }
         }
      }
      
      public static function §\x1aa$\x01\x01§(param1:Object, param2:Number, param3:Number) : Object
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = int(param1.width);
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc7_ = 0;
            _loc8_ = int(param1.height);
            while(_loc7_ < _loc8_)
            {
               _loc7_++;
               _loc9_ = _loc7_;
               if(Number(param1.§\x1b#\x06]\x02§(_loc6_,_loc9_)) == param2)
               {
                  param1.§X\x1ec\x14\x02§(_loc6_,_loc9_,param3);
               }
            }
         }
         return param1;
      }
   }
}
