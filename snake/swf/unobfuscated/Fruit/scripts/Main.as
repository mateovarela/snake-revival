package
{
   import flash.Lib;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import pix.§)$j\x1f\x02§;
   import pix.Frame;
   
   public class Main
   {
      
      public static var §\x14;F8§:Boolean = false;
      
      public static var MAX:int = 8;
      
      public static var COLUMNS:int = 2;
      
      public static var MARGIN:int = 2;
      
      public static var mcw:int = 440;
      
      public static var mch:int = 212;
      
      public static var §q1\x04f\x01§:int = 0;
      
      public static var §9'H\x1e\x02§:int = 0;
      
      public static var root:Sprite;
      
      public static var vigs:Array;
      
      public static var buts:Array;
      
      public static var page:int;
      
      public static var data:Array;
      
      public static var §8eJ\n\x03§:TextField;
      
      public static var screen:§)$j\x1f\x02§;
       
      
      public function Main()
      {
      }
      
      public static function main() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         Gfx.init();
         Lang.init();
         Codec.VERSION = Data.§L\x102d\x01§;
         Main.root = new Sprite();
         Main.root.graphics.beginFill(16777215);
         Main.root.graphics.drawRect(0,0,Main.mcw,Main.mch);
         var _loc1_:* = Lib.current.loaderInfo.parameters;
         if(Reflect.field(_loc1_,"data") != null)
         {
            _loc2_ = Codec.getData("data");
         }
         else
         {
            _loc2_ = {"_list":[]};
            _loc3_ = 0;
            while(_loc3_ < 301)
            {
               _loc3_++;
               _loc4_ = _loc3_;
               _loc2_._list.push(int(Std.random(10)));
            }
         }
         Main.data = [];
         _loc3_ = 0;
         _loc4_ = __fruitList.MAX;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            Main.data.push({
               "id":_loc5_,
               "num":int(_loc2_._list[_loc5_])
            });
         }
         Main.data.sort(Main.§N+N2\x03§);
         Main.§q1\x04f\x01§ = int(__fruitList.MAX / Main.MAX);
         Main.§9'H\x1e\x02§ = int((Main.mcw - (Main.COLUMNS * §%uF\x01§.§;\x057\x02§ + (Main.COLUMNS - 1) * Main.MARGIN)) * 0.5);
         Main.screen = new §)$j\x1f\x02§(Main.root,Main.mcw * 2,Main.mch * 2,2);
         Lib.current.addChild(Main.screen);
         Main.vigs = [];
         Main.page = 0;
         Main.§,?w\x07\x01§();
         Main.§s\x14g\n\x01§();
         Main.§kQ\x1aI\x03§();
         Lib.current.addEventListener(Event.ENTER_FRAME,Main.update);
      }
      
      public static function update(param1:*) : void
      {
         var _loc4_:* = null as But;
         var _loc2_:int = 0;
         var _loc3_:Array = Main.buts;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc4_.update();
         }
      }
      
      public static function §s\x14g\n\x01§() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null as Function;
         var _loc9_:* = null as But;
         Main.§8eJ\n\x03§ = §\x19\n\t\x01§.getField(13421772,8,-1,"nokia");
         Main.§8eJ\n\x03§.x = Main.mcw * 0.5 - 30;
         Main.§8eJ\n\x03§.y = Main.mch - 11;
         Main.root.addChild(Main.§8eJ\n\x03§);
         var _loc1_:Number = Main.mcw * 0.5;
         Main.buts = [];
         var _loc2_:int = 0;
         while(_loc2_ < 2)
         {
            _loc2_++;
            var i:Array = [_loc2_];
            _loc3_ = 0;
            while(_loc3_ < 2)
            {
               _loc3_++;
               _loc4_ = _loc3_;
               var §V\nW\x12\x02§:Array = [_loc4_ * 2 - 1];
               _loc5_ = [];
               _loc6_ = 0;
               while(_loc6_ < 3)
               {
                  _loc6_++;
                  _loc7_ = _loc6_;
                  _loc5_.push(Gfx.bg.get(_loc7_ + int(i[0]) * 3,"arrow"));
               }
               _loc8_ = function(param1:Array, param2:Array):Function
               {
                  var §V\nW\x12\x02§:Array = param1;
                  var i:Array = param2;
                  return function():void
                  {
                     Main.§wp1\x05\x02§(int(§V\nW\x12\x02§[0]) * (1 + (1 - int(i[0])) * 9));
                  };
               }(§V\nW\x12\x02§,i);
               _loc9_ = new But(_loc8_,_loc5_);
               _loc9_.scaleX = int(§V\nW\x12\x02§[0]);
               Main.buts.push(_loc9_);
               Main.root.addChild(_loc9_);
               _loc9_.x = Number(_loc1_ + int(§V\nW\x12\x02§[0]) * (185 + int(i[0]) * 32));
               _loc9_.y = Main.mch - 6;
            }
         }
      }
      
      public static function §wp1\x05\x02§(param1:int) : void
      {
         Main.page = Main.page + param1;
         if(Main.page < 0)
         {
            Main.page = 0;
         }
         if(Main.page > Main.§q1\x04f\x01§)
         {
            Main.page = Main.§q1\x04f\x01§;
         }
         Main.§kQ\x1aI\x03§();
      }
      
      public static function §kQ\x1aI\x03§() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null as §%uF\x01§;
         while(int(Main.vigs.length) > 0)
         {
            Main.vigs.pop().kill();
         }
         var _loc1_:int = 4;
         var _loc2_:int = Main.MAX;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc3_++;
            _loc4_ = _loc3_;
            _loc5_ = Main.page * _loc2_ + _loc4_;
            if(_loc5_ < __fruitList.MAX)
            {
               _loc6_ = Main.data[_loc5_];
               _loc7_ = new §%uF\x01§(int(_loc6_.id),int(_loc6_.num));
               _loc7_.x = Main.§9'H\x1e\x02§ + int(_loc4_ / _loc1_) * (§%uF\x01§.§;\x057\x02§ + Main.MARGIN);
               _loc7_.y = int(_loc4_ % _loc1_) * (§%uF\x01§.HEIGHT + Main.MARGIN);
               Main.vigs.push(_loc7_);
            }
         }
         Main.§8eJ\n\x03§.text = Lang.PAGE + " " + (Main.page + 1) + " / " + (Main.§q1\x04f\x01§ + 1);
         Main.screen.update();
      }
      
      public static function §N+N2\x03§(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(__fruitList.LIST[int(param1.id)].rank);
         var _loc4_:int = int(__fruitList.LIST[int(param2.id)].rank);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 1;
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
