package
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import fx.§\x16\bV\\\x02§;
   import fx.Bell;
   import fx.Brake;
   import fx.Grain;
   import fx.MagicPowder;
   import fx.Matches;
   import fx.Sparkling;
   import fx._x_Collier;
   import fx._x_Tshirt;
   import fx._x_ajouteBouclier;
   import fx.§f(\x0e\x18§;
   import mt.Rand;
   import mt.bumdum9.Num;
   import pix.Frame;
   
   public class Bonus extends Part
   {
      
      public static var init__:Boolean;
      
      public static var POOL:Array = [];
      
      public static var boxes:Array = [];
      
      public static var data:Array;
      
      public static var DATA:Array;
       
      
      public var type:BonusType;
      
      public var box:Rectangle;
      
      public function Bonus(param1:BonusType = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         §GT\x0b\x01\x03§ = Bonus.POOL;
         §|$)[§(param1);
      }
      
      public static function get(param1:BonusType) : Bonus
      {
         if(int(Bonus.POOL.length) == 0)
         {
            return new Bonus(param1);
         }
         var _loc2_:Bonus = Bonus.POOL.pop();
         _loc2_.init();
         _loc2_.§|$)[§(param1);
         return _loc2_;
      }
      
      public static function §8!P$\x02§() : void
      {
         var _loc3_:* = null;
         Bonus.data = [];
         var _loc1_:int = 0;
         var _loc2_:Array = Bonus.DATA;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            Bonus.data.push({
               "id":_loc3_.id,
               "weight":int(_loc3_.weight)
            });
         }
      }
      
      public static function XePH() : void
      {
         var _loc1_:int = 10;
         if(int(Game.me.§\x0e\b$\r§[0] % _loc1_) > 0 || Boolean(Game.me.have(_CardType.TRAINING)))
         {
            return;
         }
         var _loc2_:Number = Cs.§\x1f\x18\r\x1e§ * 1;
         if(Game.me.have(_CardType._x_WINDFARM_SMALL))
         {
            _loc2_ = _loc2_ * 0.9;
         }
         if(Game.me.have(_CardType._x_WINDFARM_BIG))
         {
            _loc2_ = _loc2_ * 0.6;
         }
         Bonus._x_alea(int(_loc2_));
      }
      
      public static function _x_alea(param1:int = 0) : void
      {
         var _loc5_:* = null;
         var _loc2_:int = param1;
         var _loc3_:int = 0;
         var _loc4_:Array = Bonus.data;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_ = _loc2_ + int(_loc5_.weight);
         }
         var _loc6_:Rand = Game.me.seed;
         var _loc7_:Number = _loc6_.seed * 16807 % 2147483647;
         _loc6_.seed = _loc7_;
         _loc3_ = int((int(_loc7_) & 1073741823) % _loc2_);
         _loc2_ = 0;
         var _loc8_:int = 0;
         _loc4_ = Bonus.data;
         while(_loc8_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc8_];
            _loc8_++;
            _loc2_ = _loc2_ + int(_loc5_.weight);
            if(_loc2_ > _loc3_)
            {
               Bonus.spawn(_loc5_.id);
               break;
            }
         }
      }
      
      public static function spawn(param1:BonusType) : Bonus
      {
         if(param1 == BonusType.__bonusScissors || param1 == BonusType.__bonusFlute || param1 == BonusType.__bonusGuitare || param1 == BonusType.__bonusTrompette)
         {
            if(Game.me.have(_CardType.BAT,true))
            {
               return null;
            }
         }
         var _loc2_:Bonus = new Bonus(param1);
         var _loc3_:Point = Stage.me.§;*\x13(\x02§(20,40);
         _loc2_.x = _loc3_.x;
         _loc2_.y = _loc3_.y;
         return _loc2_;
      }
      
      public static function _x_ajoutePoidsBonus(param1:BonusType, param2:int) : void
      {
         var _loc5_:* = null;
         var _loc3_:int = 0;
         var _loc4_:Array = Bonus.data;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.id == param1)
            {
               _loc5_.weight = int(_loc5_.weight) + param2;
               return;
            }
         }
      }
      
      public function vanish() : void
      {
         kill();
      }
      
      override public function updatePos() : void
      {
         super.updatePos();
         sprite.pxx();
      }
      
      override public function update() : void
      {
         if(timer < 80)
         {
            blink(2);
         }
         super.update();
      }
      
      public function trig() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:* = null as Fruit;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:* = null as Fruit;
         var _loc14_:* = null as Point;
         var _loc15_:* = null as Sparkling;
         var _loc16_:* = null as Card;
         Game.me.gameLog.bonus.push(type);
         var _loc1_:Snake = Game.me.snake;
         var _loc2_:Rand = Game.me.seed;
         switch(int(type.index))
         {
            case 0:
               Game.me._x_segmentsDynamites = [Game.me._x_segmentsDynamites[0] + 1];
               _loc4_ = 6 * Game.me._x_segmentsDynamites[0];
               if(Game.me.have(_CardType.ZIPPO,true))
               {
                  _loc4_ = _loc4_ * 2;
               }
               _loc1_.explode(_loc4_);
               break;
            case 1:
               _loc1_.cut(int(_loc1_.length[0] * 0.1),true,true);
               break;
            case 2:
               _loc4_ = 8;
               _loc5_ = 5;
               if(Game.me.have(_CardType.LASSO,true))
               {
                  _loc5_ = 1;
               }
               _loc6_ = 0;
               while(_loc6_ < _loc4_)
               {
                  _loc6_++;
                  _loc7_ = _loc6_;
                  _loc8_ = _loc7_ / _loc4_ * 6.28;
                  _loc9_ = Fruit.get(int(Game.me._x_genererIdFruit()));
                  _loc9_.x = x;
                  _loc9_.y = y;
                  _loc9_.z = -(_loc9_.box.height * 0.5 + 1);
                  _loc9_.timer = _loc9_.timer * 2;
                  _loc10_ = _loc2_.seed * 16807 % 2147483647;
                  _loc2_.seed = _loc10_;
                  _loc10_ = _loc2_.seed * 16807 % 2147483647;
                  _loc2_.seed = _loc10_;
                  _loc9_.§\nMo7§(_loc8_,int((int(_loc10_) & 1073741823) % 10007) / 10007 * _loc5_,-(0.5 + int((int(_loc10_) & 1073741823) % 10007) / 10007 * 3));
               }
               break;
            case 3:
               new §\x16\bV\\\x02§(x,y,_loc1_.angle,int(Game.me._x_genererIdFruit()));
               break;
            case 4:
               _loc4_ = int(Game.me._x_genererIdFruit());
               _loc5_ = 0;
               while(_loc5_ < 4)
               {
                  _loc5_++;
                  _loc6_ = _loc5_;
                  new §\x16\bV\\\x02§(x,y,Number(_loc6_ / 4 * 6.28 + 0.77),_loc4_);
               }
               break;
            case 5:
               _loc4_ = int(Game.me._x_genererIdFruit());
               _loc5_ = 0;
               while(_loc5_ < 4)
               {
                  _loc5_++;
                  _loc6_ = _loc5_;
                  new §\x16\bV\\\x02§(x,y,_loc6_ / 3 * 1.57 + _loc1_.angle - 0.77,_loc4_);
               }
               break;
            case 6:
               _loc4_ = 8;
               _loc5_ = 30;
               _loc6_ = 0;
               _loc9_ = _loc1_._x_fruitLePlusProche();
               if(_loc9_ != null)
               {
                  _loc6_ = int(_loc9_.data.rank);
               }
               _loc7_ = 0;
               while(_loc7_ < _loc4_)
               {
                  _loc7_++;
                  _loc11_ = _loc7_;
                  _loc8_ = _loc11_ / _loc4_ * 6.28;
                  _loc10_ = Number(x + §\x19\n\t\x01§.cos(_loc8_) * _loc5_);
                  _loc12_ = Number(y + §\x19\n\t\x01§.sin(_loc8_) * _loc5_);
                  if(Stage.me.isIn(_loc10_,_loc12_,10))
                  {
                     _loc13_ = Fruit.get(_loc6_);
                     _loc13_.x = _loc10_;
                     _loc13_.y = _loc12_;
                     _loc13_._x_creerFruitType();
                     _loc13_.§Hp@\x0f\x01§(_loc11_);
                     _loc13_.updatePos();
                  }
               }
               break;
            case 7:
               Game.me._x_addPoints(3000,x,y - 14);
               if(Game.me.have(_CardType.ECSTASY,true))
               {
                  Game.me._x_augmenteFruitibar(8);
               }
               new §f(\x0e\x18§();
               break;
            case 8:
               Game.me._x_augmenteFruitibar(6);
               break;
            case 9:
               Game.me._x_augmenteFruitibar(18);
               break;
            case 10:
               _loc9_ = Fruit.get();
               _loc14_ = Stage.me.§;*\x13(\x02§(30,60);
               _loc9_.§/2\x17§(3);
               _loc9_.x = _loc14_.x;
               _loc9_.y = _loc14_.y;
               _loc9_.§\nMo7§(0,0,0);
               _loc9_.z = -70;
               _loc9_._x_coeffPoint = _loc9_._x_coeffPoint * 10;
               _loc9_.§k|\x12\x0f\x03§ = _loc9_.§k|\x12\x0f\x03§ * 10;
               _loc15_ = new Sparkling(_loc9_.sprite,60,2);
               _loc15_.ray = Number(_loc9_.getRay());
               break;
            case 11:
               new Matches();
               break;
            case 12:
               new Grain(x,y);
               break;
            case 13:
               new Bell();
               break;
            case 14:
               new _x_ajouteBouclier(1);
               break;
            case 15:
               new _x_Tshirt(2);
               break;
            case 16:
               new _x_Collier(x,y,_x_TYPE.Red,10);
               break;
            case 17:
               new _x_Collier(x,y,_x_TYPE.Green,10);
               break;
            case 18:
               new _x_Collier(x,y,_x_TYPE.Blue,10);
               break;
            case 19:
               if(int(Game.me.cards.length) > 0)
               {
                  _loc8_ = _loc2_.seed * 16807 % 2147483647;
                  _loc2_.seed = _loc8_;
                  _loc16_ = Game.me.cards[int((int(_loc8_) & 1073741823) % int(Game.me.cards.length))];
                  _loc16_.flip();
               }
               break;
            case 20:
               Game.me._x_addPoints(Game.me.shield[0] * 4000,x,y);
            case 21:
               Game.me._x_addPoints(Game.me.shield[0] * 4000,x,y);
         }
         if(Game.me.have(_CardType.BRAKE,true))
         {
            new Brake();
         }
         if(Game.me.have(_CardType.MAGIC_POWDER) && Boolean(Game.me.have(_CardType.DETONATOR)))
         {
            new MagicPowder(6);
         }
         kill();
      }
      
      override public function _x_disparition() : void
      {
         if(Game.me.have(_CardType.KLEENEX,true))
         {
            Game.me._x_addPoints(3500,x,y);
         }
         super._x_disparition();
      }
      
      public function §\x18\x0e73\x03§() : void
      {
         var _loc2_:* = null as BitmapData;
         var _loc3_:* = null as Frame;
         var _loc1_:int = type.index;
         if(Bonus.boxes[_loc1_] != null)
         {
            box = Bonus.boxes[_loc1_];
         }
         else
         {
            _loc2_ = new BitmapData(32,32,true,0);
            _loc3_ = Gfx.bonus.get(_loc1_);
            _loc3_.§V,o\x03§(_loc2_,0,0);
            box = _loc2_.getColorBoundsRect(-1,0,false);
            box.offset(-16,-16);
            Bonus.boxes[_loc1_] = box;
         }
         box = box.clone();
      }
      
      override public function kill() : void
      {
         super.kill();
         Game.me.bonus.remove(this);
      }
      
      public function §|$)[§(param1:BonusType) : void
      {
         type = param1;
         timer = 500;
         Game.me.bonus.push(this);
         timer = Cs.§B;O_\x03§;
         weight = 0.6;
         §\x188\x1b(\x03§ = 0.5;
         if((type == BonusType.__bonusPetard || type == BonusType.__bonusAllumettes) && Boolean(Game.me.have(_CardType.BUCKET,true)))
         {
            timer = 50;
         }
         var _loc2_:int = param1.index;
         sprite.drawFrame(Gfx.bonus.get(_loc2_));
         Stage.me.dm.add(sprite,Stage.§p\x1fLp\x03§);
         FFfR(true);
         §\x18\x0e73\x03§();
      }
      
      public function §oO~Y\x02§(param1:Rectangle, param2:Number = 0.0) : Boolean
      {
         var _loc3_:Rectangle = box.clone();
         _loc3_.offset(x,y);
         return Boolean(_loc3_.intersects(param1));
      }
      
      override public function §]\x01(S\x03§() : void
      {
         var _loc1_:int = 12;
         if(x < _loc1_ || x > Stage.me.width - _loc1_)
         {
            vx = vx * -§\x188\x1b(\x03§;
            x = Number(Num.mm(_loc1_,x,Stage.me.width - _loc1_));
         }
         if(y < _loc1_ || y > Stage.me.height - _loc1_)
         {
            vy = vy * -§\x188\x1b(\x03§;
            y = Number(Num.mm(_loc1_,y,Stage.me.height - _loc1_));
         }
      }
   }
}
