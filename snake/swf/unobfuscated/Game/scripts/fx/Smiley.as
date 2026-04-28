package fx
{
   import flash.Boot;
   import flash.geom.Point;
   import mt.bumdum9.Col;
   import pix.Frame;
   import pix.Sprite;
   
   public class Smiley extends Fx
   {
      
      public static var list:Array = [];
      
      public static var RAY:int = 13;
       
      
      public var sprite:Sprite;
      
      public var §T\n8\x02§:Sprite;
      
      public var obs:Object;
      
      public var card:Card;
      
      public function Smiley(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         Smiley.list.push(this);
         card = param1;
         super();
         sprite = new Sprite();
         sprite.drawFrame(Gfx.fx.get(null,"smiley"));
         Stage.me.dm.add(sprite,Stage.§p\x1fLp\x03§);
         var _loc2_:Point = null;
         do
         {
            _loc2_ = Stage.me.§;*\x13(\x02§(40,40,15);
         }
         while(Game.me.§\x0e\b$\r§[0] < 100 && Number(Math.abs(_loc2_.y - sn.y)) < 30 && _loc2_.x < 150);
         
         var _loc3_:int = 40;
         sprite.x = _loc2_.x;
         sprite.y = _loc2_.y;
         obs = Game.me.§\x0fM;\x1c§(sprite.x,sprite.y,Smiley.RAY,collide);
         §T\n8\x02§ = new Sprite();
         §T\n8\x02§.drawFrame(Gfx.fx.get(null,"smiley"));
         Col.setPercentColor(§T\n8\x02§,1,0);
         §T\n8\x02§.x = Number(sprite.x + 3);
         §T\n8\x02§.y = Number(sprite.y + 3);
         Stage.me.§5Q-'\x03§.addChild(§T\n8\x02§);
      }
      
      public function vanish() : void
      {
         kill();
      }
      
      override public function update() : void
      {
         super.update();
         if(!card.active[0])
         {
            vanish();
         }
      }
      
      override public function kill() : void
      {
         Smiley.list.remove(this);
         sprite.kill();
         §T\n8\x02§.kill();
         Game.me.§\x1apb'\x02§(obs);
      }
      
      public function collide() : void
      {
         new Flash(sprite,0.1);
      }
   }
}
