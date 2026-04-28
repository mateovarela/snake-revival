package
{
   import flash.Boot;
   import flash.Lib;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.geom.Matrix;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import mt.DepthManager;
   import mt.fx.Blink;
   import pix.Element;
   import pix.Frame;
   
   public class Vig extends flash.display.Sprite
   {
      
      public static var WIDTH:int = 280;
      
      public static var HEIGHT:int = 22;
       
      
      public var vx:int;
      
      public var score:Object;
      
      public var §iL+e§:int;
      
      public var loaded:int;
      
      public var fdl:Loader;
      
      public var dm:DepthManager;
      
      public function Vig(param1:Object = undefined, param2:int = 0, param3:int = 0)
      {
         var _loc12_:int = 0;
         var _loc13_:* = null as _CardType;
         var _loc14_:* = null as pix.Sprite;
         var _loc15_:* = null as Bitmap;
         var _loc16_:* = null as Matrix;
         var _loc17_:* = null as Element;
         if(Boot.skip_constructor)
         {
            return;
         }
         score = param1._score[param2];
         §iL+e§ = int(score._replayId);
         super();
         Main.root.addChild(this);
         dm = new DepthManager(this);
         var _loc4_:pix.Sprite = new pix.Sprite();
         _loc4_.drawFrame(Gfx.bg.get(0),0,0);
         dm.add(_loc4_,0);
         var _loc5_:TextField = getField(1,-1,8,"nokia");
         _loc5_.x = 0;
         _loc5_.y = 5;
         _loc5_.text = Std.string(param3 + 1);
         _loc5_.width = Number(_loc5_.textWidth + 3);
         _loc5_.x = 9 - int(_loc5_.width * 0.5);
         var _loc6_:TextField = getField(1,-1);
         _loc6_.x = 40;
         _loc6_.y = 0;
         _loc6_.text = param1._name;
         _loc6_.width = 100;
         if(param1._name == Inter.me.data._me && Inter.me.§D ^\x1f\x03§ != _ScoreSection.§@zcy\x02§)
         {
            new Blink(_loc6_,-1,12,4);
         }
         var _loc7_:TextField = getField(0,-1,8,"nokia");
         _loc7_.x = 40;
         _loc7_.y = 9;
         _loc7_.text = Std.string(int(score._score));
         _loc7_.width = 100;
         if(param1._avatar != null)
         {
            load(param1._avatar);
         }
         var _loc8_:int = 20;
         var _loc9_:int = 22;
         vx = Vig.WIDTH - (_loc8_ + 2) * 7;
         var _loc10_:int = vx;
         var _loc11_:int = 0;
         while(_loc11_ < 6)
         {
            _loc11_++;
            _loc12_ = _loc11_;
            if(_loc12_ < int(score._cards.length))
            {
               _loc13_ = score._cards[_loc12_];
               _loc14_ = new pix.Sprite();
               _loc14_.drawFrame(Gfx.arts.get(int(_loc13_.index)),0,0);
               _loc15_ = new Bitmap(new BitmapData(_loc8_,_loc9_,false,16711680));
               dm.add(_loc15_,1);
               _loc15_.x = _loc10_;
               _loc16_ = new Matrix();
               _loc16_.translate(-9,-10);
               _loc15_.bitmapData.draw(_loc14_,_loc16_);
               Gfx.bg.get(3).drawAt(_loc15_.bitmapData,0,0);
            }
            else
            {
               _loc17_ = new Element();
               _loc17_.drawFrame(Gfx.bg.get(4),0,0);
               dm.add(_loc17_,1);
               _loc17_.x = _loc10_;
            }
            _loc10_ = _loc10_ + (_loc8_ + 2);
         }
         var _loc18_:Array = [];
         _loc11_ = 0;
         while(_loc11_ < 2)
         {
            _loc11_++;
            _loc12_ = _loc11_;
            _loc18_.push(Gfx.bg.get(_loc12_,"but_replay"));
         }
         var _loc19_:§\x01K\x01U§ = new §\x01K\x01U§(replay,_loc18_);
         _loc19_.x = Vig.WIDTH - 11;
         _loc19_.y = 11;
         dm.add(_loc19_,1);
         Main.buts.push(_loc19_);
      }
      
      public function §\x06[Q(\x03§(param1:Object) : void
      {
         var _loc2_:Element = new Element();
         _loc2_.drawFrame(Gfx.bg.get(param1,"prize"));
         dm.add(_loc2_,1);
         _loc2_.x = vx - 10;
         _loc2_.y = Vig.HEIGHT >> 1;
      }
      
      public function replay() : void
      {
         var _loc1_:URLRequest = new URLRequest(Main.domain + "/game/replay?id=" + §iL+e§);
         Lib.getURL(_loc1_,"_self");
      }
      
      public function §_I\x17Y§(param1:*) : void
      {
         loaded = loaded + 1;
         if(loaded == 2)
         {
            dm.add(fdl,1);
            fdl.width = 20;
            fdl.height = 20;
            Main.screen.update();
         }
      }
      
      public function load(param1:String) : void
      {
         var _loc2_:LoaderContext = new LoaderContext();
         _loc2_.checkPolicyFile = true;
         loaded = 0;
         fdl = new Loader();
         fdl.contentLoaderInfo.addEventListener(Event.COMPLETE,§_I\x17Y§);
         fdl.contentLoaderInfo.addEventListener(Event.INIT,§_I\x17Y§);
         fdl.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,error);
         fdl.load(new URLRequest(param1),_loc2_);
         fdl.x = 19;
         fdl.y = 1;
         var _loc3_:pix.Sprite = new pix.Sprite();
         _loc3_.drawFrame(Gfx.bg.get(1),0,0);
         _loc3_.x = fdl.x;
         _loc3_.y = fdl.y;
         dm.add(_loc3_,2);
      }
      
      public function kill() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function getField(param1:int = 0, param2:int = 0, param3:int = 8, param4:String = undefined) : TextField
      {
         if(param4 == null)
         {
            param4 = "04b03";
         }
         var _loc5_:TextField = new TextField();
         _loc5_.selectable = false;
         _loc5_.embedFonts = true;
         var _loc6_:TextFormat = _loc5_.getTextFormat();
         _loc6_.color = int([16777215,13107063,3248642,16768477][param1]);
         _loc6_.font = param4;
         _loc6_.size = param3;
         _loc6_.align = [TextFormatAlign.LEFT,TextFormatAlign.CENTER,TextFormatAlign.RIGHT][param2 + 1];
         _loc5_.defaultTextFormat = _loc6_;
         dm.add(_loc5_,1);
         return _loc5_;
      }
      
      public function error(param1:*) : void
      {
      }
   }
}
