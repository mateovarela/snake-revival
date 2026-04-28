package fx
{
   import flash.Boot;
   
   public class §'h\x1bF\x02§ extends §\x12\bHb\x03§
   {
       
      
      public function §'h\x1bF\x02§(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function update() : void
      {
         var _loc1_:int = 3 + int(Game.me.§2~\f#\x03§(_CardType.ECSTASY));
         if(int(Game.me.getTime()) >= _loc1_ * 60 * 1000)
         {
            Game.me.§iD\b\x10§(_CardType.STEROID).§\x1b\x03\x11K\x02§();
            sn.§1g\x03O\x01§();
            kill();
         }
         super.update();
      }
   }
}
