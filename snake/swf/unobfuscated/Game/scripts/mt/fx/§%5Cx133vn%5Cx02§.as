package mt.fx
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.filters.BlurFilter;
   import flash.geom.Point;
   import haxe.Log;
   import mt.bumdum9.Col;
   
   public class §\x133vn\x02§ extends Fx
   {
      
      public static var §\x1az\x01§:Array = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1],[1,-1]];
      
      public static var AT:Number = 0.25;
       
      
      public var §\x1c5\x1cp\x02§:int;
      
      public var ymax:int;
      
      public var §\f}'^\x03§:int;
      
      public var xmax:int;
      
      public var width:Number;
      
      public var §\x03\x01@'\x02§:Boolean;
      
      public var §\x07\x05\\f\x02§:Boolean;
      
      public var visc:Number;
      
      public var §qYE\b\x02§:Array;
      
      public var v:Array;
      
      public var uniformity:Number;
      
      public var §*i=X\x01§:Array;
      
      public var u:Array;
      
      public var res:Number;
      
      public var §\x14'z~\x01§:Array;
      
      public var r:Array;
      
      public var §D\nls\x01§:int;
      
      public var §\x05\x02=*§:Number;
      
      public var height:Number;
      
      public var grid:Array;
      
      public var §j\x0bhi\x01§:Array;
      
      public var g:Array;
      
      public var §!g\x07§:Number;
      
      public var dt:Number;
      
      public var §\x0e\x122w\x03§:Array;
      
      public var §@\x11^F\x02§:Array;
      
      public var colors:Boolean;
      
      public var §f\x19iH\x01§:Number;
      
      public var cmax:int;
      
      public var cells:Array;
      
      public var §*=TH\x01§:Array;
      
      public var b:Array;
      
      public var §F9KP\x03§:Number;
      
      public var §/}%(\x02§:Number;
      
      public function §\x133vn\x02§(param1:Number = 0.0, param2:Number = 0.0, param3:Number = 10.0)
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         if(Boot.skip_constructor)
         {
            return;
         }
         width = param1;
         height = param2;
         res = param3;
         super();
         §!g\x07§ = 0.3;
         visc = 0.0001;
         dt = 1;
         §D\nls\x01§ = 10;
         §\x07\x05\\f\x02§ = false;
         §\x03\x01@'\x02§ = false;
         xmax = int(Math.ceil(param1 / param3));
         ymax = int(Math.ceil(param2 / param3));
         §\f}'^\x03§ = xmax + 2;
         §\x1c5\x1cp\x02§ = ymax + 2;
         u = [];
         v = [];
         §*i=X\x01§ = [];
         §qYE\b\x02§ = [];
         §@\x11^F\x02§ = [];
         §\x0e\x122w\x03§ = [];
         cmax = §\f}'^\x03§ * §\x1c5\x1cp\x02§;
         §\x05\x02=*§ = 1 / cmax;
         var _loc4_:int = 0;
         var _loc5_:int = cmax;
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc7_ = 0;
            §qYE\b\x02§[_loc6_] = _loc7_;
            _loc7_ = _loc7_;
            §*i=X\x01§[_loc6_] = _loc7_;
            _loc7_ = _loc7_;
            v[_loc6_] = _loc7_;
            u[_loc6_] = _loc7_;
            _loc7_ = 0;
            §\x0e\x122w\x03§[_loc6_] = _loc7_;
            §@\x11^F\x02§[_loc6_] = _loc7_;
         }
      }
      
      override public function update() : void
      {
         _iU7();
         §G}\x03s\x03§(§*i=X\x01§,§qYE\b\x02§);
         §\x07{{V\x03§();
         §*g\x13\x01\x02§(visc);
         project(u,v,§*i=X\x01§,§qYE\b\x02§);
         §\x07{{V\x03§();
         §\x17|4S§(1,u,§*i=X\x01§,§*i=X\x01§,§qYE\b\x02§);
         §\x17|4S§(2,v,§qYE\b\x02§,§*i=X\x01§,§qYE\b\x02§);
         project(u,v,§*i=X\x01§,§qYE\b\x02§);
         if(colors)
         {
            §{A[g\x01§();
            §e?L8§();
            if(§f\x19iH\x01§ != 0 && dt != 0)
            {
               §;\x04,I\x01§(§f\x19iH\x01§);
               §e?L8§();
            }
            §\bgJ\x16\x02§(u,v);
            §B\x124\x03\x01§();
         }
      }
      
      public function §\x07{{V\x03§() : void
      {
         var _loc1_:Array = u;
         u = §*i=X\x01§;
         §*i=X\x01§ = _loc1_;
         var _loc2_:Array = v;
         v = §qYE\b\x02§;
         §qYE\b\x02§ = _loc2_;
      }
      
      public function §e?L8§() : void
      {
         var _loc1_:Array = r;
         r = §\x14'z~\x01§;
         §\x14'z~\x01§ = _loc1_;
         var _loc2_:Array = g;
         g = §j\x0bhi\x01§;
         §j\x0bhi\x01§ = _loc2_;
         var _loc3_:Array = b;
         b = §*=TH\x01§;
         §*=TH\x01§ = _loc3_;
      }
      
      public function §\x14R|B§() : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(!§\x07\x05\\f\x02§ && !§\x03\x01@'\x02§)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = §\f}'^\x03§ - 0 * §\f}'^\x03§;
         if(§\x07\x05\\f\x02§)
         {
            _loc1_ = §\f}'^\x03§;
            _loc3_ = 1 + §\f}'^\x03§;
            _loc2_ = xmax + 1 + §\f}'^\x03§;
            _loc4_ = xmax + §\f}'^\x03§;
            _loc3_ = _loc3_ ^ _loc4_;
            _loc4_ = _loc4_ ^ _loc3_;
            _loc3_ = _loc3_ ^ _loc4_;
            _loc6_ = 0;
            _loc7_ = ymax;
            while(_loc6_ < _loc7_)
            {
               _loc6_++;
               _loc8_ = _loc6_;
               r[_loc1_] = Number(r[_loc3_]);
               g[_loc1_] = Number(g[_loc3_]);
               b[_loc1_] = Number(b[_loc3_]);
               _loc1_ = _loc1_ + _loc5_;
               _loc3_ = _loc3_ + _loc5_;
               r[_loc2_] = Number(r[_loc4_]);
               g[_loc2_] = Number(g[_loc4_]);
               b[_loc2_] = Number(b[_loc4_]);
               _loc2_ = _loc2_ + _loc5_;
               _loc4_ = _loc4_ + _loc5_;
            }
         }
         if(§\x03\x01@'\x02§)
         {
            _loc1_ = 1 + 0 * §\f}'^\x03§;
            _loc3_ = 1 + §\f}'^\x03§;
            _loc2_ = 1 + (ymax + 1) * §\f}'^\x03§;
            _loc4_ = 1 + ymax * §\f}'^\x03§;
            _loc3_ = _loc3_ ^ _loc4_;
            _loc4_ = _loc4_ ^ _loc3_;
            _loc3_ = _loc3_ ^ _loc4_;
            _loc6_ = 0;
            _loc7_ = xmax;
            while(_loc6_ < _loc7_)
            {
               _loc6_++;
               _loc8_ = _loc6_;
               r[_loc1_] = Number(r[_loc3_]);
               g[_loc1_] = Number(g[_loc3_]);
               b[_loc1_] = Number(b[_loc3_]);
               _loc1_++;
               _loc3_++;
               r[_loc2_] = Number(r[_loc4_]);
               g[_loc2_] = Number(g[_loc4_]);
               b[_loc2_] = Number(b[_loc4_]);
               _loc2_++;
               _loc4_++;
            }
         }
      }
      
      public function §V\x1f|[§(param1:int, param2:Array) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:int = §\f}'^\x03§ - 0 * §\f}'^\x03§;
         var _loc4_:int = §\f}'^\x03§;
         var _loc5_:int = 1 + §\f}'^\x03§;
         var _loc6_:int = xmax + 1 + §\f}'^\x03§;
         var _loc7_:int = xmax + §\f}'^\x03§;
         if(§\x07\x05\\f\x02§)
         {
            _loc5_ = _loc5_ ^ _loc7_;
            _loc7_ = _loc7_ ^ _loc5_;
            _loc5_ = _loc5_ ^ _loc7_;
         }
         if(param1 == 1 && !§\x07\x05\\f\x02§)
         {
            _loc8_ = 0;
            _loc9_ = ymax;
            while(_loc8_ < _loc9_)
            {
               _loc8_++;
               _loc10_ = _loc8_;
               param2[_loc4_] = -param2[_loc5_];
               _loc4_ = _loc4_ + _loc3_;
               _loc5_ = _loc5_ + _loc3_;
               param2[_loc6_] = -param2[_loc7_];
               _loc6_ = _loc6_ + _loc3_;
               _loc7_ = _loc7_ + _loc3_;
            }
         }
         else
         {
            _loc8_ = 0;
            _loc9_ = ymax;
            while(_loc8_ < _loc9_)
            {
               _loc8_++;
               _loc10_ = _loc8_;
               param2[_loc4_] = Number(param2[_loc5_]);
               _loc4_ = _loc4_ + _loc3_;
               _loc5_ = _loc5_ + _loc3_;
               param2[_loc6_] = Number(param2[_loc7_]);
               _loc6_ = _loc6_ + _loc3_;
               _loc7_ = _loc7_ + _loc3_;
            }
         }
         _loc4_ = 1 + 0 * §\f}'^\x03§;
         _loc5_ = 1 + §\f}'^\x03§;
         _loc6_ = 1 + (ymax + 1) * §\f}'^\x03§;
         _loc7_ = 1 + ymax * §\f}'^\x03§;
         if(§\x03\x01@'\x02§)
         {
            _loc5_ = _loc5_ ^ _loc7_;
            _loc7_ = _loc7_ ^ _loc5_;
            _loc5_ = _loc5_ ^ _loc7_;
         }
         if(param1 == 2 && !§\x03\x01@'\x02§)
         {
            _loc8_ = 0;
            _loc9_ = xmax;
            while(_loc8_ < _loc9_)
            {
               _loc8_++;
               _loc10_ = _loc8_;
               _loc4_++;
               _loc5_++;
               param2[_loc4_] = -param2[_loc5_];
               _loc6_++;
               _loc7_++;
               param2[_loc6_] = -param2[_loc7_];
            }
         }
         else
         {
            _loc8_ = 0;
            _loc9_ = xmax;
            while(_loc8_ < _loc9_)
            {
               _loc8_++;
               _loc10_ = _loc8_;
               _loc4_++;
               _loc5_++;
               param2[_loc4_] = Number(param2[_loc5_]);
               _loc6_++;
               _loc7_++;
               param2[_loc6_] = Number(param2[_loc7_]);
            }
         }
         param2[0 * §\f}'^\x03§] = 0.5 * (Number(param2[1 + 0 * §\f}'^\x03§]) + Number(param2[§\f}'^\x03§]));
         param2[(ymax + 1) * §\f}'^\x03§] = 0.5 * (Number(param2[1 + (ymax + 1) * §\f}'^\x03§]) + Number(param2[ymax * §\f}'^\x03§]));
         param2[xmax + 1 + 0 * §\f}'^\x03§] = 0.5 * (Number(param2[xmax + 0 * §\f}'^\x03§]) + Number(param2[xmax + 1 + §\f}'^\x03§]));
         param2[xmax + 1 + (ymax + 1) * §\f}'^\x03§] = 0.5 * (Number(param2[xmax + (ymax + 1) * §\f}'^\x03§]) + Number(param2[xmax + 1 + ymax * §\f}'^\x03§]));
      }
      
      public function project(param1:Array, param2:Array, param3:Array, param4:Array) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = -0.5 / xmax;
         _loc5_ = 1 + §\f}'^\x03§;
         var _loc7_:int = 0;
         var _loc8_:int = ymax;
         while(_loc7_ < _loc8_)
         {
            _loc7_++;
            _loc9_ = _loc7_;
            _loc10_ = 0;
            _loc11_ = xmax;
            while(_loc10_ < _loc11_)
            {
               _loc10_++;
               _loc12_ = _loc10_;
               param4[_loc5_] = _loc6_ * (param1[_loc5_ + 1] - param1[_loc5_ - 1] + Number(param2[_loc5_ + §\f}'^\x03§]) - param2[_loc5_ - §\f}'^\x03§]);
               param3[_loc5_] = 0;
               _loc5_++;
            }
            _loc5_ = _loc5_ + 2;
         }
         §V\x1f|[§(0,param4);
         §V\x1f|[§(0,param3);
         §\x03gsj\x03§(0,param3,param4,1,4);
         var _loc13_:Number = 0.5 * xmax;
         var _loc14_:Number = 0.5 * ymax;
         _loc5_ = 1 + §\f}'^\x03§;
         _loc7_ = 0;
         _loc8_ = ymax;
         while(_loc7_ < _loc8_)
         {
            _loc7_++;
            _loc9_ = _loc7_;
            _loc10_ = 0;
            _loc11_ = xmax;
            while(_loc10_ < _loc11_)
            {
               _loc10_++;
               _loc12_ = _loc10_;
               param1[_loc5_] = param1[_loc5_] - _loc13_ * (param3[_loc5_ + 1] - param3[_loc5_ - 1]);
               param2[_loc5_] = param2[_loc5_] - _loc14_ * (param3[_loc5_ + §\f}'^\x03§] - param3[_loc5_ - §\f}'^\x03§]);
               _loc5_++;
            }
            _loc5_ = _loc5_ + 2;
         }
         §V\x1f|[§(1,param1);
         §V\x1f|[§(2,param2);
      }
      
      public function §w74*\x01§(param1:Number, param2:Number) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc3_:int = 0;
         param2 = 1 / param2;
         var _loc4_:int = 0;
         var _loc5_:int = §D\nls\x01§;
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc3_ = 1 + §\f}'^\x03§;
            _loc7_ = 0;
            _loc8_ = ymax;
            while(_loc7_ < _loc8_)
            {
               _loc7_++;
               _loc9_ = _loc7_;
               _loc10_ = 0;
               _loc11_ = xmax;
               while(_loc10_ < _loc11_)
               {
                  _loc10_++;
                  _loc12_ = _loc10_;
                  u[_loc3_] = ((Number(Number(Number(u[_loc3_ - 1]) + Number(u[_loc3_ + 1])) + Number(u[_loc3_ - §\f}'^\x03§])) + Number(u[_loc3_ + §\f}'^\x03§])) * param1 + Number(§*i=X\x01§[_loc3_])) * param2;
                  v[_loc3_] = ((Number(Number(Number(v[_loc3_ - 1]) + Number(v[_loc3_ + 1])) + Number(v[_loc3_ - §\f}'^\x03§])) + Number(v[_loc3_ + §\f}'^\x03§])) * param1 + Number(§qYE\b\x02§[_loc3_])) * param2;
                  _loc3_++;
               }
               _loc3_ = _loc3_ + 2;
            }
            §V\x1f|[§(1,u);
            §V\x1f|[§(2,v);
         }
      }
      
      public function §fIFQ\x03§(param1:Number, param2:Number) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc3_:int = 0;
         param2 = 1 / param2;
         var _loc4_:int = 0;
         var _loc5_:int = §D\nls\x01§;
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc7_ = 0;
            _loc8_ = ymax;
            while(_loc7_ < _loc8_)
            {
               _loc7_++;
               _loc9_ = _loc7_;
               _loc10_ = 0;
               _loc11_ = xmax;
               while(_loc10_ < _loc11_)
               {
                  _loc10_++;
                  _loc12_ = _loc10_;
                  _loc3_ = _loc12_ + 1 + (_loc9_ + 1) * §\f}'^\x03§;
                  r[_loc3_] = ((Number(Number(Number(r[_loc3_ - 1]) + Number(r[_loc3_ + 1])) + Number(r[_loc3_ - §\f}'^\x03§])) + Number(r[_loc3_ + §\f}'^\x03§])) * param1 + Number(§\x14'z~\x01§[_loc3_])) * param2;
                  g[_loc3_] = ((Number(Number(Number(g[_loc3_ - 1]) + Number(g[_loc3_ + 1])) + Number(g[_loc3_ - §\f}'^\x03§])) + Number(g[_loc3_ + §\f}'^\x03§])) * param1 + Number(§j\x0bhi\x01§[_loc3_])) * param2;
                  b[_loc3_] = ((Number(Number(Number(b[_loc3_ - 1]) + Number(b[_loc3_ + 1])) + Number(b[_loc3_ - §\f}'^\x03§])) + Number(b[_loc3_ + §\f}'^\x03§])) * param1 + Number(§*=TH\x01§[_loc3_])) * param2;
               }
            }
            §V\x1f|[§(1,u);
            §V\x1f|[§(2,v);
         }
      }
      
      public function §\x03gsj\x03§(param1:int, param2:Array, param3:Array, param4:Number, param5:Number) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc6_:int = 0;
         if(param4 == 1 && param5 == 4)
         {
            _loc7_ = 0;
            _loc8_ = §D\nls\x01§;
            while(_loc7_ < _loc8_)
            {
               _loc7_++;
               _loc9_ = _loc7_;
               _loc6_ = 1 + §\f}'^\x03§;
               _loc10_ = 0;
               _loc11_ = ymax;
               while(_loc10_ < _loc11_)
               {
                  _loc10_++;
                  _loc12_ = _loc10_;
                  _loc13_ = 0;
                  _loc14_ = xmax;
                  while(_loc13_ < _loc14_)
                  {
                     _loc13_++;
                     _loc15_ = _loc13_;
                     param2[_loc6_] = (Number(Number(Number(Number(param2[_loc6_ - 1]) + Number(param2[_loc6_ + 1])) + Number(param2[_loc6_ - §\f}'^\x03§])) + Number(param2[_loc6_ + §\f}'^\x03§])) + Number(param3[_loc6_])) * 0.25;
                     _loc6_++;
                  }
                  _loc6_ = _loc6_ + 2;
               }
               §V\x1f|[§(param1,param2);
            }
         }
         else
         {
            param5 = 1 / param5;
            _loc7_ = 0;
            _loc8_ = §D\nls\x01§;
            while(_loc7_ < _loc8_)
            {
               _loc7_++;
               _loc9_ = _loc7_;
               _loc6_ = 1 + §\f}'^\x03§;
               _loc10_ = 0;
               _loc11_ = ymax;
               while(_loc10_ < _loc11_)
               {
                  _loc10_++;
                  _loc12_ = _loc10_;
                  _loc13_ = 0;
                  _loc14_ = xmax;
                  while(_loc13_ < _loc14_)
                  {
                     _loc13_++;
                     _loc15_ = _loc13_;
                     param2[_loc6_] = ((Number(Number(Number(param2[_loc6_ - 1]) + Number(param2[_loc6_ + 1])) + Number(param2[_loc6_ - §\f}'^\x03§])) + Number(param2[_loc6_ + §\f}'^\x03§])) * param4 + Number(param3[_loc6_])) * param5;
                     _loc6_++;
                  }
                  _loc6_ = _loc6_ + 2;
               }
               §V\x1f|[§(param1,param2);
            }
         }
      }
      
      public function §\x17LD2\x02§(param1:Number = 0.0) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         colors = true;
         §f\x19iH\x01§ = param1;
         r = [];
         g = [];
         b = [];
         §\x14'z~\x01§ = [];
         §j\x0bhi\x01§ = [];
         §*=TH\x01§ = [];
         var _loc2_:int = 0;
         var _loc3_:int = cmax;
         while(_loc2_ < _loc3_)
         {
            _loc2_++;
            _loc4_ = _loc2_;
            _loc5_ = 0;
            §*=TH\x01§[_loc4_] = _loc5_;
            _loc5_ = _loc5_;
            §j\x0bhi\x01§[_loc4_] = _loc5_;
            _loc5_ = _loc5_;
            §\x14'z~\x01§[_loc4_] = _loc5_;
            _loc5_ = _loc5_;
            b[_loc4_] = _loc5_;
            _loc5_ = _loc5_;
            g[_loc4_] = _loc5_;
            r[_loc4_] = _loc5_;
         }
      }
      
      public function §\x1fC*r\x03§(param1:int, param2:int) : int
      {
         return param1 + param2 * §\f}'^\x03§;
      }
      
      public function §\x1frk{\x01§(param1:Number, param2:Number) : Object
      {
         var _loc3_:int = int(param1 / res) + 1 + (int(param2 / res) + 1) * §\f}'^\x03§;
         if(_loc3_ < 0 || _loc3_ >= cmax)
         {
            return null;
         }
         return {
            "x":Number(u[_loc3_]),
            "y":Number(v[_loc3_])
         };
      }
      
      public function §B\x124\x03\x01§() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc1_:Number = 1 - §!g\x07§;
         §/}%(\x02§ = 0;
         §F9KP\x03§ = 0;
         var _loc2_:Number = 0;
         var _loc8_:int = cmax;
         while(true)
         {
            _loc8_--;
            if(_loc8_ <= -1)
            {
               break;
            }
            _loc9_ = 0;
            §qYE\b\x02§[_loc8_] = _loc9_;
            §*i=X\x01§[_loc8_] = _loc9_;
            §\x14'z~\x01§[_loc8_] = 0;
            _loc9_ = 0;
            §*=TH\x01§[_loc8_] = _loc9_;
            §j\x0bhi\x01§[_loc8_] = _loc9_;
            §F9KP\x03§ = Number(§F9KP\x03§ + (Number(u[_loc8_] * u[_loc8_] + v[_loc8_] * v[_loc8_])));
            _loc5_ = Number(Math.min(1,Number(r[_loc8_])));
            _loc6_ = Number(Math.min(1,Number(g[_loc8_])));
            _loc7_ = Number(Math.min(1,Number(b[_loc8_])));
            _loc4_ = Number(Math.max(_loc5_,Number(Math.max(_loc6_,_loc7_))));
            §/}%(\x02§ = Number(§/}%(\x02§ + _loc4_);
            _loc3_ = _loc4_ - §/}%(\x02§;
            _loc2_ = Number(_loc2_ + _loc3_ * _loc3_);
            r[_loc8_] = _loc5_ * _loc1_;
            g[_loc8_] = _loc6_ * _loc1_;
            b[_loc8_] = _loc7_ * _loc1_;
         }
         §/}%(\x02§ = §/}%(\x02§ * §\x05\x02=*§;
         §F9KP\x03§ = §F9KP\x03§ * §\x05\x02=*§;
         uniformity = 1 / (Number(1 + _loc2_ * §\x05\x02=*§));
      }
      
      public function §d]j\n§() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:Number = 1 - §!g\x07§;
         §/}%(\x02§ = 0;
         §F9KP\x03§ = 0;
         var _loc2_:Number = 0;
         var _loc5_:int = cmax;
         while(true)
         {
            _loc5_--;
            if(_loc5_ <= -1)
            {
               break;
            }
            _loc6_ = 0;
            §qYE\b\x02§[_loc5_] = _loc6_;
            §*i=X\x01§[_loc5_] = _loc6_;
            §\x14'z~\x01§[_loc5_] = 0;
            §F9KP\x03§ = Number(§F9KP\x03§ + (Number(u[_loc5_] * u[_loc5_] + v[_loc5_] * v[_loc5_])));
            _loc4_ = Number(Math.min(1,Number(r[_loc5_])));
            §/}%(\x02§ = Number(§/}%(\x02§ + _loc4_);
            _loc3_ = _loc4_ - §/}%(\x02§;
            _loc2_ = Number(_loc2_ + _loc3_ * _loc3_);
            r[_loc5_] = _loc4_ * _loc1_;
         }
         §/}%(\x02§ = §/}%(\x02§ * §\x05\x02=*§;
         uniformity = 1 / (Number(1 + _loc2_ * §\x05\x02=*§));
      }
      
      public function §fTL \x03§(param1:BitmapData) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:int = 255;
         param1.lock();
         var _loc3_:int = 0;
         var _loc4_:int = xmax;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            _loc6_ = 0;
            _loc7_ = ymax;
            while(_loc6_ < _loc7_)
            {
               _loc6_++;
               _loc8_ = _loc6_;
               _loc9_ = _loc5_ + 1 + (_loc8_ + 1) * §\f}'^\x03§;
               _loc10_ = int(r[_loc9_] * _loc2_) << 16 | int(g[_loc9_] * _loc2_) << 8 | int(b[_loc9_] * _loc2_);
               param1.setPixel(_loc5_,_loc8_,_loc10_);
            }
         }
         param1.unlock();
         param1.applyFilter(param1,param1.rect,new Point(0,0),new BlurFilter(2,2,2));
      }
      
      public function §*g\x13\x01\x02§(param1:Number) : void
      {
         var _loc2_:Number = dt * param1 * xmax * ymax;
         §w74*\x01§(_loc2_,Number(1 + 4 * _loc2_));
      }
      
      public function §;\x04,I\x01§(param1:Number) : void
      {
         var _loc2_:Number = dt * param1 * xmax * ymax;
         §fIFQ\x03§(_loc2_,Number(1 + 4 * _loc2_));
      }
      
      public function §hRU\x1f\x03§(param1:int) : void
      {
         if(param1 < 0 || param1 >= cmax)
         {
            Log.trace("error index:" + param1,{
               "fileName":"FluidCanvas.hx",
               "lineNumber":680,
               "className":"mt.fx.FluidCanvas",
               "methodName":"checkIndex"
            });
         }
      }
      
      public function §G}\x03s\x03§(param1:Array, param2:Array) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = 0;
         _loc6_ = 1 + §\f}'^\x03§;
         var _loc8_:int = 0;
         var _loc9_:int = ymax;
         while(_loc8_ < _loc9_)
         {
            _loc8_++;
            _loc10_ = _loc8_;
            _loc11_ = 0;
            _loc12_ = xmax;
            while(_loc11_ < _loc12_)
            {
               _loc11_++;
               _loc13_ = _loc11_;
               _loc4_ = u[int(_loc6_ + §\f}'^\x03§)] - u[int(_loc6_ - §\f}'^\x03§)];
               _loc3_ = v[int(_loc6_ + 1)] - v[int(_loc6_ - 1)];
               _loc7_ = (_loc4_ - _loc3_) * 0.5;
               §\x0e\x122w\x03§[_loc6_] = _loc7_;
               §@\x11^F\x02§[_loc6_] = _loc7_ < 0?-_loc7_:_loc7_;
               _loc6_++;
            }
            _loc6_ = _loc6_ + 2;
         }
         _loc8_ = 0;
         _loc9_ = ymax - 2;
         while(_loc8_ < _loc9_)
         {
            _loc8_++;
            _loc10_ = _loc8_;
            _loc11_ = 0;
            _loc12_ = xmax - 2;
            while(_loc11_ < _loc12_)
            {
               _loc11_++;
               _loc13_ = _loc11_;
               _loc6_ = _loc13_ + 2 + (_loc10_ + 2) * §\f}'^\x03§;
               _loc3_ = §@\x11^F\x02§[int(_loc6_ + 1)] - §@\x11^F\x02§[int(_loc6_ - 1)];
               _loc4_ = §@\x11^F\x02§[int(_loc6_ + §\f}'^\x03§)] - §@\x11^F\x02§[int(_loc6_ - §\f}'^\x03§)];
               _loc5_ = Number(Number(Math.sqrt(Number(_loc3_ * _loc3_ + _loc4_ * _loc4_))) + 1.0e-6);
               _loc5_ = 2 / _loc5_;
               _loc3_ = _loc3_ * _loc5_;
               _loc4_ = _loc4_ * _loc5_;
               _loc7_ = Number(§\x0e\x122w\x03§[_loc6_]);
               param1[_loc6_] = _loc4_ * -_loc7_;
               param2[_loc6_] = _loc3_ * _loc7_;
            }
         }
      }
      
      public function §\bgJ\x16\x02§(param1:Array, param2:Array) : void
      {
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         var _loc14_:Number = dt * xmax;
         var _loc15_:Number = dt * ymax;
         var _loc16_:int = 0;
         var _loc17_:int = ymax;
         while(_loc16_ < _loc17_)
         {
            _loc16_++;
            _loc18_ = _loc16_;
            _loc19_ = 0;
            _loc20_ = xmax;
            while(_loc19_ < _loc20_)
            {
               _loc19_++;
               _loc21_ = _loc19_;
               _loc7_ = _loc21_ + 1 + (_loc18_ + 1) * §\f}'^\x03§;
               _loc8_ = _loc21_ + 1 - _loc14_ * param1[_loc7_];
               _loc9_ = _loc18_ + 1 - _loc15_ * param2[_loc7_];
               if(_loc8_ > Number(xmax + 0.5))
               {
                  _loc8_ = Number(xmax + 0.5);
               }
               if(_loc8_ < 0.5)
               {
                  _loc8_ = 0.5;
               }
               _loc3_ = int(_loc8_);
               if(_loc9_ > Number(ymax + 0.5))
               {
                  _loc9_ = Number(ymax + 0.5);
               }
               if(_loc9_ < 0.5)
               {
                  _loc9_ = 0.5;
               }
               _loc4_ = int(_loc9_);
               _loc12_ = _loc8_ - _loc3_;
               _loc10_ = 1 - _loc12_;
               _loc13_ = _loc9_ - _loc4_;
               _loc11_ = 1 - _loc13_;
               _loc22_ = _loc3_;
               _loc3_ = _loc22_ + _loc4_ * §\f}'^\x03§;
               _loc4_ = int(_loc3_ + §\f}'^\x03§);
               r[_loc7_] = Number(_loc10_ * (_loc11_ * §\x14'z~\x01§[_loc3_] + _loc13_ * §\x14'z~\x01§[_loc4_]) + _loc12_ * (_loc11_ * §\x14'z~\x01§[int(int(_loc3_ + 1))] + _loc13_ * §\x14'z~\x01§[int(_loc4_ + 1)]));
               g[_loc7_] = Number(_loc10_ * (_loc11_ * §j\x0bhi\x01§[_loc3_] + _loc13_ * §j\x0bhi\x01§[_loc4_]) + _loc12_ * (_loc11_ * §j\x0bhi\x01§[int(int(_loc3_ + 1))] + _loc13_ * §j\x0bhi\x01§[int(_loc4_ + 1)]));
               b[_loc7_] = Number(_loc10_ * (_loc11_ * §*=TH\x01§[_loc3_] + _loc13_ * §*=TH\x01§[_loc4_]) + _loc12_ * (_loc11_ * §*=TH\x01§[int(int(_loc3_ + 1))] + _loc13_ * §*=TH\x01§[int(_loc4_ + 1)]));
            }
         }
         §\x14R|B§();
      }
      
      public function §\x17|4S§(param1:int, param2:Array, param3:Array, param4:Array, param5:Array) : void
      {
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         var _loc14_:Number = 0;
         var _loc15_:Number = 0;
         var _loc16_:Number = 0;
         var _loc17_:Number = dt * xmax;
         var _loc18_:Number = dt * ymax;
         _loc10_ = 1 + §\f}'^\x03§;
         var _loc19_:int = 0;
         var _loc20_:int = ymax;
         while(_loc19_ < _loc20_)
         {
            _loc19_++;
            _loc21_ = _loc19_;
            _loc22_ = 0;
            _loc23_ = xmax;
            while(_loc22_ < _loc23_)
            {
               _loc22_++;
               _loc24_ = _loc22_;
               _loc11_ = _loc24_ + 1 - _loc17_ * param4[_loc10_];
               _loc12_ = _loc21_ + 1 - _loc18_ * param5[_loc10_];
               if(_loc11_ > Number(xmax + 0.5))
               {
                  _loc11_ = Number(xmax + 0.5);
               }
               if(_loc11_ < 0.5)
               {
                  _loc11_ = 0.5;
               }
               _loc6_ = int(_loc11_);
               _loc8_ = _loc6_ + 1;
               if(_loc12_ > Number(ymax + 0.5))
               {
                  _loc12_ = Number(ymax + 0.5);
               }
               if(_loc12_ < 0.5)
               {
                  _loc12_ = 0.5;
               }
               _loc7_ = int(_loc12_);
               _loc9_ = _loc7_ + 1;
               _loc15_ = _loc11_ - _loc6_;
               _loc13_ = 1 - _loc15_;
               _loc16_ = _loc12_ - _loc7_;
               _loc14_ = 1 - _loc16_;
               param2[_loc10_] = Number(_loc13_ * (_loc14_ * param3[_loc6_ + _loc7_ * §\f}'^\x03§] + _loc16_ * param3[_loc6_ + _loc9_ * §\f}'^\x03§]) + _loc15_ * (_loc14_ * param3[_loc8_ + _loc7_ * §\f}'^\x03§] + _loc16_ * param3[_loc8_ + _loc9_ * §\f}'^\x03§]));
               _loc10_++;
            }
            _loc10_ = _loc10_ + 2;
         }
         §V\x1f|[§(param1,param2);
      }
      
      public function _iU7() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc1_:int = 0;
         var _loc2_:int = cmax;
         while(_loc1_ < _loc2_)
         {
            _loc1_++;
            _loc3_ = _loc1_;
            _loc4_ = u;
            _loc4_[_loc3_] = Number(_loc4_[_loc3_] + §*i=X\x01§[_loc3_] * dt);
            _loc4_ = v;
            _loc4_[_loc3_] = Number(_loc4_[_loc3_] + §qYE\b\x02§[_loc3_] * dt);
         }
      }
      
      public function §{A[g\x01§() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc1_:int = 0;
         var _loc2_:int = cmax;
         while(_loc1_ < _loc2_)
         {
            _loc1_++;
            _loc3_ = _loc1_;
            _loc4_ = r;
            _loc4_[_loc3_] = Number(_loc4_[_loc3_] + dt * §\x14'z~\x01§[_loc3_]);
            _loc4_ = g;
            _loc4_[_loc3_] = Number(_loc4_[_loc3_] + dt * §j\x0bhi\x01§[_loc3_]);
            _loc4_ = b;
            _loc4_[_loc3_] = Number(_loc4_[_loc3_] + dt * §*=TH\x01§[_loc3_]);
         }
      }
      
      public function §\x04C5i\x01§(param1:Array, param2:Array) : void
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = cmax;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            param1[_loc5_] = Number(param1[_loc5_] + dt * param2[_loc5_]);
         }
      }
      
      public function §A;D\x0f\x01§(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:int = int(param1 / res) + 1 + (int(param2 / res) + 1) * §\f}'^\x03§;
         if(_loc5_ < 0 || _loc5_ >= cmax)
         {
            return;
         }
         var _loc6_:Array = §*i=X\x01§;
         _loc6_[_loc5_] = Number(_loc6_[_loc5_] + param3);
         _loc6_ = §qYE\b\x02§;
         _loc6_[_loc5_] = Number(_loc6_[_loc5_] + param4);
      }
      
      public function §+\x0f\x06D§(param1:Number, param2:Number, param3:int) : void
      {
         var _loc4_:int = int(param1 / res) + 1 + (int(param2 / res) + 1) * §\f}'^\x03§;
         if(_loc4_ < 0 || _loc4_ >= cmax)
         {
            return;
         }
         var _loc5_:* = Col._x_setRGBValues(param3);
         var _loc6_:Number = 1 / 255;
         var _loc7_:Array = §\x14'z~\x01§;
         _loc7_[_loc4_] = Number(_loc7_[_loc4_] + int(_loc5_.r) * _loc6_);
         _loc7_ = §j\x0bhi\x01§;
         _loc7_[_loc4_] = Number(_loc7_[_loc4_] + int(_loc5_.g) * _loc6_);
         _loc7_ = §*=TH\x01§;
         _loc7_[_loc4_] = Number(_loc7_[_loc4_] + int(_loc5_.b) * _loc6_);
      }
   }
}
