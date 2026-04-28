package fx
{
   import flash.Boot;
   import flash.geom.Point;
   import pix.Anim;
   import pix.Sprite;
   
   public class Bomb extends Fx
   {
      
      public static var §\x1ek\x19\x18\x02§:int = 100;
       
      
      public var step:int;
      
      public var ray:Number;
      
      public var cut:Object;
      
      public var coef:Number;
      
      public var bomb:Sprite;
      
      public var an:Number;
      
      public function Bomb()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         bomb = new Sprite();
         bomb.setAnim(Gfx.fx.getAnim("bomb"));
         Stage.me.dm.add(bomb,Stage.§|r;h§);
         var _loc1_:Point = Stage.me.§;*\x13(\x02§(20,40);
         bomb.x = _loc1_.x;
         bomb.y = _loc1_.y;
         step = 0;
         coef = 0;
      }
      
      override public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:* = null as Part;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         switch(step)
         {
            case 0:
               coef = Number(Math.min(Number(coef + 0.02),1));
               if(coef == 1)
               {
                  explode();
               }
               break;
            case 1:
               _loc1_ = 20;
               _loc2_ = 20;
               while(true)
               {
                  _loc3_ = _loc1_ / ray;
                  while(an < 6.28 && _loc2_ > 0)
                  {
                     _loc4_ = Stage.me.§X\x0f;z\x03§("burn");
                     _loc5_ = Number(§\x19\n\t\x01§.cos(an));
                     _loc6_ = Number(§\x19\n\t\x01§.sin(an));
                     _loc7_ = 1;
                     _loc8_ = ray / 100 * 4;
                     _loc4_.frict = 0.9;
                     _loc4_.x = Number(bomb.x + _loc5_ * ray);
                     _loc4_.y = Number(bomb.y + _loc6_ * ray);
                     _loc4_.vx = _loc5_ * _loc8_;
                     _loc4_.vy = _loc6_ * _loc8_;
                     an = Number(an + _loc3_);
                     _loc2_--;
                  }
                  if(_loc2_ == 0)
                  {
                     break;
                  }
                  ray = Number(ray + 12);
                  an = 0;
               }
               §#\tO\x01\x01§();
               if(ray > Bomb.§\x1ek\x19\x18\x02§)
               {
                  bomb.kill();
                  kill();
                  break;
               }
         }
      }
      
      public function explode() : void
      {
         step = 1;
         bomb.visible = false;
         ray = 10;
         an = 0;
      }
      
      public function §#\tO\x01\x01§() : void
      {
         var _loc3_:* = null as Fruit;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc9_:* = null;
         var _loc10_:* = null as §z\x1f)\x11\x01§;
         var _loc1_:int = 0;
         var _loc2_:Array = Game.me.fruits;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_ = _loc3_.x - bomb.x;
            _loc5_ = _loc3_.y - bomb.y;
            if(Number(Math.sqrt(Number(_loc4_ * _loc4_ + _loc5_ * _loc5_))) < ray)
            {
               _loc3_.§ro^T\x01§();
               _loc3_.kill();
            }
         }
         var _loc6_:Snake = Game.me.snake;
         var _loc7_:Boolean = true;
         var _loc8_:* = 0;
         _loc1_ = 0;
         _loc2_ = _loc6_.queue;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc9_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_ = _loc9_.x - bomb.x;
            _loc5_ = _loc9_.y - bomb.y;
            if(Number(Math.sqrt(Number(_loc4_ * _loc4_ + _loc5_ * _loc5_))) < ray)
            {
               if(_loc7_)
               {
                  _loc6_.burn();
               }
               else
               {
                  _loc10_ = _loc6_.cut(_loc6_.length[0] - _loc9_.pos);
                  _loc10_.§/\x0b&T§();
               }
               break;
            }
            _loc7_ = false;
         }
      }
   }
}
