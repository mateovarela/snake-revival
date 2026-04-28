package
{
   import flash.Boot;
   import flash.Lib;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import pix.Element;
   import pix.Frame;
   
   public class But extends Sprite
   {
       
      
      public var ww:int;
      
      public var mx:int;
      
      public var §\x17\r\x0f\x19§:Element;
      
      public var icon:Element;
      
      public var hh:int;
      
      public var §)\x13\x0f$§:TextField;
      
      public var field:TextField;
      
      public var colors:Array;
      
      public var box:Sprite;
      
      public var active:Boolean;
      
      public var §i\x1b06\x03§:Function;
      
      public var §\x01d,I\x02§:Function;
      
      public var action:Function;
      
      public function But(param1:String = undefined, param2:Object = undefined, param3:Array = undefined, param4:String = undefined, param5:int = 6)
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param4 == null)
         {
            param4 = "icon_play";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         colors = [Gfx.col("green_1"),Gfx.col("green_2")];
         if(param3 != null)
         {
            colors = param3;
         }
         action = param2;
         super();
         hh = 12;
         mx = param5;
         box = new Sprite();
         addChild(box);
         field = Cs.getField(16777215,8,-1,"nokia");
         field.y = -1;
         box.addChild(field);
         icon = new Element();
         icon.x = param5 + 4;
         icon.y = 6;
         box.addChild(icon);
         §\x05`FE§(param1,param4);
         Lib.current.stage.addEventListener(MouseEvent.CLICK,click);
      }
      
      public function update() : void
      {
         var _loc1_:* = Cs.§\x0b@;v\x01§(this);
         var _loc2_:Boolean = Number(Math.abs(Number(_loc1_.x))) < ww * 0.5 && Number(_loc1_.y) > 0 && Number(_loc1_.y) < hh;
         if(!!active && !_loc2_)
         {
            out();
         }
         if(!active && _loc2_)
         {
            over();
         }
      }
      
      public function §?]ao\x02§(param1:int, param2:int) : void
      {
         ww = param1;
         hh = param2;
         visible = false;
      }
      
      public function §\x05`FE§(param1:String, param2:String = undefined) : void
      {
         ww = 2 * mx;
         field.text = param1;
         field.width = Number(field.textWidth + 3);
         field.x = mx - 1;
         ww = ww + int(field.textWidth);
         icon.visible = false;
         if(param2 != null)
         {
            icon.drawFrame(Gfx.main.get(0,"icon_play"));
            icon.visible = true;
            ww = ww + 8;
            field.x = Number(field.x + 9);
         }
         box.x = -(int(ww * 0.5));
         out();
      }
      
      public function over() : void
      {
         active = true;
         box.y = 1;
         box.graphics.clear();
         box.graphics.beginFill(int(colors[0]));
         box.graphics.drawRect(0,0,ww,hh);
         if(§i\x1b06\x03§ != null)
         {
            §i\x1b06\x03§();
         }
      }
      
      public function out() : void
      {
         active = false;
         box.y = 0;
         box.graphics.clear();
         box.graphics.beginFill(int(colors[0]));
         box.graphics.drawRect(0,0,ww,hh);
         box.graphics.beginFill(int(colors[1]));
         box.graphics.drawRect(0,hh,ww,1);
         if(§\x01d,I\x02§ != null)
         {
            §\x01d,I\x02§();
         }
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
         if(!active)
         {
            return;
         }
         out();
         if(action != null)
         {
            action();
         }
      }
      
      public function §I-B\x02\x02§() : void
      {
         var _loc1_:* = Cs.§\x0b@;v\x01§(this);
         var _loc2_:Boolean = Number(Math.abs(Number(_loc1_.x))) < ww * 0.5 && Number(_loc1_.y) > 0 && Number(_loc1_.y) < hh;
         if(!!active && !_loc2_)
         {
            out();
         }
      }
      
      public function §3a\x12!\x01§() : void
      {
         var _loc1_:* = Cs.§\x0b@;v\x01§(this);
         var _loc2_:Boolean = Number(Math.abs(Number(_loc1_.x))) < ww * 0.5 && Number(_loc1_.y) > 0 && Number(_loc1_.y) < hh;
         if(!active && _loc2_)
         {
            over();
         }
      }
      
      public function §\x1bm)N§(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:TextField = Cs.getField(16777215,8,-1,"nokia");
         _loc3_.text = param1;
         _loc3_.width = Number(_loc3_.textWidth + 3);
         _loc3_.x = int(box.width * 0.5) + 4;
         _loc3_.y = -1;
         addChild(_loc3_);
         if(param2)
         {
            §\x17\r\x0f\x19§ = new Element();
            §\x17\r\x0f\x19§.drawFrame(Gfx.main.get(null,"icon_token"),0,0);
            §\x17\r\x0f\x19§.x = Number(_loc3_.x + _loc3_.width);
            §\x17\r\x0f\x19§.y = Number(_loc3_.y + 2);
            addChild(§\x17\r\x0f\x19§);
         }
      }
   }
}
