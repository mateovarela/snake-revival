package browser
{
   import flash.Boot;
   import flash.display.Sprite;
   import mt.bumdum9.Tween;
   
   public class §_\x19X\x13\x03§ extends Sprite
   {
      
      public static var SPEED:int = 16;
       
      
      public var tween:Tween;
      
      public var spc:Number;
      
      public var sleep:Object;
      
      public var §V[t\x11\x02§:Function;
      
      public var leave:Boolean;
      
      public var id:int;
      
      public var data:Object;
      
      public var coef:Number;
      
      public var card:Card;
      
      public function §_\x19X\x13\x03§(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         data = param1;
         id = int(Browser.me.§\x02zI\x1c\x01§());
         Browser.me.hand.push(this);
         leave = false;
         card = new Card(data._type);
         card.§T\n8\x02§.visible = false;
         addChild(card.sprite);
         card.§\x0eX\x1c4\x01§();
         card.coef = [1];
         Browser.me.dm.add(this,Browser.§(Xc\x05\x01§);
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         if(sleep != null)
         {
            sleep = sleep - 1;
            if(sleep <= 0)
            {
               sleep = null;
               visible = true;
            }
            return;
         }
         if(tween != null)
         {
            coef = Number(Math.min(Number(coef + spc),1));
            _loc1_ = tween.getPos(coef);
            x = Number(_loc1_.x);
            y = Number(_loc1_.y);
            if(coef == 1)
            {
               if(§V[t\x11\x02§ != null)
               {
                  §V[t\x11\x02§();
               }
               tween = null;
            }
         }
         card.update();
      }
      
      public function §Hp@\x0f\x01§(param1:Object) : void
      {
         sleep = param1;
         visible = false;
      }
      
      public function §\x01\x03\x1b(\x01§() : void
      {
         var _loc6_:int = 0;
         var _loc1_:Number = Number(int(Browser.me.§\x05\x1fxE§()) + Card.HEIGHT * 0.5);
         var _loc2_:int = 0;
         if(Browser.me.§\x13ET]\x02§.visible)
         {
            _loc2_ = _loc2_ + §0\x1atr\x02§.§;\x057\x02§;
         }
         var _loc3_:int = int(Browser.me.§\x02zI\x1c\x01§());
         var _loc4_:int = 3;
         var _loc5_:int = _loc3_ * Card.§;\x057\x02§ + (_loc3_ - 1) * _loc4_ + _loc2_;
         if(_loc5_ > Cs.mcw)
         {
            _loc6_ = _loc5_ - Cs.mcw;
            _loc4_ = _loc4_ - int(Math.ceil(_loc6_ / (_loc3_ - 1)));
            _loc5_ = _loc3_ * Card.§;\x057\x02§ + (_loc3_ - 1) * _loc4_ + _loc2_;
         }
         var _loc7_:Number = (Cs.mcw - _loc5_) * 0.5;
         moveTo(int(Number(Number(_loc2_ + _loc7_) + (id + 0.5) * (Card.§;\x057\x02§ + _loc4_))),_loc1_);
      }
      
      public function §=gp\x02§() : void
      {
         card.id = [id];
         card.§\x1b\x03\x11K\x02§();
         var _loc1_:* = Game.§BQ(d§(id);
         moveTo(int(_loc1_.x),int(_loc1_.y));
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = param1 - x;
         var _loc4_:Number = param2 - y;
         var _loc5_:Number = Number(Math.sqrt(Number(_loc3_ * _loc3_ + _loc4_ * _loc4_)));
         tween = new Tween(x,y,param1,param2);
         coef = 0;
         spc = §_\x19X\x13\x03§.SPEED / _loc5_;
      }
      
      public function kill() : void
      {
         Browser.me.hand.remove(this);
         Browser.me.§K\x16-]\x03§.remove(this);
         parent.removeChild(this);
      }
      
      public function §\x1c/=\x07\x01§() : void
      {
         Browser.me.nav.add(data);
         kill();
      }
   }
}
