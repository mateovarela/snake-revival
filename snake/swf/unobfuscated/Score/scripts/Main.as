package
{
   import flash.Lib;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import pix.Screen;
   
   public class Main
   {
      
      public static var dev:Boolean = false;
      
      public static var §\x14;F8§:Boolean = false;
      
      public static var root:Sprite;
      
      public static var MAX:int = 8;
      
      public static var buts:Array;
      
      public static var screen:Screen;
      
      public static var domain:String;
      
      public static var inter:Inter;
       
      
      public function Main()
      {
      }
      
      public static function main() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         Gfx.init();
         Lang.init();
         Main.root = new Sprite();
         Codec.VERSION = Data.§L\x102d\x01§;
         var _loc1_:* = Lib.current.loaderInfo.parameters;
         Main.domain = Reflect.field(_loc1_,"dom");
         var _loc2_:* = Codec.getData("data");
         Main.buts = [];
         if(int(_loc2_) == 1586)
         {
            Main.dev = true;
            _loc2_ = {
               "_sections":[_ScoreSection.§'&9Q\x02§,_ScoreSection.§\b\x16O|§("motion-twin"),_ScoreSection.§@zcy\x02§,_ScoreSection.§Vx\x03\x1b\x02§],
               "_me":"Bumdum"
            };
            _loc3_ = 0;
            while(_loc3_ < 2)
            {
               _loc3_++;
               _loc4_ = _loc3_;
               _loc2_._sections.push(_ScoreSection.§Yh\x1af\x02§(_loc4_,_loc4_));
            }
            _loc2_._sections.push(_ScoreSection.§\x11Fm\x05§);
         }
         Main.inter = new Inter(_loc2_);
         Main.screen = new Screen(Main.root,Inter.WIDTH * 2,Inter.HEIGHT * Main.MAX * 2,2);
         Lib.current.addChild(Main.screen);
         Lib.current.addEventListener(Event.ENTER_FRAME,Main.update);
         Main.§,?w\x07\x01§();
      }
      
      public static function update(param1:*) : void
      {
         var _loc4_:* = null as But;
         Main.inter.update();
         var _loc2_:int = 0;
         var _loc3_:Array = Main.buts;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc4_.update();
         }
         Main.screen.update();
      }
      
      public static function §,?w\x07\x01§() : void
      {
         var _loc1_:Stage = Lib.current.stage;
         _loc1_.addEventListener(Event.MOUSE_LEAVE,function(param1:*):void
         {
            Main.§\x14;F8§ = false;
         },false,0,true);
         _loc1_.addEventListener(MouseEvent.MOUSE_MOVE,function(param1:*):void
         {
            Main.§\x14;F8§ = true;
         },false,0,true);
      }
   }
}
