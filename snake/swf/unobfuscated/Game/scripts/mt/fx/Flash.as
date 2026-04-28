package mt.fx
{
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import mt.bumdum9.Col;
   
   public class Flash extends Fx
   {
       
      
      public var speed:Number;
      
      public var root:DisplayObject;
      
      public var power:Number;
      
      public var first:Boolean;
      
      public var §KQ}\x16\x02§:Object;
      
      public var color:Object;
      
      public var additive:Boolean;
      
      public function Flash(param1:DisplayObject = undefined, param2:Number = 0.1, param3:Object = undefined, param4:Number = 1.0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         color = param3;
         power = param4;
         super();
         root = param1;
         speed = param2;
         first = true;
         additive = false;
         if(color == null)
         {
            color = 16777215;
            additive = true;
         }
      }
      
      override public function update() : void
      {
         if(!root.visible)
         {
            return;
         }
         if(!first)
         {
            coef = Number(Math.min(Number(coef + speed),1));
         }
         first = false;
         maj();
         if(coef == 1)
         {
            kill();
         }
      }
      
      public function maj() : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:Number = 1 - curve(coef);
         if(additive)
         {
            _loc2_ = Col._x_setRGBValues(color);
            _loc2_.r = int(int(_loc2_.r) * _loc1_ * power);
            _loc2_.g = int(int(_loc2_.g) * _loc1_ * power);
            _loc2_.b = int(int(_loc2_.b) * _loc1_ * power);
            root.transform.colorTransform = new ColorTransform(1,1,1,1,int(_loc2_.r),int(_loc2_.g),int(_loc2_.b),0);
         }
         else
         {
            Col.setPercentColor(root,_loc1_ * power,color);
         }
         if(§KQ}\x16\x02§ != null)
         {
            root.filters = [];
            _loc2_ = color;
            if(_loc2_ == null)
            {
               color = 16777215;
            }
            if(§KQ}\x16\x02§.color != null)
            {
               _loc2_ = §KQ}\x16\x02§.color;
            }
            _loc3_ = §KQ}\x16\x02§.bl * _loc1_;
            _loc4_ = §KQ}\x16\x02§.str * _loc1_;
            if(coef > 0)
            {
               root.filters = [new GlowFilter(_loc2_,1,_loc3_,_loc3_,_loc4_)];
            }
         }
      }
      
      public function glow(param1:Number, param2:Number, param3:Object = undefined) : void
      {
         §KQ}\x16\x02§ = {
            "str":param1,
            "bl":param2,
            "color":param3
         };
         maj();
      }
   }
}
