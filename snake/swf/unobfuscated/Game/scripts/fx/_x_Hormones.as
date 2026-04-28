package fx
{
   import flash.Boot;
   
   public class _x_Hormones extends §\x12\bHb\x03§
   {
       
      
      public var timer:int;
      
      public var inc:Number;
      
      public function _x_Hormones(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         timer = 0;
      }
      
      override public function update() : void
      {
         timer = timer + 1;
         if(int(timer % 10) == 0)
         {
            sn.length = [Number(sn.length[0] + 2)];
         }
         super.update();
      }
   }
}
