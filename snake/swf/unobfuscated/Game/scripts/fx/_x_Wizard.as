package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.filters.GlowFilter;
   import mt.Rand;
   import mt.bumdum9.Tween;
   
   public class _x_Wizard extends Fx
   {
       
      
      public var fruits:Array;
      
      public function _x_Wizard()
      {
         var _loc7_:* = null as Fruit;
         var _loc8_:* = null as Rand;
         var _loc9_:Number = NaN;
         var _loc10_:* = null as Tween;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         var _loc1_:int = 50;
         var _loc2_:int = Stage.me.width >> 1;
         var _loc3_:int = Stage.me.height >> 1;
         var _loc4_:int = 10;
         fruits = [];
         var _loc5_:int = 0;
         var _loc6_:Array = Game.me.fruits;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            _loc8_ = Game.me.seed;
            _loc9_ = _loc8_.seed * 16807 % 2147483647;
            _loc8_.seed = _loc9_;
            _loc2_ = _loc2_ + (int((int(_loc9_) & 1073741823) % (_loc4_ * 2)) - _loc4_);
            _loc8_ = Game.me.seed;
            _loc9_ = _loc8_.seed * 16807 % 2147483647;
            _loc8_.seed = _loc9_;
            _loc3_ = _loc3_ + (int((int(_loc9_) & 1073741823) % (_loc4_ * 2)) - _loc4_);
            _loc10_ = new Tween(_loc7_.x,_loc7_.y,_loc2_,_loc3_);
            _loc9_ = _loc2_ - _loc7_.x;
            _loc11_ = _loc3_ - _loc7_.y;
            _loc12_ = Number(Math.sqrt(Number(_loc9_ * _loc9_ + _loc11_ * _loc11_)));
            _loc8_ = Game.me.seed;
            _loc13_ = _loc8_.seed * 16807 % 2147483647;
            _loc8_.seed = _loc13_;
            fruits.push({
               "fr":_loc7_,
               "fid":_loc7_.§8\x15J{\x02§,
               "tw":_loc10_,
               "c":0,
               "spc":Math.min(0.2,7 / _loc12_) * (0.8 + int((int(_loc13_) & 1073741823) % 10007) / 10007 * 0.2),
               "z":Number(12 + _loc12_ / 5)
            });
         }
      }
      
      override public function update() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null as Part;
         var _loc9_:Number = NaN;
         var _loc1_:Array = fruits.copy();
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            _loc3_.c = Number(Math.min(Number(Number(_loc3_.c) + Number(_loc3_.spc)),1));
            _loc4_ = _loc3_.tw.getPos(Number(_loc3_.c));
            _loc5_ = -§\x19\n\t\x01§.sin(_loc3_.c * 3.14) * _loc3_.z;
            if(_loc3_.fr.§8\x15J{\x02§ != int(_loc3_.fid))
            {
               fruits.remove(_loc3_);
            }
            else
            {
               _loc3_.fr.setPos(Number(_loc4_.x),Number(_loc4_.y),_loc5_);
               if(Number(_loc3_.c) == 1)
               {
                  _loc3_.fr.sprite.filters = [];
                  fruits.remove(_loc3_);
               }
               else
               {
                  if(int(Game.me.§\x0e\b$\r§[0] % 2) == 0)
                  {
                     _loc3_.fr.§D\x01V5\x01§(11141290);
                  }
                  _loc6_ = 0;
                  while(_loc6_ < 2)
                  {
                     _loc6_++;
                     _loc7_ = _loc6_;
                     _loc8_ = Stage.me.§X\x0f;z\x03§("spark_dust");
                     _loc8_.sprite.anim.loop = true;
                     _loc8_.sprite.anim.gotoRandom();
                     _loc8_.x = _loc3_.fr.sprite.x + int(Std.random(13)) - 7;
                     _loc8_.y = _loc3_.fr.sprite.y + int(Std.random(13)) - 7;
                     _loc8_.timer = 15;
                     _loc8_.sprite.filters = [new GlowFilter(16711935,1,4,4,2)];
                     _loc8_.sprite.blendMode = BlendMode.ADD;
                  }
                  _loc9_ = Number(Math.abs(Number(§\x19\n\t\x01§.sin(_loc3_.c * 3.14))));
                  _loc3_.fr.sprite.filters = [new GlowFilter(16777215,_loc9_,2,2,10)];
               }
            }
         }
         if(int(fruits.length) == 0)
         {
            kill();
         }
      }
   }
}
