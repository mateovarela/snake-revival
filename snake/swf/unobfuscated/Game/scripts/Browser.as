package
{
   import browser.§0\x1atr\x02§;
   import browser.Nav;
   import browser.§_\x19X\x13\x03§;
   import flash.Boot;
   import flash.Lib;
   import flash.display.BlendMode;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import haxe.Log;
   import mt.DepthManager;
   import mt.bumdum9.Col;
   import mt.bumdum9.Filt;
   import mt.bumdum9.Num;
   import mt.bumdum9.Tween;
   import mt.fx.Blink;
   import mt.fx.Manager;
   import pix.Element;
   import pix.Frame;
   import pix.Screen;
   
   public class Browser
   {
      
      public static var DP_BG:int = 0;
      
      public static var §A\bW\x1b§:int = 1;
      
      public static var §ZH)#\x02§:int = 2;
      
      public static var §(Xc\x05\x01§:int = 3;
      
      public static var Umu$:int = 4;
      
      public static var §fUg\x0f\x03§:int = 0;
      
      public static var §\x10~;E\x01§:int = 11;
      
      public static var §IH\x062\x02§:int = 16;
      
      public static var me:Browser;
      
      public static var TEST:int = 0;
       
      
      public var selection:§_\x19X\x13\x03§;
      
      public var §\x1dfv\t\x02§:int;
      
      public var §\f\x03h§:flash.display.Sprite;
      
      public var screen:Screen;
      
      public var root:flash.display.Sprite;
      
      public var §N\nM\x03§:Array;
      
      public var nav:Nav;
      
      public var §w\x1f\x03U§:int;
      
      public var §\x1a vx\x03§:int;
      
      public var §_Z_@\x03§:int;
      
      public var §\x13ET]\x02§:§0\x1atr\x02§;
      
      public var mcHint:flash.display.Sprite;
      
      public var §K\x16-]\x03§:Array;
      
      public var hand:Array;
      
      public var gt:int;
      
      public var fxm:Manager;
      
      public var §eJ\x16`\x02§:TextField;
      
      public var §F1M\x17\x03§:TextField;
      
      public var dm:DepthManager;
      
      public var data:Object;
      
      public var coef:Number;
      
      public var §\x02P`\x0b\x03§:TextField;
      
      public var buts:Array;
      
      public var §V\x14b\\\x01§:Element;
      
      public var bgf:Element;
      
      public var bg:Element;
      
      public var action:Function;
      
      public function Browser(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         Browser.me = this;
         root = new flash.display.Sprite();
         dm = new DepthManager(root);
         fxm = new Manager();
         §w\x1f\x03U§ = 0;
         §\x1a vx\x03§ = Data.§\x1a]\x07%\x01§;
         §_Z_@\x03§ = Data.§\x1a]\x07%\x01§;
         hand = [];
         §K\x16-]\x03§ = [];
         data = param1;
         initBg();
         §\x13ET]\x02§ = new §0\x1atr\x02§();
         buts = [];
         var _loc2_:SharedObject = SharedObject.getLocal("snake");
         if(_loc2_.data.controlType == null)
         {
            _loc2_.data.controlType = 0;
            _loc2_.data.gore = param1._age == null || param1._age >= 12;
         }
         var _loc3_:int = 2;
         screen = new Screen(root,Cs.mcw * _loc3_,Cs.mch * _loc3_,_loc3_);
         Main.dm.add(screen,1);
         Lib.current.stage.addEventListener(MouseEvent.CLICK,click);
         Lib.current.addEventListener(Event.ENTER_FRAME,update);
      }
      
      public function §=3a\x0e\x02§() : void
      {
         nav.update();
         §J1\x03A\x01§();
      }
      
      public function §\x018cZ\x03§() : void
      {
         var _loc1_:int = 0;
         if(§\f\x03h§ == null || int(_loc1_ % 2) != 0)
         {
            return;
         }
         §\f\x03h§.x = §\f\x03h§.x - 1;
         if(§\f\x03h§.x <= -§\x1dfv\t\x02§)
         {
            §\f\x03h§.x = Number(§\f\x03h§.x + §\x1dfv\t\x02§);
         }
      }
      
      public function §5=f/\x02§() : void
      {
         if(§\x13ET]\x02§ == null || §eJ\x16`\x02§ == null)
         {
            return;
         }
         §eJ\x16`\x02§.visible = §\x13ET]\x02§.over;
      }
      
      public function §J1\x03A\x01§() : void
      {
         var _loc6_:* = null as §_\x19X\x13\x03§;
         var _loc1_:Number = root.mouseX * 0.5;
         var _loc2_:Number = root.mouseY * 0.5;
         var _loc3_:§_\x19X\x13\x03§ = null;
         var _loc4_:int = 0;
         var _loc5_:Array = hand;
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_];
            _loc4_++;
            _loc6_.update();
            if(_loc6_.tween == null && Number(Math.abs(_loc6_.x - _loc1_)) < Card.§;\x057\x02§ * 0.5 && Number(Math.abs(_loc6_.y - _loc2_)) < Card.HEIGHT * 0.5)
            {
               _loc3_ = _loc6_;
            }
         }
         if(_loc3_ != selection)
         {
            §n\x0f]P\x02§();
            if(_loc3_ != null)
            {
               select(_loc3_);
            }
         }
         §\x13ET]\x02§.update();
      }
      
      public function §U\fx\x14\x02§() : void
      {
         var _loc3_:* = null as §_\x19X\x13\x03§;
         coef = Number(Math.min(Number(coef + 0.05),1));
         var _loc1_:int = 0;
         var _loc2_:Array = hand;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.update();
         }
         nav.root.y = nav.root.y - int(coef * 32);
         §\x13ET]\x02§.alpha = 1 - coef * 2;
         Col.setPercentColor(bg,coef,Gfx.col("green_1"));
         var _loc4_:Number = Number(Num.mm(0,coef * 2 - 1,1));
         bgf.y = bgf.y - _loc4_ * 20;
         §V\x14b\\\x01§.y = Number(§V\x14b\\\x01§.y + _loc4_ * 20);
         if(coef == 1)
         {
            §t\x1a\x1b\x07\x03§();
         }
      }
      
      public function §YUQ9\x03§() : void
      {
         §=3a\x0e\x02§();
      }
      
      public function update(param1:*) : void
      {
         var _loc4_:* = null as pix.Sprite;
         var _loc6_:* = null as But;
         if(action != null)
         {
            action();
         }
         var _loc2_:Array = pix.Sprite.all.copy();
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc2_.length))
         {
            _loc4_ = _loc2_[_loc3_];
            _loc3_++;
            _loc4_.update();
         }
         _loc3_ = 0;
         var _loc5_:Array = buts;
         while(_loc3_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc3_];
            _loc3_++;
            _loc6_.§I-B\x02\x02§();
         }
         _loc3_ = 0;
         _loc5_ = buts;
         while(_loc3_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc3_];
            _loc3_++;
            _loc6_.§3a\x12!\x01§();
         }
         fxm.update();
         §\x018cZ\x03§();
         screen.update();
      }
      
      public function §n\x0f]P\x02§() : void
      {
         if(selection == null)
         {
            return;
         }
         selection.card.§\x19X+o\x01§();
         selection = null;
         removeHint();
      }
      
      public function §';8'§() : void
      {
         while(int(§y\x1cPQ\x03§()) < int(§V',g\x01§().length))
         {
            §\x17\x11gT§(§V',g\x01§()[0]);
         }
      }
      
      public function select(param1:§_\x19X\x13\x03§) : void
      {
         selection = param1;
         selection.card.§AQ \n\x02§();
         displayHint(selection.card.§|sq8§());
      }
      
      public function removeHint() : void
      {
         if(mcHint == null)
         {
            return;
         }
         mcHint.parent.removeChild(mcHint);
         mcHint = null;
      }
      
      public function §\x17\x11gT§(param1:§_\x19X\x13\x03§) : void
      {
         var _loc7_:* = null as §_\x19X\x13\x03§;
         var _loc2_:* = nav.§1]\x1d\x17\x01§(param1.data);
         var _loc3_:int = 60;
         _loc2_.x = Number(Num.mm(-_loc3_,Number(_loc2_.x),Cs.mcw + _loc3_));
         param1.moveTo(Number(_loc2_.x),Number(_loc2_.y));
         param1.§V[t\x11\x02§ = param1.§\x1c/=\x07\x01§;
         param1.leave = true;
         dm.over(param1);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = hand;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(!_loc7_.leave)
            {
               _loc7_.id = _loc4_;
               _loc7_.§\x01\x03\x1b(\x01§();
               _loc4_++;
            }
         }
         §\x13ET]\x02§.majPos();
         §,\x1f\r\x14\x03§(-param1.card.mojo[0]);
      }
      
      public function §\x016#+\x01§() : void
      {
         var _loc5_:* = null as §_\x19X\x13\x03§;
         var _loc6_:int = 0;
         if(int(data._plays) >= Browser.§IH\x062\x02§)
         {
            return;
         }
         if(§eJ\x16`\x02§ == null)
         {
            §eJ\x16`\x02§ = Cs.getField(16777215,8,-1,"nokia");
            dm.add(§eJ\x16`\x02§,Browser.Umu$);
            §eJ\x16`\x02§.y = Number(§\x13ET]\x02§.y + 65);
            §eJ\x16`\x02§.visible = false;
         }
         var _loc1_:String = "";
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = hand;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(!_loc5_.leave)
            {
               _loc6_ = int(_loc5_.card.data.mojo);
               _loc2_ = _loc2_ + _loc6_;
               if(_loc1_.length > 0 && _loc6_ >= 0)
               {
                  _loc1_ = _loc1_ + "+";
               }
               if(_loc1_.length > 0 && _loc6_ < 0)
               {
                  _loc1_ = _loc1_ + "-";
                  _loc6_ = int(Number(Math.abs(_loc6_)));
               }
               _loc1_ = _loc1_ + _loc6_;
            }
         }
         if(_loc1_.length == 0)
         {
            _loc1_ = "0";
         }
         _loc3_ = Cs.§n\x0e?\x1e\x01§;
         if(_loc2_ < _loc3_)
         {
            _loc1_ = Lang.§\x1bW2V\x03§ + _loc1_ + " < " + _loc3_;
         }
         else if(_loc2_ > _loc3_)
         {
            _loc1_ = Lang.§\tG@p§ + _loc1_ + " > " + _loc3_;
         }
         else
         {
            _loc1_ = Lang.START_GAME;
         }
         §eJ\x16`\x02§.text = _loc1_;
         §eJ\x16`\x02§.width = Number(§eJ\x16`\x02§.textWidth + 3);
         §eJ\x16`\x02§.x = int((Cs.mcw - §eJ\x16`\x02§.width) * 0.5);
      }
      
      public function §]0@h\x01§() : void
      {
         §\x016#+\x01§();
         §\x13ET]\x02§.setValue(§_Z_@\x03§ - §w\x1f\x03U§);
      }
      
      public function §\nMo7§(param1:Object) : void
      {
         var _loc2_:* = param1._id;
         if(_loc2_ == null)
         {
            displayError("invalid GStartSend");
         }
         else if(_loc2_ == -1)
         {
            displayError("no selected cards");
         }
         else if(_loc2_ == -2)
         {
            displayError("invalid actions points check");
         }
         else if(_loc2_ == -3)
         {
            displayError("selected cards cant be used");
         }
         else if(_loc2_ == -4)
         {
            displayError("it\'s too late for play in tournament");
         }
         if(param1._id == null || param1._id < 0)
         {
            return;
         }
         kill();
         Main.§z\x1cSD§(param1._id,param1._cards,int(param1._gid));
      }
      
      public function kill() : void
      {
         Lib.current.removeEventListener(Event.ENTER_FRAME,update);
         if(screen.parent != null)
         {
            screen.parent.removeChild(screen);
         }
      }
      
      public function §e\x1cv;§(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as TextField;
         §\f\x03h§ = new flash.display.Sprite();
         §\f\x03h§.y = Cs.mch - 12;
         dm.add(§\f\x03h§,Browser.§ZH)#\x02§);
         gt = 0;
         §\x1dfv\t\x02§ = 0;
         var _loc2_:int = 0;
         while(_loc2_ < 3)
         {
            _loc2_++;
            _loc3_ = _loc2_;
            _loc4_ = §\x19\n\t\x01§.getField(16777215,8,-1,"nokia");
            _loc4_.text = param1;
            _loc4_.width = Number(_loc4_.textWidth + 3);
            if(§\x1dfv\t\x02§ == 0)
            {
               §\x1dfv\t\x02§ = int(_loc4_.width);
            }
            _loc4_.x = §\x1dfv\t\x02§ * _loc3_;
            §\f\x03h§.addChild(_loc4_);
         }
      }
      
      public function §uU'\x1d\x03§() : void
      {
         nav = new Nav();
         nav.root.y = Browser.§fUg\x0f\x03§;
         nav.set(data._cards);
      }
      
      public function §t\x1a\x1b\x07\x03§() : void
      {
         var _loc5_:* = null as §_\x19X\x13\x03§;
         action = null;
         var _loc1_:* = Cs.§,\x13\x14X\x03§();
         dm.add(_loc1_.base,Browser.§ZH)#\x02§);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = hand;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_.push(_loc5_.card.type);
         }
         var _loc6_:* = {"_cards":_loc2_};
         Codec.load(Main.domain + "/start",_loc6_,§\nMo7§);
      }
      
      public function §Qb%g§() : void
      {
         var _loc3_:* = null as §_\x19X\x13\x03§;
         action = §U\fx\x14\x02§;
         Lib.current.stage.removeEventListener(MouseEvent.CLICK,click);
         coef = 0;
         if(§eJ\x16`\x02§ != null)
         {
            §eJ\x16`\x02§.alpha = 0;
         }
         var _loc1_:int = 0;
         var _loc2_:Array = hand;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.§=gp\x02§();
         }
      }
      
      public function initBg() : void
      {
         bg = new Element();
         bg.drawFrame(Gfx.browser.get(0),0,0);
         dm.add(bg,Browser.DP_BG);
         bgf = new Element();
         bgf.drawFrame(Gfx.§&$l3§.get(0),0,0);
         dm.add(bgf,Browser.Umu$);
         §V\x14b\\\x01§ = new Element();
         §V\x14b\\\x01§.drawFrame(Gfx.§&$l3§.get(1),0,0);
         §V\x14b\\\x01§.y = Nav.HEIGHT;
         dm.add(§V\x14b\\\x01§,Browser.§A\bW\x1b§);
      }
      
      public function §,\x1f\r\x14\x03§(param1:int) : void
      {
         §w\x1f\x03U§ = §w\x1f\x03U§ + param1;
         §\x13ET]\x02§.§F'\x0ea\x01§(§w\x1f\x03U§ >= §\x1a vx\x03§ && §w\x1f\x03U§ <= §_Z_@\x03§);
         §]0@h\x01§();
      }
      
      public function §V',g\x01§() : Array
      {
         var _loc4_:* = null as §_\x19X\x13\x03§;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = hand;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!_loc4_.leave)
            {
               _loc1_.push(_loc4_);
            }
         }
         return _loc1_;
      }
      
      public function §j^\n\x14§(param1:Array, param2:int, param3:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         Browser.TEST = Browser.TEST + 1;
         if(param3 == Cs.§n\x0e?\x1e\x01§)
         {
            return true;
         }
         if(param2 == Cs.§T!)M\x03§ || param3 > 9 || int(param1.length) == 0)
         {
            return false;
         }
         var _loc4_:Array = param1.copy();
         if(param3 > Cs.§n\x0e?\x1e\x01§)
         {
            _loc5_ = 0;
            while(_loc5_ < int(param1.length))
            {
               _loc6_ = param1[_loc5_];
               _loc5_++;
               if(int(_loc6_.mojo) > 0)
               {
                  _loc4_.remove(_loc6_);
               }
            }
         }
         while(int(_loc4_.length) > 0)
         {
            _loc6_ = _loc4_.pop();
            if(_loc6_.multi == null)
            {
               while(_loc4_.remove(_loc6_))
               {
               }
            }
            if(§j^\n\x14§(_loc4_,param2 + 1,param3 + int(_loc6_.mojo)))
            {
               return true;
            }
         }
         return false;
      }
      
      public function §\x05\x1fxE§() : int
      {
         return Browser.§fUg\x0f\x03§ + Nav.HEIGHT + Browser.§\x10~;E\x01§ + 26;
      }
      
      public function §\x02zI\x1c\x01§() : int
      {
         var _loc4_:* = null as §_\x19X\x13\x03§;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = hand;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!_loc4_.leave)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function §y\x1cPQ\x03§() : int
      {
         var _loc5_:* = null as §_\x19X\x13\x03§;
         var _loc6_:* = null as _CardType;
         var _loc1_:int = Cs.§T!)M\x03§;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = hand;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_.push(_loc5_.card.type);
         }
         _loc3_ = 0;
         while(_loc3_ < int(_loc2_.length))
         {
            _loc6_ = _loc2_[_loc3_];
            _loc3_++;
            if(_loc6_ == _CardType.PICK_AXE)
            {
               _loc1_ = 3;
            }
            if(_loc6_ == _CardType.BOUNTY)
            {
               _loc1_ = 3;
            }
            if(_loc6_ == _CardType.TRAINING)
            {
               return 1;
            }
         }
         return _loc1_;
      }
      
      public function §#\x04\x07Q\x01§(param1:String) : void
      {
         var _loc2_:TextField = §-\x13YL\x02§(param1);
         §\x1f\r\b}§(Lang.BUY_CARD,§LNn\x14\x03§);
         §\x13ET]\x02§.visible = false;
      }
      
      public function §EB\x17e\x02§() : void
      {
         displayHint(Lang.§nZ;t\x02§,0.2);
      }
      
      public function displayHint(param1:String, param2:Number = 1.0, param3:Boolean = false) : void
      {
         if(mcHint != null)
         {
            removeHint();
         }
         mcHint = new flash.display.Sprite();
         dm.add(mcHint,Browser.§ZH)#\x02§);
         var _loc4_:int = Browser.§fUg\x0f\x03§ + Nav.HEIGHT;
         var _loc5_:int = !!param3?16711680:16777215;
         var _loc6_:TextField = Cs.getField(_loc5_,8,-1,"nokia");
         var _loc7_:Boolean = true;
         _loc6_.wordWrap = _loc7_;
         _loc6_.multiline = _loc7_;
         mcHint.addChild(_loc6_);
         _loc6_.width = Cs.mcw;
         _loc6_.htmlText = param1;
         _loc6_.width = Number(_loc6_.textWidth + 6);
         _loc6_.height = Number(_loc6_.textHeight + 8);
         _loc6_.x = int((Cs.mcw - _loc6_.width) * 0.5);
         _loc6_.y = 9 + _loc4_ - int(_loc6_.textHeight * 0.5);
         _loc6_.filters = [];
         _loc6_.alpha = param2;
         if(param2 < 1)
         {
            _loc6_.blendMode = BlendMode.ADD;
         }
         else
         {
            _loc6_.filters = [new DropShadowFilter(1,90,Gfx.col("green_1"),1,0,0,100)];
         }
         if(param3)
         {
            new Blink(_loc6_,40,4,4);
         }
      }
      
      public function displayError(param1:String) : void
      {
         Log.trace(param1,{
            "fileName":"Browser.hx",
            "lineNumber":364,
            "className":"Browser",
            "methodName":"displayError"
         });
      }
      
      public function §-\x13YL\x02§(param1:String, param2:int = -1) : TextField
      {
         if(§\x02P`\x0b\x03§ != null)
         {
            §\x02P`\x0b\x03§.parent.removeChild(§\x02P`\x0b\x03§);
         }
         var _loc3_:TextField = §\x19\n\t\x01§.getField(14745548,8,param2,"nokia");
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         _loc3_.x = 100;
         _loc3_.y = 100;
         _loc3_.width = 200;
         _loc3_.htmlText = param1;
         _loc3_.height = Number(_loc3_.textHeight + 4);
         dm.add(_loc3_,Browser.§ZH)#\x02§);
         _loc3_.filters = [new DropShadowFilter(1,90,Gfx.col("green_2"),1,0,0,40)];
         §\x02P`\x0b\x03§ = _loc3_;
         return _loc3_;
      }
      
      public function click(param1:*) : void
      {
         if(nav != null && nav.active)
         {
            nav.click();
            return;
         }
         if(selection != null)
         {
            §\x17\x11gT§(selection);
         }
         if(§\x13ET]\x02§.§E\bD\x07\x02§())
         {
            §Qb%g§();
         }
      }
      
      public function §-Z'\x05\x02§() : void
      {
         while(int(buts.length) > 0)
         {
            buts.pop().kill();
         }
      }
      
      public function §m!\x13Y\x03§() : Boolean
      {
         var _loc4_:* = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = data._cards;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_._available)
            {
               _loc1_.push(Data.CARDS[_loc4_._type.index]);
            }
         }
         return Boolean(§j^\n\x14§(_loc1_,0,0));
      }
      
      public function §LNn\x14\x03§() : void
      {
         var _loc1_:URLRequest = new URLRequest(Main.domain + "/card");
         Lib.getURL(_loc1_,"_self");
      }
      
      public function §GFB*\x02§(param1:§_\x19X\x13\x03§) : void
      {
         var _loc4_:* = null as §_\x19X\x13\x03§;
         var _loc2_:int = 0;
         var _loc3_:Array = Browser.me.hand;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!_loc4_.leave)
            {
               _loc4_.§\x01\x03\x1b(\x01§();
            }
         }
         §';8'§();
         §\x13ET]\x02§.majPos();
         §,\x1f\r\x14\x03§(param1.card.mojo[0]);
      }
      
      public function §\x1f\r\b}§(param1:String, param2:Object) : But
      {
         var _loc3_:TextField = §\x02P`\x0b\x03§;
         var _loc4_:But = new But(param1,param2,[Gfx.col("green_2"),int(Col.brighten(Gfx.col("green_2"),-50))]);
         _loc4_.x = Cs.mcw * 0.5;
         _loc4_.y = Number(Number(_loc3_.y + _loc3_.height) + 8);
         dm.add(_loc4_,Browser.§ZH)#\x02§);
         Filt.glow(_loc4_.box,2,40,Gfx.col("green_0"));
         buts.push(_loc4_);
         return _loc4_;
      }
   }
}
