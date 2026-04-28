package fx
{
   import flash.Boot;
   import flash.filters.DropShadowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mt.Rand;
   import mt.bumdum9.Col;
   import mt.fx.§qR))\x03§;
   import pix.Element;
   import pix.Frame;
   import pix.Part;
   
   public class Rune extends §\x12\bHb\x03§
   {
      
      public static var COLORS:Array = [15490656,5077757,14896386,10158324];
      
      public static var LIST:Array = [];
       
      
      public var type:int;
      
      public var step:int;
      
      public var runes:Array;
      
      public var rune:Element;
      
      public var count:int;
      
      public function Rune(param1:Card = undefined, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         type = param2;
         count = 10;
         step = 0;
         init();
         Rune.LIST.push(this);
      }
      
      override public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         super.update();
         switch(step)
         {
            case 0:
               if(Game.me.have(_CardType.PICK_AXE))
               {
                  count = count - 1;
               }
               _loc1_ = count;
               count = count - 1;
               if(_loc1_ <= 0)
               {
                  light();
               }
               break;
            case 1:
               _loc2_ = sn.x - rune.x;
               _loc3_ = sn.y - rune.y;
               if(Number(Math.sqrt(Number(_loc2_ * _loc2_ + _loc3_ * _loc3_))) < 20)
               {
                  grab();
                  break;
               }
         }
      }
      
      public function render() : void
      {
         Stage.me.§~i\x18[\x02§(runes[0].getBounds(Stage.me.bg));
      }
      
      public function light() : void
      {
         rune.visible = true;
         step = step + 1;
         render();
         var _loc1_:pix.Part = new pix.Part();
         _loc1_.setPos(rune.x,rune.y);
         _loc1_.timer = 10;
         _loc1_.fadeType = 1;
         _loc1_.drawFrame(Gfx.fx.get(type,"runes"));
         Stage.me.dm.add(_loc1_,Stage.§'YOP\x01§);
         Col.setPercentColor(_loc1_,1,16777215);
      }
      
      override public function kill() : void
      {
         Rune.LIST.remove(this);
         while(int(runes.length) > 0)
         {
            runes.pop().kill();
         }
         super.kill();
      }
      
      public function init() : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as Element;
         var _loc1_:Point = §/k=j\x02§();
         var _loc2_:Number = Number(Math.sqrt(2));
         _loc2_ = 1;
         runes = [];
         var _loc3_:int = 0;
         while(_loc3_ < 3)
         {
            _loc3_++;
            _loc4_ = _loc3_;
            _loc5_ = new Element();
            runes.push(_loc5_);
            _loc5_.drawFrame(Gfx.fx.get(type,"runes"));
            _loc5_.x = _loc1_.x;
            _loc5_.y = _loc1_.y;
            switch(_loc4_)
            {
               case 0:
                  Stage.me.ground.addChild(_loc5_);
                  _loc5_.visible = false;
                  continue;
               case 1:
                  Stage.me.relief.addChild(_loc5_);
                  _loc5_.filters = [new DropShadowFilter(_loc2_,225,0,1,0,0,1,0,false,true,true)];
                  continue;
               case 2:
                  Stage.me.relief.addChild(_loc5_);
                  _loc5_.filters = [new DropShadowFilter(_loc2_,45,16777215,1,0,0,1,0,false,true,true)];
                  continue;
            }
         }
         rune = runes[0];
         render();
      }
      
      public function grab() : void
      {
         var _loc1_:* = null as Rand;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Fruit;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:* = null as Part;
         var _loc11_:* = null as §qR))\x03§;
         rune.visible = false;
         render();
         step = 0;
         switch(type)
         {
            case 0:
               Game.me._x_augmenteFruitibar(3);
               _loc1_ = Game.me.seed;
               _loc2_ = _loc1_.seed * 16807 % 2147483647;
               _loc1_.seed = _loc2_;
               count = int((int(_loc2_) & 1073741823) % 800) + 800;
               break;
            case 1:
               new Reduce(20,2);
               _loc1_ = Game.me.seed;
               _loc2_ = _loc1_.seed * 16807 % 2147483647;
               _loc1_.seed = _loc2_;
               count = int((int(_loc2_) & 1073741823) % 300) + 300;
               break;
            case 2:
               _loc3_ = 500;
               _loc3_ = _loc3_ + int(Game.me.§2~\f#\x03§(_CardType.SCISSOR)) * 100;
               if(Game.me.have(_CardType.BIG_SCISSOR))
               {
                  _loc3_ = _loc3_ * 2;
               }
               Game.me._x_addPoints(_loc3_,rune.x,rune.y);
               _loc1_ = Game.me.seed;
               _loc2_ = _loc1_.seed * 16807 % 2147483647;
               _loc1_.seed = _loc2_;
               count = int((int(_loc2_) & 1073741823) % 100) + 100;
               break;
            case 3:
               _loc4_ = Game.me.fruits.copy();
               _loc3_ = 0;
               while(_loc3_ < int(_loc4_.length))
               {
                  _loc5_ = _loc4_[_loc3_];
                  _loc3_++;
                  _loc1_ = Game.me.seed;
                  _loc2_ = _loc1_.seed * 16807 % 2147483647;
                  _loc1_.seed = _loc2_;
                  _loc5_.evolve((Boolean(Game.me.have(_CardType.PIN))?12:3) + int((int(_loc2_) & 1073741823) % 2));
               }
               _loc1_ = Game.me.seed;
               _loc2_ = _loc1_.seed * 16807 % 2147483647;
               _loc1_.seed = _loc2_;
               count = int((int(_loc2_) & 1073741823) % 100) + 100;
         }
         _loc3_ = 32;
         var _loc6_:int = 2;
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_)
         {
            _loc7_++;
            _loc8_ = _loc7_;
            _loc2_ = Math.random() * 3;
            _loc9_ = _loc8_ * 6.28 / _loc3_;
            _loc10_ = Part.get();
            _loc10_.sprite.drawFrame(Gfx.fx.get(null,"cross"));
            Stage.me.dm.add(_loc10_.sprite,Stage.§l\x10|-\x02§);
            _loc10_.vx = §\x19\n\t\x01§.cos(_loc9_) * _loc2_;
            _loc10_.vy = §\x19\n\t\x01§.sin(_loc9_) * _loc2_;
            _loc10_.vz = -Math.random() * 3;
            _loc10_.setPos(Number(rune.x + _loc10_.vx * _loc6_),Number(rune.y + _loc10_.vy * _loc6_));
            _loc10_.frict = 0.92;
            _loc10_.sleep = int(Std.random(6));
            _loc10_.sprite.visible = false;
            _loc10_.timer = 10 + int(Std.random(20));
            _loc10_.weight = (0.5 + Number(Math.random())) * 0.25;
            _loc10_.ray = 1;
            _loc10_.FFfR(false);
            Col.setColor(_loc10_.sprite,int(Col.shuffle(int(Rune.COLORS[type]),40)));
         }
         _loc7_ = 0;
         while(_loc7_ < 2)
         {
            _loc7_++;
            _loc8_ = _loc7_;
            _loc11_ = new §qR))\x03§(20 + _loc8_ * 10,40 + _loc8_ * 40,Number(0.1 + _loc8_ * 0.1));
            _loc11_.setPos(rune.x,rune.y);
            Stage.me.dm.add(_loc11_.root,Stage.§l\x10|-\x02§);
         }
      }
      
      public function §/k=j\x02§() : Point
      {
         var _loc1_:* = null as Point;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Rune;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         do
         {
            if(false)
            {
               return null;
            }
            _loc1_ = Stage.me.§;*\x13(\x02§(12);
            _loc2_ = true;
            _loc3_ = 0;
            _loc4_ = Rune.LIST;
            while(_loc3_ < int(_loc4_.length))
            {
               _loc5_ = _loc4_[_loc3_];
               _loc3_++;
               _loc6_ = _loc5_.rune.x - _loc1_.x;
               _loc7_ = _loc5_.rune.y - _loc1_.y;
               if(Number(Math.sqrt(Number(_loc6_ * _loc6_ + _loc7_ * _loc7_))) < 20)
               {
                  _loc2_ = false;
                  break;
               }
            }
         }
         while(!_loc2_);
         
         return _loc1_;
      }
   }
}
