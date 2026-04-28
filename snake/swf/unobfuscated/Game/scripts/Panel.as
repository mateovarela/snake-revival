package
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.ui.Mouse;
   
   public class Panel extends Sprite
   {
      
      public static var me:Panel;
       
      
      public var win:Sprite;
      
      public var step:int;
      
      public var pww:int;
      
      public var phh:int;
      
      public var coef:Number;
      
      public var box:Sprite;
      
      public function Panel()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         Panel.me = this;
         super();
         step = 0;
         coef = 0;
         Mouse.show();
      }
      
      public function §3\f;8§() : void
      {
      }
      
      public function update() : void
      {
         switch(step)
         {
            case 0:
               coef = Number(Math.min(Number(coef + 0.1),1));
               §HZ\x15e\x03§(coef);
               if(coef == 1)
               {
                  display();
                  step = step + 1;
               }
               break;
            case 1:
               §3\f;8§();
               break;
            case 2:
               coef = Number(Math.min(Number(coef + 0.1),1));
               §HZ\x15e\x03§(1 - coef);
               if(coef == 1)
               {
                  kill();
                  break;
               }
         }
      }
      
      public function §HZ\x15e\x03§(param1:Number) : void
      {
         param1 = Number(Math.pow(param1,2));
         var _loc2_:int = int(pww * 0.5 * param1);
         var _loc3_:int = int(phh * 0.5 * param1);
         if(win == null)
         {
            win = new Sprite();
            addChild(win);
         }
         win.x = Cs.mcw * 0.5;
         win.y = Cs.mch * 0.5;
         var _loc4_:int = 2;
         win.graphics.clear();
         win.graphics.beginFill(16777215);
         win.graphics.drawRect(-(_loc2_ + _loc4_),-(_loc3_ + _loc4_),(_loc2_ + _loc4_) * 2,(_loc3_ + _loc4_) * 2);
         _loc4_--;
         win.graphics.beginFill(Gfx.col("green_1"));
         win.graphics.drawRect(-(_loc2_ + _loc4_),-(_loc3_ + _loc4_),(_loc2_ + _loc4_) * 2,(_loc3_ + _loc4_) * 2);
         win.graphics.beginFill(Gfx.col("green_0"));
         win.graphics.drawRect(-_loc2_,-_loc3_,_loc2_ * 2,_loc3_ * 2);
         win.graphics.beginFill(16777215);
         win.graphics.drawRect(-(_loc2_ + _loc4_),-(_loc3_ + _loc4_),(_loc2_ + _loc4_) * 2,int(14 * param1));
      }
      
      public function §\x05`FE§(param1:String) : void
      {
         var _loc2_:TextField = §\x19\n\t\x01§.getField(Gfx.col("green_1"),8,-1,"nokia");
         _loc2_.text = param1;
         _loc2_.y = Cs.mch * 0.5 - phh * 0.5;
         _loc2_.width = Number(_loc2_.textWidth + 3);
         _loc2_.x = int((Cs.mcw - _loc2_.width) * 0.5);
         box.addChild(_loc2_);
      }
      
      public function leave() : void
      {
         coef = 0;
         step = 2;
         box.visible = false;
      }
      
      public function kill() : void
      {
         Panel.me = null;
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function fadeOut() : void
      {
         if(step != 1)
         {
            return;
         }
         step = 2;
         coef = 0;
         box.visible = false;
      }
      
      public function display() : void
      {
         box = new Sprite();
         addChild(box);
      }
      
      public function §\x04\x0f3Q\x02§(param1:TextField, param2:Object = undefined) : void
      {
         param1.width = Number(param1.textWidth + 3);
         if(param2 != null && param1.width > param2)
         {
            param1.width = param2;
         }
         param1.x = Game.MARGIN + int((Cs.mcw - (Number(param1.textWidth + Game.MARGIN * 2))) * 0.5);
      }
   }
}
