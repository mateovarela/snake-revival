package
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import fx.§\t`v\x1f\x03§;
   import fx.§0\x1d_Y\x01§;
   import fx.Battery;
   import fx.BlackHole;
   import fx.Brake;
   import fx.Brandy;
   import fx.Chausson;
   import fx.Eaten;
   import fx.MagicPowder;
   import fx.Reduce;
   import fx.Soap;
   import fx.Tongue;
   import fx.§](]Y\x02§;
   import fx._x_Blood;
   import fx._x_PotionBleue;
   import fx._x_Rebond;
   import fx._x_ajouteBouclier;
   import fx.§z\x1f)\x11\x01§;
   import mt.bumdum9.Col;
   import mt.bumdum9.Filt;
   import mt.bumdum9.Num;
   import part.Line;
   import part.§Y9u~\x03§;
   import pix.Anim;
   import pix.Element;
   import pix.Frame;
   
   public class Snake
   {
      
      public static var §Q\nx\x07\x03§:int = 3;
      
      public static var §\x0bKox\x03§:int = 32;
      
      public static var §tbQ\x02§:int = 5;
      
      public static var §`6c)§:int = 3;
      
      public static var §R8&\x05\x03§:int = 10;
       
      
      public var y:Number;
      
      public var x:Number;
      
      public var §x4\x06d\x01§:Number;
      
      public var trq:Array;
      
      public var tongue:Tongue;
      
      public var thrusting:Boolean;
      
      public var thrust:Number;
      
      public var test:Object;
      
      public var stomach:Array;
      
      public var speed:Number;
      
      public var root:Sprite;
      
      public var §REo\x12§:Array;
      
      public var §|\x01P \x02§:Number;
      
      public var rainbow:Boolean;
      
      public var §]iI[\x03§:§[TU\x01§;
      
      public var queue:Array;
      
      public var pal:Array;
      
      public var mcq:Sprite;
      
      public var length:Array;
      
      public var §G\x17} §:Object;
      
      public var lance:Number;
      
      public var §Pr;i\x02§:Array;
      
      public var §1hjf\x02§:Object;
      
      public var freeze:Array;
      
      public var dead:Boolean;
      
      public var §O\r\x1a4\x02§:Number;
      
      public var boost:Number;
      
      public var angle:Number;
      
      public function Snake()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         x = Cs.mcw * 0.5;
         y = Cs.mch * 0.5;
         root = new Sprite();
         Stage.me.dm.add(root,Stage.§|r;h§);
         mcq = new Sprite();
         root.addChild(mcq);
         §Pr;i\x02§ = [false];
         thrusting = false;
         rainbow = false;
         §O\r\x1a4\x02§ = 0;
         speed = Cs.§0'`;\x01§;
         thrust = Cs.§+k-\t§;
         §|\x01P \x02§ = 0;
         §REo\x12§ = [0];
         lance = 0;
         §x4\x06d\x01§ = 0;
         boost = 0;
         §]iI[\x03§ = §[TU\x01§.§]_g\x0f\x02§;
         x = 10;
         init();
         §\x0171\t\x01§(0);
         freeze = [false];
         dead = false;
         §1hjf\x02§ = 1;
      }
      
      public static function §^LL*§(param1:Array, param2:Graphics, param3:Number = 1.0) : void
      {
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:* = null as Array;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:int = 0;
         var _loc21_:* = null as Array;
         var _loc22_:int = 0;
         var _loc23_:* = null;
         if(!Game.me.§8m_x\x01§)
         {
            return;
         }
         var _loc4_:Snake = Game.me.snake;
         var _loc5_:Array = _loc4_.pal;
         if(int(param1.length) == 0)
         {
            return;
         }
         var _loc6_:Array = param1.copy();
         var _loc7_:* = _loc6_.shift();
         var _loc8_:int = 0;
         while(_loc8_ < 3)
         {
            _loc8_++;
            _loc9_ = _loc8_;
            _loc10_ = (10 - 4 * _loc9_) * param3;
            _loc11_ = _loc9_ == 0?int(_loc5_[2]):int(_loc5_[1]);
            _loc12_ = -_loc9_ * 1;
            if(_loc9_ == 2)
            {
               _loc10_ = param3;
               _loc12_ = -4;
               _loc11_ = int(_loc5_[0]);
            }
            _loc12_ = _loc12_ * param3;
            _loc13_ = (1 - _loc7_.size) * 5;
            _loc13_ = 0;
            param2.moveTo(Number(_loc7_.x),Number(Number(Number(_loc7_.y) + _loc12_) + _loc13_));
            param2.lineStyle(_loc10_,_loc11_);
            _loc14_ = _loc4_.§]iI[\x03§.§N\nM\x03§;
            switch(int(_loc4_.§]iI[\x03§.index))
            {
               case 0:
                  _loc15_ = 0;
                  while(_loc15_ < int(_loc6_.length))
                  {
                     _loc16_ = _loc6_[_loc15_];
                     _loc15_++;
                     param2.lineStyle(_loc10_ * _loc16_.size,_loc11_,1);
                     param2.lineTo(Number(_loc16_.x),Number(Number(_loc16_.y) + _loc12_));
                  }
                  continue;
               case 1:
                  _loc17_ = _loc14_[0];
                  _loc18_ = _loc14_[1];
                  _loc19_ = 0;
                  _loc15_ = 0;
                  while(_loc15_ < int(_loc6_.length))
                  {
                     _loc16_ = _loc6_[_loc15_];
                     _loc15_++;
                     _loc20_ = int(Col.mergeCol(int(Col.getRainbow2(_loc19_)),_loc11_,_loc18_));
                     _loc19_ = Number(_loc19_ + _loc17_ % 1);
                     param2.lineStyle(_loc10_ * _loc16_.size,_loc20_,1);
                     param2.lineTo(Number(_loc16_.x),Number(Number(_loc16_.y) + _loc12_));
                  }
                  continue;
               case 2:
                  _loc15_ = 0;
                  _loc16_ = param1[_loc15_];
                  _loc21_ = [24,8];
                  _loc20_ = 0;
                  _loc22_ = 0;
                  param2.moveTo(Number(_loc16_.x),Number(Number(_loc16_.y) + _loc12_));
                  while(true)
                  {
                     _loc20_ = _loc20_ + int(_loc21_[_loc22_]);
                     if(_loc20_ >= _loc4_.§REo\x12§[0])
                     {
                        break;
                     }
                     _loc23_ = _loc4_.§S=6 §(_loc20_).§#\x16\x16\x01§;
                     if(_loc22_ == 0)
                     {
                        param2.lineTo(Number(_loc23_.x),Number(Number(_loc23_.y) + _loc12_));
                     }
                     if(_loc22_ == 1)
                     {
                        param2.moveTo(Number(_loc23_.x),Number(Number(_loc23_.y) + _loc12_));
                     }
                     _loc22_ = int((_loc22_ + 1) % 2);
                  }
                  continue;
            }
         }
      }
      
      public function _x_cogneContreMur() : void
      {
         var _loc1_:* = null as Card;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(Game.me.have(_CardType.RESSORT,true,true))
         {
            _loc1_ = Game.me.§iD\b\x10§(_CardType.RESSORT);
            _loc1_._x_blanchirCarte(_loc1_.data.time);
            new _x_Rebond();
            if(Game.me.have(_CardType.POTION_PINK))
            {
               _loc2_ = 0;
               while(_loc2_ < 3)
               {
                  _loc2_++;
                  _loc3_ = _loc2_;
                  Game.me._x_creerFruitType(_x_TYPE.Pink);
               }
            }
            return;
         }
         if(Game.me.have(_CardType.POTION_YELLOW))
         {
            _loc1_ = Game.me.§iD\b\x10§(_CardType.POTION_YELLOW);
            _loc1_.flip();
            new _x_Rebond();
            new §0\x1d_Y\x01§();
            return;
         }
         §1g\x03O\x01§();
      }
      
      public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Array;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         if(!freeze[0])
         {
            §\n(E7\x01§();
         }
         §Tx\x05@\x02§();
         if(Game.me.have(_CardType.POTION_ORANGE))
         {
            _loc1_ = 0;
            _loc2_ = trq;
            while(_loc1_ < int(_loc2_.length))
            {
               _loc3_ = _loc2_[_loc1_];
               _loc1_++;
               _loc4_ = 0.98;
               _loc3_.vx = _loc3_.vx * _loc4_;
               _loc3_.vy = _loc3_.vy * _loc4_;
               _loc3_.x = Number(Number(_loc3_.x) + Number(_loc3_.vx));
               _loc3_.y = Number(Number(_loc3_.y) + Number(_loc3_.vy));
               _loc5_ = Stage.me.clamp(Number(_loc3_.x),Number(_loc3_.y),4);
               _loc3_.x = Number(_loc5_.x);
               _loc3_.y = Number(_loc5_.y);
            }
         }
         §#\tO\x01\x01§();
         digest();
         if(§1hjf\x02§ != null)
         {
            §\x1bS+)\x03§();
         }
         Game.me.gameLog.§?[Qy\x01§ = int(Number(Math.max(Number(Game.me.gameLog.§?[Qy\x01§),length[0])));
      }
      
      public function turn(param1:int) : void
      {
         angle = Number(angle + s6WT() * param1);
         §G\x17} § = param1;
      }
      
      public function §\x0171\t\x01§(param1:int) : void
      {
         var _loc2_:* = null as DropShadowFilter;
         switch(param1)
         {
            case 0:
               pal = [Gfx.col("snake_0"),Gfx.col("snake_1"),Gfx.col("snake_2")];
               root.blendMode = BlendMode.NORMAL;
               _loc2_ = new DropShadowFilter(2,90,21811,0.5,4,4,1);
               mcq.filters = [_loc2_];
               break;
            case 1:
               pal = [Gfx.col("blue_0"),Gfx.col("blue_1"),Gfx.col("blue_2")];
               root.blendMode = BlendMode.HARDLIGHT;
               mcq.alpha = 2;
               mcq.filters = [];
         }
      }
      
      public function §,\x04\x19\x02§() : void
      {
         var _loc7_:* = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc2_:Number = x;
         var _loc3_:Number = y;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = trq;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            _loc8_ = _loc2_ - _loc7_.x;
            _loc9_ = _loc3_ - _loc7_.y;
            _loc1_ = Number(_loc1_ + Number(Math.sqrt(Number(_loc8_ * _loc8_ + _loc9_ * _loc9_))));
            if(_loc1_ > length[0])
            {
               break;
            }
            _loc2_ = Number(_loc7_.x);
            _loc3_ = Number(_loc7_.y);
            _loc4_++;
         }
         trq = trq.slice(0,_loc4_);
         trq.reverse();
         §@k\x15`§();
         §W`\x14@\x03§();
      }
      
      public function §@k\x15`§() : void
      {
         if(int(trq.length) < 2)
         {
            return;
         }
         var _loc1_:* = trq[0];
         var _loc2_:* = trq[1];
         x = Number(_loc1_.x);
         y = Number(_loc1_.y);
         var _loc3_:Number = _loc1_.x - _loc2_.x;
         var _loc4_:Number = _loc1_.y - _loc2_.y;
         angle = Number(Math.atan2(_loc4_,_loc3_));
      }
      
      public function _x_cogneContreQueue() : void
      {
         var _loc1_:* = null as Card;
         if(§Pr;i\x02§[0])
         {
            return;
         }
         if(Game.me.have(_CardType.POTION_BLUE))
         {
            _loc1_ = Game.me.§iD\b\x10§(_CardType.POTION_BLUE);
            _loc1_.flip();
            new _x_PotionBleue();
            return;
         }
         §1g\x03O\x01§();
      }
      
      public function §\n(E7\x01§() : void
      {
         var _loc1_:Number = speed;
         var _loc2_:Number = 0;
         if(thrusting)
         {
            _loc2_ = Number(_loc2_ + thrust);
            if(Game.me.have(_CardType.ROLLER))
            {
               _loc2_ = _loc2_ * 2;
            }
            thrusting = false;
            if(int(Game.me.§\x0e\b$\r§[0] % 4) == 0 && Boolean(Game.me.have(_CardType.CLOUD,true)))
            {
               Game.me._x_addPoints(20);
               Game.me._x_remplirBouclier(0.02);
            }
         }
         var _loc3_:Number = _loc2_ - §O\r\x1a4\x02§;
         §O\r\x1a4\x02§ = Number(§O\r\x1a4\x02§ + _loc3_ * 0.25);
         _loc1_ = Number(_loc1_ + Game.me.speed[0] / 100 * Cs.§\x1eT|\x17\x02§);
         _loc1_ = Number(_loc1_ + boost);
         if(Game.me.have(_CardType.FEATHER))
         {
            _loc1_ = _loc1_ * 0.7;
         }
         if(Game.me.have(_CardType.SOCKS))
         {
            _loc1_ = _loc1_ * 0.85;
         }
         _loc1_ = Number(_loc1_ + §O\r\x1a4\x02§);
         if(Chausson.ACTIVE)
         {
            _loc1_ = _loc1_ * Chausson.coef;
         }
         if(Battery.ACTIVE)
         {
            _loc1_ = _loc1_ * Battery.coef;
         }
         if(Brake.ACTIVE)
         {
            _loc1_ = _loc1_ * Brake.coef;
         }
         if(Soap.ACTIVE)
         {
            _loc1_ = _loc1_ * Soap.speedCoef;
         }
         boost = boost * 0.8;
         §|\x01P \x02§ = _loc1_;
         x = Number(x + §\x19\n\t\x01§.cos(angle) * _loc1_);
         y = Number(y + §\x19\n\t\x01§.sin(angle) * _loc1_);
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = Number(Num.hMod(angle - lance * 0.01,3.14));
         lance = Number(lance + _loc6_ * 100 * 0.1);
         var _loc7_:Number = 0.4;
         var _loc8_:Number = lance * 0.01;
         _loc4_ = §\x19\n\t\x01§.cos(_loc8_) * _loc7_;
         _loc5_ = §\x19\n\t\x01§.sin(_loc8_) * _loc7_;
         if(test == null)
         {
            test = 0;
         }
         test = (test + 2) % 628;
         var _loc9_:Number = Number(0.75 + Math.cos(test * 0.01) * 0.75);
         trq.unshift({
            "x":x,
            "y":y,
            "vx":_loc4_ * _loc9_,
            "vy":_loc5_ * _loc9_
         });
      }
      
      public function §W`\x14@\x03§() : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         queue = [];
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:* = trq[0];
         while(_loc2_ < int(trq.length))
         {
            _loc4_ = trq[_loc2_];
            _loc5_ = Number(_loc4_.x);
            _loc6_ = Number(_loc4_.y);
            _loc7_ = _loc3_.x - _loc4_.x;
            _loc8_ = _loc3_.y - _loc4_.y;
            _loc9_ = Number(Math.sqrt(Number(_loc7_ * _loc7_ + _loc8_ * _loc8_)));
            if(Number(_loc1_ + _loc9_) > length[0])
            {
               _loc10_ = length[0] - _loc1_;
               _loc11_ = _loc10_ / _loc9_;
               _loc5_ = _loc3_.x - _loc11_ * _loc7_;
               _loc6_ = _loc3_.y - _loc11_ * _loc8_;
            }
            _loc1_ = Number(_loc1_ + _loc9_);
            queue.push({
               "x":_loc5_,
               "y":_loc6_,
               "size":1,
               "pos":_loc1_
            });
            _loc3_ = _loc4_;
            _loc2_ = _loc2_ + Snake.§Q\nx\x07\x03§;
            §REo\x12§ = [_loc1_];
            if(§REo\x12§[0] >= length[0])
            {
               break;
            }
         }
         if(§REo\x12§[0] < length[0] && !BlackHole.ACTIVE)
         {
            §Skqa\x01§();
         }
      }
      
      public function §\x1bS+)\x03§() : void
      {
         §1hjf\x02§ = Number(Math.max(§1hjf\x02§ - 0.025,0));
         var _loc1_:Number = Number(Math.pow(§1hjf\x02§,0.5));
         root.filters = [];
         Filt.glow(root,10 * _loc1_,_loc1_,16777215);
         Filt.glow(root,2,_loc1_,16776960);
         Col.setColor(root,0,int(_loc1_ * 255));
         if(§1hjf\x02§ == 0)
         {
            §1hjf\x02§ = null;
         }
      }
      
      public function kill() : void
      {
         mcq.parent.removeChild(mcq);
         Game.me.snake = null;
      }
      
      public function §Di&b\x03§(param1:Object) : Boolean
      {
         return (Number(param1.x) != x || Number(param1.y) != y) && Number(param1.pos) < §REo\x12§[0];
      }
      
      public function init() : void
      {
         length = [Cs.§eQU\x19\x01§];
         if(Game.me.training[0])
         {
            length = [50];
         }
         trq = [];
         stomach = [];
         angle = Number(Math.atan2(Stage.me.height * 0.5 - y,Stage.me.width * 0.5 - x));
         var _loc1_:int = Snake.§`6c)§ + 1;
         x = Number(Num.mm(_loc1_,x,Stage.me.width - _loc1_));
         y = Number(Num.mm(_loc1_,y,Stage.me.height - _loc1_));
      }
      
      public function §dZ9\x0b\x01§(param1:Number) : void
      {
         length = [Number(length[0] + param1)];
         if(length[0] < 20)
         {
            length = [20];
         }
      }
      
      public function §1g\x03O\x01§() : void
      {
         Game.me.shake(0,§|\x01P \x02§ * 3,0.75);
         dead = true;
         Game.me.§\x07~\x016\x01§();
      }
      
      public function s6WT() : Number
      {
         var _loc1_:Number = Cs.§QF\x1cT\x01§;
         if(Game.me.have(_CardType.RING))
         {
            _loc1_ = _loc1_ * 1.5;
         }
         _loc1_ = _loc1_ * (1 - §x4\x06d\x01§);
         if(Soap.ACTIVE)
         {
            _loc1_ = _loc1_ * 0.1;
         }
         return _loc1_;
      }
      
      public function §S=6 §(param1:Number) : Object
      {
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc2_:* = {
            "x":x,
            "y":y,
            "pos":0,
            "size":1
         };
         if(queue == null)
         {
            return {
               "#\x16\x16\x01":_loc2_,
               "a":0
            };
         }
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:Array = queue;
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_];
            _loc4_++;
            if(Number(_loc6_.pos) >= param1 || _loc6_ == queue[int(queue.length) - 1])
            {
               _loc2_ = _loc6_;
               if(_loc3_ != null)
               {
                  _loc7_ = (param1 - _loc3_.pos) / (_loc6_.pos - _loc3_.pos);
                  _loc2_ = {
                     "pos":Number(Number(_loc3_.pos) + (_loc6_.pos - _loc3_.pos) * _loc7_),
                     "size":Number(Number(_loc3_.size) + (_loc6_.size - _loc3_.size) * _loc7_),
                     "x":Number(Number(_loc3_.x) + (_loc6_.x - _loc3_.x) * _loc7_),
                     "y":Number(Number(_loc3_.y) + (_loc6_.y - _loc3_.y) * _loc7_)
                  };
               }
               break;
            }
            _loc3_ = _loc6_;
         }
         _loc7_ = 0;
         if(_loc3_ != null)
         {
            _loc8_ = _loc2_.x - _loc3_.x;
            _loc9_ = _loc2_.y - _loc3_.y;
            _loc7_ = Number(Math.atan2(_loc9_,_loc8_));
         }
         return {
            "#\x16\x16\x01":_loc2_,
            "a":_loc7_
         };
      }
      
      public function _x_fruitLePlusProche() : Fruit
      {
         var _loc5_:* = null as Fruit;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:Fruit = null;
         var _loc2_:Number = 99999.9;
         var _loc3_:int = 0;
         var _loc4_:Array = Game.me.fruits;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = _loc5_.x - x;
            _loc7_ = _loc5_.y - y;
            _loc8_ = Number(Math.sqrt(Number(_loc6_ * _loc6_ + _loc7_ * _loc7_)));
            if(_loc8_ < _loc2_)
            {
               _loc2_ = _loc8_;
               _loc1_ = _loc5_;
            }
         }
         return _loc1_;
      }
      
      public function §\x06r0O\x02§(param1:Number, param2:Number, param3:int = 10, param4:int = 2) : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as Part;
         var _loc9_:Number = NaN;
         var _loc11_:* = null as BitmapData;
         var _loc12_:* = null as Matrix;
         var _loc13_:Number = NaN;
         var _loc5_:Part = Stage.me.§X\x0f;z\x03§("body_explode");
         _loc5_.setPos(int(param1),int(param2));
         _loc5_.sprite.scaleX = int(Std.random(2)) * 2 - 1;
         _loc5_.sprite.scaleY = int(Std.random(2)) * 2 - 1;
         Stage.me.§?j\x03§(_loc5_.sprite,Stage.§|r;h§);
         var _loc6_:int = 0;
         while(_loc6_ < param4)
         {
            _loc6_++;
            _loc7_ = _loc6_;
            _loc8_ = Part.get();
            Stage.me.dm.add(_loc8_.sprite,Stage.DP_FX);
            _loc8_.ray = 2;
            _loc8_.sprite.drawFrame(Gfx.fx.get(int(Std.random(6)),"snake_parts"));
            _loc8_.FFfR(true);
            _loc8_.x = param1;
            _loc8_.y = param2;
            _loc9_ = Math.random() * 6;
            _loc8_.vz = -Math.random() * 8;
            _loc8_.vx = (Math.random() * 2 - 1) * _loc9_;
            _loc8_.vy = (Math.random() * 2 - 1) * _loc9_;
            _loc8_.weight = 0.4;
            _loc8_.frict = 0.92;
            _loc8_.timer = 30 + int(Std.random(15));
            _loc8_.updatePos();
         }
         if(!Game.me.§JO[;§)
         {
            return;
         }
         param3 = 1;
         var _loc10_:Element = new Element();
         _loc6_ = 0;
         while(_loc6_ < param3)
         {
            _loc6_++;
            _loc7_ = _loc6_;
            _loc10_.drawFrame(Gfx.fx.get(int(Std.random(5)),"blood_mini_spot"));
            _loc11_ = Stage.me.gore.bitmapData;
            _loc12_ = new Matrix();
            _loc9_ = Number(param1 + (Math.random() * 2 - 1) * 8);
            _loc13_ = Number(param2 + (Math.random() * 2 - 1) * 8);
            _loc12_.translate(int(_loc9_),int(_loc13_));
            _loc11_.draw(_loc10_,_loc12_);
         }
         _loc10_.kill();
         _loc6_ = 16;
         Stage.me.§~i\x18[\x02§(new Rectangle(param1 - _loc6_,param2 - _loc6_,_loc6_ * 2,_loc6_ * 2));
         §G\x11aR\x03§(param1,param2,10,4);
      }
      
      public function §Skqa\x01§() : void
      {
         var _loc3_:* = null as Part;
         var _loc1_:* = queue[int(queue.length) - 1];
         var _loc2_:Line = Line.get();
         _loc2_.§\nMo7§(Math.random() * 6.28,Number(1 + Math.random() * 2),-Math.random());
         _loc2_.x = Number(Number(_loc1_.x) + _loc2_.vx);
         _loc2_.y = Number(Number(_loc1_.y) + _loc2_.vy);
         _loc2_.color = 16777215;
         _loc2_.timer = 30;
         _loc2_.multi = 2;
         _loc2_.§1hjf\x02§ = 1;
         _loc2_.updatePos();
         Stage.me.dm.add(_loc2_.sprite,Stage.DP_FX);
         _loc2_.sprite.blendMode = BlendMode.ADD;
         _loc2_.updatePos();
         if(int(Game.me.§\x0e\b$\r§[0] % 3) == 0)
         {
            _loc3_ = Stage.me.§X\x0f;z\x03§("pulse");
            _loc3_.x = Number(_loc1_.x);
            _loc3_.y = Number(_loc1_.y);
            _loc3_.updatePos();
            _loc3_.sprite.blendMode = BlendMode.ADD;
            _loc3_.sprite.alpha = 0.5;
         }
      }
      
      public function §7\x04V,\x03§(param1:Object) : void
      {
         §1hjf\x02§ = param1;
         §\x1bS+)\x03§();
      }
      
      public function §\x0bH\x0eE\x02§(param1:Number, param2:Number = 2.0) : void
      {
         var _loc7_:* = null;
         if(!Game.me.§JO[;§)
         {
            return;
         }
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = queue;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            _loc3_ = Number(_loc7_.x);
            _loc4_ = Number(_loc7_.y);
            if(Number(_loc7_.pos) >= param1)
            {
               break;
            }
         }
         if(param1 == 0)
         {
            _loc3_ = x;
            _loc4_ = y;
         }
         var _loc8_:Element = new Element();
         _loc8_.drawFrame(Gfx.fx.get(0,"blood"));
         _loc8_.x = _loc3_;
         _loc8_.y = _loc4_;
         Stage.me.ground.addChild(_loc8_);
         var _loc9_:BitmapData = Stage.me.gore.bitmapData;
         var _loc10_:Matrix = new Matrix();
         _loc5_ = int(Std.random(2)) * 2 - 1;
         var _loc11_:int = int(Std.random(2)) * 2 - 1;
         _loc10_.scale(param2 * _loc5_,param2 * _loc11_);
         _loc10_.translate(_loc3_,_loc4_);
         _loc9_.draw(_loc8_,_loc10_);
         Stage.me.§~i\x18[\x02§(_loc8_.getBounds(Stage.me.bg));
         _loc8_.kill();
      }
      
      public function §G\x11aR\x03§(param1:Number, param2:Number, param3:int = 6, param4:int = 5) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as §Y9u~\x03§;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(!Game.me.§JO[;§)
         {
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < param3)
         {
            _loc5_++;
            _loc6_ = _loc5_;
            _loc7_ = §Y9u~\x03§.get();
            _loc8_ = Math.random() * 6.28;
            _loc9_ = Math.random() * param4;
            _loc7_.vx = §\x19\n\t\x01§.cos(_loc8_) * _loc9_;
            _loc7_.vy = §\x19\n\t\x01§.sin(_loc8_) * _loc9_;
            _loc7_.x = Number(param1 + _loc7_.vx * 2);
            _loc7_.y = Number(param2 + _loc7_.vy * 2);
            _loc7_.z = -4;
            _loc7_.vz = _loc9_ - param4 * 0.5;
            if(Number(Math.random()) < 0.2)
            {
               _loc7_.vz = _loc7_.vz - Math.random() * 4;
            }
         }
      }
      
      public function §U{\x04\\§() : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as Part;
         var _loc8_:* = null as Part;
         var _loc1_:int = 3;
         var _loc2_:int = 0;
         var _loc3_:Array = queue;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = 0;
            while(_loc5_ < 3)
            {
               _loc5_++;
               _loc6_ = _loc5_;
               _loc7_ = Part.get();
               _loc7_.sprite.setAnim(Gfx.fx.getAnim("spark_dust"),true);
               _loc7_.x = Number(_loc4_.x) + int(Std.random(9)) - 4;
               _loc7_.y = Number(_loc4_.y) + int(Std.random(9)) - 4;
               _loc7_.timer = 10 + int(Std.random(20));
               _loc7_.weight = -(0.05 + Math.random() * 0.3);
               _loc7_.frict = 0.9;
               _loc7_.sprite.anim.gotoRandom();
               Stage.me.dm.add(_loc7_.sprite,Stage.DP_FX);
               _loc7_.§Hp@\x0f\x01§(_loc6_ * _loc1_ + int(Std.random(_loc1_)));
               _loc8_ = Stage.me.§X\x0f;z\x03§("spark_dust_blow");
               _loc8_.x = _loc7_.x;
               _loc8_.y = _loc7_.y;
               _loc8_.§Hp@\x0f\x01§(_loc6_ * _loc1_ + int(Std.random(_loc1_)));
               _loc8_.sprite.anim.stop();
               _loc8_.sprite.blendMode = BlendMode.ADD;
               _loc8_.sprite.alpha = 0.5;
               Filt.glow(_loc8_.sprite,9,1,16777215);
               _loc7_.updatePos();
               _loc8_.updatePos();
            }
         }
      }
      
      public function explode(param1:int) : void
      {
         var _loc2_:* = null;
         length = [length[0] - param1];
         if(length[0] - param1 < 5)
         {
            length = [0];
         }
         while(true)
         {
            _loc2_ = queue.pop();
            if(int(queue.length) == 0 || Number(_loc2_.pos) < length[0])
            {
               break;
            }
            §\x06r0O\x02§(Number(_loc2_.x),Number(_loc2_.y));
         }
         §Tx\x05@\x02§();
         if(length[0] == 0)
         {
            Game.me.§\x07~\x016\x01§();
         }
      }
      
      public function eat(param1:Fruit) : void
      {
         var _loc4_:* = null as Card;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc10_:int = 0;
         param1.kill();
         Game.me._x_augmenteFruitibar(Number(param1.getVit()));
         var _loc2_:* = null;
         var _loc3_:Boolean = true;
         if(int(stomach.length) >= 2 && Boolean(Game.me.have(_CardType.BELT,false,true)))
         {
            _loc4_ = Game.me.§iD\b\x10§(_CardType.BELT,true);
            _loc4_._x_blanchirCarte(_loc4_.data.time);
            _loc3_ = false;
         }
         if(_loc3_)
         {
            _loc5_ = null;
            _loc6_ = Number(param1.getCal());
            if(Game.me.have(_CardType.POO) && !param1.has(_x_TYPE.Shit))
            {
               _loc5_ = 0;
               _loc6_ = _loc6_ * 0.4;
            }
            _loc2_ = {
               "pos":-Snake.§\x0bKox\x03§ * 0.25,
               "cal":_loc6_,
               "type":_loc5_,
               "V\nW\x12\x02":1,
               "speed":1
            };
            stomach.push(_loc2_);
         }
         var _loc7_:int = int(param1.getScore());
         if(_loc7_ < 0 && Boolean(Game.me.have(_CardType.GLOTTIS,true,true)))
         {
            _loc4_ = Game.me.§iD\b\x10§(_CardType.GLOTTIS);
            _loc4_._x_blanchirCarte(_loc4_.data.time);
            if(_loc2_ != null)
            {
               _loc2_.§V\nW\x12\x02§ = int(_loc2_.§V\nW\x12\x02§) * -1;
            }
         }
         else
         {
            Game.me._x_addPoints(_loc7_,param1.x,param1.y - 14);
         }
         if(!param1.has(_x_TYPE.Sugar) && Boolean(Game.me.have(_CardType.WOOL,true)))
         {
            new Reduce(8,2);
         }
         if(param1.has(_x_TYPE.Flower) && Boolean(Game.me.have(_CardType.THORNS,true)))
         {
            new Reduce(50 * int(Game.me.§2~\f#\x03§(_CardType.THORNS)),2);
         }
         if(param1.has(_x_TYPE.Courge) && Boolean(Game.me.have(_CardType.CAULDRON,true)))
         {
            new _x_ajouteBouclier();
         }
         if(Game.me.have(_CardType.MAGIC_POWDER))
         {
            new MagicPowder(int(Game.me.§2~\f#\x03§(_CardType.MAGIC_POWDER)));
         }
         if((param1.has(_x_TYPE.Poire) || Boolean(param1.has(_x_TYPE.Apple))) && Boolean(Game.me.have(_CardType.BRANDY,true)))
         {
            new Brandy();
         }
         if(Game.me.have(_CardType.BOUNTY))
         {
            §](]Y\x02§.me._x_primeRecolte(param1);
         }
         if(Game.me.have(_CardType._x_STAR_SHOOTING) && int(Game.me.fruits.length) > 0 && !param1.star)
         {
            new §\t`v\x1f\x03§(param1);
         }
         var _loc8_:int = 1 + int(Game.me.§2~\f#\x03§(_CardType._x_LOUPE));
         if(param1._x_debugEncyclopefruitNull)
         {
            _loc8_ = 0;
         }
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc9_++;
            _loc10_ = _loc9_;
            Game.me.gameLog.fruits.push(param1.gid);
         }
         new Eaten(param1);
      }
      
      public function §\x0b\x06Ll\x03§(param1:Object) : void
      {
         var _loc2_:Graphics = mcq.graphics;
         _loc2_.beginFill(int(param1.color));
         _loc2_.lineStyle(1,int(param1.line),1);
         var _loc3_:Number = (1 - param1.size) * 5;
         if(int(param1.color) != 16777215)
         {
            _loc3_ = Number(_loc3_ + 2);
         }
         _loc2_.drawCircle(Number(param1.x),Number(Number(param1.y) + _loc3_),Number(param1.ray));
         _loc2_.endFill();
      }
      
      public function §Tx\x05@\x02§() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null as Array;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         §W`\x14@\x03§();
         if(int(queue.length) < 2)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:Array = stomach;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_ = 0;
            _loc5_ = queue;
            while(_loc4_ < int(_loc5_.length))
            {
               _loc6_ = _loc5_[_loc4_];
               _loc4_++;
               _loc7_ = _loc6_.pos - _loc3_.pos;
               _loc8_ = 0.3;
               _loc9_ = Snake.§\x0bKox\x03§ * (1 + (_loc3_.cal - 10) * 0.1 * _loc8_);
               _loc9_ = Number(Math.min(_loc9_,80));
               _loc10_ = Number(Math.min(Number(2.5 + _loc6_.pos * 0.05),7));
               if(Number(_loc6_.pos) > Number(Number(_loc3_.pos) + _loc9_))
               {
                  break;
               }
               if(Number(_loc6_.pos) > _loc3_.pos - _loc9_)
               {
                  _loc11_ = _loc7_ / _loc9_;
                  _loc6_.size = Number(Number(_loc6_.size) + (1 - Math.abs(_loc11_)) * (_loc3_.cal / 10) * 0.65);
                  if(Number(_loc6_.size) > _loc10_)
                  {
                     _loc6_.size = _loc10_;
                  }
               }
            }
         }
         _loc7_ = Number(queue[0].size);
         _loc2_ = [];
         _loc8_ = Number(4 + 3 * (_loc7_ - 1));
         _loc9_ = 1.57;
         _loc1_ = -2;
         _loc10_ = §\x19\n\t\x01§.cos(angle) * _loc1_;
         _loc11_ = §\x19\n\t\x01§.sin(angle) * _loc1_;
         _loc4_ = -3;
         var _loc12_:int = 0;
         while(_loc12_ < 3)
         {
            _loc12_++;
            _loc13_ = _loc12_;
            _loc14_ = Number(angle + _loc9_ * (_loc13_ * 2 - 1));
            _loc14_ = Number(Num.hMod(_loc14_,3.14));
            _loc15_ = _loc10_;
            _loc16_ = Number(_loc11_ + _loc4_);
            _loc17_ = Number(1.7 + (_loc7_ - 1) * 0.5);
            _loc18_ = 0;
            _loc19_ = 2236962;
            if(_loc13_ == 2)
            {
               _loc14_ = Number(Num.hMod(angle,3.14));
               _loc15_ = 0;
               _loc16_ = 0;
               _loc17_ = (_loc7_ - 1) * 6;
               _loc18_ = 11141120;
               _loc19_ = 2123264;
            }
            _loc3_ = {
               "x":Number(Number(x + §\x19\n\t\x01§.cos(_loc14_) * _loc8_) + _loc15_),
               "y":Number(Number(y + §\x19\n\t\x01§.sin(_loc14_) * _loc8_) + _loc16_),
               "size":_loc7_,
               "front":_loc14_ >= 0,
               "ray":_loc17_,
               "color":_loc18_,
               "line":_loc19_
            };
            _loc2_.push(_loc3_);
         }
         var _loc20_:Graphics = mcq.graphics;
         _loc20_.clear();
         if(tongue != null)
         {
            _loc3_ = queue[0];
            _loc20_.lineStyle(2,16746632);
            _loc20_.moveTo(x,y);
            _loc20_.lineTo(tongue.x,tongue.y);
         }
         _loc12_ = 0;
         while(_loc12_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc12_];
            _loc12_++;
            if(!_loc3_.front)
            {
               §\x0b\x06Ll\x03§(_loc3_);
            }
         }
         Snake.§^LL*§(queue,_loc20_);
         _loc12_ = 0;
         while(_loc12_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc12_];
            _loc12_++;
            if(_loc3_.front)
            {
               §\x0b\x06Ll\x03§(_loc3_);
            }
         }
         while(int(trq.length) > 1600)
         {
            trq.pop();
         }
      }
      
      public function digest() : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null as Fruit;
         var _loc8_:* = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = null as §Y9u~\x03§;
         var _loc1_:int = 6;
         var _loc2_:Array = stomach.copy();
         var _loc3_:int = 1;
         if(Game.me.have(_CardType.PRUNE))
         {
            _loc3_ = 4;
            _loc1_ = _loc1_ * 2;
         }
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc2_.length))
         {
            _loc5_ = _loc2_[_loc4_];
            _loc4_++;
            _loc5_.pos = Number(Number(_loc5_.pos) + _loc1_ * int(_loc5_.§V\nW\x12\x02§) * _loc5_.speed);
            if(Number(_loc5_.pos) > Number(length[0] + Snake.§\x0bKox\x03§ * 0.5))
            {
               _loc5_.cal = _loc5_.cal - _loc3_;
               length = [Number(length[0] + _loc3_)];
               if(Number(_loc5_.cal) <= 0)
               {
                  stomach.remove(_loc5_);
               }
               _loc6_ = _loc5_.type;
               if(_loc6_ == 0)
               {
                  _loc7_ = Fruit.get(180);
                  _loc8_ = §S=6 §(§REo\x12§[0]).§#\x16\x16\x01§;
                  _loc7_.x = Number(_loc8_.x);
                  _loc7_.y = Number(_loc8_.y);
                  _loc5_.type = null;
               }
            }
            if(Number(_loc5_.pos) < -Snake.§\x0bKox\x03§)
            {
               _loc5_.cal = _loc5_.cal - _loc3_;
               if(Number(_loc5_.cal) <= 0)
               {
                  stomach.remove(_loc5_);
               }
               _loc9_ = Number(2 + Math.random() * 2);
               _loc10_ = Number(angle + (Math.random() * 2 - 1) * 0.3);
               _loc11_ = §Y9u~\x03§.get();
               _loc11_.setColor(int(Col.shuffle(8943360,30)));
               _loc11_.x = x;
               _loc11_.y = y;
               _loc11_.vx = §\x19\n\t\x01§.cos(_loc10_) * _loc9_;
               _loc11_.vy = §\x19\n\t\x01§.sin(_loc10_) * _loc9_;
               _loc11_.vz = -3;
            }
         }
         _loc5_ = Game.me.gameLog;
      }
      
      public function death() : void
      {
         if(int(queue.length) == 0)
         {
            return;
         }
         mcq.graphics.clear();
         var _loc1_:* = queue.shift();
         Snake.§^LL*§(queue,mcq.graphics);
         §\x06r0O\x02§(Number(_loc1_.x),Number(_loc1_.y),4,2);
      }
      
      public function cut(param1:Number, param2:Boolean = false, param3:Boolean = false) : §z\x1f)\x11\x01§
      {
         var _loc5_:* = null;
         var _loc6_:* = null as Part;
         var _loc7_:Number = NaN;
         var _loc4_:§z\x1f)\x11\x01§ = new §z\x1f)\x11\x01§(length[0] - param1,length[0]);
         if(param2)
         {
            _loc5_ = §S=6 §(length[0] - param1);
            _loc6_ = Part.get();
            _loc6_.sprite.drawFrame(Gfx.fx.get(0,"slash"));
            _loc7_ = Number(Number(_loc5_.a) + 1.57);
            _loc6_.sprite.rotation = _loc7_ / 0.0174;
            _loc6_.vx = §\x19\n\t\x01§.cos(_loc7_) * 5;
            _loc6_.vy = §\x19\n\t\x01§.sin(_loc7_) * 5;
            _loc6_.frict = 0.95;
            _loc6_.x = _loc5_.§#\x16\x16\x01§.x - _loc6_.vx * 3;
            _loc6_.y = _loc5_.§#\x16\x16\x01§.y - _loc6_.vy * 3;
            _loc6_.sprite.blendMode = BlendMode.ADD;
            _loc6_.timer = 10;
            _loc6_.fadeType = 1;
            _loc6_.sprite.scaleX = 2;
            Stage.me.dm.add(_loc6_.sprite,Stage.DP_FX);
         }
         length = [length[0] - param1];
         if(length[0] < 10)
         {
            length = [10];
         }
         §W`\x14@\x03§();
         if(param3)
         {
            new _x_Blood(12 / param1);
            _loc7_ = Number(0.5 + Math.min(param1 / 50,1) * 1.5);
            §\x0bH\x0eE\x02§(length[0],_loc7_);
         }
         return _loc4_;
      }
      
      public function §#\tO\x01\x01§() : void
      {
         var _loc5_:* = null as Fruit;
         var _loc6_:* = null as Bonus;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc1_:int = Snake.§`6c)§;
         var _loc2_:Rectangle = new Rectangle(x - _loc1_,y - _loc1_,_loc1_ * 2,_loc1_ * 2);
         var _loc3_:int = 0;
         var _loc4_:Array = Game.me.fruits;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.§oO~Y\x02§(_loc2_) && _loc5_.edible)
            {
               eat(_loc5_);
            }
         }
         _loc3_ = 0;
         _loc4_ = Game.me.bonus;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc6_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc6_.§oO~Y\x02§(_loc2_))
            {
               _loc6_.trig();
            }
         }
         _loc3_ = 10;
         var _loc7_:int = int(queue.length);
         while(_loc3_ < _loc7_)
         {
            _loc3_++;
            _loc8_ = _loc3_;
            _loc9_ = queue[_loc8_];
            _loc10_ = _loc9_.x - x;
            _loc11_ = _loc9_.y - y;
            _loc12_ = 5;
            _loc13_ = _loc12_ + _loc12_ * _loc9_.size - 4;
            if(Number(Math.sqrt(Number(_loc10_ * _loc10_ + _loc11_ * _loc11_))) < _loc13_)
            {
               _x_cogneContreQueue();
               break;
            }
         }
         _loc3_ = 0;
         _loc4_ = Game.me.obstacles;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc9_ = _loc4_[_loc3_];
            _loc3_++;
            _loc10_ = x - _loc9_.x;
            _loc11_ = y - _loc9_.y;
            if(Number(Math.sqrt(Number(_loc10_ * _loc10_ + _loc11_ * _loc11_))) < Number(Snake.§`6c)§ + Number(_loc9_.ray)))
            {
               if(_loc9_.collide != null)
               {
                  _loc9_.collide();
               }
               §1g\x03O\x01§();
               return;
            }
         }
         _loc3_ = Snake.§`6c)§;
         if(x <= _loc3_ || x > Stage.me.width - _loc3_ || y <= _loc3_ || y > Stage.me.height - _loc3_)
         {
            _x_cogneContreMur();
         }
      }
      
      public function burn() : void
      {
         Game.me.§\x07~\x016\x01§();
      }
      
      public function §O\no%\x01§() : void
      {
         trq.shift();
         §@k\x15`§();
         §W`\x14@\x03§();
      }
   }
}
