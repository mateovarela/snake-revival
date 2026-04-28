package
{
   import flash.Boot;
   import flash.Lib;
   import flash.display.BlendMode;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.text.TextField;
   import flash.ui.Mouse;
   import flash.utils.ByteArray;
   import fx.§\x03R-\x02§;
   import fx.§#\x1b\x07\x19\x01§;
   import fx.Brandy;
   import fx.§E!WL\x02§;
   import fx.Flash;
   import fx.Score;
   import fx.Virus;
   import haxe.Serializer;
   import haxe.Timer;
   import haxe.io.Bytes;
   import mt.DepthManager;
   import mt.Rand;
   import mt.bumdum9.Col;
   import mt.bumdum9.Filt;
   import mt.bumdum9.Num;
   import mt.fx.Manager;
   import pix.Anim;
   import pix.Screen;
   import §q'2§.Control;
   import §q'2§.Debug;
   import §q'2§.Info;
   import §q'2§.Pause;
   
   public class Game
   {
      
      public static var DP_BG:int = 0;
      
      public static var §(Xc\x05\x01§:int = 1;
      
      public static var Umu$:int = 2;
      
      public static var §\r\x0f\t2\x03§:int = 3;
      
      public static var DP_FX:int = 4;
      
      public static var §+CK;\x03§:Boolean = false;
      
      public static var §@;#Y\x03§:int = 11396971;
      
      public static var §47)3\x01§:int = 8436832;
      
      public static var MARGIN:int = 56;
      
      public static var TOP:int = 12;
      
      public static var BOTTOM:int = 4;
      
      public static var me:Game;
       
      
      public var §8m_x\x01§:Boolean;
      
      public var training:Array;
      
      public var timer:Array;
      
      public var §\x07|mh§:int;
      
      public var step:int;
      
      public var stage:Stage;
      
      public var speed:Array;
      
      public var snake:Snake;
      
      public var §(A;o\x01§:Array;
      
      public var § ;f?§:Array;
      
      public var shield:Array;
      
      public var shaker:Object;
      
      public var §S-x;\x03§:int;
      
      public var seed:Rand;
      
      public var screen:Screen;
      
      public var score:Array;
      
      public var root:flash.display.Sprite;
      
      public var §Jc\x1f\\\x03§:Array;
      
      public var §k\x175}\x01§:Object;
      
      public var §?|\x02Z§:int;
      
      public var record:Array;
      
      public var promo:Promo;
      
      public var playTime:Number;
      
      public var §\x12NF§:Pause;
      
      public var parts:Array;
      
      public var obstacles:Array;
      
      public var §\x17\x06h'\x03§:Array;
      
      public var §^\x02JU\x03§:Array;
      
      public var mode:GameMode;
      
      public var inter:Inter;
      
      public var id:Array;
      
      public var hand:Array;
      
      public var §\x0e\b$\r§:Array;
      
      public var §JO[;§:Boolean;
      
      public var gore:Boolean;
      
      public var gameLog:Object;
      
      public var fxm:Manager;
      
      public var §\b[F§:Array;
      
      public var §\x01\x11l5\x02§:Array;
      
      public var §\x11\x18|\x19\x03§:Array;
      
      public var §],Q\x02§:Boolean;
      
      public var fruits:Array;
      
      public var §CU\x06l\x02§:Array;
      
      public var §f\b\x05|\x01§:Array;
      
      public var effects:Array;
      
      public var _x_segmentsDynamites:Array;
      
      public var dm:DepthManager;
      
      public var demo:Array;
      
      public var deb:Debug;
      
      public var controlType:§o\x0f\x10E\x01§;
      
      public var click:Boolean;
      
      public var §h\x01\b\x02§:Timer;
      
      public var cards:Array;
      
      public var §1Cw\x02\x03§:Array;
      
      public var box:Object;
      
      public var bonus:Array;
      
      public var §\x02,Rg\x01§:int;
      
      public var bg:flash.display.Sprite;
      
      public var action:Function;
      
      public var §;\x1d[R\x03§:int;
      
      public function Game(param1:int = 0, param2:Array = undefined, param3:int = 0, param4:Bytes = undefined, param5:Boolean = false)
      {
         var _loc7_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         demo = [param5];
         training = [Boolean(Lambda.has(param2,_CardType.TRAINING))];
         Game.me = this;
         root = new flash.display.Sprite();
         dm = new DepthManager(root);
         fxm = new Manager();
         mt.fx.Fx.DEFAULT_MANAGER = fxm;
         id = [param1];
         hand = param2;
         §S-x;\x03§ = param3;
         seed = new Rand(param3);
         mode = GameMode.§T\x0e!'\x01§;
         §?|\x02Z§ = 0;
         record = [];
         var _loc6_:int = 0;
         while(_loc6_ < 300000)
         {
            _loc6_++;
            _loc7_ = _loc6_;
            record.push(0);
         }
         §\x17\x06h'\x03§ = [];
         if(Game.§+CK;\x03§)
         {
            Game.BOTTOM = Game.BOTTOM + 10;
         }
         initBg();
         _loc6_ = Cs.mcw - Game.MARGIN * 2;
         if(param5)
         {
            _loc6_ = 198;
         }
         stage = new Stage(_loc6_,Cs.mch - (Game.TOP + Game.BOTTOM));
         stage.setPos(Game.MARGIN,Game.TOP);
         stage.root.y = 1000;
         if(param4 != null)
         {
            §O5Y\x0b\x01§(param4);
         }
         §\x0e\b$\r§ = [0];
         §Jc\x1f\\\x03§ = [0];
         §^\x02JU\x03§ = [0];
         _x_segmentsDynamites = [0];
         gameLog = {
            "fruits":[],
            "bonus":[],
            "rec":null,
            "score":0,
            "\b[F":0,
            "?[Qy\x01":0,
            "chrono":0
         };
         parts = [];
         fruits = [];
         bonus = [];
         obstacles = [];
         effects = [];
         §f\b\x05|\x01§ = Cs.§;\rFd\x03§.copy();
         score = [0];
         §\x01\x11l5\x02§ = [0];
         §\b[F§ = [Cs.§Sw\\\x01§];
         §\x11\x18|\x19\x03§ = [Cs.§4@Ua\x03§];
         §CU\x06l\x02§ = [Cs.§]-a8\x01§];
         speed = [0];
         §;\x1d[R\x03§ = 0;
         shield = [0];
         § ;f?§ = [0];
         §(A;o\x01§ = [3];
         §],Q\x02§ = false;
         Bonus.§8!P$\x02§();
         §\x0fm{A§(param2);
         initInter();
         Keyb.init();
         Keyb.actions[80] = §Q(\x17\x1d\x01§;
         Keyb.§@\x14U&\x03§ = §Q(\x17\x1d\x01§;
         Keyb.actions[13] = §Q(\x17\x1d\x01§;
         Keyb.actions[68] = §\x1cX\x1f1\x03§;
         if(§k\x175}\x01§ != null)
         {
            Keyb.actions[109] = function(param1:Function, param2:int):Function
            {
               var f:Function = param1;
               var a1:int = param2;
               return function():void
               {
                  return f(a1);
               };
            }(§\x0fk\x04%§,-1);
            Keyb.actions[107] = function(param1:Function, param2:int):Function
            {
               var f:Function = param1;
               var a1:int = param2;
               return function():void
               {
                  return f(a1);
               };
            }(§\x0fk\x04%§,1);
         }
         var _loc8_:SharedObject = SharedObject.getLocal("snake");
         if(training[0])
         {
            new Info(Lang.§z\x14im\x02§,Lang.§=7'(\x02§,8);
         }
         else if((_loc8_.data.§+(5V\x02§ == null || _loc8_.data.§+(5V\x02§ < 8) && !param5 && mode == GameMode.§T\x0e!'\x01§)
         {
            new Control(§[\x16u\x01\x01§);
         }
         else
         {
            §[\x16u\x01\x01§();
         }
         Lib.current.stage.addEventListener(Event.DEACTIVATE,§\x0f\x1f;\x06\x02§);
         _loc7_ = 2;
         screen = new Screen(root,Cs.mcw * _loc7_,Cs.mch * _loc7_,_loc7_);
         Main.dm.add(screen,1);
         screen.update();
      }
      
      public static function §BQ(d§(param1:int) : Object
      {
         var _loc2_:int = 6;
         var _loc3_:int = int((Cs.mch - (3 * Card.HEIGHT + 2 * _loc2_)) * 0.5);
         var _loc4_:int = int(param1 / 3) * 2 - 1;
         var _loc5_:Number = Cs.mcw * 0.5;
         var _loc6_:Number = Number(_loc5_ + (_loc5_ - (Number(6 + Card.§;\x057\x02§ * 0.5))) * _loc4_);
         var _loc7_:Number = Number(Number(_loc3_ + Card.HEIGHT * 0.5) + int(param1 % 3) * (Card.HEIGHT + _loc2_));
         return {
            "x":int(_loc6_),
            "y":int(_loc7_)
         };
      }
      
      public function §-3^C\x02§() : void
      {
         var _loc1_:Number = NaN;
         if(int(§^\x02JU\x03§[0] % 2) == 0)
         {
            return;
         }
         screen.x = Number(shaker.dx);
         screen.y = Number(shaker.dy);
         shaker.dx = shaker.dx * -shaker.fr;
         shaker.dy = shaker.dy * -shaker.fr;
         if(Number(Number(Math.abs(Number(shaker.dx))) + Number(Math.abs(Number(shaker.dy)))) < 1)
         {
            shaker = null;
            _loc1_ = 0;
            screen.y = _loc1_;
            screen.x = _loc1_;
         }
      }
      
      public function updatePlay() : void
      {
         var _loc2_:* = null as Point;
         var _loc5_:* = null as Fruit;
         §\x0e\b$\r§ = [§\x0e\b$\r§[0] + 1];
         §Jc\x1f\\\x03§ = [§Jc\x1f\\\x03§[0] + 1];
         if(mode == GameMode.§T\x0e!'\x01§)
         {
            control();
         }
         if(mode == GameMode.§\nu((\x02§)
         {
            replay();
         }
         snake.update();
         inter.§\rs;\x07\x03§(int(Game.me.getTime()));
         inter.frutibar.update();
         inter.§\x05\x13iv\x03§();
         var _loc1_:int = §;\x1d[R\x03§;
         §;\x1d[R\x03§ = §;\x1d[R\x03§ + 1;
         if(_loc1_ == 100)
         {
            §;\x1d[R\x03§ = 0;
            _x_augmenterVitesse(Cs.§\x1a60^\x02§);
         }
         while(int(§\x17\x06h'\x03§.length) < 5)
         {
            _loc2_ = stage.§;*\x13(\x02§(20,40);
            §\x17\x06h'\x03§.push(_loc2_);
         }
         _loc1_ = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = fruits;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(!_loc5_.has(_x_TYPE.Shit))
            {
               _loc1_++;
            }
         }
         if(have(_CardType.ACE_SPADES))
         {
            _loc1_ = _loc1_ - int(_x_nbCartesRetournees());
         }
         if(have(_CardType.SMALL_BELLS) && _loc1_ <= 1 + int(§2~\f#\x03§(_CardType.SQUIRREL)))
         {
            _loc1_ = 0;
         }
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         _loc3_ = _loc1_ * §CU\x06l\x02§[0];
         var _loc6_:Rand = seed;
         var _loc7_:Number = _loc6_.seed * 16807 % 2147483647;
         _loc6_.seed = _loc7_;
         if(int((int(_loc7_) & 1073741823) % _loc3_) == 0)
         {
            §S\x04d\f\x02§();
         }
         Bonus.XePH();
         if(int(§\x0e\b$\r§[0] % 10) == 0)
         {
            _x_remplirBouclier(0.015);
         }
      }
      
      public function §+F*!\x01§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as Card;
         switch(§\x07|mh§)
         {
            case 0:
               timer = [timer[0] + 1];
               _loc1_ = 20;
               _loc2_ = timer[0] / _loc1_;
               _loc3_ = 0.5 - §\x19\n\t\x01§.cos(_loc2_ * 3.14) * 0.5;
               stage.root.y = Number(Game.TOP + 400 * (1 - _loc2_));
               inter.root.y = -(int(14 * (1 - _loc3_)));
               if(timer[0] == _loc1_)
               {
                  timer = [0];
                  §\x07|mh§ = §\x07|mh§ + 1;
               }
               break;
            case 1:
               timer = [timer[0] + 1];
               if(timer[0] > 5)
               {
                  _loc4_ = true;
                  _loc1_ = 0;
                  _loc5_ = cards;
                  while(_loc1_ < int(_loc5_.length))
                  {
                     _loc6_ = _loc5_[_loc1_];
                     _loc1_++;
                     if(!_loc6_.active[0])
                     {
                        _loc4_ = false;
                        _loc6_.§\x0eX\x1c4\x01§();
                        break;
                     }
                  }
                  timer = [0];
                  if(_loc4_)
                  {
                     initPlay();
                     break;
                  }
                  break;
               }
         }
      }
      
      public function §\x10\x05%3\x02§() : void
      {
         timer = [timer[0] + 1];
         snake.death();
         if(timer[0] >= 100 && int(snake.queue.length) == 0)
         {
            endGame();
         }
      }
      
      public function §67\x04w\x02§() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         timer = [timer[0] + 1];
         switch(step)
         {
            case 0:
               _loc1_ = timer[0] / 20;
               snake.§7\x04V,\x03§(_loc1_);
               if(timer[0] == 20)
               {
                  _loc2_ = int(score[0] * 0.2);
                  _x_addPoints(_loc2_,snake.x,snake.y);
                  snake.§U{\x04\\§();
                  snake.kill();
                  timer = [0];
                  step = step + 1;
               }
               break;
            case 1:
               if(timer[0] > 20)
               {
                  endGame();
                  break;
               }
         }
      }
      
      public function §asy\t\x01§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Card;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:* = null as flash.display.Sprite;
         timer = [timer[0] + 1];
         switch(step)
         {
            case 0:
               _loc1_ = 50;
               _loc2_ = timer[0] / _loc1_;
               Col.setPercentColor(Stage.me.root,_loc2_,Gfx.col("green_1"));
               inter.root.y = inter.root.y - int(_loc2_ * 16);
               _loc3_ = 0;
               _loc4_ = cards;
               while(_loc3_ < int(_loc4_.length))
               {
                  _loc5_ = _loc4_[_loc3_];
                  _loc3_++;
                  _loc6_ = _loc5_.id[0] * 0.1;
                  _loc7_ = Number(Num.mm(0,(_loc2_ - _loc6_) / (1 - _loc6_),1));
                  _loc8_ = int(_loc5_.id[0] / 3) * 2 - 1;
                  _loc9_ = _loc5_.sprite;
                  _loc9_.x = Number(_loc9_.x + int(_loc7_ * 16) * _loc8_);
               }
               if(timer[0] == _loc1_)
               {
                  step = step + 1;
                  timer = [0];
                  box = Cs.§,\x13\x14X\x03§();
                  dm.add(box.base,3);
                  §t\x03\x0b\f§(int(box.n));
                  stage.kill();
                  §h\x01\b\x02§ = new Timer(Data.§J\x06F?§);
                  §h\x01\b\x02§.run = §\x13s\x01\x06\x02§;
               }
               break;
            case 1:
               break;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               break;
            case 10:
               _loc1_ = 30;
               _loc3_ = int(timer[0] / 5);
               if(_loc3_ < int(cards.length))
               {
                  _loc5_ = cards[_loc3_];
                  if(_loc5_.active[0])
                  {
                     _loc5_.§\x1b\x03\x11K\x02§();
                  }
               }
               if(timer[0] == _loc1_)
               {
                  timer = [0];
                  step = step + 1;
               }
               break;
            case 11:
               Col.setColor(stage.root,0,timer[0] * 30);
               if(timer[0] > 10)
               {
                  Main.§Z\x17\x18&\x02§();
                  Main.§Ym'*\x03§();
                  break;
               }
         }
      }
      
      public function §\\2oh\x02§() : void
      {
         promo.update();
      }
      
      public function §;\x0bF\b§(param1:*) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 1;
         if(§k\x175}\x01§ != null)
         {
            _loc2_ = int(Number(Math.pow(2,§k\x175}\x01§)));
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc3_++;
            _loc4_ = _loc3_;
            §8m_x\x01§ = _loc4_ == _loc2_ - 1;
            update();
         }
      }
      
      public function update() : void
      {
         var _loc3_:* = null as Fx;
         var _loc5_:* = null as Card;
         var _loc6_:* = null as pix.Sprite;
         var _loc8_:* = null as Part;
         §^\x02JU\x03§ = [§^\x02JU\x03§[0] + 1];
         if(§\x12NF§ != null)
         {
            §\x12NF§.update();
            if(screen != null)
            {
               screen.update();
            }
            return;
         }
         if(action != null)
         {
            action();
         }
         Lib.current.stage.focus = Lib.current.stage;
         var _loc1_:Array = effects.copy();
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            _loc3_.update();
         }
         fxm.update();
         _loc2_ = 0;
         var _loc4_:Array = cards;
         while(_loc2_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc2_];
            _loc2_++;
            _loc5_.update();
         }
         _loc4_ = pix.Sprite.all.copy();
         _loc2_ = 0;
         while(_loc2_ < int(_loc4_.length))
         {
            _loc6_ = _loc4_[_loc2_];
            _loc2_++;
            _loc6_.update();
         }
         var _loc7_:Array = parts.copy();
         _loc2_ = 0;
         while(_loc2_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc2_];
            _loc2_++;
            _loc8_.update();
         }
         if(screen != null && §8m_x\x01§)
         {
            screen.update();
         }
         if(shaker != null)
         {
            §-3^C\x02§();
         }
         if(demo[0])
         {
            §\\2oh\x02§();
         }
      }
      
      public function §Q(\x17\x1d\x01§() : void
      {
         if(Main.§tt%\f\x02§ == null || Main.§tt%\f\x02§._draft != null)
         {
            return;
         }
         if((action != updatePlay || demo[0]) && §\x12NF§ == null)
         {
            return;
         }
         if(§\x12NF§ == null)
         {
            §\x12NF§ = new Pause();
            return;
         }
         §\x12NF§.fadeOut();
      }
      
      public function §\x17W\x1a\r\x01§() : void
      {
         §],Q\x02§ = !§],Q\x02§;
         inter.frutibar.filters = [];
         Filt.grey(inter.frutibar,!!§],Q\x02§?1:0);
         inter.frutibar.blendMode = !!§],Q\x02§?BlendMode.OVERLAY:BlendMode.NORMAL;
      }
      
      public function §\x1cX\x1f1\x03§() : void
      {
         if(!Keyb.§\x15(@1\x02§())
         {
            return;
         }
         if(deb == null)
         {
            deb = new Debug();
            return;
         }
         deb.kill();
         deb = null;
      }
      
      public function stopPlay() : void
      {
         var _loc3_:* = null as Card;
         playTime = Date.now().getTime() - playTime;
         var _loc1_:int = 0;
         var _loc2_:Array = cards;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_._x_effetALaMort();
         }
         action = null;
      }
      
      public function _x_creerFruitType(param1:_x_TYPE = undefined) : void
      {
         var _loc2_:int = int(_x_genererIdFruit());
         if(param1 != null)
         {
            _loc2_ = int(Fruit.getNearest(_loc2_,param1));
         }
         var _loc3_:Fruit = Fruit.get(_loc2_);
         var _loc4_:Point = stage.§;*\x13(\x02§(20,40);
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         _loc3_.updatePos();
         _loc3_._x_creerFruitType();
      }
      
      public function §S\x04d\f\x02§() : void
      {
         var _loc3_:* = null as Rand;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc1_:int = int(_x_genererIdFruit());
         var _loc2_:Boolean = false;
         if(Game.me.have(_CardType.SURPRISE) && int((int(_loc4_) & 1073741823) % 5) == 0 && §\x0e\b$\r§[0] > 100)
         {
            _loc5_ = int(int(__fruitList.LIST.length) * 0.4);
            _loc3_ = Game.me.seed;
            _loc4_ = _loc3_.seed * 16807 % 2147483647;
            _loc3_.seed = _loc4_;
            _loc1_ = int(__fruitList.LIST.length) - (12 + int((int(_loc4_) & 1073741823) % _loc5_));
            if(Game.me.have(_CardType.DOLPHIN))
            {
               _loc3_ = Game.me.seed;
               _loc4_ = _loc3_.seed * 16807 % 2147483647;
               _loc3_.seed = _loc4_;
               _loc1_ = 50 + int((int(_loc4_) & 1073741823) % 100);
            }
            Game.me.§iD\b\x10§(_CardType.SURPRISE).flip();
            _loc2_ = true;
         }
         var _loc6_:Fruit = Fruit.get(_loc1_);
         var _loc7_:Point = §\x17\x06h'\x03§.shift();
         _loc6_.x = _loc7_.x;
         _loc6_.y = _loc7_.y;
         _loc6_.updatePos();
         if(_loc2_)
         {
            _loc6_._x_creerFruitType();
         }
      }
      
      public function §((*\x01§(param1:Object, param2:int, param3:String) : void
      {
         if(param3 == null)
         {
            param3 = "???";
         }
         var _loc4_:flash.display.Sprite = new flash.display.Sprite();
         var _loc5_:int = 31;
         var _loc6_:Avatar = new Avatar(_loc5_,param1._avatar);
         _loc4_.addChild(_loc6_);
         var _loc7_:TextField = Cs.getField(16777215,8,-1,"nokia");
         _loc7_.alpha = 0.8;
         _loc7_.text = param1._name;
         _loc7_.width = Number(_loc7_.textWidth + 3);
         _loc7_.y = -1;
         _loc4_.addChild(_loc7_);
         var _loc8_:TextField = Cs.getField(16777215,8,-1,"nokia");
         _loc8_.text = Std.string(param2);
         _loc8_.width = Number(_loc8_.textWidth + 3);
         _loc8_.y = 10;
         _loc4_.addChild(_loc8_);
         _loc8_.filters = [new GlowFilter(0,0.4,2,2,1)];
         var _loc9_:TextField = Cs.getField(16777215,8,-1);
         _loc9_.text = param3;
         _loc9_.width = Number(_loc9_.textWidth + 3);
         _loc9_.y = 21;
         _loc4_.addChild(_loc9_);
         _loc9_.filters = [new GlowFilter(0,0.4,2,2,1)];
         var _loc10_:int = 2;
         var _loc11_:int = 11;
         var _loc12_:Number = Number(_loc5_ + Number(Math.max(Number(Math.max(_loc7_.width,_loc8_.width)),_loc9_.width)));
         _loc4_.graphics.beginFill(Gfx.col("green_0"));
         _loc4_.graphics.drawRect(0,0,_loc12_,_loc5_);
         _loc4_.graphics.beginFill(Gfx.col("red_0"));
         _loc4_.graphics.drawRect(0,0,_loc12_,_loc11_);
         _loc4_.graphics.beginFill(int(Col.brighten(Gfx.col("green_0"),-20)));
         _loc4_.graphics.drawRect(0,22,_loc12_,9);
         _loc4_.x = Cs.mcw - _loc12_ - _loc10_;
         _loc4_.y = Cs.mch - _loc5_ - _loc10_;
         dm.add(_loc4_,Game.§\r\x0f\t2\x03§);
         Filt.glow(_loc4_,2,40,16777215);
         _loc7_.x = _loc5_ + int((_loc12_ - _loc5_ - _loc7_.width) * 0.5);
         _loc9_.x = _loc5_ + int((_loc12_ - _loc5_ - _loc9_.width) * 0.5);
         _loc8_.x = _loc5_ + int((_loc12_ - _loc5_ - _loc8_.width) * 0.5);
      }
      
      public function shake(param1:Number, param2:Number, param3:Number = 0.5) : void
      {
         shaker = {
            "dx":param1,
            "dy":param2,
            "fr":param3
         };
      }
      
      public function §L\x1e9\x02§(param1:Object) : void
      {
         if(param1 == null)
         {
            param1 = true;
         }
         gore = param1;
         var _loc2_:Number = -3866110;
         var _loc3_:Number = -3342456;
         var _loc4_:Number = -6032551;
         _loc2_ = 4291101186;
         _loc3_ = 4291624840;
         if(gore)
         {
            Gfx.§\x1aa$\x01\x01§(Gfx.§ LtL\x02§,_loc3_,_loc2_);
         }
         else
         {
            Gfx.§\x1aa$\x01\x01§(Gfx.§ LtL\x02§,_loc2_,_loc3_);
         }
      }
      
      public function §\n\x0b#\t\x03§(param1:§o\x0f\x10E\x01§) : void
      {
         if(controlType != null)
         {
            if(!int(controlType.index))
            {
               Lib.current.stage.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
               Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
            }
         }
         controlType = param1;
         if(controlType == null)
         {
            controlType = §o\x0f\x10E\x01§.§a)}j\x03§;
         }
         if(!int(controlType.index))
         {
            Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
            Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
         }
         if(§\x03R-\x02§.me != null)
         {
            §\x03R-\x02§.me.update();
         }
      }
      
      public function §r\x0be8\x03§(param1:uint) : void
      {
         bg.graphics.clear();
         bg.graphics.beginFill(param1);
         bg.graphics.drawRect(0,0,Cs.mcw,Cs.mch);
         bg.graphics.endFill();
      }
      
      public function §t\x03\x0b\f§(param1:int) : void
      {
         var _loc2_:* = {
            "_id":id[0],
            "_score":score[0],
            "_fruits":gameLog.fruits,
            "_record":gameLog.rec,
            "_tr":param1,
            "_pt":playTime,
            "_tra":§Jc\x1f\\\x03§[0] * Data.§\x0b8j8\x03§ / playTime
         };
         switch(int(mode.index))
         {
            case 0:
               Codec.displayError = function(param1:*):void
               {
               };
               Codec.load(Main.domain + "/end",_loc2_,§z\b+\x01§);
               break;
            case 1:
               §z\b+\x01§({
                  "_progression":[],
                  "_err":0
               });
         }
      }
      
      public function replay() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = record.shift();
         var _loc2_:* = _loc1_;
         if(_loc2_ != 0)
         {
            if(_loc2_ == 1)
            {
               snake.turn(-1);
            }
            else if(_loc2_ == 2)
            {
               snake.turn(1);
            }
         }
         while(int(record.length) > 0)
         {
            _loc3_ = int(record[0]);
            if(_loc3_ <= 2)
            {
               break;
            }
            record.shift();
            switch(_loc3_)
            {
               default:
               default:
               default:
                  continue;
               case 3:
                  snake.thrusting = true;
                  continue;
               case 4:
               case 5:
               case 6:
               case 7:
               case 8:
               case 9:
                  cards[_loc3_ - 4].action();
                  continue;
            }
         }
      }
      
      public function §\x1apb'\x02§(param1:Object) : void
      {
         obstacles.remove(param1);
      }
      
      public function §ChP'\x01§(param1:int) : void
      {
         record[§?|\x02Z§] = param1;
         §?|\x02Z§ = §?|\x02Z§ + 1;
      }
      
      public function §N~d\x01§() : Boolean
      {
         if(shield[0] <= 0)
         {
            return false;
         }
         shield = [shield[0] - 1];
         inter.§\x1dpZ$\x03§();
         if(have(_CardType.WRENCH,true))
         {
            _x_augmenteFruitibar(int(§2~\f#\x03§(_CardType.WRENCH)));
         }
         if(Game.me.have(_CardType.§xu1\x03§) && Boolean(have(_CardType.EGG_SHELL,true)))
         {
            Game.me._x_creerFruitType(_x_TYPE.Nut);
         }
         return true;
      }
      
      public function onMouseUp(param1:*) : void
      {
         click = false;
      }
      
      public function onMouseDown(param1:*) : void
      {
         click = true;
      }
      
      public function §\x0f\x1f;\x06\x02§(param1:*) : void
      {
         if(§\x12NF§ == null && !demo[0] && §k\x175}\x01§ == null)
         {
            §Q(\x17\x1d\x01§();
         }
      }
      
      public function §2~\f#\x03§(param1:_CardType) : int
      {
         var _loc5_:* = null as Card;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = cards;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.type == param1 && _loc5_.active[0])
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public function _x_nbCartesRetournees() : int
      {
         var _loc4_:* = null as Card;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = cards;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!_loc4_.active[0])
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function kill() : void
      {
         pix.Sprite.all = [];
         screen.kill();
         screen = null;
         Main.game = null;
      }
      
      public function §O5Y\x0b\x01§(param1:Bytes) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as pix.Sprite;
         var _loc2_:Array = [];
         var _loc3_:ByteArray = param1.b;
         _loc3_.uncompress();
         var _loc4_:int = 0;
         var _loc5_:int = _loc3_.length;
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc2_.push(int(_loc3_.readByte()));
         }
         record = _loc2_;
         mode = GameMode.§\nu((\x02§;
         if(!demo[0])
         {
            _loc7_ = new pix.Sprite();
            _loc7_.setAlign(0,0);
            stage.dm.add(_loc7_,Stage.DP_FX);
            _loc7_.setAnim(Gfx.fx.getAnim("record"));
            §k\x175}\x01§ = 0;
         }
      }
      
      public function initPlay() : void
      {
         playTime = Number(Date.now().getTime());
         action = updatePlay;
         §1Cw\x02\x03§ = [];
         snake.dead = false;
      }
      
      public function §dA;e\x02§() : void
      {
         var _loc1_:SharedObject = SharedObject.getLocal("snake");
         §\n\x0b#\t\x03§(§\x19\n\t\x01§.getEnum(§o\x0f\x10E\x01§,_loc1_.data.controlType));
         §L\x1e9\x02§(_loc1_.data.gore);
         §JO[;§ = true;
         §\x02,Rg\x01§ = !!gore?16711680:13434760;
      }
      
      public function §[\x16u\x01\x01§() : void
      {
         action = §+F*!\x01§;
         timer = [0];
         §\x07|mh§ = 0;
         inter.root.y = inter.root.y - 15;
         snake = new Snake();
         §dA;e\x02§();
         if(demo[0])
         {
            §XJ\x16q\x01§();
         }
      }
      
      public function initInter() : void
      {
         inter = new Inter();
      }
      
      public function §XJ\x16q\x01§() : void
      {
         §\x07|mh§ = 1;
         stage.root.y = Game.TOP;
         inter.root.y = 0;
         promo = new Promo();
         promo.x = Game.MARGIN + 203;
         promo.y = 5;
         dm.add(promo,Game.DP_BG);
         var _loc1_:Flash = new Flash(stage.root,0.1);
         _loc1_.update();
      }
      
      public function §\x0fm{A§(param1:Array) : void
      {
         var _loc3_:* = null as _CardType;
         var _loc4_:* = null as Card;
         var _loc5_:* = null as flash.display.Sprite;
         var _loc6_:* = null;
         cards = [];
         var _loc2_:int = 0;
         while(_loc2_ < int(param1.length))
         {
            _loc3_ = param1[_loc2_];
            _loc2_++;
            _loc4_ = new Card(_loc3_);
            _loc4_.id = [int(cards.length)];
            _loc5_ = _loc4_.sprite;
            _loc6_ = Game.§BQ(d§(_loc4_.id[0]);
            _loc5_.x = int(_loc6_.x);
            _loc5_.y = int(_loc6_.y);
            dm.add(_loc5_,Game.§(Xc\x05\x01§);
            cards.push(_loc4_);
         }
      }
      
      public function initBg() : void
      {
         bg = new flash.display.Sprite();
         dm.add(bg,Game.DP_BG);
         §r\x0be8\x03§(Gfx.col("green_1"));
      }
      
      public function _x_augmenterVitesse(param1:Number) : void
      {
         speed = [Number(Num.mm(0,Number(speed[0] + param1),10000))];
      }
      
      public function _x_remplirBouclier(param1:Number) : void
      {
         if(shield[0] == §(A;o\x01§[0])
         {
            return;
         }
         § ;f?§ = [Number(§ ;f?§[0] + param1)];
         if(§ ;f?§[0] >= 1)
         {
            § ;f?§ = [0];
            shield = [shield[0] + 1];
         }
         inter.§\x1dpZ$\x03§();
      }
      
      public function _x_addPoints(param1:int, param2:Object = undefined, param3:Object = undefined) : void
      {
         score = [score[0] + param1];
         if(score[0] < 0)
         {
            score = [0];
         }
         inter._x_leaderboardScore();
         if(param2 != null && !Game.me.have(_CardType.EGG_SHELL))
         {
            new Score(param2,param3,param1);
         }
      }
      
      public function §\x0fk\x04%§(param1:int) : void
      {
         §k\x175}\x01§ = §k\x175}\x01§ + param1;
         if(§k\x175}\x01§ < 0)
         {
            §k\x175}\x01§ = 0;
         }
         if(§k\x175}\x01§ > 5)
         {
            §k\x175}\x01§ = 5;
         }
      }
      
      public function _x_augmenteFruitibar(param1:Number) : void
      {
         if(§],Q\x02§)
         {
            return;
         }
         var _loc2_:int = int(§-G\x1eA\x03§());
         §\x01\x11l5\x02§ = [Number(Num.mm(_loc2_,Number(§\x01\x11l5\x02§[0] + param1),§\b[F§[0]))];
         inter._x_updateSpriteFruitibar(§\x01\x11l5\x02§[0] / §\b[F§[0]);
         gameLog.§\b[F§ = Number(Math.max(§\x01\x11l5\x02§[0],Number(gameLog.§\b[F§)));
      }
      
      public function _x_groupeCartes(param1:Array) : Boolean
      {
         var _loc3_:* = null as _CardType;
         var _loc2_:int = 0;
         while(_loc2_ < int(param1.length))
         {
            _loc3_ = param1[_loc2_];
            _loc2_++;
            if(!have(_loc3_))
            {
               return false;
            }
         }
         return true;
      }
      
      public function have(param1:_CardType, param2:Boolean = false, param3:Boolean = false) : Boolean
      {
         var _loc7_:* = null as Card;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Array = cards;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(_loc7_.type == param1)
            {
               if(_loc7_.active[0])
               {
                  if(!param3 || _loc7_.cooldown[0] == 0)
                  {
                     _loc4_ = true;
                     if(param2)
                     {
                        _loc7_.§\x0fB}F\x03§();
                     }
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function getTime() : int
      {
         return §\x0e\b$\r§[0] * 25;
      }
      
      public function _x_genererIdFruit(param1:Object = undefined, param2:int = 0) : int
      {
         var _loc3_:* = null as Rand;
         var _loc4_:Number = NaN;
         var _loc11_:Number = NaN;
         if(param1 == null)
         {
            _loc3_ = seed;
            _loc4_ = _loc3_.seed * 16807 % 2147483647;
            _loc3_.seed = _loc4_;
            param1 = int((int(_loc4_) & 1073741823) % 10007) / 10007;
         }
         if(have(_CardType.TRAINING))
         {
            return 5;
         }
         var _loc5_:int = 0;
         if(have(_CardType.__TAPIS))
         {
            _loc5_ = int(§\x01\x11l5\x02§[0] / §\b[F§[0] * 60);
         }
         _loc4_ = 300 / (Number(100 + §\x01\x11l5\x02§[0] * 2));
         var _loc6_:Number = Number(Math.pow(param1,_loc4_));
         var _loc7_:Number = int(__fruitList.LIST.length) - 1 - (1 - §\x01\x11l5\x02§[0] / §\b[F§[0]) * §\x11\x18|\x19\x03§[0];
         var _loc8_:Number = _loc7_ - _loc5_;
         var _loc9_:int = _loc5_ + int(Math.round(_loc6_ * _loc8_));
         var _loc10_:* = Fruit.getData(_loc9_);
         _loc3_ = Game.me.seed;
         _loc11_ = _loc3_.seed * 16807 % 2147483647;
         _loc3_.seed = _loc11_;
         if(int((int(_loc11_) & 1073741823) % int(_loc10_.§\x0e-EY\x01§)) > 0 && param2 < 20)
         {
            return int(_x_genererIdFruit(_loc6_,param2 + 1));
         }
         if(Virus.me != null && !Virus.me.§l\x16/\x01§(_loc10_))
         {
            return int(_x_genererIdFruit(null,param2 + 1));
         }
         if(Game.me.have(_CardType.IDOL) && int((int(_loc11_) & 1073741823) % 8) == 0)
         {
            _loc9_ = int(Fruit.getNearest(_loc9_,null));
         }
         if(Game.me.have(_CardType.BOYCOTT) && _loc9_ == 0 && param2 < 20)
         {
            return int(_x_genererIdFruit(null,param2 + 1));
         }
         if(Game.me.have(_CardType._x_SERRE) && Boolean(Game.me.have(_CardType._x_LEAF)))
         {
            _loc9_ = int(Fruit.getNearest(_loc9_,_x_TYPE.Green));
         }
         if(int(Cs.§@f2[\x02§.length) > 0)
         {
            _loc3_ = Game.me.seed;
            _loc11_ = _loc3_.seed * 16807 % 2147483647;
            _loc3_.seed = _loc11_;
            return int(Cs.§@f2[\x02§[int((int(_loc11_) & 1073741823) % int(Cs.§@f2[\x02§.length))]);
         }
         if(Cs.§v\x1e\x1d=\x03§ != null && int((int(_loc11_) & 1073741823) % 3) != 0)
         {
            _loc9_ = int(Fruit.getNearest(_loc9_,Cs.§v\x1e\x1d=\x03§));
         }
         return _loc9_;
      }
      
      public function §\beCB§(param1:Number, param2:Number, param3:Number) : int
      {
         var _loc4_:* = Cs.§\x0b@;v\x01§(Stage.me.root);
         _loc4_.x = Number(Number(_loc4_.x) + Number(Brandy.DECAL.x));
         _loc4_.y = Number(Number(_loc4_.y) + Number(Brandy.DECAL.y));
         var _loc5_:Number = _loc4_.x - param1;
         var _loc6_:Number = _loc4_.y - param2;
         var _loc7_:Number = Number(Math.atan2(_loc6_,_loc5_));
         var _loc8_:Number = Number(Num.hMod(_loc7_ - param3,3.14));
         var _loc9_:Number = 0.05;
         var _loc10_:int = 0;
         if(_loc8_ < -_loc9_)
         {
            _loc10_ = -1;
         }
         if(_loc8_ > _loc9_)
         {
            _loc10_ = 1;
         }
         return _loc10_;
      }
      
      public function §H\\el\x01§() : int
      {
         var _loc4_:* = null as Card;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = cards;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ = _loc1_ + _loc4_.type.index;
         }
         return _loc1_;
      }
      
      public function §-G\x1eA\x03§() : int
      {
         var _loc1_:int = 0;
         if(Game.me.have(_CardType.CROISSANT))
         {
            _loc1_ = 30 + 10 * int(§2~\f#\x03§(_CardType._x_STAR_SHOOTING));
         }
         return _loc1_;
      }
      
      public function §u{\x06D\x02§() : Object
      {
         return §f\b\x05|\x01§.shift();
      }
      
      public function §iD\b\x10§(param1:_CardType, param2:Boolean = false) : Card
      {
         var _loc5_:* = null as Card;
         var _loc3_:int = 0;
         var _loc4_:Array = cards;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.type == param1 && _loc5_.active[0] && (_loc5_.cooldown[0] == 0 || !param2))
            {
               return _loc5_;
            }
         }
         return null;
      }
      
      public function §\x07~\x016\x01§() : void
      {
         Inter.me.§}k\x1c\x0b\x01§(false);
         stopPlay();
         timer = [0];
         action = §\x10\x05%3\x02§;
         snake.§\x0bH\x0eE\x02§(0);
         if(Game.me.have(_CardType.ANKH,true))
         {
            new §#\x1b\x07\x19\x01§();
         }
         if(Game.me.have(_CardType.TRAINING))
         {
            new §E!WL\x02§();
         }
      }
      
      public function exit() : void
      {
         var _loc3_:* = null as Card;
         var _loc1_:int = 0;
         var _loc2_:Array = cards;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_._x_effetALaMort();
         }
         timer = [0];
         step = 0;
         action = §67\x04w\x02§;
      }
      
      public function endGame() : void
      {
         var _loc4_:int = 0;
         while(int(effects.length) > 0)
         {
            effects.pop().kill();
         }
         §cuO9\x01§();
         gameLog.score = score[0];
         record = record.slice(0,§?|\x02Z§);
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:int = 0;
         var _loc3_:Array = record;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = int(_loc3_[_loc2_]);
            _loc2_++;
            _loc1_.writeByte(_loc4_);
         }
         _loc1_.compress();
         gameLog.rec = Bytes.ofData(_loc1_);
         action = §asy\t\x01§;
         step = 0;
         timer = [0];
         Mouse.show();
         if(demo[0])
         {
            step = 10;
         }
      }
      
      public function §{0\x1a3\x02§() : void
      {
         var _loc3_:* = null as Card;
         var _loc5_:int = 0;
         var _loc6_:* = null as BonusType;
         var _loc7_:int = 0;
         box = Cs.§,\x13\x14X\x03§();
         inter.root.visible = false;
         var _loc1_:int = 0;
         var _loc2_:Array = cards;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.sprite.visible = false;
         }
         gameLog.score = int(Std.random(3500)) * 10;
         gameLog.§?[Qy\x01§ = Math.random() * 300;
         gameLog.§\b[F§ = Math.random() * 100;
         gameLog.chrono = Math.random() * 180000;
         _loc1_ = int(Std.random(7));
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc4_++;
            _loc5_ = _loc4_;
            _loc6_ = Cs.getEnum(BonusType,int(Std.random(10)));
            gameLog.bonus.push(_loc6_);
         }
         _loc2_ = [];
         _loc4_ = 1 + int(Std.random(12));
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc5_++;
            _loc7_ = _loc5_;
            _loc2_.push({
               "_id":int(Std.random(160)),
               "_lvl":int(Std.random(5)) + 1
            });
         }
         §z\b+\x01§({
            "_progression":_loc2_,
            "_err":0
         });
      }
      
      public function §z\b+\x01§(param1:Object) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null as §CXs2\x01§;
         var _loc12_:* = null;
         if(box != null)
         {
            box.base.parent.removeChild(box.base);
            box = null;
         }
         if(§h\x01\b\x02§ != null)
         {
            §h\x01\b\x02§.stop();
         }
         var a:Array = [];
         var _loc2_:int = 3;
         var _loc3_:* = Gfx.col("green_1");
         var _loc4_:Rand = new Rand(0);
         _loc4_.initSeed(int(§H\\el\x01§()));
         var _loc5_:Array = null;
         _loc6_ = _loc4_.seed * 16807 % 2147483647;
         _loc4_.seed = _loc6_;
         if(int((int(_loc6_) & 1073741823) % 128) == 0)
         {
            _loc5_ = [];
            _loc6_ = _loc4_.seed * 16807 % 2147483647;
            _loc4_.seed = _loc6_;
            _loc7_ = 1 + int((int(_loc6_) & 1073741823) % 6);
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc8_++;
               _loc9_ = _loc8_;
               _loc6_ = _loc4_.seed * 16807 % 2147483647;
               _loc4_.seed = _loc6_;
               _loc5_.push(int((int(_loc6_) & 1073741823) % __fruitList.MAX));
            }
         }
         _loc6_ = _loc4_.seed * 16807 % 2147483647;
         _loc4_.seed = _loc6_;
         if(int((int(_loc6_) & 1073741823) % 128) == 0)
         {
            _loc6_ = _loc4_.seed * 16807 % 2147483647;
            _loc4_.seed = _loc6_;
            _loc3_ = int(Col.getRainbow2(int((int(_loc6_) & 1073741823) % 10007) / 10007));
            _loc6_ = _loc4_.seed * 16807 % 2147483647;
            _loc4_.seed = _loc6_;
            _loc3_ = int(Col.brighten(_loc3_,160 - int((int(_loc6_) & 1073741823) % 320)));
         }
         §r\x0be8\x03§(_loc3_);
         _loc7_ = 0;
         while(_loc7_ < _loc2_)
         {
            _loc7_++;
            _loc8_ = _loc7_;
            _loc10_ = new §CXs2\x01§(Cs.mcw,Cs.mch);
            _loc10_.menu = _loc5_;
            dm.add(_loc10_,1);
            a.push(_loc10_);
            _loc6_ = _loc8_ / _loc2_;
            Col.setPercentColor(_loc10_,(1 - _loc6_) * 0.75,_loc3_);
         }
         var _loc11_:String = null;
         if(demo[0])
         {
            _loc12_ = {
               "_rec":gameLog.rec,
               "_id":id[0],
               "_sid":§S-x;\x03§,
               "_hand":hand,
               "_player":{
                  "_name":"bumdum",
                  "_avatar":"hale.gif",
                  "_id":0,
                  "_rank":11
               },
               "_score":score[0],
               "_dateString":"23/03/78"
            };
            _loc11_ = Serializer.run(_loc12_);
         }
         var deb:§s\x1ddi\x03§ = new §s\x1ddi\x03§(param1,gameLog,_loc11_);
         action = function():void
         {
            var _loc2_:* = null as §CXs2\x01§;
            deb.update();
            var _loc1_:int = 0;
            while(_loc1_ < int(a.length))
            {
               _loc2_ = a[_loc1_];
               _loc1_++;
               _loc2_.update();
            }
         };
      }
      
      public function control() : void
      {
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:* = null as Card;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         switch(int(controlType.index))
         {
            case 0:
               _loc8_ = int(§\beCB§(snake.x,snake.y,snake.angle));
               _loc1_ = _loc8_ == -1;
               _loc2_ = _loc8_ == 1;
               if(click)
               {
                  _loc3_ = true;
               }
               break;
            case 1:
               _loc5_ = null;
               if(Keyb.§ ur_\x01§())
               {
                  _loc5_ = -3.14;
               }
               if(Keyb.§&!15\x01§())
               {
                  _loc5_ = 0;
               }
               if(Keyb.§Z\x14\x0bN\x01§())
               {
                  _loc5_ = -1.57;
               }
               if(Keyb.isDown())
               {
                  _loc5_ = 1.57;
               }
               if(_loc5_ != null)
               {
                  _loc6_ = Number(Num.hMod(_loc5_ - snake.angle,3.14));
                  _loc7_ = 0.05;
                  if(_loc6_ < -_loc7_)
                  {
                     _loc1_ = true;
                  }
                  if(_loc6_ > _loc7_)
                  {
                     _loc2_ = true;
                  }
               }
               if(Keyb.§E\bD\x07\x02§())
               {
                  _loc3_ = true;
               }
               break;
            case 2:
               _loc1_ = Boolean(Keyb.§ ur_\x01§());
               _loc2_ = Boolean(Keyb.§&!15\x01§());
               _loc3_ = Boolean(Keyb.§Z\x14\x0bN\x01§());
            case 3:
               _loc1_ = Boolean(Keyb.§ ur_\x01§());
               _loc2_ = Boolean(Keyb.§&!15\x01§());
               _loc3_ = Boolean(Keyb.§Z\x14\x0bN\x01§());
         }
         if(_loc1_)
         {
            snake.turn(-1);
            §ChP'\x01§(1);
         }
         else if(_loc2_)
         {
            snake.turn(1);
            §ChP'\x01§(2);
         }
         else
         {
            §ChP'\x01§(0);
         }
         if(_loc3_)
         {
            snake.thrusting = true;
            §ChP'\x01§(3);
         }
         Inter.me.§}k\x1c\x0b\x01§(_loc3_);
         _loc8_ = 0;
         var _loc4_:Array = §1Cw\x02\x03§;
         while(_loc8_ < int(_loc4_.length))
         {
            _loc9_ = _loc4_[_loc8_];
            _loc8_++;
            _loc9_.action();
            §ChP'\x01§(4 + _loc9_.id[0]);
         }
         §1Cw\x02\x03§ = [];
      }
      
      public function §cuO9\x01§() : void
      {
         var _loc3_:* = null as Fruit;
         var _loc5_:* = null as Bonus;
         var _loc1_:Array = fruits.copy();
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            _loc3_.vanish();
         }
         var _loc4_:Array = bonus.copy();
         _loc2_ = 0;
         while(_loc2_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc2_];
            _loc2_++;
            _loc5_.vanish();
         }
      }
      
      public function §\x13s\x01\x06\x02§() : void
      {
         if(box == null)
         {
            return;
         }
         box.n = int(box.n) + 1;
         var _loc1_:String = Lang.§w\x03\n_§ + " " + int(box.n) + " / " + Data.§n\x14?w\x01§;
         if(int(box.n) > Data.§n\x14?w\x01§)
         {
            _loc1_ = Lang.§\x13;\x1bs\x03§;
         }
         else
         {
            §t\x03\x0b\f§(int(box.n));
         }
         var _loc2_:TextField = box.field;
         _loc2_.text = _loc1_;
         _loc2_.width = Number(_loc2_.textWidth + 3);
         _loc2_.x = -(int(_loc2_.width * 0.5));
      }
      
      public function §\x0fM;\x1c§(param1:Number, param2:Number, param3:Number, param4:Object = undefined) : Object
      {
         var _loc5_:* = {
            "x":param1,
            "y":param2,
            "ray":param3,
            "collide":param4
         };
         obstacles.push(_loc5_);
         return _loc5_;
      }
   }
}
