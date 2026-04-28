package
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Rectangle;
   import fx.§'\x18H\x14\x01§;
   import fx.Flash;
   import fx.MagicPowder;
   import fx.Score;
   import fx.Soap;
   import fx.Sparkling;
   import fx.Virus;
   import fx.§yX=1\x02§;
   import mt.Rand;
   import mt.bumdum9.Col;
   import mt.bumdum9.Filt;
   import mt.bumdum9.Num;
   import mt.fx.§qR))\x03§;
   import pix.Frame;
   
   public class Fruit extends Part
   {
      
      public static var POOL:Array = [];
      
      public static var boxes:Array = [];
      
      public static var _x_listeFamilles:Array;
      
      public static var negatives:Array;
      
      public static var §\x11\x026-§:int;
       
      
      public var §\x13{9\x1a§:Number;
      
      public var star:Boolean;
      
      public var _x_coeffPoint:Number;
      
      public var scale:Number;
      
      public var ry:Number;
      
      public var rx:Number;
      
      public var rotten:Boolean;
      
      public var light:Boolean;
      
      public var gid:int;
      
      public var _x_debugEncyclopefruitNull:Boolean;
      
      public var edible:Boolean;
      
      public var dummy:Boolean;
      
      public var death:Boolean;
      
      public var data:Object;
      
      public var §k|\x12\x0f\x03§:Number;
      
      public var box:Rectangle;
      
      public var _x_points:int;
      
      public var active:Boolean;
      
      public function Fruit(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         §GT\x0b\x01\x03§ = Fruit.POOL;
         §\x1c$\x15\x01§(param1);
      }
      
      public static function get(param1:Object = undefined) : Fruit
      {
         if(int(Fruit.POOL.length) == 0)
         {
            return new Fruit(param1);
         }
         var _loc2_:Fruit = Fruit.POOL.pop();
         _loc2_.init();
         _loc2_.§\x1c$\x15\x01§(param1);
         return _loc2_;
      }
      
      public static function init() : void
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as _x_TYPE;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:Array = Type.getEnumConstructs(_x_TYPE);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc1_.length))
         {
            _loc4_ = _loc1_[_loc3_];
            _loc3_++;
            _loc2_.push(Type.createEnum(_x_TYPE,_loc4_));
         }
         Fruit._x_listeFamilles = [];
         Fruit.negatives = [];
         _loc3_ = 0;
         while(_loc3_ < int(_loc2_.length))
         {
            _loc5_ = _loc2_[_loc3_];
            _loc3_++;
            Fruit._x_listeFamilles.push([]);
         }
         _loc3_ = 0;
         var _loc6_:Array = __fruitList.LIST;
         while(_loc3_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc3_];
            _loc3_++;
            _loc8_ = 0;
            _loc9_ = int(_loc2_.length);
            while(_loc8_ < _loc9_)
            {
               _loc8_++;
               _loc10_ = _loc8_;
               if(int(_loc7_.score) < 0)
               {
                  Fruit.negatives.push(int(_loc7_.rank));
               }
               if(Lambda.has(_loc7_.tags,_loc2_[_loc10_]))
               {
                  Fruit._x_listeFamilles[_loc10_].push(int(_loc7_.rank));
               }
            }
         }
      }
      
      public static function getNearest(param1:int, param2:_x_TYPE = undefined) : int
      {
         if(param2 == null)
         {
            return int(Fruit.§i\x15H\x13\x01§(param1,Fruit.negatives));
         }
         return int(Fruit.§i\x15H\x13\x01§(param1,Fruit._x_listeFamilles[param2.index]));
      }
      
      public static function §i\x15H\x13\x01§(param1:int, param2:Array) : int
      {
         var _loc5_:* = null as Rand;
         var _loc6_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:int = 9999;
         Fruit.§\x11\x026-§ = param1;
         param2.sort(Fruit.§N%CK\x02§);
         while(true)
         {
            _loc5_ = Game.me.seed;
            _loc6_ = _loc5_.seed * 16807 % 2147483647;
            _loc5_.seed = _loc6_;
            if(int((int(_loc6_) & 1073741823) % int(Fruit.getData(int(param2[0])).§\x0e-EY\x01§)) <= 0)
            {
               break;
            }
            param2.shift();
         }
         return int(param2[0]);
      }
      
      public static function §N%CK\x02§(param1:int, param2:int) : int
      {
         if(Number(Math.abs(Fruit.§\x11\x026-§ - param1)) < Number(Math.abs(Fruit.§\x11\x026-§ - param2)))
         {
            return -1;
         }
         return 1;
      }
      
      public static function §FZ\x017\x03§(param1:int) : int
      {
         var _loc2_:* = null as Rand;
         var _loc3_:Number = NaN;
         while(param1 < int(__fruitList.LIST.length) && int((int(_loc3_) & 1073741823) % int(Fruit.getData(param1).§\x0e-EY\x01§)) > 0)
         {
            param1++;
         }
         return param1;
      }
      
      public static function §\x04\x11\x0b\x05§(param1:int) : int
      {
         return int(__fruitList._x_appliqueFormulePoints(param1));
      }
      
      public static function getData(param1:int) : Object
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:Array = __fruitList.LIST;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(int(_loc4_.rank) == param1)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public static function §\n@%\x1f\x02§(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(__fruitList.LIST.length);
         while(_loc2_ < _loc3_)
         {
            _loc2_++;
            _loc4_ = _loc2_;
            if(int(__fruitList.LIST[_loc4_].rank) == param1)
            {
               return _loc4_;
            }
         }
         return -1;
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
         if(timer < Cs._x_tempsClignotement)
         {
            blink(2);
         }
         super.update();
      }
      
      public function unregister() : void
      {
         active = false;
         Game.me.fruits.remove(this);
      }
      
      override public function _x_disparition() : void
      {
         var _loc1_:* = null as _x_TYPE;
         var _loc2_:* = null as Fruit;
         var _loc4_:int = 0;
         var _loc5_:* = null as Score;
         if(Game.me.have(_CardType._x_SERRE))
         {
            _loc1_ = null;
            if(has(_x_TYPE.Green))
            {
               _loc1_ = _x_TYPE.Red;
            }
            if(has(_x_TYPE.Red) && Boolean(Game.me.have(_CardType.OGM)))
            {
               _loc1_ = _x_TYPE.Blue;
            }
            if(_loc1_ != null)
            {
               _loc2_ = Fruit.get(int(Fruit.getNearest(int(data.rank),_loc1_)));
               _loc2_.x = x;
               _loc2_.y = y;
               _loc2_.§\nMo7§(0,0,-2);
               _loc2_.updatePos();
               kill();
               return;
            }
         }
         var _loc3_:Boolean = true;
         if(has(_x_TYPE.Shit))
         {
            _loc3_ = false;
         }
         if(has(_x_TYPE.Leaf) && Boolean(Game.me.have(_CardType.ZIPPO,true)))
         {
            _loc3_ = false;
            §ro^T\x01§();
         }
         else if(Game.me.have(_CardType.MUSHROOM,true))
         {
            _loc4_ = -int(getScore());
            Game.me._x_addPoints(_loc4_);
            _loc5_ = new Score(x,y,_loc4_);
         }
         if(Virus.me != null)
         {
            Virus.me.§\x10\x1f\x16F\x01§(this);
         }
         if((int(data.score) < 0 || Boolean(Game.me.have(_CardType.OGM))) && Boolean(Game.me.have(_CardType._x_HERBICIDE)))
         {
            _loc3_ = false;
         }
         §'\x18H\x14\x01§.GRAVEYARD.push(int(data.rank));
         if(_loc3_)
         {
            if(Game.me.§N~d\x01§())
            {
               §)\x1c=;\x03§();
            }
            else
            {
               Game.me._x_augmenteFruitibar(-6);
               _x_animationCrane();
            }
         }
         super._x_disparition();
      }
      
      public function _x_creerFruitType() : void
      {
         timer = timer * 2;
         §\nMo7§(0,0,-1.5);
         new fx.Flash(sprite);
         new Sparkling(sprite,15);
      }
      
      public function §/2\x17§(param1:Number) : void
      {
         scale = param1;
         sprite.scaleX = param1;
         sprite.scaleY = param1;
         §T\n8\x02§.scaleX = param1;
         §T\n8\x02§.scaleY = param1;
         §\x18\x0e73\x03§();
      }
      
      public function §\x18\x0e73\x03§() : void
      {
         var _loc1_:* = null as BitmapData;
         var _loc2_:* = null as Frame;
         if(Fruit.boxes[gid] != null)
         {
            box = Fruit.boxes[gid];
         }
         else
         {
            _loc1_ = new BitmapData(32,32,true,0);
            _loc2_ = Gfx.fruits.get(gid);
            _loc2_.§V,o\x03§(_loc1_,0,0);
            box = _loc1_.getColorBoundsRect(-1,0,false);
            box.offset(-16,-16);
            Fruit.boxes[gid] = box;
         }
         box = box.clone();
         box.x = box.x * scale;
         box.y = box.y * scale;
         box.width = box.width * scale;
         box.height = box.height * scale;
      }
      
      override public function kill() : void
      {
         death = true;
         unregister();
         super.kill();
      }
      
      public function §\x1c$\x15\x01§(param1:Object = undefined) : void
      {
         edible = true;
         light = false;
         death = false;
         rotten = false;
         _x_debugEncyclopefruitNull = false;
         dummy = false;
         star = false;
         if(param1 == null)
         {
            param1 = int(Game.me._x_genererIdFruit());
         }
         data = Fruit.getData(param1);
         gid = int(Fruit.§\n@%\x1f\x02§(param1));
         _x_points = int(Fruit.§\x04\x11\x0b\x05§(param1));
         Game.me.fruits.push(this);
         rx = 14;
         ry = 14;
         x = 0;
         y = 0;
         z = 0;
         scale = 1;
         ray = 0;
         weight = 0.2;
         §\x188\x1b(\x03§ = 0.75;
         frict = 0.95;
         _x_coeffPoint = 1;
         §k|\x12\x0f\x03§ = 1;
         §\x13{9\x1a§ = 1;
         active = true;
         §d7Kz\x02§ = true;
         var _loc2_:Number = Cs.§;B0C§ * int(data.sta) * 0.075;
         if((int(data.score) < 0 || Boolean(Game.me.have(_CardType.OGM))) && !has(_x_TYPE.Shit) && Boolean(Game.me.have(_CardType._x_HERBICIDE,true)))
         {
            _loc2_ = _loc2_ * 0.4;
         }
         if(Game.me.have(_CardType.HOURGLASS))
         {
            _loc2_ = _loc2_ * 2;
         }
         if(has(_x_TYPE.Shit) && Boolean(Game.me.have(_CardType.KLEENEX)))
         {
            _loc2_ = _loc2_ * 0.6;
         }
         if(has(_x_TYPE.Shit) && Boolean(Game.me.have(_CardType.BROOM)))
         {
            _loc2_ = _loc2_ * 0.6;
         }
         timer = int(_loc2_);
         if(int(data.score) < 0)
         {
            Game.me.have(_CardType.IDOL,true);
         }
         var _loc3_:Frame = Gfx.fruits.get(gid,"main");
         sprite.drawFrame(_loc3_);
         Stage.me.dm.add(sprite,Stage.§p\x1fLp\x03§);
         FFfR(true);
         §\x18\x0e73\x03§();
         var _loc4_:int = int(Game.me.§2~\f#\x03§(_CardType.§Ol+\x03§));
         if(_loc4_ > 0)
         {
            new §yX=1\x02§(this,_loc4_);
         }
      }
      
      public function §oO~Y\x02§(param1:Rectangle, param2:Number = 0.0) : Boolean
      {
         if(Number(Math.abs(param2 - z)) > box.height * 0.5)
         {
            return false;
         }
         var _loc3_:Rectangle = box.clone();
         _loc3_.offset(x,y);
         return Boolean(_loc3_.intersects(param1));
      }
      
      public function hitTest(param1:Number, param2:Number, param3:int) : Boolean
      {
         var _loc4_:Number = param1 - x;
         var _loc5_:Number = param2 - y;
         return Number(Math.sqrt(Number(_loc4_ * _loc4_ + _loc5_ * _loc5_))) < param3 + 12;
      }
      
      public function has(param1:_x_TYPE) : Boolean
      {
         var _loc4_:* = null as _x_TYPE;
         var _loc2_:int = 0;
         var _loc3_:Array = data.tags;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getVit() : Number
      {
         if(rotten)
         {
            return 0;
         }
         var _loc1_:Number = int(data.vit) * 0.1 * §\x13{9\x1a§;
         _loc1_ = _loc1_ * 0.4;
         if(Game.me.have(_CardType.STEROID))
         {
            _loc1_ = _loc1_ * 2;
         }
         if(Game.me.have(_CardType.OGM))
         {
            _loc1_ = _loc1_ * 0.5;
         }
         if(Game.me.have(_CardType.__HAY) && int(data.score) < 0)
         {
            _loc1_ = Number(_loc1_ + 2);
         }
         return _loc1_;
      }
      
      public function getScore() : int
      {
         var _loc1_:Number = _x_points * int(data.score) * 0.1;
         var _loc2_:Function = Game.me.have;
         var _loc3_:int = 50 + (Boolean(_loc2_(_CardType._x_WINDFARM_SMALL))?100:0) + (Boolean(_loc2_(_CardType._x_WINDFARM_BIG))?300:0);
         if(_loc1_ < _loc3_ && Boolean(_loc2_(_CardType.KETCHUP,true)))
         {
            _loc1_ = _loc3_;
         }
         _loc1_ = Number(_loc1_ + 100 * int(Game.me.§2~\f#\x03§(_CardType.SALT)));
         _loc1_ = Number(_loc1_ + 200 * int(Game.me.§2~\f#\x03§(_CardType.PEPPER)));
         _loc1_ = Number(_loc1_ + 200 * int(Game.me.§2~\f#\x03§(_CardType.§xu1\x03§)) * Game.me.shield[0]);
         _loc1_ = Number(_loc1_ + MagicPowder.MAX[0]);
         _loc1_ = _loc1_ * _x_coeffPoint;
         if(Game.me.snake.rainbow)
         {
            _loc1_ = _loc1_ * 2;
         }
         if(_loc2_(_CardType.OGM))
         {
            _loc1_ = _loc1_ * 2;
         }
         if(_loc2_(_CardType.BULL,false))
         {
            _loc1_ = _loc1_ * 2;
         }
         if(has(_x_TYPE.Nut) && Boolean(_loc2_(_CardType.SQUIRREL,true)))
         {
            _loc1_ = _loc1_ * 10;
         }
         if(has(_x_TYPE.Sugar) && Boolean(_loc2_(_CardType.CANDY,true)))
         {
            _loc1_ = _loc1_ * 1.5;
         }
         if(has(_x_TYPE.Flower) && Boolean(_loc2_(_CardType.HONEYPOT,true)))
         {
            _loc1_ = _loc1_ * 5;
         }
         if(has(_x_TYPE.Leaf) && Boolean(_loc2_(_CardType._x_LEAF,true)))
         {
            _loc1_ = _loc1_ * 0.5;
         }
         if(timer < Cs._x_tempsClignotement && Boolean(_loc2_(_CardType.CANDLE,true)))
         {
            _loc1_ = _loc1_ * (2 * int(Game.me.§2~\f#\x03§(_CardType.CANDLE)));
         }
         if(int(data.rank) < 50 && Boolean(_loc2_(_CardType.LADLE,true)))
         {
            _loc1_ = _loc1_ * (2 * int(Game.me.§2~\f#\x03§(_CardType.LADLE)));
         }
         if(has(_x_TYPE.Red) && Boolean(_loc2_(_CardType.POTION_RED,true)))
         {
            _loc1_ = _loc1_ * (2 * int(Game.me.§2~\f#\x03§(_CardType.POTION_RED)));
         }
         if(int(Game.me.getTime()) < 90000 && Boolean(_loc2_(_CardType.LOUD_SPEAKER,true)))
         {
            _loc1_ = _loc1_ * (2 * int(Game.me.§2~\f#\x03§(_CardType.LOUD_SPEAKER)));
         }
         if(!!Soap.ACTIVE && Boolean(_loc2_(_CardType.SOAP,true)))
         {
            _loc1_ = _loc1_ * 2;
         }
         if(has(_x_TYPE.Red) && _loc1_ > 0 && Boolean(_loc2_(_CardType.BULL,true)))
         {
            _loc1_ = _loc1_ * -1;
         }
         return int(_loc1_);
      }
      
      public function getRay() : Number
      {
         var _loc1_:Number = Number(Math.max(-box.x,-box.y));
         _loc1_ = Number(Math.max(_loc1_,box.width - box.x));
         _loc1_ = Number(Math.max(_loc1_,box.height - box.y));
         return _loc1_;
      }
      
      public function getCal() : Number
      {
         if(light)
         {
            return 0;
         }
         var _loc1_:Number = int(data.cal) * 1 * §k|\x12\x0f\x03§;
         if(has(_x_TYPE.Leaf) && Boolean(Game.me.have(_CardType._x_LEAF)))
         {
            _loc1_ = _loc1_ * 0;
         }
         if(int(data.rank) < 50 + int(Game.me.§2~\f#\x03§(_CardType.BAT)) * 50 && Boolean(Game.me.have(_CardType.SERINGUE,true)))
         {
            _loc1_ = _loc1_ * 0;
         }
         var _loc2_:Rand = Game.me.seed;
         var _loc3_:Number = _loc2_.seed * 16807 % 2147483647;
         _loc2_.seed = _loc3_;
         if(int((int(_loc3_) & 1073741823) % 3) == 0 && Boolean(Game.me.have(_CardType.WORM,true)))
         {
            _loc1_ = _loc1_ * 0;
         }
         if(has(_x_TYPE.Blue) && Boolean(Game.me.have(_CardType.DOLPHIN,true)))
         {
            _loc1_ = _loc1_ * 0;
         }
         if(int(data.score) < 0 && Boolean(Game.me.have(_CardType.__HAY,true)))
         {
            _loc1_ = _loc1_ * 0;
         }
         if(Game.me.have(_CardType.OGM) && Boolean(Game.me.have(_CardType.HAMBURGER,true)))
         {
            _loc1_ = _loc1_ * 2;
         }
         return _loc1_;
      }
      
      public function §D\x01V5\x01§(param1:int, param2:String = undefined) : Part
      {
         if(param2 == null)
         {
            param2 = BlendMode.NORMAL;
         }
         var _loc3_:Part = Part.get();
         _loc3_.sprite.drawFrame(Gfx.fruits.get(gid));
         Stage.me.dm.add(_loc3_.sprite,Stage.§\t!B|§);
         _loc3_.x = sprite.x;
         _loc3_.y = sprite.y;
         _loc3_.timer = 10;
         _loc3_.fadeType = 1;
         Col.setPercentColor(_loc3_.sprite,1,param1);
         _loc3_.sprite.blendMode = param2;
         _loc3_.updatePos();
         return _loc3_;
      }
      
      public function §)\x1c=;\x03§() : void
      {
         var _loc1_:Part = Part.get();
         _loc1_.sprite.drawFrame(Gfx.fx.get(null,"big_shield"));
         _loc1_.x = x;
         _loc1_.y = y;
         _loc1_.fadeType = 1;
         _loc1_.timer = 15;
         _loc1_.fadeLimit = _loc1_.timer;
         _loc1_.updatePos();
         Stage.me.dm.add(_loc1_.sprite,Stage.DP_FX);
         _loc1_.sprite.blendMode = BlendMode.ADD;
         Filt.glow(_loc1_.sprite,8,0.5,16777215);
      }
      
      public function _x_animationCrane() : void
      {
         var _loc1_:Part = Stage.me.§X\x0f;z\x03§("crane");
         _loc1_.x = x;
         _loc1_.y = y;
         _loc1_.fadeType = 1;
         _loc1_.timer = 16;
         _loc1_.vy = -0.5;
         _loc1_.updatePos();
         _loc1_.sprite.blendMode = BlendMode.ADD;
         Filt.glow(_loc1_.sprite,8,0.4,16777215);
      }
      
      public function §ro^T\x01§() : void
      {
         var _loc1_:Part = Stage.me.§X\x0f;z\x03§("burn");
         _loc1_.setPos(x,y);
      }
      
      public function evolve(param1:int = 3) : void
      {
         var _loc2_:int = int(data.rank) + param1;
         var _loc3_:int = 280;
         while(_loc2_ < _loc3_ && int(Fruit.getData(_loc2_).§\x0e-EY\x01§) > 1)
         {
            _loc2_++;
         }
         if(_loc2_ > _loc3_)
         {
            _loc2_ = _loc3_;
         }
         var _loc4_:Fruit = Fruit.get(_loc2_);
         _loc4_.x = x;
         _loc4_.y = y;
         _loc4_.updatePos();
         _loc4_.timer = int(timer + 50);
         kill();
         var _loc5_:Sparkling = new Sparkling(_loc4_.sprite,20,3);
         _loc5_.anim = "line_fade";
         var _loc6_:mt.fx.Flash = new mt.fx.Flash(_loc4_.sprite,0.05);
         _loc6_.curveIn(2);
         var _loc7_:§qR))\x03§ = new §qR))\x03§(20,40,0.1);
         _loc7_.setPos(_loc4_.x,_loc4_.y);
         Stage.me.dm.add(_loc7_.root,Stage.§l\x10|-\x02§);
      }
      
      override public function §]\x01(S\x03§() : void
      {
         if(x < rx || x > Stage.me.width - rx)
         {
            vx = vx * -§\x188\x1b(\x03§;
            x = Number(Num.mm(rx,x,Stage.me.width - rx));
         }
         if(y < ry || y > Stage.me.height - ry)
         {
            vy = vy * -§\x188\x1b(\x03§;
            y = Number(Num.mm(ry,y,Stage.me.height - ry));
         }
      }
   }
}
