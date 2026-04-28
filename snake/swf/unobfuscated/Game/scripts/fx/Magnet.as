package fx
{
   import flash.Boot;
   import flash.display.Sprite;
   
   public class Magnet extends §\x12\bHb\x03§
   {
      
      public static var me:Magnet;
       
      
      public var layer:Sprite;
      
      public var dec:Number;
      
      public function Magnet(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(Magnet.me != null)
         {
            return;
         }
         Magnet.me = this;
         super(param1);
         dec = 0;
         layer = new Sprite();
         Stage.me.dm.add(layer,Stage.DP_BG);
      }
      
      override public function update() : void
      {
         var _loc4_:* = null as Fruit;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Boolean = false;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc1_:int = 40 * int(Game.me.§2~\f#\x03§(_CardType.MAGNET)) + 20 * int(Game.me.§2~\f#\x03§(_CardType.LASSO));
         var _loc2_:Array = Game.me.fruits.copy();
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc2_.length))
         {
            _loc4_ = _loc2_[_loc3_];
            _loc3_++;
            if(!(_loc4_.dummy || _loc4_.z < -3))
            {
               _loc5_ = sn.x - _loc4_.x;
               _loc6_ = sn.y - _loc4_.y;
               if(Number(Math.sqrt(Number(_loc5_ * _loc5_ + _loc6_ * _loc6_))) < _loc1_)
               {
                  new §P\x1f%\x1d\x02§(_loc4_,6,sn);
               }
            }
         }
         dec = (dec + 0.2) % 6.28;
         _loc3_ = int(Math.PI * _loc1_ * 2 / 16);
         _loc5_ = 6.28 / _loc3_;
         _loc3_++;
         var _loc7_:Array = [];
         var _loc8_:int = 0;
         while(_loc8_ < _loc3_)
         {
            _loc8_++;
            _loc9_ = _loc8_;
            _loc6_ = (_loc9_ + 1) * _loc5_;
            _loc10_ = §\x19\n\t\x01§.sin(_loc6_) * 4;
            _loc11_ = Number(_loc1_ + §\x19\n\t\x01§.sin(Number(dec + _loc10_)) * 8);
            _loc12_ = §\x19\n\t\x01§.cos(_loc6_) * _loc11_;
            _loc13_ = §\x19\n\t\x01§.sin(_loc6_) * _loc11_;
            _loc7_.push({
               "dx":_loc12_,
               "dy":_loc13_
            });
         }
         layer.graphics.clear();
         _loc8_ = 0;
         while(_loc8_ < 2)
         {
            _loc8_++;
            _loc9_ = _loc8_;
            _loc14_ = true;
            _loc6_ = 1 - _loc9_ * 0.5;
            layer.graphics.beginFill(16777062,0.15);
            if(_loc9_ == 0)
            {
               layer.graphics.lineStyle(1,16777096,0.2);
            }
            _loc15_ = 0;
            while(_loc15_ < int(_loc7_.length))
            {
               _loc16_ = _loc7_[_loc15_];
               _loc15_++;
               _loc10_ = Number(sn.x + _loc16_.dx * _loc6_);
               _loc11_ = Number(sn.y + _loc16_.dy * _loc6_);
               _loc17_ = Stage.me.clamp(_loc10_,_loc11_,2);
               if(_loc14_)
               {
                  layer.graphics.moveTo(Number(_loc17_.x),Number(_loc17_.y));
                  _loc14_ = false;
               }
               else
               {
                  layer.graphics.lineTo(Number(_loc17_.x),Number(_loc17_.y));
               }
            }
            layer.graphics.endFill();
         }
         super.update();
         layer.visible = !sn.dead && sn.§REo\x12§[0] > 5;
      }
      
      override public function kill() : void
      {
         if(!Game.me.have(_CardType.MAGNET))
         {
            layer.parent.removeChild(layer);
            Magnet.me = null;
            super.kill();
         }
      }
   }
}
