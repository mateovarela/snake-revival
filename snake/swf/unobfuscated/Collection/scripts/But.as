package
{
   import flash.Lib;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.§f$\n8\x01§;
   import flash.text.TextField;
   import pix.Frame;
   
   public class But extends flash.display.Sprite
   {
       
      
      public var ww:int;
      
      public var icon:pix.Sprite;
      
      public var hh:int;
      
      public var field:TextField;
      
      public var box:flash.display.Sprite;
      
      public var §i\x1b06\x03§:Function;
      
      public var §\x01d,I\x02§:Function;
      
      public var action:Function;
      
      public function But(param1:String = undefined, param2:Function = undefined, param3:String = undefined)
      {
         if(param3 == null)
         {
            param3 = "icon_play";
         }
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         action = param2;
         super();
         var _loc4_:int = 6;
         box = new flash.display.Sprite();
         field = Main.getField(16777215,8,-1,"nokia");
         field.text = param1;
         field.width = Number(field.textWidth + 3);
         field.height = Number(field.textHeight + 3);
         field.x = _loc4_ + 8;
         field.y = -1;
         icon = new pix.Sprite();
         icon.drawFrame(Gfx.main.get(0,param3));
         icon.x = _loc4_ + 4;
         icon.y = 6;
         box.addChild(field);
         box.addChild(icon);
         addChild(box);
         ww = int(Number(Number(field.width + 8) + 2 * _loc4_));
         hh = 12;
         box.x = -(int(ww * 0.5));
         addEventListener(MouseEvent.CLICK,click);
         addEventListener(MouseEvent.MOUSE_OVER,over);
         addEventListener(MouseEvent.MOUSE_OUT,out);
         out(null);
      }
      
      public function over(param1:*) : void
      {
         if(§i\x1b06\x03§ != null)
         {
            §i\x1b06\x03§();
         }
         box.y = 1;
         box.graphics.clear();
         box.graphics.beginFill(Gfx.col("green_1"));
         box.graphics.drawRect(0,0,ww,hh);
      }
      
      public function out(param1:*) : void
      {
         if(§\x01d,I\x02§ != null)
         {
            §\x01d,I\x02§();
         }
         box.y = 0;
         box.graphics.clear();
         box.graphics.beginFill(Gfx.col("green_1"));
         box.graphics.drawRect(0,0,ww,hh);
         box.graphics.beginFill(Gfx.col("green_2"));
         box.graphics.drawRect(0,hh,ww,1);
      }
      
      public function kill() : void
      {
         Lib.current.stage.removeEventListener(MouseEvent.CLICK,click);
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function click(param1:*) : void
      {
         over(null);
         action();
      }
   }
}
