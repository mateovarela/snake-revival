package
{
   import flash.Boot;
   import flash.Lib;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class But extends Sprite
   {
       
      
      public var ww:int;
      
      public var §+VZ§:Number;
      
      public var sleep:Boolean;
      
      public var highlight:Boolean;
      
      public var hh:int;
      
      public var active:Boolean;
      
      public var action:Function;
      
      public function But(param1:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         action = param1;
         super();
         sleep = false;
         active = false;
         highlight = false;
         ww = 10;
         hh = 10;
         §+VZ§ = 1;
         Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseDown);
         Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP,mouseUp);
         Lib.current.stage.addEventListener(MouseEvent.CLICK,click);
      }
      
      public function update() : void
      {
         if(sleep)
         {
            return;
         }
         var _loc1_:* = §\x19\n\t\x01§.§\x0b@;v\x01§(this);
         var _loc2_:Boolean = Number(Math.abs(Number(_loc1_.x))) < ww * 0.5 && Number(Math.abs(Number(_loc1_.y))) < hh * 0.5;
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
      }
      
      public function §Hp@\x0f\x01§(param1:Boolean) : void
      {
         alpha = !!param1?§+VZ§:Number(1);
         sleep = param1;
         active = false;
         §p7\x174§(!!sleep?4:0);
      }
      
      public function §\x07EvB\x01§(param1:int, param2:int) : void
      {
         ww = param1;
         hh = param2;
         §p7\x174§(0);
      }
      
      public function §s\x03n\b\x01§(param1:Boolean) : void
      {
         highlight = param1;
         §p7\x174§(!!highlight?3:0);
      }
      
      public function over() : void
      {
         active = true;
         §p7\x174§(1);
      }
      
      public function out() : void
      {
         active = false;
         §p7\x174§(!!highlight?3:0);
      }
      
      public function mouseUp(param1:*) : void
      {
         if(sleep)
         {
            return;
         }
         if(active)
         {
            over();
         }
         else
         {
            out();
         }
      }
      
      public function mouseDown(param1:*) : void
      {
         if(sleep || !active)
         {
            return;
         }
         §p7\x174§(2);
      }
      
      public function kill() : void
      {
         Lib.current.stage.removeEventListener(MouseEvent.MOUSE_DOWN,mouseDown);
         Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP,mouseUp);
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
