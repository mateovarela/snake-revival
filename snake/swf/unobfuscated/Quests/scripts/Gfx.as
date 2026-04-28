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
      
      public static var main:§W\x1bSS\x01§;
      
      public static var bg:§W\x1bSS\x01§;
      
      public static var textures:Array;
      
      public static var pal:§_g\nX\x01§;
       
      
      public function Gfx()
      {
      }
      
      public static function init() : void
      {
         Gfx.§;3Pu§();
         var _loc1_:__mcBlankBackground = new __mcBlankBackground(0,0);
         Gfx.bg = new §W\x1bSS\x01§(_loc1_);
         Gfx.bg.slice(0,0,§%uF\x01§.§;\x057\x02§,§%uF\x01§.HEIGHT,2);
         var _loc2_:__mcMisc = new __mcMisc(0,0);
         Gfx.§\x1eEIO\x03§(_loc2_,Gfx.WHITE);
         Gfx.main = new §W\x1bSS\x01§(_loc2_);
         Gfx.main.addIndex("cards");
         Gfx.main.slice(0,0,43,62,2);
         Gfx.main.addIndex("icon_play");
         Gfx.main.slice(88,72,8,8,2);
         Gfx.main.addIndex("token");
         Gfx.main.slice(16,96,9,9);
         Gfx.main.addIndex("icon_flash");
         Gfx.main.slice(128,72,8,8);
         Gfx.main.addIndex("icon_freq");
         Gfx.main.slice(136,72,3,3,3);
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
      
      public static function §;3Pu§() : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:uint = 0;
         var _loc11_:* = null as String;
         var _loc1_:__mcRainbowSnake = new __mcRainbowSnake(0,0);
         var _loc2_:Array = [];
         var _loc3_:int = 10;
         var _loc4_:int = 4;
         var _loc5_:int = 0;
         while(_loc5_ < 100)
         {
            _loc5_++;
            _loc6_ = _loc5_;
            _loc7_ = int(_loc6_ % _loc3_) * _loc4_;
            _loc8_ = int(_loc6_ / _loc3_) * _loc4_;
            _loc9_ = uint(_loc1_.getPixel(_loc7_,_loc8_));
            _loc2_.push(_loc9_);
         }
         var _loc10_:Array = ["green_0","green_1","green_2","red_0","red_1","red_2","or_0","or_1","or_2","or_3","snake_0","snake_1","snake_2"];
         Gfx.pal = new §_g\nX\x01§();
         _loc5_ = 0;
         _loc6_ = int(_loc10_.length);
         while(_loc5_ < _loc6_)
         {
            _loc5_++;
            _loc7_ = _loc5_;
            _loc11_ = _loc10_[_loc7_];
            Gfx.pal.set(_loc11_,uint(_loc2_[_loc7_]));
         }
      }
      
      public static function col(param1:String) : Object
      {
         return Gfx.pal.get(param1);
      }
   }
}
