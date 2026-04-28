package mt.fx
{
   import flash.Boot;
   import flash.display.DisplayObject;
   
   public class Spawn extends Visibility
   {
       
      
      public var spc:Number;
      
      public function Spawn(param1:DisplayObject = undefined, param2:Number = 0.1, param3:Boolean = true, param4:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         spc = param2;
         if(param3)
         {
            §\t\x04;2\x03§();
         }
         if(param4)
         {
            §1\bSe\x01§(1,1);
         }
      }
      
      override public function update() : void
      {
         super.update();
         coef = Number(Math.min(Number(coef + spc),1));
         §/\x15kH§(Number(curve(coef)));
         if(coef == 1)
         {
            kill();
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
         var _loc3_:int = param1;
         if(_loc3_ == -1)
         {
            root.scaleX = 100000;
         }
         else if(_loc3_ == 1)
         {
            root.scaleX = 0;
         }
         _loc3_ = param2;
         if(_loc3_ == -1)
         {
            root.scaleY = 100000;
         }
         else if(_loc3_ == 1)
         {
            root.scaleY = 0;
         }
      }
      
      public function §)u^\x1a\x02§(param1:Number, param2:Number) : void
      {
         §YHqr\x02§ = {
            "x":param1,
            "y":param2
         };
      }
      
      public function §\t\x04;2\x03§() : void
      {
         alpha = root.alpha;
         root.alpha = 0;
         §Ib(`\x03§ = true;
      }
   }
}
