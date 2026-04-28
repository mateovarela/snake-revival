package
{
   import browser.Nav;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import pix.§Mdc\n\x02§;
   import pix.Store;
   
   public class Gfx
   {
      
      public static var BLACK:Number = 4278190080;
      
      public static var WHITE:Number = 4294967295;
      
      public static var BLUE:Number = 4283267837;
      
      public static var §L{v\x0e\x01§:Number = 4284492967;
      
      public static var bg:Store;
      
      public static var main:Store;
      
      public static var fruits:Store;
      
      public static var bonus:Store;
      
      public static var fx:Store;
      
      public static var browser:Store;
      
      public static var §&$l3§:Store;
      
      public static var §|\x0e\x1e\x01\x03§:Store;
      
      public static var §\x1fGEM§:Store;
      
      public static var §sO?5\x01§:§Mdc\n\x02§;
      
      public static var §8Caq\x03§:§Mdc\n\x02§;
      
      public static var §\x1dE&o§:§Mdc\n\x02§;
      
      public static var §e@\fX§:§Mdc\n\x02§;
      
      public static var § LtL\x02§:BitmapData;
      
      public static var textures:Array;
      
      public static var pal:Hash;
       
      
      public function Gfx()
      {
      }
      
      public static function init() : void
      {
         var _loc6_:* = null as §Mdc\n\x02§;
         var _loc1_:__mcFruits = new __mcFruits(0,0);
         Gfx.§\x1eEIO\x03§(_loc1_,Gfx.WHITE);
         Gfx.fruits = new Store(_loc1_);
         Gfx.fruits.addIndex("main");
         Gfx.fruits.slice(0,0,32,32,20,16);
         var _loc2_:__mcBonus = new __mcBonus(0,0);
         Gfx.§\x1eEIO\x03§(_loc2_,Gfx.WHITE);
         Gfx.bonus = new Store(_loc2_);
         Gfx.bonus.addIndex("main");
         Gfx.bonus.slice(0,0,32,32,6,6);
         Gfx.§A}\x0e}\x03§();
         Gfx.§\x1d]\x0b}\x02§();
         var _loc3_:__mcNumbers = new __mcNumbers(0,0);
         Gfx.§\x1eEIO\x03§(_loc3_,Gfx.WHITE);
         Gfx.§sO?5\x01§ = new §Mdc\n\x02§(_loc3_,10,14,0,0,11,1);
         Gfx.§8Caq\x03§ = new §Mdc\n\x02§(_loc3_,10,14,0,14,11,1);
         Gfx.§\x1dE&o§ = new §Mdc\n\x02§(_loc3_,8,10,0,28);
         Gfx.§e@\fX§ = new §Mdc\n\x02§(_loc3_,5,7,0,58,10,1);
         var _loc4_:Array = [Gfx.§sO?5\x01§,Gfx.§8Caq\x03§];
         var _loc5_:int = 0;
         while(_loc5_ < int(_loc4_.length))
         {
            _loc6_ = _loc4_[_loc5_];
            _loc5_++;
            _loc6_.§;CjU\x03§("-",10);
         }
         var _loc7_:__mcBlankBackground = new __mcBlankBackground(0,0);
         Gfx.§\x1eEIO\x03§(_loc7_,Gfx.WHITE);
         Gfx.bg = new Store(_loc7_);
         Gfx.bg.slice(0,0,288,176);
         var _loc8_:§C\x1d82\x03§ = new §C\x1d82\x03§(0,0);
         Gfx.browser = new Store(_loc8_);
         Gfx.browser.slice(0,0,Cs.mcw,Cs.mch);
         var _loc9_:__mcBorder = new __mcBorder(0,0);
         Gfx.§\x1eEIO\x03§(_loc9_,Gfx.WHITE);
         Gfx.§&$l3§ = new Store(_loc9_);
         Gfx.§&$l3§.slice(0,0,Cs.mcw,Nav.HEIGHT);
         Gfx.§&$l3§.slice(0,Nav.HEIGHT,Cs.mcw,Cs.mch - Nav.HEIGHT);
         Gfx.§\x1eEIO\x03§(_loc9_,Gfx.WHITE);
         var _loc10_:__mcAppliedBackgroundModifier = new __mcAppliedBackgroundModifier(0,0);
         Gfx.§|\x0e\x1e\x01\x03§ = new Store(_loc10_);
         Gfx.§|\x0e\x1e\x01\x03§.slice(0,0,16,16,16,8);
         var _loc11_:§\x01BI§ = new §\x01BI§(0,0);
         Gfx.§\x1fGEM§ = new Store(_loc11_);
         Gfx.§\x1fGEM§.slice(0,0,16,16,16,8);
         Gfx.§;3Pu§();
      }
      
      public static function §\x1d]\x0b}\x02§() : void
      {
         var _loc1_:__mcGameEffect = new __mcGameEffect(0,0);
         Gfx.§ LtL\x02§ = _loc1_;
         Gfx.§\x1eEIO\x03§(_loc1_,Gfx.WHITE);
         Gfx.fx = new Store(_loc1_);
         Gfx.fx.addIndex("bad_star");
         Gfx.fx.slice(0,0,24,24,3);
         Gfx.fx.addIndex("burn");
         Gfx.fx.slice(48,32,16,24,8);
         Gfx.fx.addAnim("burn",[0,1,2,3,4,5,6,7],[1,1,1,2,2,2,3,3]);
         Gfx.fx.addIndex("blood");
         Gfx.fx.slice(0,48,32,32);
         Gfx.fx.addIndex("blood_trace");
         Gfx.fx.slice(32,66,16,12,8);
         Gfx.fx.addAnim("blood_trace",[0,1,2,3,4,5,6,7],[3,2,1]);
         Gfx.fx.addIndex("blood_mini_spot");
         Gfx.fx.slice(0,80,16,16);
         Gfx.fx.slice(16,80,8,8,2,2);
         Gfx.fx.addIndex("slash");
         Gfx.fx.slice(32,56,32,8);
         Gfx.fx.addIndex("bomb");
         Gfx.fx.slice(32,80,16,16,3);
         Gfx.fx.addAnim("bomb",[0,1,2],[4,2,4]);
         Gfx.fx.addIndex("miniflame");
         Gfx.fx.slice(64,56,8,8,9);
         Gfx.fx.addAnim("miniflame",[0,1,2,3,4,5,6,7,8],[1,1,1,1,2]);
         Gfx.fx.addIndex("record");
         Gfx.fx.slice(80,80,29,5,1,2);
         Gfx.fx.addAnim("record",[0,1],[6]);
         Gfx.fx.addIndex("onde");
         Gfx.fx.slice(80,0,32,32,6);
         Gfx.fx.addAnim("onde",[0,1,2,3,4,5]);
         Gfx.fx.addAnim("onde_slow",[0,1,2,3,4,5],[2]);
         Gfx.fx.addIndex("blood_drop");
         Gfx.fx.slice(1,62,3,3);
         Gfx.fx.addIndex("body_explode");
         Gfx.fx.slice(0,96,32,32,10);
         Gfx.fx.addAnim("body_explode",[0,1,2,3,4,5,6,7,8,9],[1,1,1,2,3,4,3,2,1]);
         Gfx.fx.addIndex("smiley");
         Gfx.fx.slice(192,32,32,32);
         Gfx.fx.addIndex("pin");
         Gfx.fx.slice(112,80,16,16);
         Gfx.fx.slice(112,80,16,16,1,1,true);
         Gfx.fx.addIndex("spark_onde");
         Gfx.fx.slice(128,80,8,8,2,2);
         Gfx.fx.addAnim("spark_onde",[0,1,2,3],[1,2,3,4]);
         Gfx.fx.addIndex("volt");
         Gfx.fx.slice(144,80,8,8,2,2);
         Gfx.fx.addAnim("volt",[0,1,2,3],[2]);
         Gfx.fx.addIndex("soap");
         Gfx.fx.slice(160,64,16,16,8,1);
         Gfx.fx.addAnim("soap",[0,1,2,3,4,5,6,7],[2]);
         Gfx.fx.addIndex("pink_ribbon");
         Gfx.fx.slice(224,32,32,32);
         Gfx.fx.addIndex("tennis_ball");
         Gfx.fx.slice(160,80,8,8,3,2);
         Gfx.fx.addAnim("tennis_ball",[0,1,2,3,4,5],[2]);
         Gfx.fx.addIndex("big_shield");
         Gfx.fx.slice(256,32,32,32);
         Gfx.fx.addIndex("crane");
         Gfx.fx.slice(0,128,16,24,12);
         Gfx.fx.addAnim("crane",[0,1,2,3,3,4,4,4,5,5,6,7,8,9,10,11]);
         Gfx.fx.addIndex("pulse");
         Gfx.fx.slice(192,128,32,32,3);
         Gfx.fx.addAnim("pulse",[0,1,2],[1]);
         Gfx.fx.addIndex("line_fade");
         Gfx.fx.slice(144,152,8,8,5);
         Gfx.fx.addAnim("line_fade",[0,1,2,3,4],[2]);
         Gfx.fx.addIndex("spark_dust");
         Gfx.fx.slice(184,80,8,8,4,2);
         Gfx.fx.addAnim("spark_dust",[0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,2,3,3],[1]);
         Gfx.fx.addAnim("spark_dust_fast",[0,1,0,1,0,1,2,3,3],[1]);
         Gfx.fx.addAnim("spark_dust_blow",[4,5,6,0],[1]);
         Gfx.fx.addAnim("spark_dust_pulse",[0,0,0,2],[2]);
         Gfx.fx.addIndex("grain");
         Gfx.fx.slice(216,80,8,8,5);
         Gfx.fx.addIndex("snake_parts");
         Gfx.fx.slice(216,88,8,8,6);
         Gfx.fx.addIndex("bubble");
         Gfx.fx.slice(0,152,16,16,5);
         Gfx.fx.addAnim("bubble",[0,1,2,3,4],[2,2,8,2,2]);
         Gfx.fx.addIndex("runes");
         Gfx.fx.slice(80,152,16,16,4);
         Gfx.fx.addIndex("cross");
         Gfx.fx.slice(165,69,3,3,1);
         Gfx.fx.addIndex("mini_star");
         Gfx.fx.slice(256,80,8,8);
         Gfx.fx.addIndex("soup");
         Gfx.fx.slice(144,160,32,18,5,2);
         Gfx.fx.addAnim("soup",[0,1,2,3,4,5,6,7,8],[2]);
         Gfx.fx.addIndex("wisp");
         Gfx.fx.slice(0,184,24,40,4);
         Gfx.fx.addAnim("wisp",[0,1,2,3],[4]);
         Gfx.fx.addIndex("ghost");
         Gfx.fx.slice(0,168,16,16,9);
         Gfx.fx.slice(16,168,16,16,7,1,true);
         Gfx.fx.addAnim("ghost",[4,3,2,1,0,9,10,11,12,13,14,15,8,7,6,5],[1]);
      }
      
      public static function §A}\x0e}\x03§() : void
      {
         var _loc1_:__mcMisc = new __mcMisc(0,0);
         Gfx.§\x1eEIO\x03§(_loc1_,Gfx.WHITE);
         Gfx.main = new Store(_loc1_);
         Gfx.main.addIndex("cards");
         Gfx.main.slice(0,0,43,62,2);
         Gfx.main.addIndex("frutibar");
         Gfx.main.slice(0,64,12,9,2);
         Gfx.main.addIndex("frutibar_bg");
         Gfx.main.slice(24,64,12,8);
         Gfx.main.addIndex("key");
         Gfx.main.slice(0,80,16,16);
         Gfx.main.addIndex("round_key");
         Gfx.main.slice(48,80,16,16);
         Gfx.main.addIndex("card_dark");
         Gfx.main.slice(86,0,43,62);
         Gfx.main.addIndex("prime");
         Gfx.main.slice(129,0,43,62);
         Gfx.main.addIndex("shield");
         Gfx.main.slice(88,64,6,8,10);
         Gfx.main.addIndex("checkbox");
         Gfx.main.slice(48,80,8,8,2);
         Gfx.main.addIndex("mojo");
         Gfx.main.slice(172,0,76,62,2);
         Gfx.main.addIndex("loading_bar");
         Gfx.main.slice(64,80,60,5,1,5);
         Gfx.main.addAnim("loading_bar",[0,1,2,3,4],[2]);
         Gfx.main.addIndex("icon_play");
         Gfx.main.slice(88,72,8,8,2);
         Gfx.main.addIndex("icon_skull");
         Gfx.main.slice(112,72,8,8);
         Gfx.main.addIndex("icon_star");
         Gfx.main.slice(120,72,8,8);
         Gfx.main.addIndex("icon_flash");
         Gfx.main.slice(128,72,8,8);
         Gfx.main.addIndex("icon_freq");
         Gfx.main.slice(136,72,3,3,3);
         Gfx.main.addIndex("art_control");
         Gfx.main.slice(0,128,96,64,3);
         Gfx.main.slice(0,128,192,64);
         Gfx.main.addIndex("mouse_icon");
         Gfx.main.slice(160,64,16,16,3);
         Gfx.main.addAnim("mouse_icon",[0,1,2,1],[2]);
         Gfx.main.addIndex("icon_token");
         Gfx.main.slice(16,96,9,9);
         Gfx.main.addIndex("icon_draft");
         Gfx.main.slice(25,96,9,9,3);
         Gfx.main.addIndex("medium_card");
         Gfx.main.slice(208,64,22,32);
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
         param1.threshold(param1,param1.rect,new Point(0,0),"==",int(param2),16777215);
      }
      
      public static function §\x1aa$\x01\x01§(param1:BitmapData, param2:Number, param3:Number) : BitmapData
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.width;
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc7_ = 0;
            _loc8_ = param1.height;
            while(_loc7_ < _loc8_)
            {
               _loc7_++;
               _loc9_ = _loc7_;
               if(uint(param1.getPixel32(_loc6_,_loc9_)) == param2)
               {
                  param1.setPixel32(_loc6_,_loc9_,uint(param3));
               }
            }
         }
         return param1;
      }
   }
}
