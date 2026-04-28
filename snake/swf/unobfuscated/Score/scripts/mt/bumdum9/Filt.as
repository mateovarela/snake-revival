package mt.bumdum9
{
   import flash.display.DisplayObject;
   import flash.filters.BlurFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   
   public class Filt
   {
       
      
      public function Filt()
      {
      }
      
      public static function glow(param1:DisplayObject, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined) : void
      {
         if(param2 == null)
         {
            param2 = 2;
         }
         if(param3 == null)
         {
            param3 = 10;
         }
         if(param4 == null)
         {
            param4 = 0;
         }
         if(param5 == null)
         {
            param5 = false;
         }
         var _loc6_:GlowFilter = new GlowFilter();
         _loc6_.blurX = param2;
         _loc6_.blurY = param2;
         _loc6_.strength = param3;
         _loc6_.color = param4;
         _loc6_.inner = param5;
         var _loc7_:Array = param1.filters;
         _loc7_.push(_loc6_);
         param1.filters = _loc7_;
      }
      
      public static function blur(param1:DisplayObject, param2:Object = undefined, param3:Object = undefined) : void
      {
         if(param2 == null)
         {
            param2 = 0;
         }
         if(param3 == null)
         {
            param3 = 0;
         }
         var _loc4_:BlurFilter = new BlurFilter();
         _loc4_.blurX = param2;
         _loc4_.blurY = param3;
         var _loc5_:Array = param1.filters;
         _loc5_.push(_loc4_);
         param1.filters = _loc5_;
      }
      
      public static function grey(param1:DisplayObject, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Array = undefined) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc13_:int = 0;
         if(param2 == null)
         {
            param2 = 1;
         }
         if(param3 == null)
         {
            param3 = 0;
         }
         if(param4 == null)
         {
            param4 = {
               "r":0,
               "g":0,
               "b":0
            };
         }
         var _loc6_:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         if(param5 == null)
         {
            _loc7_ = 0.35;
            _loc8_ = 0.45;
            _loc9_ = 0.2;
            param5 = [_loc7_,_loc8_,_loc9_,0,int(int(param4.r) + param3),_loc7_,_loc8_,_loc9_,0,int(int(param4.g) + param3),_loc7_,_loc8_,_loc9_,0,int(int(param4.b) + param3),0,0,0,1,0];
         }
         var _loc10_:Array = [];
         var _loc11_:int = 0;
         var _loc12_:int = int(_loc6_.length);
         while(_loc11_ < _loc12_)
         {
            _loc11_++;
            _loc13_ = _loc11_;
            _loc10_[_loc13_] = Number(int(_loc6_[_loc13_]) * (1 - param2) + param5[_loc13_] * param2);
         }
         var _loc14_:ColorMatrixFilter = new ColorMatrixFilter();
         _loc14_.matrix = _loc10_;
         var _loc15_:Array = param1.filters;
         _loc15_.push(_loc14_);
         param1.filters = _loc15_;
      }
   }
}
