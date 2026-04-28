package pix
{
   import flash.§f$\n8\x01§;
   
   public class Anim
   {
       
      
      public var §o\x11Fv\x03§:Array;
      
      public var store:§W\x1bSS\x01§;
      
      public var playSpeed:Number;
      
      public var onFinish:Function;
      
      public var loop:Boolean;
      
      public var cursor:Number;
      
      public function Anim(param1:§W\x1bSS\x01§ = undefined)
      {
         if(§f$\n8\x01§.skip_constructor)
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
         §o\x11Fv\x03§ = [0];
         cursor = 0;
         playSpeed = 1;
         loop = true;
      }
      
      public function update() : void
      {
         cursor = Number(cursor + playSpeed);
         if(cursor >= int(§o\x11Fv\x03§.length))
         {
            if(loop)
            {
               cursor = cursor - int(§o\x11Fv\x03§.length);
            }
            else
            {
               cursor = int(§o\x11Fv\x03§.length) - 1;
               playSpeed = 0;
            }
            onFinish();
         }
         if(cursor < 0)
         {
            if(loop)
            {
               cursor = Number(cursor + int(§o\x11Fv\x03§.length));
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
      
      public function §,\x04\x19\x02§() : void
      {
         playSpeed = -playSpeed;
         cursor = int(§o\x11Fv\x03§.length) - (Number(1 + cursor));
      }
      
      public function play(param1:Number = 1.0) : void
      {
         playSpeed = param1;
      }
      
      public function gotoRandom() : void
      {
         cursor = int(Std.random(int(§o\x11Fv\x03§.length)));
      }
      
      public function goto(param1:Number) : void
      {
         cursor = param1;
      }
      
      public function getRandomFrame() : Frame
      {
         var _loc1_:int = int(§o\x11Fv\x03§[int(Std.random(int(§o\x11Fv\x03§.length)))]);
         return store.get(_loc1_);
      }
      
      public function getCurrentFrame() : Frame
      {
         var _loc1_:int = int(§o\x11Fv\x03§[int(cursor)]);
         return store.get(_loc1_);
      }
   }
}
