package
{
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mt.DepthManager;
   import mt.Rand;
   import mt.bumdum9.Col;
   import mt.bumdum9.Num;
   import pix.Anim;
   import pix.Element;
   import pix.Frame;
   
   public class Stage
   {
      
      public static var §\x1az\x01§:Array = [[1,0],[0,1],[-1,0],[0,-1]];
      
      public static var DP_FX:int = 8;
      
      public static var §p\x1fLp\x03§:int = 5;
      
      public static var §|r;h§:int = 4;
      
      public static var §'YOP\x01§:int = 3;
      
      public static var §\t!B|§:int = 2;
      
      public static var §l\x10|-\x02§:int = 1;
      
      public static var DP_BG:int = 0;
      
      public static var WALL:int = 3;
      
      public static var me:Stage;
       
      
      public var §\x13t]|\x02§:int;
      
      public var width:int;
      
      public var §\nAt^§:int;
      
      public var §D?\x02!\x03§:int;
      
      public var tiles:Array;
      
      public var §A3\x04o\x02§:Bitmap;
      
      public var §5Q-'\x03§:Sprite;
      
      public var seed:Rand;
      
      public var root:Sprite;
      
      public var §MX\x07\x03\x02§:BitmapData;
      
      public var relief:Sprite;
      
      public var mcWalls:Sprite;
      
      public var mask:Sprite;
      
      public var height:int;
      
      public var ground:Sprite;
      
      public var grid:Array;
      
      public var gore:Bitmap;
      
      public var dm:DepthManager;
      
      public var §I'\x10\x06§:Bitmap;
      
      public var bg:Element;
      
      public var art:BitmapData;
      
      public function Stage(param1:int = 0, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         Stage.me = this;
         width = param1;
         height = param2;
         §\x13t]|\x02§ = width + 60;
         root = new Sprite();
         Game.me.dm.add(root,Game.§\r\x0f\t2\x03§);
         dm = new DepthManager(root);
         var _loc3_:Rand = new Rand(0);
         _loc3_.seed = Game.me.seed.seed;
         seed = _loc3_;
         initBg();
         §5Q-'\x03§ = new Sprite();
         Col.setPercentColor(§5Q-'\x03§,1,0);
         §5Q-'\x03§.blendMode = BlendMode.LAYER;
         §5Q-'\x03§.alpha = 0.5;
         var _loc4_:Sprite = new Sprite();
         _loc4_.blendMode = BlendMode.OVERLAY;
         _loc4_.addChild(§5Q-'\x03§);
         dm.add(_loc4_,Stage.§\t!B|§);
      }
      
      public function §Hhy@§() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Array = tiles;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.empty)
            {
               _loc3_.id = 0;
            }
            else
            {
               _loc4_ = 0;
               _loc5_ = 0;
               while(_loc5_ < 4)
               {
                  _loc5_++;
                  _loc6_ = _loc5_;
                  if(_loc3_.nei[_loc6_] == null || !_loc3_.nei[_loc6_].empty)
                  {
                     _loc4_ = _loc4_ + int(Number(Math.pow(2,int((_loc6_ + 1) % 4))));
                  }
               }
               _loc3_.id = _loc4_;
            }
         }
      }
      
      public function setPos(param1:Number, param2:Number) : void
      {
         root.x = param1;
         root.y = param2;
         if(mask != null)
         {
            mask.x = param1;
            mask.y = param2;
         }
      }
      
      public function §?j\x03§(param1:Sprite, param2:int) : void
      {
         if(param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
         dm.add(param1,param2);
      }
      
      public function §~i\x18[\x02§(param1:Rectangle = undefined) : void
      {
         §I'\x10\x06§.bitmapData.draw(bg,null,null,null,param1);
      }
      
      public function §\x13\x04xz\x03§(param1:BitmapData, param2:int = 32) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:uint = 0;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = param1.width;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            _loc6_ = 0;
            _loc7_ = param1.height;
            while(_loc6_ < _loc7_)
            {
               _loc6_++;
               _loc8_ = _loc6_;
               _loc9_ = uint(param1.getPixel32(_loc5_,_loc8_));
               _loc10_ = Col._x_setRVBAValues(_loc9_);
               _loc11_ = int(int(_loc10_.r) / param2) * param2;
               _loc12_ = int(int(_loc10_.g) / param2) * param2;
               _loc13_ = int(int(_loc10_.b) / param2) * param2;
               _loc10_ = {
                  "r":_loc11_,
                  "g":_loc12_,
                  "b":_loc13_,
                  "a":int(_loc10_.a)
               };
               param1.setPixel32(_loc5_,_loc8_,int(Col.§\x01\x01\x0bV§(_loc10_)));
            }
         }
      }
      
      public function kill() : void
      {
         if(root.parent != null)
         {
            root.parent.removeChild(root);
         }
         §69d\x10\x02§();
      }
      
      public function isIn(param1:Number, param2:Number, param3:Number) : Boolean
      {
         return param1 >= param3 && param1 < width - param3 && param2 >= param3 && param2 < height;
      }
      
      public function initBg() : void
      {
         §I'\x10\x06§ = new Bitmap();
         §I'\x10\x06§.bitmapData = new BitmapData(width,height,false,16711680);
         dm.add(§I'\x10\x06§,Stage.DP_BG);
         bg = new Element();
         var _loc1_:int = Stage.WALL;
         var _loc2_:* = Gfx.col("green_0");
         art = new BitmapData(§\x13t]|\x02§ - _loc1_ * 2,height - _loc1_ * 2,false,_loc2_);
         var _loc3_:Bitmap = new Bitmap();
         _loc3_.bitmapData = art;
         _loc3_.x = _loc1_;
         _loc3_.y = _loc1_;
         bg.addChild(_loc3_);
         §5i\x13\x04\x02§();
         ground = new Sprite();
         bg.addChild(ground);
         gore = new Bitmap();
         gore.bitmapData = new BitmapData(§\x13t]|\x02§,height,true,0);
         bg.addChild(gore);
         §-Vj[§();
         §,%b|\x01§();
         §~i\x18[\x02§();
      }
      
      public function §$\rV2§(param1:int, param2:int) : void
      {
         width = width + param1;
         height = height + param2;
         if(width >= §\x13t]|\x02§)
         {
            width = §\x13t]|\x02§;
         }
         §I'\x10\x06§.bitmapData.dispose();
         §I'\x10\x06§.bitmapData = new BitmapData(width,height,false,Gfx.col("green_1"));
         §5i\x13\x04\x02§();
         §~i\x18[\x02§();
      }
      
      public function §j\x0fkz§(param1:Number, param2:Number = 0.0) : Object
      {
         var _loc3_:Number = Stage.me.width - 2 * param2;
         var _loc4_:Number = Stage.me.height - 2 * param2;
         var _loc5_:Number = Number(Number(Number(_loc3_ + _loc3_) + _loc4_) + _loc4_);
         var _loc6_:Number = param1 * _loc5_;
         if(_loc6_ < _loc3_)
         {
            return {
               "x":Number(param2 + _loc6_),
               "y":param2
            };
         }
         _loc6_ = _loc6_ - _loc3_;
         if(_loc6_ < _loc4_)
         {
            return {
               "x":Number(param2 + _loc3_),
               "y":Number(param2 + _loc6_)
            };
         }
         _loc6_ = _loc6_ - _loc4_;
         if(_loc6_ < _loc3_)
         {
            return {
               "x":param2 + _loc3_ - _loc6_,
               "y":Number(param2 + _loc4_)
            };
         }
         _loc6_ = _loc6_ - _loc3_;
         if(_loc6_ < _loc4_)
         {
            return {
               "x":param2,
               "y":param2 + _loc4_ - _loc6_
            };
         }
         return null;
      }
      
      public function §;*\x13(\x02§(param1:int = 0, param2:Object = undefined, param3:Object = undefined) : Point
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:* = null as Array;
         var _loc12_:* = null;
         var _loc5_:Rand = Game.me.seed;
         var _loc6_:Number = _loc5_.seed * 16807 % 2147483647;
         _loc5_.seed = _loc6_;
         var _loc4_:Number = Number(param1 + int((int(_loc6_) & 1073741823) % 10007) / 10007 * (width - 2 * param1));
         _loc5_ = Game.me.seed;
         _loc7_ = _loc5_.seed * 16807 % 2147483647;
         _loc5_.seed = _loc7_;
         _loc6_ = Number(param1 + int((int(_loc7_) & 1073741823) % 10007) / 10007 * (height - 2 * param1));
         if(param2 != null && Game.me.snake != null && !Game.me.snake.dead)
         {
            _loc7_ = Game.me.snake.x - _loc4_;
            _loc8_ = Game.me.snake.y - _loc6_;
            _loc9_ = Number(Math.sqrt(Number(_loc7_ * _loc7_ + _loc8_ * _loc8_)));
            if(_loc9_ < param2)
            {
               return §;*\x13(\x02§(param1,param2,param3);
            }
         }
         if(param3 != null)
         {
            _loc10_ = 0;
            _loc11_ = Game.me.obstacles;
            while(_loc10_ < int(_loc11_.length))
            {
               _loc12_ = _loc11_[_loc10_];
               _loc10_++;
               _loc7_ = _loc12_.x - _loc4_;
               _loc8_ = _loc12_.y - _loc6_;
               if(Number(Math.sqrt(Number(_loc7_ * _loc7_ + _loc8_ * _loc8_))) > param3 + Number(_loc12_.ray))
               {
                  continue;
               }
               return §;*\x13(\x02§(param1,param2,param3);
            }
         }
         return new Point(_loc4_,_loc6_);
      }
      
      public function §X\x0f;z\x03§(param1:String, param2:Object = undefined) : Part
      {
         if(param2 == null)
         {
            param2 = Stage.DP_FX;
         }
         var _loc3_:Part = Part.get();
         var _loc4_:Anim = Gfx.fx.getAnim(param1);
         _loc3_.sprite.setAnim(_loc4_,false);
         _loc3_.sprite.anim.onFinish = _loc3_.kill;
         dm.add(_loc3_.sprite,param2);
         return _loc3_;
      }
      
      public function §\neY7\x03§(param1:Number, param2:Number) : Object
      {
         return {
            "x":Number(param1 + root.x),
            "y":Number(param2 + root.y)
         };
      }
      
      public function §-Vj[§() : void
      {
         relief = new Sprite();
         relief.blendMode = BlendMode.OVERLAY;
         var _loc1_:Bitmap = new Bitmap();
         _loc1_.bitmapData = new BitmapData(§\x13t]|\x02§,height,false,8947848);
         _loc1_.alpha = 1;
         _loc1_.x = Stage.WALL;
         _loc1_.y = Stage.WALL;
         §MX\x07\x03\x02§ = _loc1_.bitmapData;
         relief.addChild(_loc1_);
         bg.addChild(relief);
      }
      
      public function §g\x07\x05\x15\x01§() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as Rand;
         var _loc8_:Number = NaN;
         var _loc1_:int = 0;
         var _loc2_:Array = tiles;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(!_loc3_.empty)
            {
               _loc4_ = 0;
               _loc5_ = 0;
               while(_loc5_ < 4)
               {
                  _loc5_++;
                  _loc6_ = _loc5_;
                  if(_loc3_.nei[_loc6_] != null && Boolean(_loc3_.nei[_loc6_].empty))
                  {
                     _loc4_++;
                  }
               }
               _loc4_ = int([100,7,4,3,2][_loc4_]);
               _loc7_ = seed;
               _loc8_ = _loc7_.seed * 16807 % 2147483647;
               _loc7_.seed = _loc8_;
               if(int((int(_loc8_) & 1073741823) % _loc4_) == 0)
               {
                  _loc3_.empty = true;
               }
            }
         }
      }
      
      public function §5i\x13\x04\x02§() : void
      {
         var _loc5_:int = 0;
         if(mcWalls == null)
         {
            mcWalls = new Sprite();
            dm.add(mcWalls,Stage.DP_BG);
         }
         var _loc1_:Graphics = mcWalls.graphics;
         _loc1_.clear();
         var _loc2_:* = Gfx.col("green_2");
         _loc1_.beginFill(_loc2_);
         var _loc3_:int = 0;
         var _loc4_:int = Stage.WALL;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            _loc1_.beginFill(_loc2_);
            _loc1_.beginFill(int(Col.brighten(_loc2_,-20)));
            _loc1_.drawRect(_loc5_,_loc5_,width - 2 * _loc5_,1);
            _loc1_.beginFill(int(Col.brighten(_loc2_,25)));
            _loc1_.drawRect(width - (_loc5_ + 1),_loc5_,1,height - 2 * _loc5_);
            _loc1_.beginFill(int(Col.brighten(_loc2_,45)));
            _loc1_.drawRect(_loc5_,height - (_loc5_ + 1),width - 2 * _loc5_,1);
            _loc1_.beginFill(int(Col.brighten(_loc2_,0)));
            _loc1_.drawRect(_loc5_,_loc5_,1,height - 2 * _loc5_);
         }
      }
      
      public function §,%b|\x01§() : void
      {
         var _loc3_:* = null as Rand;
         var _loc4_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc13_:* = null as Array;
         var _loc14_:* = null as Array;
         var _loc15_:* = null as Frame;
         var _loc16_:* = null as Frame;
         var _loc1_:int = 16;
         §D?\x02!\x03§ = int(§\x13t]|\x02§ / 16);
         §\nAt^§ = int(height / 16);
         grid = [];
         tiles = [];
         _loc3_ = seed;
         _loc4_ = _loc3_.seed * 16807 % 2147483647;
         _loc3_.seed = _loc4_;
         var _loc2_:int = 2 + int((int(_loc4_) & 1073741823) % 8);
         var _loc5_:int = 0;
         _loc6_ = §D?\x02!\x03§;
         while(_loc5_ < _loc6_)
         {
            _loc5_++;
            _loc7_ = _loc5_;
            grid[_loc7_] = [];
            _loc8_ = 0;
            _loc9_ = §\nAt^§;
            while(_loc8_ < _loc9_)
            {
               _loc8_++;
               _loc10_ = _loc8_;
               _loc3_ = seed;
               _loc4_ = _loc3_.seed * 16807 % 2147483647;
               _loc3_.seed = _loc4_;
               _loc11_ = {
                  "x":_loc7_,
                  "y":_loc10_,
                  "empty":int((int(_loc4_) & 1073741823) % _loc2_) == 0,
                  "id":0,
                  "nei":[]
               };
               grid[_loc7_][_loc10_] = _loc11_;
               tiles.push(_loc11_);
            }
         }
         _loc5_ = 0;
         var _loc12_:Array = tiles;
         while(_loc5_ < int(_loc12_.length))
         {
            _loc11_ = _loc12_[_loc5_];
            _loc5_++;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc13_ = Stage.§\x1az\x01§;
            while(_loc7_ < int(_loc13_.length))
            {
               _loc14_ = _loc13_[_loc7_];
               _loc7_++;
               _loc8_ = int(_loc11_.x) + int(_loc14_[0]);
               _loc9_ = int(_loc11_.y) + int(_loc14_[1]);
               if(_loc8_ >= 0 && _loc8_ < §D?\x02!\x03§ && _loc9_ >= 0 && _loc9_ < §\nAt^§)
               {
                  _loc11_.nei[_loc6_] = grid[_loc8_][_loc9_];
               }
               _loc6_++;
            }
         }
         §g\x07\x05\x15\x01§();
         §Hhy@§();
         _loc5_ = 0;
         _loc12_ = tiles;
         while(_loc5_ < int(_loc12_.length))
         {
            _loc11_ = _loc12_[_loc5_];
            _loc5_++;
            _loc3_ = seed;
            _loc4_ = _loc3_.seed * 16807 % 2147483647;
            _loc3_.seed = _loc4_;
            _loc6_ = 32 + int(_loc11_.id) + int((int(_loc4_) & 1073741823) % 2) * 16;
            _loc15_ = Gfx.§|\x0e\x1e\x01\x03§.get(_loc6_);
            _loc15_.§V,o\x03§(art,int(_loc11_.x) * 16,int(_loc11_.y) * 16);
            _loc16_ = Gfx.§\x1fGEM§.get(_loc6_);
            _loc16_.§V,o\x03§(§MX\x07\x03\x02§,int(_loc11_.x) * 16,int(_loc11_.y) * 16);
         }
      }
      
      public function §69d\x10\x02§() : void
      {
         §I'\x10\x06§.parent.removeChild(§I'\x10\x06§);
         §I'\x10\x06§.bitmapData.dispose();
         gore.bitmapData.dispose();
         §MX\x07\x03\x02§.dispose();
         art.dispose();
      }
      
      public function clamp(param1:Number, param2:Number, param3:int = 0) : Object
      {
         return {
            "x":Number(Num.mm(param3,param1,width - param3)),
            "y":Number(Num.mm(param3,param2,height - param3))
         };
      }
   }
}
