package
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import mt.bumdum9.Col;
   import mt.bumdum9.Num;
   import pix.Anim;
   import pix.Element;
   
   public class Part
   {
      
      public static var POOL:Array = [];
      
      public static var §9\bh*§:int = 0;
       
      
      public var z:Number;
      
      public var y:Number;
      
      public var x:Number;
      
      public var §d7Kz\x02§:Boolean;
      
      public var weight:Number;
      
      public var vz:Number;
      
      public var vy:Number;
      
      public var vx:Number;
      
      public var timer:Object;
      
      public var §QW\x070\x03§:Boolean;
      
      public var sprite:pix.Sprite;
      
      public var sleep:Object;
      
      public var §T\n8\x02§:flash.display.Sprite;
      
      public var ray:Number;
      
      public var §\x183h)\x03§:Function;
      
      public var §1_4\n\x01§:Part;
      
      public var §8\x15J{\x02§:int;
      
      public var §\x188\x1b(\x03§:Number;
      
      public var §u!H7\x01§:Number;
      
      public var frict:Number;
      
      public var fadeType:int;
      
      public var fadeLimit:int;
      
      public var §GT\x0b\x01\x03§:Array;
      
      public function Part()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         §1_4\n\x01§ = this;
         sprite = new pix.Sprite();
         pix.Sprite.all.remove(sprite);
         §GT\x0b\x01\x03§ = Part.POOL;
         init();
      }
      
      public static function get() : Part
      {
         if(int(Part.POOL.length) == 0)
         {
            return new Part();
         }
         var _loc1_:Part = Part.POOL.pop();
         _loc1_.init();
         return _loc1_;
      }
      
      public function updatePos() : void
      {
         var _loc1_:Number = NaN;
         sprite.x = x;
         sprite.y = Number(y + z);
         sprite.pxx();
         if(§T\n8\x02§ != null)
         {
            _loc1_ = 0.25;
            §T\n8\x02§.x = x + 2 - z * _loc1_;
            §T\n8\x02§.y = y + 2 - z * _loc1_;
            if(§QW\x070\x03§)
            {
               §T\n8\x02§.x = §T\n8\x02§.x - Stage.me.root.x;
               §T\n8\x02§.y = §T\n8\x02§.y - Stage.me.root.y;
            }
         }
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(sleep != null)
         {
            _loc1_ = sleep;
            sleep = sleep - 1;
            if(_loc1_ <= 0)
            {
               sleep = null;
               sprite.visible = true;
               if(§T\n8\x02§ != null)
               {
                  §T\n8\x02§.visible = true;
               }
               if(sprite.anim != null && sprite.anim.playSpeed == 0)
               {
                  sprite.anim.play();
               }
            }
            return;
         }
         x = Number(x + vx);
         y = Number(y + vy);
         vx = vx * frict;
         vy = vy * frict;
         if(!§d7Kz\x02§)
         {
            z = Number(z + vz);
            vz = vz * frict;
            if(z > -ray)
            {
               §o\x1d\x16d\x01§();
               z = -ray;
               vz = vz * -§\x188\x1b(\x03§;
               vx = vx * §u!H7\x01§;
               vy = vy * §u!H7\x01§;
               if(Number(Math.abs(vz)) < weight * 3)
               {
                  vz = 0;
                  §d7Kz\x02§ = true;
               }
            }
            else
            {
               vz = Number(vz + weight);
            }
         }
         §]\x01(S\x03§();
         updatePos();
         if(timer != null)
         {
            timer = timer - 1;
            if(timer <= fadeLimit)
            {
               _loc2_ = timer / fadeLimit;
               switch(fadeType)
               {
                  case 0:
                     break;
                  case 1:
                     sprite.alpha = _loc2_;
                     break;
                  case 2:
                     _loc3_ = _loc2_;
                     sprite.scaleY = _loc3_;
                     sprite.scaleX = _loc3_;
               }
            }
            if(timer < 0)
            {
               _x_disparition();
            }
         }
      }
      
      public function _x_disparition() : void
      {
         kill();
      }
      
      public function §Hp@\x0f\x01§(param1:Object) : void
      {
         sleep = param1;
         sprite.visible = false;
         if(§T\n8\x02§ != null)
         {
            §T\n8\x02§.visible = false;
         }
      }
      
      public function setPos(param1:Number, param2:Number, param3:Object = undefined) : void
      {
         x = param1;
         y = param2;
         if(param3 != null)
         {
            z = param3;
         }
         updatePos();
      }
      
      public function §\x156Qx\x01§() : void
      {
         §T\n8\x02§.parent.removeChild(§T\n8\x02§);
         §T\n8\x02§ = null;
      }
      
      public function §I\\\x1a=\x03§() : void
      {
         var _loc1_:int = 1;
         sprite.scaleX = (int(Std.random(2)) * 2 - 1) * _loc1_;
         sprite.scaleY = (int(Std.random(2)) * 2 - 1) * _loc1_;
      }
      
      public function mark(param1:int = 16711680) : void
      {
         var _loc2_:flash.display.Sprite = new flash.display.Sprite();
         sprite.addChild(_loc2_);
         _loc2_.graphics.beginFill(param1);
         _loc2_.graphics.drawCircle(0,0,ray);
      }
      
      public function §\nMo7§(param1:Number, param2:Number, param3:Number) : void
      {
         vx = §\x19\n\t\x01§.cos(param1) * param2;
         vy = §\x19\n\t\x01§.sin(param1) * param2;
         vz = param3;
         §d7Kz\x02§ = false;
      }
      
      public function kill() : void
      {
         Game.me.parts.remove(this);
         if(§T\n8\x02§ != null && §T\n8\x02§.parent != null)
         {
            §T\n8\x02§.parent.removeChild(§T\n8\x02§);
         }
         sprite.kill();
         §GT\x0b\x01\x03§.push(this);
      }
      
      public function init() : void
      {
         var _loc1_:int = Part.§9\bh*§;
         Part.§9\bh*§ = Part.§9\bh*§ + 1;
         §8\x15J{\x02§ = _loc1_;
         x = 0;
         y = 0;
         z = 0;
         vx = 0;
         vy = 0;
         vz = 0;
         weight = 0;
         frict = 1;
         ray = 0;
         §QW\x070\x03§ = false;
         §u!H7\x01§ = 0.5;
         §\x188\x1b(\x03§ = 0.75;
         fadeType = 0;
         fadeLimit = 10;
         §d7Kz\x02§ = false;
         §T\n8\x02§ = null;
         §\x183h)\x03§ = null;
         timer = null;
         sleep = null;
         sprite.clear();
         pix.Sprite.all.push(sprite);
         Game.me.parts.push(this);
      }
      
      public function §o\x1d\x16d\x01§() : void
      {
         if(§\x183h)\x03§ != null)
         {
            §\x183h)\x03§();
         }
      }
      
      public function FFfR(param1:Boolean = true) : void
      {
         var _loc2_:* = null as Element;
         if(param1)
         {
            _loc2_ = new Element();
            _loc2_.drawFrame(sprite.currentFrame);
            Col.setPercentColor(_loc2_,1,0);
            §T\n8\x02§ = _loc2_;
         }
         else
         {
            §T\n8\x02§ = new flash.display.Sprite();
            §T\n8\x02§.graphics.beginFill(0);
            §T\n8\x02§.graphics.drawCircle(0,0,ray);
         }
         Stage.me.§5Q-'\x03§.addChild(§T\n8\x02§);
      }
      
      public function §]\x01(S\x03§() : void
      {
         if(x < ray || x > Stage.me.width - ray)
         {
            vx = vx * -§\x188\x1b(\x03§;
            x = Number(Num.mm(ray,x,Stage.me.width - ray));
         }
         if(y < ray || y > Stage.me.height - ray)
         {
            vy = vy * -§\x188\x1b(\x03§;
            y = Number(Num.mm(ray,y,Stage.me.height - ray));
         }
      }
      
      public function blink(param1:int) : void
      {
         var _loc2_:Number = 0;
         if(int(Game.me.§\x0e\b$\r§[0] % (param1 * 2)) < param1)
         {
            _loc2_ = 1;
         }
         Col.setPercentColor(sprite,_loc2_,16777215);
      }
   }
}
