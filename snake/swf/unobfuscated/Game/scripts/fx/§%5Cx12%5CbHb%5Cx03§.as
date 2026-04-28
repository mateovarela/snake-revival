package fx
{
   import flash.Boot;
   
   public class §\x12\bHb\x03§ extends Fx
   {
       
      
      public var card:Card;
      
      public function §\x12\bHb\x03§(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         card = param1;
         super();
      }
      
      public function vanish() : void
      {
         kill();
      }
      
      override public function update() : void
      {
         super.update();
         if(!card.active[0])
         {
            vanish();
         }
      }
   }
}
