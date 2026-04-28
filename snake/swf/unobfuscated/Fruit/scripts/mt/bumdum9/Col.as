package mt.bumdum9
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   
   public class Col
   {
       
      
      public function Col()
      {
      }
      
      public static function §'|X3\x01§(param1:int) : Object
      {
         return {
            "r":param1 >> 16,
            "g":param1 >> 8 & 255,
            "b":param1 & 255
         };
      }
      
      public static function §73du\x02§(param1:Object) : int
      {
         return int(param1.r) << 16 | int(param1.g) << 8 | int(param1.b);
      }
      
      public static function §4HM\x1d§(param1:int) : Object
      {
         return {
            "a":param1 >>> 24,
            "r":param1 >> 16 & 255,
            "g":param1 >> 8 & 255,
            "b":param1 & 255
         };
      }
      
      public static function §\x01\x01\x0bV§(param1:Object) : int
      {
         return int(param1.a) << 24 | int(param1.r) << 16 | int(param1.g) << 8 | int(param1.b);
      }
      
      public static function setPercentColor(param1:DisplayObject, param2:Number, param3:int, param4:Object = undefined) : void
      {
         if(param4 == null)
         {
            param4 = 0;
         }
         var _loc5_:* = Col.§'|X3\x01§(param3);
         var _loc6_:Number = 1 - param2;
         var _loc7_:ColorTransform = new ColorTransform(_loc6_,_loc6_,_loc6_,1,int(Number(param2 * int(_loc5_.r) + param4)),int(Number(param2 * int(_loc5_.g) + param4)),int(Number(param2 * int(_loc5_.b) + param4)),0);
         param1.transform.colorTransform = _loc7_;
      }
      
      public static function setColor(param1:DisplayObject, param2:int, param3:int = -255) : void
      {
         var _loc4_:* = Col.§4HM\x1d§(param2);
         var _loc5_:ColorTransform = new ColorTransform(1,1,1,1,int(int(_loc4_.r) + param3),int(int(_loc4_.g) + param3),int(int(_loc4_.b) + param3),0);
         param1.transform.colorTransform = _loc5_;
      }
      
      public static function overlay(param1:DisplayObject, param2:int, param3:int = -128) : void
      {
         var _loc4_:* = Col.§4HM\x1d§(param2);
         var _loc5_:int = 1;
         var _loc6_:int = 2;
         var _loc7_:ColorTransform = new ColorTransform(_loc5_,_loc5_,_loc5_,1,int((int(_loc4_.r) + param3) * _loc6_),int((int(_loc4_.g) + param3) * _loc6_),int((int(_loc4_.b) + param3) * _loc6_),0);
         param1.transform.colorTransform = _loc7_;
      }
      
      public static function overlay2(param1:DisplayObject, param2:int, param3:int = -128) : void
      {
         var _loc4_:* = Col.§4HM\x1d§(param2);
         var _loc5_:int = 2;
         var _loc6_:int = 1;
         var _loc7_:ColorTransform = new ColorTransform(_loc5_,_loc5_,_loc5_,_loc5_,int((int(_loc4_.r) + param3) * _loc6_),int((int(_loc4_.g) + param3) * _loc6_),int((int(_loc4_.b) + param3) * _loc6_),0);
         param1.transform.colorTransform = _loc7_;
      }
      
      public static function getRainbow(param1:Object = undefined) : int
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param1 == null)
         {
            param1 = Number(Math.random());
         }
         var _loc2_:int = 3;
         var _loc3_:Array = [0,0,0];
         var _loc4_:Number = 1 / _loc2_ * 2;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc5_++;
            _loc6_ = _loc5_;
            _loc7_ = Number(_loc4_ + _loc6_ * 2 * _loc4_);
            _loc8_ = Number(Num.hMod(_loc7_ - param1,0.5));
            _loc3_[_loc6_] = Number(Math.min(1.5 - Math.abs(_loc8_) * 3,1));
         }
         return int(Col.§73du\x02§({
            "r":int(_loc3_[0] * 255),
            "g":int(_loc3_[1] * 255),
            "b":int(_loc3_[2] * 255)
         }));
      }
      
      public static function getRainbow2(param1:Object = undefined) : int
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         if(param1 == null)
         {
            param1 = Number(Math.random());
         }
         var _loc2_:Number = 1 / 3;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < 3)
         {
            _loc4_++;
            _loc5_ = _loc4_;
            _loc6_ = Math.abs(Number(Num.hMod(param1 - _loc2_ * _loc5_,0.5))) * 2;
            _loc3_.push(int(_loc6_ * 255));
         }
         return int(Col.§73du\x02§({
            "r":int(_loc3_[0]),
            "g":int(_loc3_[1]),
            "b":int(_loc3_[2])
         }));
      }
      
      public static function mergeCol(param1:int, param2:int, param3:Object = undefined) : int
      {
         if(param3 == null)
         {
            param3 = 0.5;
         }
         var _loc4_:* = Col.§'|X3\x01§(param1);
         var _loc5_:* = Col.§'|X3\x01§(param2);
         var _loc6_:* = {
            "r":int(Number(int(_loc4_.r) * param3 + int(_loc5_.r) * (1 - param3))),
            "g":int(Number(int(_loc4_.g) * param3 + int(_loc5_.g) * (1 - param3))),
            "b":int(Number(int(_loc4_.b) * param3 + int(_loc5_.b) * (1 - param3)))
         };
         return int(Col.§73du\x02§(_loc6_));
      }
      
      public static function mergeCol32(param1:int, param2:int, param3:Object = undefined) : int
      {
         if(param3 == null)
         {
            param3 = 0.5;
         }
         var _loc4_:* = Col.§4HM\x1d§(param1);
         var _loc5_:* = Col.§4HM\x1d§(param2);
         var _loc6_:* = {
            "r":int(Number(int(_loc4_.r) * param3 + int(_loc5_.r) * (1 - param3))),
            "g":int(Number(int(_loc4_.g) * param3 + int(_loc5_.g) * (1 - param3))),
            "b":int(Number(int(_loc4_.b) * param3 + int(_loc5_.b) * (1 - param3))),
            "a":int(Number(int(_loc4_.a) * param3 + int(_loc5_.a) * (1 - param3)))
         };
         return int(Col.§\x01\x01\x0bV§(_loc6_));
      }
      
      public static function desaturate(param1:int, param2:Number = 0.5) : int
      {
         var _loc3_:* = Col.§'|X3\x01§(param1);
         var _loc4_:Number = (int(_loc3_.r) + int(_loc3_.g) + int(_loc3_.b)) / 3;
         _loc3_.r = int(Number(int(_loc3_.r) * (1 - param2) + _loc4_ * param2));
         _loc3_.g = int(Number(int(_loc3_.g) * (1 - param2) + _loc4_ * param2));
         _loc3_.b = int(Number(int(_loc3_.b) * (1 - param2) + _loc4_ * param2));
         return int(Col.§73du\x02§(_loc3_));
      }
      
      public static function §!x\fV\x02§(param1:int, param2:int) : int
      {
         var _loc3_:* = Col.§'|X3\x01§(param1);
         _loc3_.r = int(Number(Num.mm(0,int(_loc3_.r) + param2,255)));
         _loc3_.g = int(Number(Num.mm(0,int(_loc3_.g) + param2,255)));
         _loc3_.b = int(Number(Num.mm(0,int(_loc3_.b) + param2,255)));
         return int(Col.§73du\x02§(_loc3_));
      }
      
      public static function shuffle(param1:int, param2:int) : int
      {
         var _loc3_:* = Col.§'|X3\x01§(param1);
         _loc3_.r = int(Number(Num.mm(0,Number(int(_loc3_.r) + (Math.random() * 2 - 1) * param2),255)));
         _loc3_.g = int(Number(Num.mm(0,Number(int(_loc3_.g) + (Math.random() * 2 - 1) * param2),255)));
         _loc3_.b = int(Number(Num.mm(0,Number(int(_loc3_.b) + (Math.random() * 2 - 1) * param2),255)));
         return int(Col.§73du\x02§(_loc3_));
      }
      
      public static function §4\x04\x0e(\x03§(param1:int, param2:int, param3:int) : int
      {
         return (param1 << 16) + (param2 << 8) + param3;
      }
      
      public static function getWeb(param1:int) : String
      {
         return "#" + StringTools.hex(param1);
      }
      
      public static function §AV6D\x01§(param1:Class, param2:int = 8) : Array
      {
         var _loc8_:int = 0;
         var _loc3_:Sprite = Type.createInstance(param1,[]);
         var _loc4_:BitmapData = new BitmapData(int(_loc3_.width),int(_loc3_.height),false,16776960);
         _loc4_.draw(_loc3_);
         var _loc5_:Array = [];
         var _loc6_:int = param2 >> 1;
         var _loc7_:int = 0;
         while(_loc7_ < 10)
         {
            _loc7_++;
            _loc8_ = _loc7_;
            _loc5_.push(uint(_loc4_.getPixel(_loc8_ * param2 + _loc6_,_loc6_)));
         }
         _loc4_.dispose();
         return _loc5_;
      }
   }
}
