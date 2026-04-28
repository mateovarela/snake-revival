package mt.fx
{
   import flash.Boot;
   import flash.display.DisplayObject;
   
   public class Tween extends Fx
   {
       
      
      public var tw:mt.bumdum9.Tween;
      
      public var speed:Number;
      
      public var sin:Object;
      
      public var root:DisplayObject;
      
      public var fitPix:Boolean;
      
      public var f:Function;
      
      public function Tween(param1:DisplayObject = undefined, param2:Object = undefined, param3:Object = undefined, param4:Number = 0.1, param5:Object = undefined, param6:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         root = param1;
         speed = param4;
         if(param5 == null)
         {
            param5 = root.x;
         }
         if(param6 == null)
         {
            param6 = root.y;
         }
         tw = new mt.bumdum9.Tween(param5,param6,param2,param3);
         f = tw.getPos;
      }
      
      override public function update() : void
      {
         var _loc3_:Number = NaN;
         coef = Number(Math.min(Number(coef + speed),1));
         var _loc1_:Number = Number(curve(coef));
         var _loc2_:* = f(_loc1_);
         if(sin != null)
         {
            _loc3_ = Number(Math.sin(_loc1_ * 3.14));
            _loc2_.x = Number(Number(_loc2_.x) + sin.dx * _loc3_);
            _loc2_.y = Number(Number(_loc2_.y) + sin.dy * _loc3_);
         }
         root.x = Number(_loc2_.x);
         root.y = Number(_loc2_.y);
         if(fitPix)
         {
            root.x = int(root.x);
            root.y = int(root.y);
         }
         if(coef == 1)
         {
            kill();
         }
      }
      
      public function §`\f;\x0e§() : Boolean
      {
         return true;
      }
      
      public function §*r*_\x03§(param1:int, param2:Number = -1.57) : void
      {
         sin = {
            "dx":Math.cos(param2) * param1,
            "dy":Math.sin(param2) * param1
         };
      }
      
      public function §n\x0fDn§(param1:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:Number = Number(tw.getDist());
         if(sin != null)
         {
            _loc3_ = Number(Math.sqrt(Number(sin.dx * sin.dx + sin.dy * sin.dy)) * 2 + _loc2_);
            _loc2_ = _loc3_ * Math.PI / 4;
         }
         speed = param1 / _loc2_;
      }
      
      public function §stWa\x02§(param1:Object, param2:Object) : void
      {
         var x:Object = param1;
         var y:Object = param2;
         var me:mt.fx.Tween = this;
         f = function(param1:Number):Object
         {
            return me.tw.§}kQl§(param1,x,y);
         };
      }
      
      public function §'U#h\x01§() : void
      {
         var me:mt.fx.Tween = this;
         onFinish = function():void
         {
            me.root.x = int(me.root.x);
            me.root.y = int(me.root.y);
         };
      }
   }
}
