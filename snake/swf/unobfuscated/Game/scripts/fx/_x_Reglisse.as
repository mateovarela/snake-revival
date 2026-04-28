package fx
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import mt.bumdum9.Num;
   
   public class _x_Reglisse extends Fx
   {
      
      public static var RAY:int = 4;
      
      public static var §j\x03,\x1a\x01§:Number = 0.08;
       
      
      public var y:Number;
      
      public var x:Number;
      
      public var trq:Array;
      
      public var §}\x0fz/\x01§:int;
      
      public var speed:Number;
      
      public var queue:Array;
      
      public var mcq:Sprite;
      
      public var length:Number;
      
      public var card:Card;
      
      public var an:Number;
      
      public function _x_Reglisse(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         card = param1;
         super();
         x = stg.width - 20;
         y = stg.height * 0.5;
         trq = [];
         queue = [];
         speed = 1.5;
         an = -3.14;
         length = 50;
         mcq = new Sprite();
         stg.dm.add(mcq,Stage.§|r;h§);
      }
      
      public function vanish() : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as Part;
         var _loc1_:int = 4;
         var _loc2_:int = 0;
         var _loc3_:Array = queue;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = 0;
            while(_loc5_ < 4)
            {
               _loc5_++;
               _loc6_ = _loc5_;
               _loc7_ = Part.get();
               _loc7_.sprite.graphics.beginFill(0);
               _loc7_.sprite.graphics.drawCircle(0,0,Number(2 + Math.random() * 2));
               _loc7_.weight = -Math.random() * 0.3;
               _loc7_.frict = 0.95;
               _loc7_.setPos(Number(Number(_loc4_.x) + Math.random() * 2.1 * _loc1_),Number(Number(_loc4_.y) + Math.random() * 2.1 * _loc1_));
               _loc7_.fadeType = 1;
               _loc7_.timer = 10 + int(Std.random(10));
               _loc7_.fadeLimit = 7;
               _loc7_.sleep = _loc6_;
               _loc7_.sprite.visible = false;
               stg.dm.add(_loc7_.sprite,Stage.DP_FX);
            }
         }
         kill();
      }
      
      override public function update() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:Fruit = §Qwxv\x02§();
         if(_loc1_ == null)
         {
            _loc1_ = §W'Lw§();
         }
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.x - x;
            _loc3_ = _loc1_.y - y;
            _loc4_ = Number(Math.atan2(_loc3_,_loc2_));
            _loc5_ = Number(Num.hMod(_loc4_ - an,3.14));
            if(_loc5_ > _x_Reglisse.§j\x03,\x1a\x01§)
            {
               an = Number(an + _x_Reglisse.§j\x03,\x1a\x01§);
            }
            if(_loc5_ < -_x_Reglisse.§j\x03,\x1a\x01§)
            {
               an = an - _x_Reglisse.§j\x03,\x1a\x01§;
            }
         }
         x = Number(x + §\x19\n\t\x01§.cos(an) * speed);
         y = Number(y + §\x19\n\t\x01§.sin(an) * speed);
         trq.unshift({
            "x":x,
            "y":y,
            "h":0
         });
         if(int(trq.length) > 50)
         {
            trq.pop();
         }
         §\t\x05{t\x02§();
         draw();
         if(!card.active[0])
         {
            vanish();
         }
      }
      
      public function §\t\x05{t\x02§() : void
      {
         var _loc3_:* = null as Fruit;
         var _loc1_:int = 0;
         var _loc2_:Array = Game.me.fruits;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.hitTest(x,y,4))
            {
               _loc3_._x_coeffPoint = _loc3_._x_coeffPoint * 0.5;
               _loc3_.§k|\x12\x0f\x03§ = _loc3_.§k|\x12\x0f\x03§ * 0.5;
               _loc3_.§\x13{9\x1a§ = _loc3_.§\x13{9\x1a§ * 0.5;
               new Eaten(_loc3_,this);
               _loc3_.kill();
            }
         }
         if(!stg.isIn(x,y,_x_Reglisse.RAY))
         {
            death();
         }
      }
      
      public function §W'Lw§() : Fruit
      {
         var _loc5_:* = null as Fruit;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:Number = 999.9;
         var _loc2_:Fruit = null;
         var _loc3_:int = 0;
         var _loc4_:Array = Game.me.fruits;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = x - _loc5_.x;
            _loc7_ = y - _loc5_.y;
            _loc8_ = Number(Math.sqrt(Number(_loc6_ * _loc6_ + _loc7_ * _loc7_)));
            if(_loc8_ < _loc1_)
            {
               _loc2_ = _loc5_;
               _loc1_ = _loc8_;
               §}\x0fz/\x01§ = int(_loc2_.data.rank);
            }
         }
         return _loc2_;
      }
      
      override public function kill() : void
      {
         if(mcq.parent != null)
         {
            mcq.parent.removeChild(mcq);
         }
         super.kill();
      }
      
      public function §Qwxv\x02§() : Fruit
      {
         var _loc3_:* = null as Fruit;
         var _loc1_:int = 0;
         var _loc2_:Array = Game.me.fruits;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(int(_loc3_.data.rank) == §}\x0fz/\x01§)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function draw() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         §=)iD§();
         if(int(queue.length) == 0)
         {
            return;
         }
         var _loc1_:Graphics = mcq.graphics;
         _loc1_.clear();
         var _loc2_:int = 0;
         while(_loc2_ < 2)
         {
            _loc2_++;
            _loc3_ = _loc2_;
            _loc4_ = queue[0];
            _loc1_.lineStyle(5,0);
            _loc5_ = 0;
            if(_loc3_ == 1)
            {
               _loc1_.lineStyle(1,5592405);
               _loc5_ = -1.5;
            }
            _loc1_.moveTo(Number(_loc4_.x),Number(Number(_loc4_.y) + _loc5_));
            _loc6_ = 1;
            _loc7_ = int(queue.length);
            while(_loc6_ < _loc7_)
            {
               _loc6_++;
               _loc8_ = _loc6_;
               _loc9_ = queue[_loc8_];
               _loc1_.lineTo(Number(_loc9_.x),Number(Number(_loc9_.y) + _loc5_));
            }
         }
      }
      
      public function death() : void
      {
         if(card.active[0])
         {
            card.flip();
         }
      }
      
      public function §=)iD§() : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:* = null as Array;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         queue = [];
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:* = trq[0];
         while(true)
         {
            _loc4_ = trq[_loc2_];
            _loc5_ = Number(_loc4_.x);
            _loc6_ = Number(_loc4_.y);
            _loc7_ = _loc3_.x - _loc4_.x;
            _loc8_ = _loc3_.y - _loc4_.y;
            _loc9_ = Number(Math.sqrt(Number(_loc7_ * _loc7_ + _loc8_ * _loc8_)));
            if(Number(_loc1_ + _loc9_) > length)
            {
               _loc10_ = length - _loc1_;
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
            _loc2_ = _loc2_ + 3;
            if(_loc2_ >= int(trq.length))
            {
               break;
            }
            if(_loc1_ >= length)
            {
               break;
            }
         }
         _loc5_ = 10;
         var _loc12_:Array = [];
         _loc4_ = queue[int(int(queue.length) * 0.5)];
         if(sn.queue != null)
         {
            _loc13_ = 0;
            _loc14_ = sn.queue;
            while(_loc13_ < int(_loc14_.length))
            {
               _loc15_ = _loc14_[_loc13_];
               _loc13_++;
               _loc6_ = _loc15_.x - _loc4_.x;
               _loc7_ = _loc15_.y - _loc4_.y;
               if(Number(Math.sqrt(Number(_loc6_ * _loc6_ + _loc7_ * _loc7_))) < length * 0.5)
               {
                  _loc12_.push(_loc15_);
               }
            }
         }
         _loc13_ = 0;
         _loc14_ = queue;
         while(_loc13_ < int(_loc14_.length))
         {
            _loc15_ = _loc14_[_loc13_];
            _loc13_++;
            _loc6_ = _loc5_;
            _loc16_ = 0;
            while(_loc16_ < int(_loc12_.length))
            {
               _loc17_ = _loc12_[_loc16_];
               _loc16_++;
               _loc7_ = _loc17_.x - _loc15_.x;
               _loc8_ = _loc17_.y - _loc15_.y;
               _loc9_ = Number(Number(Math.abs(_loc7_)) + Number(Math.abs(_loc8_)));
               _loc9_ = Number(Math.sqrt(Number(_loc7_ * _loc7_ + _loc8_ * _loc8_)));
               if(_loc9_ < _loc6_)
               {
                  _loc6_ = _loc9_;
               }
            }
            _loc7_ = 1 - _loc6_ / _loc5_;
            _loc8_ = Number(§\x19\n\t\x01§.sin(_loc7_ * 1.57));
            _loc15_.y = _loc15_.y - _loc8_ * 8;
         }
      }
   }
}
