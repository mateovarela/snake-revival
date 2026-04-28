package §q'2§
{
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class §=\x1a5%\x01§ extends Sprite
   {
      
      public static var §;\x057\x02§:int = 60;
      
      public static var HEIGHT:int = 12;
       
      
      public var selected:Boolean;
      
      public var light:Sprite;
      
      public var id:int;
      
      public function §=\x1a5%\x01§(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         id = param1;
         super();
         selected = false;
         var _loc2_:Graphics = graphics;
         _loc2_.beginFill(16777215);
         _loc2_.drawRect(0,0,§=\x1a5%\x01§.§;\x057\x02§,§=\x1a5%\x01§.HEIGHT);
         var _loc3_:int = 1;
         _loc2_.beginFill(Gfx.col("red_0"));
         _loc2_.drawRect(_loc3_,_loc3_,§=\x1a5%\x01§.§;\x057\x02§ - 2 * _loc3_,§=\x1a5%\x01§.HEIGHT - 2 * _loc3_);
         var _loc4_:TextField = §\x19\n\t\x01§.getField(16777215,8,-1,"nokia");
         _loc4_.text = Lang.§\x13o'\x1c\x02§[param1];
         _loc4_.y = -1;
         _loc4_.width = Number(_loc4_.textWidth + 3);
         _loc4_.x = int((§=\x1a5%\x01§.§;\x057\x02§ - _loc4_.width) * 0.5);
         _loc4_.blendMode = BlendMode.OVERLAY;
         addChild(_loc4_);
         var _loc5_:int = 2;
         light = new Sprite();
         light.graphics.lineStyle(2,16777215,1);
         light.graphics.beginFill(16777215);
         light.graphics.drawRect(-_loc5_,-_loc5_,§=\x1a5%\x01§.§;\x057\x02§ + 2 * _loc5_,§=\x1a5%\x01§.HEIGHT + 2 * _loc5_);
         light.alpha = 0.25;
         light.blendMode = BlendMode.ADD;
         light.visible = false;
         addChild(light);
      }
      
      public function update() : void
      {
         var _loc1_:Number = (mouseX - x) * 0.5;
         var _loc2_:Number = (mouseY - y) * 0.5;
         var _loc3_:Boolean = _loc1_ > 0 && _loc1_ < §=\x1a5%\x01§.§;\x057\x02§ && _loc2_ > 0 && _loc2_ < §=\x1a5%\x01§.HEIGHT;
         if(!!_loc3_ && !selected)
         {
            select();
         }
      }
      
      public function §n\x0f]P\x02§() : void
      {
         selected = false;
         Control.me.§S%;3\x01§(id);
         light.visible = false;
      }
      
      public function select() : void
      {
         var _loc3_:* = null as §=\x1a5%\x01§;
         var _loc1_:int = 0;
         var _loc2_:Array = Control.me.buts;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_ != this)
            {
               _loc3_.§n\x0f]P\x02§();
            }
         }
         selected = true;
         Control.me.§\f}2§(id);
         light.visible = true;
      }
   }
}
