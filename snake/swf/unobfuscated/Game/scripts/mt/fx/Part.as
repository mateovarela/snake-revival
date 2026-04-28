package mt.fx
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class Part extends Fx
   {
       
      
      public var y:Number;
      
      public var x:Number;
      
      public var weight:Number;
      
      public var vy:Number;
      
      public var vx:Number;
      
      public var vr:Number;
      
      public var timer:int;
      
      public var sfr:Object;
      
      public var scale:Number;
      
      public var root:Sprite;
      
      public var rfr:Number;
      
      public var onBounceGround:Function;
      
      public var ground:Object;
      
      public var frict:Number;
      
      public var fitPix:Boolean;
      
      public var fadeType:int;
      
      public var fadeLimit:int;
      
      public var fadeInData:Object;
      
      public var alpha:Number;
      
      public function Part(param1:Sprite = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         root = param1;
         fitPix = false;
         x = root.x;
         y = root.y;
         vx = 0;
         vy = 0;
         weight = 0;
         vr = 0;
         sfr = null;
         rfr = 1;
         frict = 1;
         rfr = 1;
         scale = 1;
         alpha = 1;
         timer = -1;
         fadeLimit = 10;
         fadeType = 0;
      }
      
      public function updatePos() : void
      {
         root.x = x;
         root.y = y;
         if(fitPix)
         {
            root.x = int(root.x);
            root.y = int(root.y);
         }
      }
      
      override public function update() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         vy = Number(vy + weight);
         vx = vx * frict;
         vy = vy * frict;
         x = Number(x + vx);
         y = Number(y + vy);
         vr = vr * rfr;
         root.rotation = Number(root.rotation + vr);
         if(sfr != null)
         {
            scale = scale * sfr;
            §/2\x17§(scale);
         }
         if(ground != null)
         {
            if(y > Number(ground.y))
            {
               y = Number(ground.y);
               vx = vx * ground.frx;
               vy = vy * -ground.fry;
               if(onBounceGround != null)
               {
                  onBounceGround();
               }
            }
         }
         if(fadeInData != null)
         {
            fadeInData.timer = int(fadeInData.timer) + 1;
            _loc1_ = int(fadeInData.timer) / int(fadeInData.§_(\f§);
            switch(fadeType)
            {
               case 0:
                  break;
               case 1:
                  root.alpha = _loc1_ * alpha;
                  break;
               case 2:
                  _loc2_ = _loc1_ * scale;
                  root.scaleY = _loc2_;
                  root.scaleX = _loc2_;
                  break;
               case 3:
                  root.scaleX = _loc1_ * scale;
                  break;
               case 4:
                  root.scaleY = _loc1_ * scale;
            }
            if(_loc1_ == 1)
            {
               fadeInData = null;
            }
         }
         timer = timer - 1;
         if(timer < fadeLimit && timer >= 0)
         {
            _loc1_ = timer / fadeLimit;
            switch(fadeType)
            {
               case 0:
                  break;
               case 1:
                  root.alpha = _loc1_ * alpha;
                  break;
               case 2:
                  _loc2_ = _loc1_ * scale;
                  root.scaleY = _loc2_;
                  root.scaleX = _loc2_;
                  break;
               case 3:
                  root.scaleX = _loc1_ * scale;
                  break;
               case 4:
                  root.scaleY = _loc1_ * scale;
            }
         }
         if(timer == 0)
         {
            kill();
         }
         updatePos();
      }
      
      public function twist(param1:int, param2:Object = undefined) : void
      {
         if(param2 != null)
         {
            rfr = param2;
         }
         root.rotation = Math.random() * 360;
         vr = (Math.random() * 2 - 1) * param1;
      }
      
      public function sleep(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:Sleep = new Sleep(this,null,param1);
         root.visible = false;
         var me:Part = this;
         var _loc4_:Function = function():void
         {
            me.root.visible = true;
         };
         if(param2)
         {
            var mc:MovieClip = root;
            mc.stop();
            _loc4_ = function():void
            {
               me.root.visible = true;
               mc.play();
            };
         }
         _loc3_.onFinish = _loc4_;
      }
      
      public function §\x05\x01\x11g\x01§(param1:int) : void
      {
         x = Number(x + vx * param1);
         y = Number(y + vy * param1);
         updatePos();
      }
      
      public function §/2\x17§(param1:Number) : void
      {
         scale = param1;
         root.scaleX = param1;
         root.scaleY = param1;
      }
      
      public function setPos(param1:Number, param2:Number) : void
      {
         x = param1;
         y = param2;
         updatePos();
      }
      
      public function setGround(param1:Number, param2:Number, param3:Number, param4:Object = undefined) : void
      {
         var timer:Object = param4;
         ground = {
            "y":param1,
            "frx":param2,
            "fry":param3
         };
         if(timer != null)
         {
            var me:Part = this;
            onBounceGround = function():void
            {
               me.timer = timer;
            };
         }
      }
      
      public function setAlpha(param1:Number) : void
      {
         alpha = param1;
         root.alpha = param1;
      }
      
      override public function kill() : void
      {
         if(root.parent != null)
         {
            root.parent.removeChild(root);
         }
         super.kill();
      }
      
      public function §X \\\x0f§() : void
      {
         var _loc1_:* = root;
         _loc1_.kill = kill;
      }
      
      public function fadeIn(param1:int) : void
      {
         fadeInData = {
            "timer":0,
            "_(\f":param1
         };
         var _loc2_:Number = 0;
         root.scaleY = _loc2_;
         root.scaleX = _loc2_;
      }
   }
}
