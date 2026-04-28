package mt.fx
{
   import flash.Boot;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class §qR))\x03§ extends Part
   {
       
      
      public var spc:Number;
      
      public var scy:Number;
      
      public var min:Number;
      
      public var max:Number;
      
      public var hole:Object;
      
      public var §?\x03);§:Number;
      
      public var colors:Array;
      
      public var §~2+\x02\x02§:Number;
      
      public function §qR))\x03§(param1:Number = 0.0, param2:Number = 0.0, param3:Number = 0.1, param4:Number = 0.0, param5:Number = 1.0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(new Sprite());
         min = param1;
         max = param2;
         spc = param3;
         §?\x03);§ = param4;
         scy = param5;
         colors = [16777215,16777215];
         §~2+\x02\x02§ = 0.5;
         curveIn(0.5);
         draw();
         maj(0);
      }
      
      override public function update() : void
      {
         super.update();
         coef = Number(Math.min(Number(coef + spc),1));
         if(hole != null)
         {
            draw();
         }
         maj(coef);
         if(coef == 1)
         {
            kill();
         }
      }
      
      public function §9iv_\x02§(param1:Number = 1.0) : void
      {
         hole = {"\x06AF\x12\x01":param1};
      }
      
      public function maj(param1:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:Number = Number(curve(coef));
         root.scaleX = (min + (max - min) * _loc2_) * 0.01;
         root.scaleY = root.scaleX * scy;
         if(_loc2_ > §?\x03);§)
         {
            _loc3_ = (param1 - §?\x03);§) / (1 - §?\x03);§);
            root.alpha = (1 - _loc3_) * alpha;
         }
      }
      
      public function draw() : void
      {
         var _loc2_:* = null as Matrix;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:Graphics = root.graphics;
         _loc1_.clear();
         if(int(colors.length) > 1)
         {
            _loc2_ = new Matrix();
            _loc2_.createGradientBox(100,100,0,-50,-50);
            _loc1_.beginGradientFill(GradientType.RADIAL,colors,[0,1],[int(§~2+\x02\x02§ * 255),255],_loc2_);
         }
         else
         {
            _loc1_.beginFill(int(colors[0]));
         }
         var _loc3_:int = 50;
         _loc1_.drawCircle(0,0,_loc3_);
         if(hole != null)
         {
            _loc4_ = Number(curve(coef));
            _loc5_ = _loc3_ * _loc4_;
            _loc6_ = (_loc3_ - _loc5_) * (1 - hole.§\x06AF\x12\x01§);
            _loc1_.drawCircle(_loc6_,0,_loc5_);
         }
      }
   }
}
