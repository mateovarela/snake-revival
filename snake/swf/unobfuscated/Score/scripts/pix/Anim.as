package pix
{
   import flash.Boot;
   
   public class Anim
   {
       
      
      public var timeline:Array;
      
      public var store:Store;
      
      public var playSpeed:Number;
      
      public var onFinish:Function;
      
      public var loop:Boolean;
      
      public var cursor:Number;
      
      public function Anim(param1:Store = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(!onFinish)
         {
            onFinish = function():void
            {
            };
         }
         store = param1;
         timeline = [0];
         cursor = 0;
         playSpeed = 1;
         loop = true;
      }
      
      public function update() : void
      {
         cursor = Number(cursor + playSpeed);
         if(cursor >= int(timeline.length))
         {
            if(loop)
            {
               cursor = cursor - int(timeline.length);
            }
            else
            {
               cursor = int(timeline.length) - 1;
               playSpeed = 0;
            }
            onFinish();
         }
         if(cursor < 0)
         {
            if(loop)
            {
               cursor = Number(cursor + int(timeline.length));
            }
            else
            {
               cursor = 0;
               playSpeed = 0;
            }
            onFinish();
         }
      }
      
      public function stop() : void
      {
         play(0);
      }
      
      public function reverse() : void
      {
         playSpeed = -playSpeed;
         cursor = int(timeline.length) - (Number(1 + cursor));
      }
      
      public function play(param1:Number = 1.0) : void
      {
         playSpeed = param1;
      }
      
      public function gotoRandom() : void
      {
         cursor = int(Std.random(int(timeline.length)));
      }
      
      public function goto(param1:Number) : void
      {
         cursor = param1;
      }
      
      public function getRandomFrame() : Frame
      {
         var _loc1_:int = int(timeline[int(Std.random(int(timeline.length)))]);
         return store.get(_loc1_);
      }
      
      public function getCurrentFrame() : Frame
      {
         var _loc1_:int = int(timeline[int(cursor)]);
         return store.get(_loc1_);
      }
   }
}
