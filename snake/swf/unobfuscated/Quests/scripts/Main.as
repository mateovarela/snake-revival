package
{
   import flash.Lib;
   import flash.display.MovieClip;
   import pix.§)$j\x1f\x02§;
   
   public class Main
   {
      
      public static var root:MovieClip;
      
      public static var XMAX:int = 4;
      
      public static var YMAX:int = 2;
      
      public static var MARGIN:int = 2;
      
      public static var domain:String;
       
      
      public function Main()
      {
      }
      
      public static function main() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = null as §%uF\x01§;
         Main.root = new MovieClip();
         Codec.VERSION = Data.§L\x102d\x01§;
         Lang.init();
         Gfx.init();
         var _loc1_:* = Lib.current.loaderInfo.parameters;
         Main.domain = Reflect.field(Lib.current.loaderInfo.parameters,"dom");
         if(Main.domain != null)
         {
            _loc2_ = Codec.getData("data");
         }
         else
         {
            _loc2_ = {"_list":[]};
            _loc3_ = 0;
            while(_loc3_ < 8)
            {
               _loc3_++;
               _loc4_ = _loc3_;
               _loc5_ = {
                  "_id":_CardType.ARROSOIR,
                  "_desc":"bonjour",
                  "_success":int(Std.random(2)) == 0,
                  "_visible":int(Std.random(4)) > 0
               };
               _loc2_._list.push(_loc5_);
            }
         }
         _loc3_ = Main.MARGIN;
         _loc4_ = §%uF\x01§.§;\x057\x02§ + _loc3_;
         var _loc6_:int = §%uF\x01§.HEIGHT + _loc3_;
         var _loc7_:int = _loc3_ + _loc4_ * Main.XMAX * 2;
         var _loc8_:int = _loc3_ + _loc6_ * Main.YMAX * 2;
         Main.root.graphics.beginFill(16777215);
         Main.root.graphics.drawRect(0,0,_loc7_,_loc8_);
         var _loc9_:int = 0;
         var _loc10_:int = Main.YMAX;
         while(_loc9_ < _loc10_)
         {
            _loc9_++;
            _loc11_ = _loc9_;
            _loc12_ = 0;
            _loc13_ = Main.XMAX;
            while(_loc12_ < _loc13_)
            {
               _loc12_++;
               _loc14_ = _loc12_;
               _loc15_ = new §%uF\x01§(_loc2_._list.shift());
               _loc15_.x = Main.MARGIN + _loc14_ * _loc4_;
               _loc15_.y = Main.MARGIN + _loc11_ * _loc6_;
               Main.root.addChild(_loc15_);
            }
         }
         var _loc16_:§)$j\x1f\x02§ = new §)$j\x1f\x02§(Main.root,_loc7_,_loc8_,2);
         Lib.current.addChild(_loc16_);
         _loc16_.update();
      }
   }
}
