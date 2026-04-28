package mt.fx
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.§f$\n8\x01§;
   
   public class Vanish extends Visibility
   {
       
      
      public var timer:Number;
      
      public var fadeLimit:Number;
      
      public function Vanish(param1:DisplayObject = undefined, param2:int = 10, param3:int = 10, param4:Boolean = false)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super(param1);
         timer = param2;
         fadeLimit = param3;
         §Ib(`\x03§ = param4;
         alpha = root.alpha;
      }
      
      override public function update() : void
      {
         if(root.parent == null)
         {
            kill();
            return;
         }
         var _loc1_:Number = timer;
         timer = timer - 1;
         if(_loc1_ < fadeLimit)
         {
            §/\x15kH§(Number(curve(timer / fadeLimit)));
            if(timer == 0)
            {
               if(root.parent != null)
               {
                  root.parent.removeChild(root);
               }
               kill();
            }
         }
      }
      
      public function §1\bSe\x01§(param1:int, param2:int) : void
      {
         §MIvi\x03§ = {
            "sx":param1,
            "sy":param2,
            "scx":root.scaleX,
            "scy":root.scaleY
         };
      }
      
      public function §)u^\x1a\x02§(param1:Number, param2:Number) : void
      {
         §YHqr\x02§ = {
            "x":param1,
            "y":param2
         };
      }
   }
}
