package fx
{
   import flash.Boot;
   
   public class §'y!3\x01§ extends §\x12\bHb\x03§
   {
       
      
      public var timer:int;
      
      public var inc:Number;
      
      public function §'y!3\x01§(param1:Card = undefined, param2:Number = 0.0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         timer = 0;
         inc = param2;
      }
      
      override public function update() : void
      {
         timer = timer + 1;
         if(int(timer % 10) == 0)
         {
            Game.me._x_augmenteFruitibar(inc);
         }
         super.update();
      }
   }
}
