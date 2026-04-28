package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import mt.bumdum9.Filt;
   
   public class Scanner extends §\x12\bHb\x03§
   {
       
      
      public var title:TextField;
      
      public var stats:Sprite;
      
      public var grid:Sprite;
      
      public var flip:int;
      
      public var field:TextField;
      
      public var box:Sprite;
      
      public function Scanner(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         flip = 0;
      }
      
      override public function update() : void
      {
         super.update();
         flip = flip + 1;
         var _loc1_:Fruit = sn._x_fruitLePlusProche();
         §HmtH\x02§(_loc1_);
         if(!card.active[0])
         {
            vanish();
         }
      }
      
      public function §HmtH\x02§(param1:Fruit) : void
      {
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc2_:Fruit = param1;
         if(box == null)
         {
            box = new Sprite();
            Stage.me.dm.add(box,Stage.DP_FX);
            grid = new Sprite();
            Stage.me.dm.add(grid,Stage.DP_FX);
            grid.alpha = 0.75;
            grid.blendMode = BlendMode.ADD;
            field = Cs.getField(16777215,8,0);
            field.width = 30;
            title = Cs.getField(16777215,8,0);
            title.width = 100;
            box.addChild(field);
            box.addChild(title);
            stats = new Sprite();
            box.addChild(stats);
            Filt.glow(grid,2,1,2254336);
            Filt.glow(box,2,1,2263040);
         }
         if(param1 == null)
         {
            box.visible = false;
            return;
         }
         box.visible = true;
         box.x = int(param1.x);
         box.y = int(param1.y);
         grid.x = box.x;
         grid.y = box.y;
         grid.graphics.clear();
         grid.graphics.lineStyle(1,16777215);
         var _loc3_:Rectangle = param1.box.clone();
         _loc3_.inflate(2,2);
         var _loc4_:Number = 9 - (Number(_loc3_.height + _loc3_.y));
         if(_loc4_ > 0)
         {
            _loc3_.inflate(_loc4_,_loc4_);
         }
         grid.graphics.drawRect(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
         grid.graphics.lineStyle(1,16777215,0.15);
         var _loc5_:int = 3;
         var _loc6_:int = int(_loc3_.width / _loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc7_++;
            _loc8_ = _loc7_;
            _loc9_ = Number(_loc3_.x + _loc8_ * _loc5_);
            grid.graphics.moveTo(_loc9_,_loc3_.y);
            grid.graphics.lineTo(_loc9_,Number(_loc3_.y + _loc3_.height));
         }
         _loc7_ = int(_loc3_.height / _loc5_);
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc8_++;
            _loc10_ = _loc8_;
            _loc9_ = Number(_loc3_.y + _loc10_ * _loc5_);
            grid.graphics.moveTo(_loc3_.x,_loc9_);
            grid.graphics.lineTo(Number(_loc3_.x + _loc3_.width),_loc9_);
         }
         _loc8_ = param1.x < Stage.me.width * 0.5?0:1;
         field.text = Std.string(int(param1.data.score));
         _loc10_ = int(int(Fruit.§\x04\x11\x0b\x05§(int(param1.data.rank))) * int(param1.data.score) * 0.1);
         field.text = Std.string(_loc10_);
         field.width = Number(field.textWidth + 4);
         field.y = _loc3_.y - 2;
         var _loc11_:String = Data.TEXT[int(Fruit.§\n@%\x1f\x02§(int(param1.data.rank)))].fruit;
         title.text = Lang._x_getName(_loc11_).toUpperCase();
         title.width = Number(title.textWidth + 4);
         title.y = _loc3_.y - 9;
         stats.y = Number(field.y + 11);
         stats.graphics.clear();
         var _loc12_:Array = [int(param1.data.vit),int(param1.data.cal),int(param1.data.sta)];
         var _loc13_:Array = [16764108,16777164,13421823];
         var _loc14_:int = 3;
         var _loc15_:int = 0;
         var _loc16_:int = 2;
         var _loc17_:int = 0;
         while(_loc17_ < int(_loc12_.length))
         {
            _loc18_ = int(_loc12_[_loc17_]);
            _loc17_++;
            _loc15_ = int(Number(Math.max(_loc18_,_loc15_)));
         }
         _loc17_ = 0;
         while(_loc17_ < 3)
         {
            _loc17_++;
            _loc18_ = _loc17_;
            _loc19_ = int(_loc12_[_loc18_]);
            _loc20_ = _loc18_ * (_loc16_ + 1);
            stats.graphics.lineStyle(_loc16_,int(_loc13_[_loc18_]),1);
            stats.graphics.moveTo(_loc14_,_loc20_);
            stats.graphics.lineTo(_loc14_ + _loc19_,_loc20_);
         }
         switch(_loc8_)
         {
            case 0:
               field.x = Number(_loc3_.x + _loc3_.width);
               stats.x = Number(_loc3_.x + _loc3_.width);
               stats.scaleX = 1;
               title.x = _loc3_.x - 2;
               break;
            case 1:
               field.x = 1 + _loc3_.x - field.width;
               stats.x = Number(1 + _loc3_.x);
               stats.scaleX = -1;
               title.x = Number(_loc3_.width + _loc3_.x) + 4 - title.width;
         }
      }
      
      override public function kill() : void
      {
         super.kill();
         if(box.parent != null)
         {
            box.parent.removeChild(box);
         }
         if(grid.parent != null)
         {
            grid.parent.removeChild(grid);
         }
      }
   }
}
