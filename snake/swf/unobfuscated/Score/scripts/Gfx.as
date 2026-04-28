package
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import mt.flash.§-F\fN\x01§;
   import pix.Store;
   
   public class Gfx
   {
      
      public static var BLACK:Number = 4278190080;
      
      public static var WHITE:Number = 4294967295;
      
      public static var BLUE:Number = 4283267837;
      
      public static var §L{v\x0e\x01§:Number = 4284492967;
      
      public static var bg:Store;
      
      public static var arts:Store;
      
      public static var textures:Array;
      
      public static var pal:Hash;
       
      
      public function Gfx()
      {
      }
      
      public static function init() : void
      {
         Gfx.§;3Pu§();
         var _loc1_:__mcFruitsEffects = new __mcFruitsEffects(0,0);
         §-F\fN\x01§.run(_loc1_);
         Gfx.arts = new Store(_loc1_);
         var _loc2_:int = 10;
         var _loc3_:int = int(Math.ceil(int(Data.§0\x14UO\x02§()) / _loc2_));
         Gfx.arts.slice(0,0,37,43,_loc2_,_loc3_);
         var _loc4_:__mcBlankBackground = new __mcBlankBackground(0,0);
         _loc4_.threshold(_loc4_,_loc4_.rect,new Point(0,0),"==",-65281,16777215);
         Gfx.bg = new Store(_loc4_);
         Gfx.bg.slice(0,0,40,Vig.HEIGHT);
         Gfx.bg.slice(0,22,20,20,2);
         Gfx.bg.slice(40,22,20,22,2);
         Gfx.bg.slice(40,22,20,22,2);
         Gfx.bg.addIndex("but_replay");
         Gfx.bg.slice(40,0,20,22,2);
         Gfx.bg.addIndex("but_scroll");
         Gfx.bg.slice(80,0,44,44,3);
         Gfx.bg.addIndex("but_scroll_fast");
         Gfx.bg.slice(0,44,44,20,3);
         Gfx.bg.addIndex("prize");
         Gfx.bg.slice(220,0,20,20,2,2);
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
         var _loc10_:Array = ["green_0","green_1","green_2","red_0","red_1","red_2","or_0","or_1","or_2","or_3","snake_0","snake_1","snake_2","blue_0","blue_1","blue_2"];
         Gfx.pal = new Hash();
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
