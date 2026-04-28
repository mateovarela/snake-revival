package
{
   import flash.Lib;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.§f$\n8\x01§;
   import pix.Element;
   import pix.Frame;
   
   public class But extends Sprite
   {
       
      
      public var ww:int;
      
      public var hh:int;
      
      public var gfx:Element;
      
      public var frames:Array;
      
      public var §\x11!\x01§:Number;
      
      public var §i\b\x01§:Number;
      
      public var active:Boolean;
      
      public var action:Function;
      
      public function But(param1:Function = undefined, param2:Array = undefined)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         action = param1;
         super();
         frames = param2;
         §i\b\x01§ = 0.5;
         §\x11!\x01§ = 0.5;
         ww = 21;
         hh = 12;
         gfx = new Element();
         addChild(gfx);
         Lib.current.stage.addEventListener(MouseEvent.CLICK,click);
         out();
      }
      
      public function update() : void
      {
         var _loc1_:* = §\x19\n\t\x01§.§\x0b@;v\x01§(this);
         var _loc2_:Boolean = Number(Math.abs(Number(_loc1_.x))) < ww * 0.5 && Number(Math.abs(Number(_loc1_.y))) < hh * 0.5 && Main.§\x14;F8§;
         if(!!active && !_loc2_)
         {
            out();
         }
         if(!active && _loc2_)
         {
            over();
         }
      }
      
      public function §p7\x174§(param1:int) : void
      {
         var _loc2_:Frame = frames[param1];
         if(_loc2_ == null)
         {
            return;
         }
         gfx.drawFrame(_loc2_,§i\b\x01§,§\x11!\x01§);
         Main.screen.update();
      }
      
      public function §k\x07f\x0f\x01§(param1:Boolean) : void
      {
         active = param1;
         §p7\x174§(!!active?0:2);
      }
      
      public function over() : void
      {
         active = true;
         §p7\x174§(1);
      }
      
      public function out() : void
      {
         active = false;
         §p7\x174§(0);
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
         over();
         action();
      }
   }
}
