package browser
{
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import mt.bumdum9.Filt;
   import mt.bumdum9.Tween;
   import pix.Element;
   import pix.Frame;
   
   public class §0\x1atr\x02§ extends Element
   {
      
      public static var §;\x057\x02§:int = 76;
      
      public static var HEIGHT:int = 62;
      
      public static var SPEED:int = 16;
       
      
      public var tween:Tween;
      
      public var spc:Number;
      
      public var ready:Boolean;
      
      public var play:TextField;
      
      public var over:Boolean;
      
      public var field:TextField;
      
      public var desc:TextField;
      
      public var coef:Number;
      
      public function §0\x1atr\x02§()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         Browser.me.dm.add(this,2);
         x = (Cs.mcw - §0\x1atr\x02§.§;\x057\x02§) * 0.5;
         y = int(Browser.me.§\x05\x1fxE§());
         var _loc1_:TextField = Cs.getField(16759739,8,-1,"nokia");
         addChild(_loc1_);
         _loc1_.wordWrap = true;
         _loc1_.multiline = true;
         _loc1_.x = 1;
         _loc1_.y = 3;
         _loc1_.text = Lang.§*\tK\x0e\x01§;
         _loc1_.width = §0\x1atr\x02§.§;\x057\x02§ - 1;
         _loc1_.height = 32;
         _loc1_.filters = [new GlowFilter(Gfx.col("red_1"),1,2,2,40)];
         desc = _loc1_;
         var _loc2_:TextField = Cs.getField(Gfx.col("green_2"),16,-1,"nokia");
         addChild(_loc2_);
         _loc2_.y = 17;
         _loc2_.text = Lang.PLAY;
         _loc2_.width = Number(_loc2_.textWidth + 3);
         _loc2_.x = int((§0\x1atr\x02§.§;\x057\x02§ - _loc2_.width) * 0.5);
         _loc2_.filters = [new GlowFilter(Gfx.col("green_0"),1,4,4,40)];
         play = _loc2_;
         var _loc3_:TextField = Cs.getField(16759739,40,0,"upheavel");
         addChild(_loc3_);
         _loc3_.y = 12;
         _loc3_.text = "6";
         _loc3_.width = §0\x1atr\x02§.§;\x057\x02§;
         var _loc4_:TextFormat = _loc3_.getTextFormat();
         field = _loc3_;
         ready = true;
         §F'\x0ea\x01§(false);
         setValue(6);
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         if(tween != null)
         {
            coef = Number(Math.min(Number(coef + spc),1));
            _loc1_ = tween.getPos(coef);
            x = Number(_loc1_.x);
            y = Number(_loc1_.y);
            if(coef == 1)
            {
               tween = null;
            }
         }
         var _loc2_:Number = (mouseX - x) * 0.5;
         var _loc3_:Number = (mouseY - y) * 0.5;
         over = _loc2_ > 0 && _loc2_ < §0\x1atr\x02§.§;\x057\x02§ && _loc3_ > 0 && _loc3_ < §0\x1atr\x02§.HEIGHT;
         if(ready)
         {
            filters = [];
            blendMode = BlendMode.NORMAL;
            alpha = 1;
            if(over)
            {
               blendMode = BlendMode.ADD;
               alpha = 0.6;
               Filt.glow(this,8,1,16777215);
            }
         }
      }
      
      public function setValue(param1:int) : void
      {
         desc.text = Lang.§*\tK\x0e\x01§;
         var _loc2_:Array = [0,1,0,0,80,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0];
         filters = [new ColorMatrixFilter(_loc2_)];
         if(param1 < 0)
         {
            param1 = param1 * -1;
            desc.text = Lang.§[DhN§;
            filters = [];
         }
         var _loc3_:String = Std.string(param1);
         field.text = _loc3_;
         desc.x = int((§0\x1atr\x02§.§;\x057\x02§ - desc.textWidth) * 0.5);
         desc.y = 10 - int(desc.textHeight * 0.5);
      }
      
      public function §F'\x0ea\x01§(param1:Boolean) : void
      {
         if(param1 == ready)
         {
            return;
         }
         ready = param1;
         drawFrame(Gfx.main.get(!!ready?1:0,"mojo"),0,0);
         field.visible = !ready;
         desc.visible = !ready;
         play.visible = ready;
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = param1 - x;
         var _loc4_:Number = param2 - y;
         var _loc5_:Number = Number(Math.sqrt(Number(_loc3_ * _loc3_ + _loc4_ * _loc4_)));
         tween = new Tween(x,y,param1,param2);
         coef = 0;
         spc = §0\x1atr\x02§.SPEED / _loc5_;
      }
      
      public function majPos() : void
      {
         var _loc1_:int = int(Browser.me.§\x02zI\x1c\x01§());
         var _loc2_:int = 3;
         var _loc3_:int = _loc1_ * Card.§;\x057\x02§ + (_loc1_ - 1) * _loc2_ + §0\x1atr\x02§.§;\x057\x02§;
         var _loc4_:int = int((Cs.mcw - _loc3_) * 0.5);
         moveTo(_loc4_,int(Browser.me.§\x05\x1fxE§()));
      }
      
      public function §E\bD\x07\x02§() : Boolean
      {
         return !!ready && over;
      }
   }
}
