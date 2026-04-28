package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.display.Sprite;
   import mt.bumdum9.Filt;
   import mt.fx.Part;
   import pix.Element;
   import pix.Frame;
   
   public class §\t`v\x1f\x03§ extends Fx
   {
      
      public static var SPEED:int = 20;
       
      
      public var trg:Fruit;
      
      public var tid:int;
      
      public var star:Element;
      
      public var life:int;
      
      public function §\t`v\x1f\x03§(param1:Fruit = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         star = new Element();
         star.x = param1.x;
         star.y = param1.y;
         star.drawFrame(Gfx.fx.get(null,"mini_star"));
         Stage.me.dm.add(star,Stage.DP_FX);
         life = int(Game.me.§2~\f#\x03§(_CardType._x_STAR_SHOOTING)) * 3;
      }
      
      override public function update() : void
      {
         super.update();
         if(trg != null && (trg.death || trg.dummy || tid != trg.§8\x15J{\x02§))
         {
            trg = null;
         }
         if(trg == null && life > 0)
         {
            §Qwxv\x02§();
         }
         if(trg == null)
         {
            kill();
            return;
         }
         var _loc1_:Number = trg.x - star.x;
         var _loc2_:Number = trg.y - star.y;
         var _loc3_:Number = Number(Math.sqrt(Number(_loc1_ * _loc1_ + _loc2_ * _loc2_)));
         if(_loc3_ > §\t`v\x1f\x03§.SPEED)
         {
            _loc1_ = _loc1_ * (§\t`v\x1f\x03§.SPEED / _loc3_);
            _loc2_ = _loc2_ * (§\t`v\x1f\x03§.SPEED / _loc3_);
            _loc3_ = §\t`v\x1f\x03§.SPEED;
         }
         else
         {
            life = life - 1;
            trg.star = true;
            new §P\x1f%\x1d\x02§(trg,10,sn);
            if(int(Game.me.fruits.length) == 0)
            {
               kill();
            }
         }
         star.x = Number(star.x + _loc1_);
         star.y = Number(star.y + _loc2_);
         var _loc4_:int = 1;
         var _loc5_:Sprite = new Sprite();
         var _loc6_:Part = new Part(_loc5_);
         _loc5_.graphics.beginFill(16777215,1);
         _loc5_.graphics.drawRect(0,-_loc4_,_loc3_,2 * _loc4_);
         Stage.me.dm.add(_loc5_,Stage.§l\x10|-\x02§);
         _loc6_.setPos(star.x,star.y);
         _loc5_.rotation = Number(180 + Math.atan2(_loc2_,_loc1_) / 0.0174);
         _loc6_.timer = 10;
         _loc6_.fadeType = 2;
         Filt.glow(_loc6_.root,10,1,16777215);
         _loc5_.blendMode = BlendMode.ADD;
      }
      
      override public function kill() : void
      {
         super.kill();
         star.kill();
      }
      
      public function §Qwxv\x02§() : void
      {
         var _loc3_:* = null as Fruit;
         var _loc1_:int = 0;
         var _loc2_:Array = Game.me.fruits;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(!_loc3_.dummy)
            {
               trg = _loc3_;
               tid = trg.§8\x15J{\x02§;
               break;
            }
         }
      }
   }
}
