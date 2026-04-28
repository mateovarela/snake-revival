package fx
{
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.filters.BlurFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import mt.bumdum9.Col;
   import mt.bumdum9.Filt;
   import mt.bumdum9.Num;
   import mt.fx.§\x133vn\x02§;
   
   public class Fluid extends §\x12\bHb\x03§
   {
       
      
      public var ww:int;
      
      public var screen:BitmapData;
      
      public var res:Number;
      
      public var parts:Array;
      
      public var mcScreen:Bitmap;
      
      public var hh:int;
      
      public var dec:Number;
      
      public var canvas:§\x133vn\x02§;
      
      public var bmp:BitmapData;
      
      public function Fluid(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         ww = Stage.me.width;
         hh = Stage.me.height;
         res = 12;
         dec = 0;
         parts = [];
         canvas = new §\x133vn\x02§(ww,hh,res);
         canvas.§!g\x07§ = 0.01;
         canvas.visc = 0.0001;
         screen = new BitmapData(ww,hh,true,0);
         mcScreen = new Bitmap(screen);
         Stage.me.dm.add(mcScreen,Stage.§l\x10|-\x02§);
         mcScreen.blendMode = BlendMode.ADD;
         Filt.glow(mcScreen,8,1,16777215);
      }
      
      override public function vanish() : void
      {
         sn = null;
         mcScreen.parent.removeChild(mcScreen);
         screen.dispose();
         super.vanish();
      }
      
      override public function update() : void
      {
         var _loc9_:* = null as Part;
         var _loc10_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         super.update();
         if(sn == null)
         {
            return;
         }
         if(sn.dead)
         {
            vanish();
            return;
         }
         var _loc1_:Number = 0.1;
         var _loc2_:Number = -§\x19\n\t\x01§.cos(sn.angle) * sn.§|\x01P \x02§ * _loc1_;
         var _loc3_:Number = -§\x19\n\t\x01§.sin(sn.angle) * sn.§|\x01P \x02§ * _loc1_;
         canvas.§A;D\x0f\x01§(sn.x,sn.y,_loc2_,_loc3_);
         dec = (dec + 0.05) % 1;
         var _loc4_:int = 6;
         var _loc5_:* = §uqN\x01§();
         _loc5_.x = Number(sn.x + (Math.random() * 2 - 1) * _loc4_);
         _loc5_.y = Number(sn.y + (Math.random() * 2 - 1) * _loc4_);
         var _loc6_:Number = 30;
         var _loc7_:int = 0;
         var _loc8_:Array = Game.me.parts;
         while(_loc7_ < int(_loc8_.length))
         {
            _loc9_ = _loc8_[_loc7_];
            _loc7_++;
            _loc10_ = canvas.§\x1frk{\x01§(_loc9_.x,_loc9_.y);
            _loc9_.x = Number(_loc9_.x + _loc10_.x * _loc6_);
            _loc9_.y = Number(_loc9_.y + _loc10_.y * _loc6_);
         }
         _loc7_ = 100;
         var _loc11_:Number = 0.5;
         _loc8_ = parts.copy();
         var _loc12_:int = 0;
         var _loc13_:Array = parts;
         while(_loc12_ < int(_loc13_.length))
         {
            _loc10_ = _loc13_[_loc12_];
            _loc12_++;
            _loc14_ = canvas.§\x1frk{\x01§(Number(_loc10_.x),Number(_loc10_.y));
            _loc10_.vx = Number(_loc14_.x * _loc7_ * _loc10_.§1\x01§ + _loc10_.vx * _loc11_);
            _loc10_.vy = Number(_loc14_.y * _loc7_ * _loc10_.§1\x01§ + _loc10_.vy * _loc11_);
            _loc10_.x = Number(Number(_loc10_.x) + Number(_loc10_.vx));
            _loc10_.y = Number(Number(_loc10_.y) + Number(_loc10_.vy));
            if(Number(_loc10_.x) > 0 || Number(_loc10_.x) < ww)
            {
               _loc10_.x = Number(Num.mm(0,Number(_loc10_.x),ww));
               _loc10_.vx = _loc10_.vx * -1;
            }
            if(Number(_loc10_.y) > 0 || Number(_loc10_.y) < hh)
            {
               _loc10_.y = Number(Num.mm(0,Number(_loc10_.y),hh));
               _loc10_.vy = _loc10_.vy * -1;
            }
            screen.setPixel32(int(Number(_loc10_.x)),int(Number(_loc10_.y)),int(_loc10_.col));
            _loc15_ = int(_loc10_.t);
            _loc10_.t = int(_loc10_.t) - 1;
            if(_loc15_ <= 0)
            {
               parts.remove(_loc10_);
            }
         }
         var _loc16_:ColorTransform = new ColorTransform(1,1,1,1,0,0,0,-100);
         screen.colorTransform(screen.rect,_loc16_);
      }
      
      public function §%'{\x07\x03§() : void
      {
         canvas.§fTL \x03§(bmp);
         var _loc1_:Matrix = new Matrix();
         _loc1_.scale(res,res);
         screen.draw(bmp,_loc1_,null,BlendMode.ADD);
         var _loc2_:ColorTransform = new ColorTransform(1,1,1,1,0,0,0,-50);
         screen.colorTransform(screen.rect,_loc2_);
         screen.applyFilter(screen,screen.rect,new Point(0,0),new BlurFilter(2,2,2));
      }
      
      public function §uqN\x01§() : Object
      {
         var _loc1_:int = int(Col.getRainbow2(dec)) + -16777216;
         var _loc2_:* = {
            "x":0,
            "y":0,
            "vx":0,
            "vy":0,
            "1\x01":Number(0.5 + Math.random() * 0.5),
            "t":300,
            "col":_loc1_
         };
         parts.push(_loc2_);
         return _loc2_;
      }
   }
}
