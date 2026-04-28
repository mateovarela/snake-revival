package fx
{
   import flash.Boot;
   import flash.display.Sprite;
   import gfx.§ec@\x14\x02§;
   
   public class BlackHole extends Fx
   {
      
      public static var ACTIVE:Boolean = false;
       
      
      public var spc:Number;
      
      public var parts:Array;
      
      public var hole:§ec@\x14\x02§;
      
      public var dec:Number;
      
      public var coef:Number;
      
      public function BlackHole()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(BlackHole.ACTIVE)
         {
            return;
         }
         super();
         BlackHole.ACTIVE = true;
         sn.trq = [];
         coef = 0;
         spc = 0.001;
         dec = 0;
         hole = new §ec@\x14\x02§();
         hole.x = sn.x;
         hole.y = sn.y;
         var _loc1_:Number = 0.25;
         hole.scaleY = _loc1_;
         hole.scaleX = _loc1_;
         Stage.me.dm.add(hole,Stage.DP_BG);
         parts = [];
      }
      
      override public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Array;
         var _loc3_:* = null as Fruit;
         var _loc4_:* = null;
         super.update();
         coef = Number(Math.min(Number(coef + spc),1));
         if(sn.§REo\x12§[0] / sn.length[0] < 1)
         {
            pop();
            hole.scaleX = hole.scaleX * 1.001;
            hole.scaleY = hole.scaleX;
            _loc1_ = 0;
            _loc2_ = Game.me.fruits;
            while(_loc1_ < int(_loc2_.length))
            {
               _loc3_ = _loc2_[_loc1_];
               _loc1_++;
               if(!_loc3_.dummy)
               {
                  new §P\x1f%\x1d\x02§(_loc3_,1,{
                     "x":hole.x,
                     "y":hole.y
                  });
               }
            }
         }
         else
         {
            hole.scaleX = hole.scaleX * 0.9;
            hole.scaleY = hole.scaleX;
            _loc1_ = 0;
            _loc2_ = parts;
            while(_loc1_ < int(_loc2_.length))
            {
               _loc4_ = _loc2_[_loc1_];
               _loc1_++;
               _loc4_.c = _loc4_.c * 0.97;
            }
            if(hole.scaleX < 0.02)
            {
               kill();
            }
         }
         _loc2_ = parts.copy();
         _loc1_ = 0;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc4_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_.sp.scaleX = _loc4_.sp.scaleX * _loc4_.c;
            _loc4_.sp.scaleY = _loc4_.sp.scaleX;
            _loc4_.sp.rotation = Number(_loc4_.sp.rotation + Number(_loc4_.vr));
            _loc4_.bl.scaleX = _loc4_.bl.scaleX * 1.08;
            _loc4_.bl.scaleY = _loc4_.bl.scaleX;
            if(_loc4_.sp.scaleX < 0.1)
            {
               parts.remove(_loc4_);
               _loc4_.sp.parent.removeChild(_loc4_.sp);
            }
         }
      }
      
      public function pop() : void
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:§ec@\x14\x02§ = new §ec@\x14\x02§();
         _loc1_.addChild(_loc2_);
         _loc2_.x = 20 + int(Std.random(40));
         _loc1_.rotation = Math.random() * 360;
         _loc1_.x = hole.x;
         _loc1_.y = hole.y;
         var _loc3_:Number = 0.03;
         _loc2_.scaleY = _loc3_;
         _loc2_.scaleX = _loc3_;
         parts.push({
            "sp":_loc1_,
            "bl":_loc2_,
            "c":Number(0.85 + Math.random() * 0.1),
            "vr":Number(2 + Math.random() * 4)
         });
         Stage.me.dm.add(_loc1_,Stage.DP_BG);
      }
      
      override public function kill() : void
      {
         var _loc1_:* = null as Sprite;
         BlackHole.ACTIVE = false;
         hole.parent.removeChild(hole);
         while(int(parts.length) > 0)
         {
            _loc1_ = parts.pop().sp;
            _loc1_.parent.removeChild(_loc1_);
         }
         super.kill();
      }
   }
}
