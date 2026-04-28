package
{
   import flash.Boot;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import fx.§\x03R-\x02§;
   import fx.§\x0f)\x1f\\§;
   import fx.§\x16\bV\\\x02§;
   import fx.§'\x18H\x14\x01§;
   import fx.§'h\x1bF\x02§;
   import fx.§'y!3\x01§;
   import fx.Battery;
   import fx.BlackHole;
   import fx.Bomb;
   import fx.Broom;
   import fx.Chausson;
   import fx.Chrono;
   import fx.Closer;
   import fx.Exit;
   import fx.Fertilizer;
   import fx.Flag;
   import fx.Flash;
   import fx.Fluid;
   import fx.Fog;
   import fx.Funnel;
   import fx.Ghost;
   import fx.Globe;
   import fx.Horn;
   import fx.Magnet;
   import fx.Pin;
   import fx.Poison;
   import fx.Retro;
   import fx.Roller;
   import fx.Rune;
   import fx.Scanner;
   import fx.Smiley;
   import fx.Soap;
   import fx.Soup;
   import fx.Sponge;
   import fx.Tongue;
   import fx.Virus;
   import fx.Watch;
   import fx.§](]Y\x02§;
   import fx._x_Collier;
   import fx._x_Disjoncter;
   import fx._x_EtirerJeu;
   import fx._x_Hormones;
   import fx._x_PotionRose;
   import fx._x_Reglisse;
   import fx._x_Ruban;
   import fx._x_Ventouse;
   import fx._x_Wizard;
   import fx.§`?OQ§;
   import mt.Rand;
   import mt.bumdum9.Col;
   import mt.bumdum9.Filt;
   import mt.bumdum9.Num;
   import pix.Element;
   import pix.Frame;
   
   public class Card
   {
      
      public static var §;\x057\x02§:int = 43;
      
      public static var HEIGHT:int = 62;
      
      public static var §6k3H\x01§:Number = 0.08;
       
      
      public var z:Number;
      
      public var type:_CardType;
      
      public var sprite:Sprite;
      
      public var §T\n8\x02§:Element;
      
      public var mojo:Array;
      
      public var mcKey:Element;
      
      public var mcDark:Element;
      
      public var §@lBE§:Object;
      
      public var key:int;
      
      public var id:Array;
      
      public var gfx:§#UX^\x01§;
      
      public var dz:Number;
      
      public var data:Object;
      
      public var §g\x02\r\x18\x03§:Array;
      
      public var cooldown:Array;
      
      public var coef:Array;
      
      public var active:Array;
      
      public function Card(param1:_CardType = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         data = Data.CARDS[param1.index];
         type = param1;
         sprite = new Element();
         mojo = [int(data.mojo)];
         if(Game.me != null && data.time != null)
         {
            key = Game.me.§u{\x06D\x02§();
         }
         §\b\x07e\x19\x03§();
         coef = [0];
         active = [false];
         z = 0;
         dz = 0;
         cooldown = [0];
      }
      
      public function §\x07T9D§() : void
      {
         if(§@lBE§ == null)
         {
            return;
         }
         var _loc1_:int = int(§@lBE§ * 255);
         §@lBE§ = §@lBE§ * 0.5;
         if(_loc1_ == 0)
         {
            §@lBE§ = null;
         }
         Col.setColor(mcKey,0,_loc1_);
         Col.setColor(mcKey,0,_loc1_);
      }
      
      public function §Pg\fm§(param1:*) : void
      {
         var _loc2_:int = !!active[0]?1:-1;
         coef = [Number(Num.mm(0,Number(coef[0] + _loc2_ * Card.§6k3H\x01§),1))];
         §]Pzm\x03§();
         if(coef[0] == 0 || coef[0] == 1)
         {
            sprite.removeEventListener(Event.ENTER_FRAME,§Pg\fm§);
         }
      }
      
      public function update() : void
      {
         if(cooldown[0] > 0)
         {
            cooldown = [cooldown[0] - 1];
            §_K+\x01§();
         }
         §\x07T9D§();
      }
      
      public function §0)^;\x01§() : void
      {
         switch(int(type.index))
         {
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               Keyb.actions[key] = §jHg'\x03§;
               mcKey = new Element();
               mcKey.drawFrame(Gfx.main.get(0,"round_key"));
               gfx.face.addChild(mcKey);
               mcKey.x = Card.§;\x057\x02§ * 0.5 - 5;
               mcKey.y = Card.HEIGHT * 0.5 - 6;
               mcKey.pxx();
               var _loc2_:TextField = Cs.getField(5570560,8,-1,"nokia");
               _loc2_.text = Std.string(Keyb.getKeyName(key).toUpperCase());
               _loc2_.x = -2 - int(_loc2_.textWidth * 0.5);
               _loc2_.y = -8;
               mcKey.addChild(_loc2_);
               return;
            case 17:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            case 59:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            case 97:
               return;
         }
      }
      
      public function _x_blanchirCarte(param1:int) : void
      {
         §g\x02\r\x18\x03§ = [param1];
         cooldown = [param1];
         if(mcKey != null)
         {
            mcKey.visible = false;
         }
      }
      
      public function §z\x03\r\x15\x02§() : void
      {
         Col.setPercentColor(gfx,0,0);
      }
      
      public function §R&2Q\x03§() : void
      {
         mcKey.visible = false;
         Keyb.actions[key] = null;
      }
      
      public function §jHg'\x03§() : void
      {
         if(Game.me.§1Cw\x02\x03§ == null || Game.me.§\x0e\b$\r§[0] < 10)
         {
            return;
         }
         Game.me.§1Cw\x02\x03§.push(this);
      }
      
      public function _x_effetALaMort() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Snake = Game.me.snake;
         if(!active[0])
         {
            return;
         }
         switch(int(type.index))
         {
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               break;
            case 55:
            default:
               _loc3_ = 3;
               if(Game.me.have(_CardType.FOG))
               {
                  _loc3_++;
               }
               if(int(Game.me.getTime()) < _loc3_ * 60 * 1000)
               {
                  cash(Game.me.score[0]);
               }
               else
               {
                  §\x1b\x03\x11K\x02§();
               }
               break;
            case 57:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               cash(5000);
               break;
            case 119:
               cash(int(Math.ceil(Game.me.score[0] * 0.15)));
         }
      }
      
      public function §\t\x11c\x03§() : void
      {
         switch(int(type.index))
         {
            default:
               break;
            case 1:
            default:
            default:
            default:
            default:
            default:
            default:
               Game.me._x_augmenteFruitibar(-10);
               break;
            case 8:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               Game.me._x_augmenteFruitibar(-10);
               break;
            case 19:
               Game.me._x_augmenteFruitibar(-10);
               break;
            case 20:
               Game.me._x_augmenteFruitibar(-10);
               break;
            case 21:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               Game.me._x_augmenteFruitibar(-10);
               break;
            case 32:
            default:
            default:
            default:
            default:
            default:
            default:
               Game.me._x_augmenteFruitibar(-25);
               break;
            case 39:
            default:
            default:
               Game.me._x_augmenteFruitibar(-25);
               break;
            case 42:
            default:
            default:
               Game.me._x_augmenteFruitibar(-25);
               break;
            case 45:
            default:
            default:
            default:
            default:
            default:
               Game.me._x_augmenteFruitibar(-25);
               break;
            case 51:
            default:
            default:
            default:
            default:
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusPetard,-60);
               break;
            case 56:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusFlute,-16);
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusGuitare,-8);
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusTrompette,-4);
               break;
            case 65:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               new _x_EtirerJeu(-50);
               break;
            case 80:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               Game.me.snake.§dZ9\x0b\x01§(-100);
               break;
            case 111:
            default:
            default:
            default:
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusPilule,-100);
               break;
            case 115:
               Game.me._x_augmenteFruitibar(50);
         }
         §m!\x13Y\x03§();
      }
      
      public function _x_rendCarteVisible() : void
      {
         if(data.time != null)
         {
            §0)^;\x01§();
         }
         switch(int(type.index))
         {
            default:
               break;
            case 1:
            default:
            default:
            default:
            default:
            default:
            default:
               Game.me._x_augmenteFruitibar(10);
               break;
            case 8:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               new _x_Reglisse(this);
               break;
            case 19:
               new Smiley(this);
               break;
            case 20:
               new Pin(this);
               break;
            case 21:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               new Roller(this);
               break;
            case 32:
            default:
            default:
            default:
            default:
            default:
            default:
               Game.me._x_augmenteFruitibar(25);
               break;
            case 39:
            default:
            default:
               new _x_Ruban(this);
               break;
            case 42:
            default:
            default:
               new Scanner(this);
               break;
            case 45:
            default:
            default:
            default:
            default:
            default:
               new Broom(this);
               break;
            case 51:
            default:
            default:
            default:
            default:
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusPetard,60);
               break;
            case 56:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusFlute,16);
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusGuitare,8);
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusTrompette,4);
               break;
            case 65:
            default:
            default:
            default:
               new _x_EtirerJeu(50);
               break;
            case 69:
            default:
            default:
               new _x_Ventouse(this);
               break;
            case 72:
            default:
               new _x_PotionRose(this);
               break;
            case 74:
            default:
               new §\x03R-\x02§();
               break;
            case 76:
            default:
            default:
               new Battery(this);
               break;
            case 79:
               new §'h\x1bF\x02§(this);
               break;
            case 80:
            default:
               Game.me.snake.§dZ9\x0b\x01§(100);
               break;
            case 82:
            default:
            default:
            default:
               new Magnet(this);
               break;
            case 86:
            default:
            default:
            default:
            default:
            default:
               new Globe(this);
               break;
            case 92:
               new Fertilizer(this);
               break;
            case 93:
               new Rune(this,0);
               break;
            case 94:
               new Rune(this,1);
               break;
            case 95:
            default:
            default:
               new Rune(this,2);
               break;
            case 98:
            default:
            default:
               new Funnel(this);
               break;
            case 101:
            default:
            default:
               new Chrono(this,120,function():void
               {
                  new Ghost();
               });
               break;
            case 104:
            default:
            default:
            default:
            default:
            default:
            default:
               new Fluid(this);
               break;
            case 111:
               Bonus._x_ajoutePoidsBonus(BonusType.__bonusPilule,100);
               break;
            case 112:
            default:
               new Closer(this);
               break;
            case 114:
               new Rune(this,3);
               break;
            case 115:
               Game.me._x_augmenteFruitibar(50);
               new §'y!3\x01§(this,-0.1);
               break;
            case 116:
               if(!Game.me.have(_CardType.PICK_AXE))
               {
                  new §](]Y\x02§(this);
               }
               break;
            case 117:
            default:
            default:
            default:
               new §\x0f)\x1f\\§(this);
               break;
            case 121:
               new Virus(this);
               break;
            case 122:
            default:
               new _x_Hormones(this);
               break;
            case 124:
            default:
            default:
            default:
            default:
               new Flag(this);
               break;
            case 129:
               new Fog(this);
         }
         Game.me._x_augmenteFruitibar(0);
         §m!\x13Y\x03§();
      }
      
      public function §]Pzm\x03§() : void
      {
         gfx.coef = 0.75 - coef[0] * 0.5;
         gfx.§]Pzm\x03§();
         var _loc1_:Sprite = gfx.face;
         var _loc2_:Sprite = gfx.§O\no%\x01§;
         dz = -§\x19\n\t\x01§.sin(coef[0] * 3.14) * 8;
         §T\n8\x02§.x = -dz * 1.7;
         §T\n8\x02§.y = Number(-dz * 0.4 + 1);
         §T\n8\x02§.scaleX = 1 - §\x19\n\t\x01§.sin(coef[0] * 3.14) * 0.5;
         §T\n8\x02§.alpha = 1 - §\x19\n\t\x01§.sin(coef[0] * 3.14) * 0.75;
         var _loc3_:int = -6;
         _loc1_.x = §\x19\n\t\x01§.sin(coef[0] * 3.14) * _loc3_;
         _loc2_.x = §\x19\n\t\x01§.sin(coef[0] * 3.14) * _loc3_;
         _loc1_.y = Number(z + dz);
         _loc2_.y = Number(z + dz);
         var _loc4_:int = 120;
         Col.setColor(_loc1_,0,int(_loc4_ * (1 - _loc1_.scaleX)));
         Col.setColor(_loc2_,0,-(int(_loc4_ * (1 - _loc2_.scaleX))));
      }
      
      public function §_K+\x01§() : void
      {
         var _loc1_:* = null as Frame;
         if(mcDark == null)
         {
            mcDark = new Element();
            mcDark.y = -Card.HEIGHT * 0.5;
            mcDark.alpha = 0.75;
            gfx.face.addChild(mcDark);
         }
         if(cooldown[0] > 0)
         {
            mcDark.visible = true;
            _loc1_ = Gfx.main.get(0,"card_dark");
            _loc1_.height = int(Math.round(cooldown[0] / §g\x02\r\x18\x03§[0] * Card.HEIGHT));
            mcDark.drawFrame(_loc1_,0.5,0);
         }
         else
         {
            mcDark.visible = false;
            if(mcKey != null)
            {
               mcKey.visible = true;
            }
         }
      }
      
      public function §\f\x0b2E\x01§() : Object
      {
         return {
            "x":sprite.x - Stage.me.root.x,
            "y":sprite.y - Stage.me.root.y
         };
      }
      
      public function §|sq8§() : String
      {
         return Data.TEXT[type.index].desc;
      }
      
      public function §\b\x07e\x19\x03§() : void
      {
         gfx = new §#UX^\x01§();
         gfx.§)QR\x01§(type);
         §T\n8\x02§ = new Element();
         §T\n8\x02§.y = Number(§T\n8\x02§.y + 1);
         §T\n8\x02§.drawFrame(Gfx.main.get(0,"cards"));
         Col.setPercentColor(§T\n8\x02§,1,3178517);
         sprite.addChild(§T\n8\x02§);
         sprite.addChild(gfx);
      }
      
      public function §\x0fB}F\x03§() : void
      {
         new Flash(sprite,0.1);
      }
      
      public function §AQ \n\x02§() : void
      {
         Filt.glow(gfx,2,10,11206400,true);
      }
      
      public function §\x19X+o\x01§() : void
      {
         gfx.filters = [];
      }
      
      public function §\x1b\x03\x11K\x02§() : void
      {
         if(!active[0])
         {
            return;
         }
         flip();
      }
      
      public function §\x0eX\x1c4\x01§() : void
      {
         if(active[0])
         {
            return;
         }
         flip();
      }
      
      public function flip() : void
      {
         active = [!active[0]];
         if(Game.me != null)
         {
            if(active[0])
            {
               _x_rendCarteVisible();
            }
            if(!active[0])
            {
               §\t\x11c\x03§();
            }
         }
         sprite.addEventListener(Event.ENTER_FRAME,§Pg\fm§);
      }
      
      public function §\x05c'u§(param1:int) : void
      {
         gfx.§\x05c'u§(param1);
      }
      
      public function §e\x1fSH\x02§() : void
      {
         Col.setPercentColor(gfx,0.75,17408);
      }
      
      public function §m!\x13Y\x03§() : void
      {
         var _loc1_:Snake = Game.me.snake;
         _loc1_.§]iI[\x03§ = §[TU\x01§.§]_g\x0f\x02§;
         _loc1_.rainbow = false;
         if(Game.me._x_groupeCartes([_CardType.POTION_RED,_CardType.POTION_ORANGE,_CardType.POTION_YELLOW,_CardType.POTION_GREEN,_CardType.POTION_BLUE,_CardType.POTION_PINK]))
         {
            _loc1_.rainbow = true;
            _loc1_.§]iI[\x03§ = §[TU\x01§.§a@Io\x02§(0.05,0.6);
         }
      }
      
      public function cash(param1:int, param2:Boolean = true) : void
      {
         §\x0fB}F\x03§();
         if(param2)
         {
            §\x1b\x03\x11K\x02§();
         }
         var _loc3_:* = §\f\x0b2E\x01§();
         Game.me._x_addPoints(param1,Number(_loc3_.x),Number(_loc3_.y));
      }
      
      public function action() : void
      {
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as Fruit;
         var _loc7_:* = null as Fruit;
         var _loc8_:Number = NaN;
         var _loc9_:* = null as Rand;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null as Fruit;
         var _loc14_:* = null as Bonus;
         var _loc15_:* = null;
         if(!active[0])
         {
            return;
         }
         if(cooldown[0] > 0)
         {
            return;
         }
         §@lBE§ = 1;
         var _loc1_:Snake = Game.me.snake;
         var _loc2_:* = data.time;
         switch(int(type.index))
         {
            case 0:
               new Tongue();
               break;
            default:
               break;
            case 2:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               _loc4_ = Game.me.fruits.copy();
               if(int(_loc4_.length) < 100)
               {
                  _loc5_ = 0;
                  while(_loc5_ < int(_loc4_.length))
                  {
                     _loc6_ = _loc4_[_loc5_];
                     _loc5_++;
                     _loc7_ = Fruit.get(int(_loc6_.data.rank));
                     _loc7_.x = _loc6_.x;
                     _loc7_.y = _loc6_.y;
                     _loc7_.timer = _loc6_.timer;
                     _loc9_ = Game.me.seed;
                     _loc10_ = _loc9_.seed * 16807 % 2147483647;
                     _loc9_.seed = _loc10_;
                     _loc8_ = int((int(_loc10_) & 1073741823) % 10007) / 10007 * 6.28;
                     _loc11_ = 0;
                     while(_loc11_ < 2)
                     {
                        _loc11_++;
                        _loc12_ = _loc11_;
                        _loc13_ = [_loc6_,_loc7_][_loc12_];
                        _loc13_.§\nMo7§(Number(_loc8_ + _loc12_ * 3.14),3,-3);
                     }
                     _loc7_._x_debugEncyclopefruitNull = true;
                  }
               }
               break;
            case 10:
            default:
            default:
               new Exit(0.3);
               break;
            case 13:
               _loc9_ = Game.me.seed;
               _loc8_ = _loc9_.seed * 16807 % 2147483647;
               _loc9_.seed = _loc8_;
               _loc5_ = 60 + int((int(_loc8_) & 1073741823) % 60);
               _loc1_.cut(_loc5_,true,true);
               break;
            case 14:
               _loc14_ = Bonus.spawn(BonusType.__bonusChest);
               _loc14_.§\nMo7§(0,0,-4);
               new Flash(_loc14_.sprite);
               if(Game.me.have(_CardType.PIRATE))
               {
                  _loc2_ = _loc2_ - 200;
               }
               break;
            case 15:
               new Poison();
               break;
            case 16:
            default:
               new Bomb();
               break;
            case 18:
            default:
            default:
            default:
            default:
               Bonus._x_alea();
               break;
            case 23:
            default:
            default:
               new _x_Disjoncter();
               break;
            case 26:
            default:
            default:
            default:
               new Chausson();
               break;
            case 30:
               _loc5_ = int(_loc1_.length[0] * 0.3);
               _loc1_.cut(_loc5_,true,true);
               break;
            case 31:
            default:
            default:
               _loc5_ = int(_loc1_.length[0] * 0.1);
               _loc1_.cut(_loc5_,true,true);
               break;
            case 34:
            default:
               _loc5_ = int(_loc1_.length[0] * 0.5);
               _loc1_.cut(_loc5_,true,true);
               Game.me._x_augmenteFruitibar(-(int(Game.me.§\x01\x11l5\x02§[0] * 0.5)));
               break;
            case 36:
               if(Game.me.§\x0e\b$\r§[0] < 100)
               {
                  return;
               }
               new Watch();
               break;
            case 37:
               new Sponge();
               break;
            case 38:
            default:
            default:
               _loc1_.§,\x04\x19\x02§();
               if(Game.me.have(_CardType.POTION_YELLOW))
               {
                  _loc5_ = 0;
                  while(_loc5_ < 3)
                  {
                     _loc5_++;
                     _loc11_ = _loc5_;
                     Game.me._x_creerFruitType(_x_TYPE.Yellow);
                  }
               }
               break;
            case 41:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               new _x_Collier(_loc1_.x,_loc1_.y,_x_TYPE.Sugar,10);
               break;
            case 58:
            default:
            default:
            default:
               _loc5_ = 1 + int(Game.me.§2~\f#\x03§(_CardType.LADLE));
               _loc11_ = 0;
               while(_loc11_ < _loc5_)
               {
                  _loc11_++;
                  _loc12_ = _loc11_;
                  new §`?OQ§(_loc12_);
               }
               break;
            case 62:
               _loc1_.cut(70,true,true);
               if(Game.me.have(_CardType.BRAKE) && int(Game.me.cards.length) <= 3)
               {
                  new _x_EtirerJeu(5);
               }
               Game.me._x_augmenterVitesse(3);
               break;
            case 63:
            default:
            default:
            default:
               Game.me._x_augmenterVitesse(-int(Game.me.speed[0]));
               break;
            case 67:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               new _x_Wizard();
               break;
            case 75:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               _loc14_ = Bonus.spawn(BonusType.__bonusBouee);
               _loc14_.§\nMo7§(0,0,-4);
               new Flash(_loc14_.sprite);
               break;
            case 87:
            default:
               new §\x16\bV\\\x02§(_loc1_.x,_loc1_.y,_loc1_.angle,int(Game.me._x_genererIdFruit()),7 - int(Game.me.§2~\f#\x03§(_CardType.AMPLI)) * 2);
               break;
            case 89:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               new Horn(_loc1_.x,_loc1_.y);
               if(Game.me.have(_CardType.POTION_ORANGE))
               {
                  _loc2_ = _loc2_ - 200;
               }
               break;
            case 100:
            default:
            default:
            default:
               new Soap();
               break;
            case 104:
               new Retro();
               break;
            case 105:
            default:
               _loc5_ = 0;
               _loc4_ = _loc1_.stomach;
               while(_loc5_ < int(_loc4_.length))
               {
                  _loc15_ = _loc4_[_loc5_];
                  _loc5_++;
                  _loc15_.§V\nW\x12\x02§ = -1;
               }
               break;
            case 107:
            default:
            default:
               new BlackHole();
               if(Game.me.have(_CardType.GALAXY))
               {
                  _loc2_ = _loc2_ >> 1;
               }
               break;
            case 110:
            default:
            default:
               Game.me._x_creerFruitType(_x_TYPE.Flower);
               break;
            case 113:
            default:
            default:
            default:
               _loc5_ = int(_loc1_.length[0] * 0.75);
               _loc1_.cut(_loc5_,true,true);
               new _x_EtirerJeu(-50);
               break;
            case 117:
               _loc1_.cut(50,true,true);
               break;
            case 118:
            default:
               Game.me.§\x17W\x1a\r\x01§();
               break;
            case 120:
            default:
            default:
            default:
               _loc5_ = 3 + int(Game.me.§2~\f#\x03§(_CardType.PIRATE));
               _loc11_ = 0;
               while(_loc11_ < _loc5_)
               {
                  _loc11_++;
                  _loc12_ = _loc11_;
                  _loc14_ = Bonus.spawn([BonusType.__bonusCollierBleu,BonusType.§\x1fE s\x02§,BonusType.__bonusCollierRouge][int(_loc12_ % 3)]);
                  _loc14_.§\nMo7§(0,0,-4);
                  new Flash(_loc14_.sprite);
               }
               break;
            case 124:
               Flag.me._x_act();
               break;
            case 125:
               new Soup();
               if(Game.me.have(_CardType.BUCKET))
               {
                  _loc2_ = _loc2_ >> 1;
               }
               break;
            case 126:
               new §'\x18H\x14\x01§();
         }
         _loc15_ = _loc2_;
         if(_loc15_ != -2)
         {
            if(_loc15_ == -1)
            {
               flip();
            }
            else
            {
               _x_blanchirCarte(_loc2_);
            }
         }
      }
   }
}
