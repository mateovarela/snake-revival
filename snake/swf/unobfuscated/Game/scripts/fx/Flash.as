package fx
{
   import flash.Boot;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import mt.bumdum9.Col;
   
   public class Flash extends Fx
   {
       
      
      public var type:int;
      
      public var speed:Number;
      
      public var root:Sprite;
      
      public var §KQ}\x16\x02§:Object;
      
      public var color:Object;
      
      public var coef:Number;
      
      public function Flash(param1:Sprite = undefined, param2:Number = 0.1, param3:Object = undefined, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         color = param4;
         type = param3;
         super();
         root = param1;
         speed = param2;
         coef = 1;
         maj();
      }
      
      override public function update() : void
      {
         if(!root.visible)
         {
            return;
         }
         coef = Number(Math.max(coef - speed,0));
         maj();
         if(coef == 0)
         {
            kill();
         }
      }
      
      public function maj() : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:Number = coef;
         switch(type)
         {
            case 0:
               _loc1_ = coef;
               break;
            case 1:
               _loc1_ = 0.5 - §\x19\n\t\x01§.cos(coef * 3.14) * 0.5;
         }
         if(color == null)
         {
            Col.setColor(root,0,int(255 * coef));
         }
         else
         {
            Col.setPercentColor(root,coef,color);
         }
         if(§KQ}\x16\x02§ != null)
         {
            root.filters = [];
            _loc2_ = color;
            if(_loc2_ == null)
            {
               color = 16777215;
            }
            _loc3_ = §KQ}\x16\x02§.bl * coef;
            _loc4_ = §KQ}\x16\x02§.str * coef;
            if(coef > 0)
            {
               root.filters = [new GlowFilter(color,1,_loc3_,_loc3_,_loc4_)];
            }
         }
      }
      
      public function glow(param1:Number, param2:Number) : void
      {
         §KQ}\x16\x02§ = {
            "str":param1,
            "bl":param2
         };
         maj();
      }
   }
}
