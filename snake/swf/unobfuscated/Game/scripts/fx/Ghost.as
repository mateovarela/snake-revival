package fx
{
   import flash.Boot;
   import flash.geom.Point;
   import mt.bumdum9.Num;
   import mt.fx.Tween;
   import mt.fx.§qR))\x03§;
   import pix.Anim;
   import pix.Sprite;
   
   public class Ghost extends Fx
   {
       
      
      public var ghost:Part;
      
      public var float:int;
      
      public var acc:Number;
      
      public function Ghost()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         float = 0;
         ghost = Part.get();
         ghost.sprite = new Sprite();
         ghost.sprite.setAnim(Gfx.fx.getAnim("ghost"));
         ghost.sprite.anim.stop();
         ghost.ray = 3;
         ghost.FFfR(false);
         ghost.frict = 0.91;
         acc = 0.025;
         var _loc1_:Point = Stage.me.§;*\x13(\x02§(20,100);
         ghost.x = _loc1_.x;
         ghost.y = _loc1_.y;
         ghost.z = -10;
         Stage.me.dm.add(ghost.sprite,Stage.DP_FX);
      }
      
      public function vanish() : void
      {
         ghost.timer = 10;
         ghost.fadeType = 1;
         kill();
      }
      
      override public function update() : void
      {
         var _loc7_:* = null as §qR))\x03§;
         var _loc8_:* = null as Tween;
         super.update();
         var _loc1_:Number = sn.x - ghost.x;
         var _loc2_:Number = sn.y - ghost.y;
         var _loc3_:Number = Number(Math.atan2(_loc2_,_loc1_));
         var _loc4_:Number = ghost.sprite.anim.cursor;
         var _loc5_:Number = _loc3_ / 6.28 * 16;
         var _loc6_:Number = Number(Num.hMod(int(Math.round(_loc5_ - _loc4_)),8));
         if(_loc6_ > 0)
         {
            _loc4_++;
         }
         if(_loc6_ < 0)
         {
            _loc4_--;
         }
         ghost.sprite.anim.goto(Number(Num.sMod(_loc4_,16)));
         ghost.vx = Number(ghost.vx + §\x19\n\t\x01§.cos(_loc3_) * acc);
         ghost.vy = Number(ghost.vy + §\x19\n\t\x01§.sin(_loc3_) * acc);
         acc = Number(acc + 0.0001);
         float = int((float + 9) % 628);
         ghost.z = Number(-9 + §\x19\n\t\x01§.cos(float * 0.01) * 6);
         if(ghost.z > -6 && Number(Math.sqrt(Number(_loc1_ * _loc1_ + _loc2_ * _loc2_))) < 12)
         {
            _loc7_ = new §qR))\x03§(16,46,0.05);
            _loc7_.setPos(ghost.x,ghost.y);
            Stage.me.dm.add(_loc7_.root,Stage.§l\x10|-\x02§);
            var sp:Sprite = ghost.sprite;
            _loc8_ = new Tween(sp,sn.x,sn.y,0.2);
            _loc8_.onFinish = function():void
            {
               sp.visible = false;
            };
            ghost.sprite = new Sprite();
            ghost.kill();
            kill();
            new Exit();
         }
         if(sn.dead)
         {
            vanish();
         }
      }
   }
}
