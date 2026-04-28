package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import mt.bumdum9.Filt;
   import mt.fx.Spawn;
   import pix.Element;
   import pix.Frame;
   
   public class §](]Y\x02§ extends §\x12\bHb\x03§
   {
      
      public static var MAX:int = 3;
      
      public static var me:§](]Y\x02§;
       
      
      public var timer:Object;
      
      public var slots:Array;
      
      public var board:Sprite;
      
      public function §](]Y\x02§(param1:Card = undefined)
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as Element;
         var _loc6_:* = null;
         var _loc7_:* = null as Element;
         var _loc8_:* = null;
         var _loc9_:* = null as Spawn;
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         board = new Sprite();
         Game.me.dm.add(board,Game.Umu$);
         §](]Y\x02§.me = this;
         slots = [];
         var _loc2_:int = 0;
         var _loc3_:int = §](]Y\x02§.MAX;
         while(_loc2_ < _loc3_)
         {
            _loc2_++;
            _loc4_ = _loc2_;
            _loc5_ = new Element();
            _loc5_.drawFrame(Gfx.main.get(null,"prime"));
            _loc6_ = Game.§BQ(d§(3 + _loc4_);
            _loc5_.x = int(_loc6_.x);
            _loc5_.y = int(_loc6_.y);
            board.addChild(_loc5_);
            _loc7_ = new Element();
            _loc7_.y = -2;
            _loc5_.addChild(_loc7_);
            Filt.grey(_loc7_,1);
            _loc7_.blendMode = BlendMode.OVERLAY;
            Filt.glow(_loc7_,2,4,2236962);
            _loc8_ = {
               "el":_loc5_,
               "fruit":_loc7_,
               "data":null
            };
            slots.push(_loc8_);
            _loc5_.filters = [new GlowFilter(0,0.5,2,2,4),new DropShadowFilter(1,90,0,0.2,0,0,1)];
            _loc9_ = new Spawn(_loc5_,0.1,false);
            _loc9_.§1\bSe\x01§(0,1);
            §;\n\x13q§(_loc8_);
         }
      }
      
      override public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         super.update();
         if(timer == null)
         {
            return;
         }
         _loc1_ = timer;
         timer = timer - 1;
         if(_loc1_ < 0)
         {
            _loc2_ = 0;
            _loc3_ = slots;
            while(_loc2_ < int(_loc3_.length))
            {
               _loc1_ = _loc3_[_loc2_];
               _loc2_++;
               §;\n\x13q§(_loc1_);
               new mt.fx.Flash(_loc1_.el);
            }
            timer = null;
         }
      }
      
      public function _x_primeRecolte(param1:Fruit) : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = slots;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.fruit.visible)
            {
               _loc2_++;
            }
         }
         _loc3_ = 0;
         _loc4_ = slots;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(!_loc5_.fruit.visible || int(param1.data.rank) != int(_loc5_.data.rank))
            {
               continue;
            }
            _loc5_.fruit.visible = false;
            _loc6_ = int(16000 * Math.pow(2,3 - _loc2_));
            _loc2_--;
            Game.me._x_addPoints(_loc6_,_loc5_.el.x - Stage.me.root.x,_loc5_.el.y - Stage.me.root.y);
            timer = 1600;
            if(_loc2_ == 0)
            {
               timer = 20;
            }
            break;
         }
      }
      
      public function §;\n\x13q§(param1:Object) : void
      {
         var _loc2_:int = int(Game.me._x_genererIdFruit());
         var _loc3_:* = Fruit.getData(_loc2_);
         param1.data = _loc3_;
         var _loc4_:int = int(Fruit.§\n@%\x1f\x02§(_loc2_));
         param1.fruit.drawFrame(Gfx.fruits.get(_loc4_));
         param1.fruit.visible = true;
      }
      
      override public function kill() : void
      {
         super.kill();
         board.parent.removeChild(board);
      }
   }
}
