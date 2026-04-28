package mt.deepnight
{
   import flash.display.DisplayObjectContainer;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   
   public class SuperMovie
   {
       
      
      public function SuperMovie()
      {
      }
      
      public static function registerEvent(param1:EventDispatcher, param2:Function, param3:String) : Object
      {
         var cb:Function = param2;
         var _loc4_:Function = function(param1:*):void
         {
            cb();
         };
         param1.addEventListener(param3,_loc4_);
         return {
            "cb":_loc4_,
            "type":param3
         };
      }
      
      public static function removeEvent(param1:EventDispatcher, param2:Object) : void
      {
         param1.removeEventListener(param2.type,param2.cb);
      }
      
      public static function onClick(param1:EventDispatcher, param2:Function) : Object
      {
         return SuperMovie.registerEvent(param1,param2,MouseEvent.CLICK);
      }
      
      public static function onMouseUp(param1:EventDispatcher, param2:Function) : Object
      {
         return SuperMovie.registerEvent(param1,param2,MouseEvent.MOUSE_UP);
      }
      
      public static function onMouseDown(param1:EventDispatcher, param2:Function) : Object
      {
         return SuperMovie.registerEvent(param1,param2,MouseEvent.MOUSE_DOWN);
      }
      
      public static function onOver(param1:EventDispatcher, param2:Function) : Object
      {
         return SuperMovie.registerEvent(param1,param2,MouseEvent.MOUSE_OVER);
      }
      
      public static function §\x10GB\x02§(param1:EventDispatcher, param2:Function) : Object
      {
         return SuperMovie.registerEvent(param1,param2,MouseEvent.MOUSE_OUT);
      }
      
      public static function onWheel(param1:EventDispatcher, param2:Function, param3:Number = 1.0) : Object
      {
         var cb:Function = param2;
         var §oN\n\x03\x02§:Number = param3;
         var _loc4_:Function = function(param1:MouseEvent):void
         {
            cb(param1.delta * §oN\n\x03\x02§);
         };
         param1.addEventListener(MouseEvent.MOUSE_WHEEL,_loc4_);
         return {
            "cb":_loc4_,
            "type":MouseEvent.MOUSE_WHEEL
         };
      }
      
      public static function remove(param1:DisplayObjectContainer) : void
      {
         if(param1 == null || param1.parent == null)
         {
            return;
         }
         param1.parent.removeChild(param1);
      }
      
      public static function disableMouse(param1:DisplayObjectContainer) : void
      {
         param1.mouseEnabled = false;
         param1.mouseChildren = false;
      }
      
      public static function enableMouse(param1:DisplayObjectContainer) : void
      {
         param1.mouseEnabled = true;
         param1.mouseChildren = true;
      }
      
      public static function handCursor(param1:Sprite, param2:Boolean) : void
      {
         param1.useHandCursor = param2;
         param1.buttonMode = param2;
         if(param2)
         {
            SuperMovie.enableMouse(param1);
         }
         else
         {
            SuperMovie.disableMouse(param1);
         }
      }
      
      public static function hasFrame(param1:MovieClip, param2:String) : Boolean
      {
         var _loc5_:* = null as FrameLabel;
         var _loc3_:int = 0;
         var _loc4_:Array = param1.currentLabels;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.name == param2)
            {
               return true;
            }
         }
         return false;
      }
   }
}
