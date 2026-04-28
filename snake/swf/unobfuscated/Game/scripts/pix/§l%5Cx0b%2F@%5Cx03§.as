package pix
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   
   public class §l\x0b/@\x03§ extends flash.display.Sprite
   {
       
      
      public var ww:int;
      
      public var right:Element;
      
      public var mid:Element;
      
      public var left:Element;
      
      public var hh:int;
      
      public function §l\x0b/@\x03§(param1:Frame = undefined, param2:int = 0, param3:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ww = param2;
         hh = param3;
         super();
         var _loc4_:Frame = param1.slice(0,0,ww,hh);
         left = new Element();
         left.drawFrame(_loc4_,0,0);
         addChild(left);
         var _loc5_:Frame = param1.slice(ww,0,ww,hh);
         mid = new Element();
         mid.drawFrame(_loc5_,0,0);
         addChild(mid);
         mid.x = ww;
         var _loc6_:Frame = param1.slice(ww * 2,0,ww,hh);
         right = new Element();
         right.drawFrame(_loc6_,0,0);
         addChild(right);
      }
      
      public function setWidth(param1:Number) : void
      {
         mid.width = int(param1);
         right.x = Number(mid.width + ww);
      }
      
      public function kill() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}
