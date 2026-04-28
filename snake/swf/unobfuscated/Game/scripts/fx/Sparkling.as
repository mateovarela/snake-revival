package fx
{
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.display.Sprite;
   
   public class Sparkling extends Fx
   {
       
      
      public var timer:int;
      
      public var root:Sprite;
      
      public var ray:Number;
      
      public var §\x0e-EY\x01§:int;
      
      public var anim:String;
      
      public function Sparkling(param1:Sprite = undefined, param2:int = 10, param3:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         root = param1;
         timer = param2;
         §\x0e-EY\x01§ = param3;
         ray = 10;
         anim = "spark_onde";
      }
      
      override public function update() : void
      {
         if(!root.visible)
         {
            return;
         }
         if(int(timer % §\x0e-EY\x01§) == 0)
         {
            spark();
         }
         var _loc1_:int = timer;
         timer = timer - 1;
         if(_loc1_ == 0)
         {
            kill();
         }
      }
      
      public function spark() : void
      {
         var _loc1_:Part = Stage.me.§X\x0f;z\x03§(anim);
         _loc1_.x = Number(root.x + (Math.random() * 2 - 1) * ray);
         _loc1_.y = Number(root.y + (Math.random() * 2 - 1) * ray);
         _loc1_.weight = -(0.1 + Math.random() * 0.2);
         _loc1_.sprite.blendMode = BlendMode.ADD;
      }
   }
}
