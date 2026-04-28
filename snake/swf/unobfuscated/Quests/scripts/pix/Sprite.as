package pix
{
   import flash.§f$\n8\x01§;
   
   public class Sprite extends Element
   {
      
      public static var all:Array = [];
       
      
      public var snapPix:Boolean;
      
      public var chain:Array;
      
      public var anim:Anim;
      
      public function Sprite()
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super();
         Sprite.all.push(this);
         snapPix = true;
      }
      
      public function update() : void
      {
         var _loc1_:* = null as Frame;
         if(anim != null)
         {
            anim.update();
            if(!!visible && anim != null)
            {
               _loc1_ = anim.getCurrentFrame();
               if(_loc1_ != currentFrame)
               {
                  graphics.clear();
                  drawFrame(_loc1_);
               }
            }
         }
         if(snapPix)
         {
            pxx();
         }
      }
      
      public function swapAnim(param1:Anim) : void
      {
         if(anim != null)
         {
            param1.cursor = anim.cursor;
            param1.loop = anim.loop;
         }
         anim = param1;
      }
      
      public function setAnims(param1:Array) : void
      {
         chain = param1;
         next();
      }
      
      public function setAnim(param1:Anim, param2:Boolean = true) : void
      {
         anim = param1;
         if(anim == null)
         {
            return;
         }
         anim.loop = param2;
         drawFrame(anim.getCurrentFrame());
      }
      
      public function next() : void
      {
         setAnim(chain.shift());
         if(int(chain.length) > 0)
         {
            anim.onFinish = next;
         }
      }
      
      override public function kill() : void
      {
         Sprite.all.remove(this);
         super.kill();
      }
      
      public function continueAnim(param1:Anim, param2:Boolean = true) : void
      {
         if(param1 != null && anim != null && anim.§o\x11Fv\x03§ == param1.§o\x11Fv\x03§)
         {
            return;
         }
         setAnim(param1);
      }
      
      override public function clear() : void
      {
         super.clear();
         anim = null;
         snapPix = true;
         chain = null;
      }
   }
}
