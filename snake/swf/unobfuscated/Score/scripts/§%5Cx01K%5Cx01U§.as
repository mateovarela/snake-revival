package
{
   import flash.Boot;
   import pix.Element;
   import pix.Frame;
   
   public class §\x01K\x01U§ extends But
   {
       
      
      public var gfx:Element;
      
      public var frames:Array;
      
      public var ay:Number;
      
      public var ax:Number;
      
      public function §\x01K\x01U§(param1:Function = undefined, param2:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         frames = param2;
         while(int(frames.length) < 5)
         {
            frames.push(param2[0]);
         }
         ax = 0.5;
         ay = 0.5;
         ww = 21;
         hh = 22;
         gfx = new Element();
         addChild(gfx);
         out();
      }
      
      override public function §p7\x174§(param1:int) : void
      {
         super.§p7\x174§(param1);
         var _loc2_:Frame = frames[param1];
         if(_loc2_ == null)
         {
            return;
         }
         gfx.drawFrame(_loc2_,ax,ay);
         ww = _loc2_.width;
         hh = _loc2_.height;
      }
   }
}
