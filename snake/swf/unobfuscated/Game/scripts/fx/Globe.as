package fx
{
   import flash.Boot;
   import mt.bumdum9.Num;
   
   public class Globe extends §\x12\bHb\x03§
   {
       
      
      public var sum:Number;
      
      public var angle:Number;
      
      public function Globe(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         angle = sn.angle;
         sum = 0;
      }
      
      override public function update() : void
      {
         super.update();
         var _loc1_:Number = Number(Num.hMod(sn.angle - angle,3.14));
         angle = sn.angle;
         sum = Number(sum + _loc1_);
         var _loc2_:Number = 6.28;
         if(sum > _loc2_)
         {
            sum = sum - _loc2_;
            §\x06r\\'§(1);
         }
         if(sum <= -_loc2_)
         {
            sum = Number(sum + _loc2_);
            §\x06r\\'§(-1);
         }
      }
      
      public function §\x06r\\'§(param1:int) : void
      {
         Game.me.§\x0e\b$\r§ = [Game.me.§\x0e\b$\r§[0] + 50 * param1];
         if(Game.me.§\x0e\b$\r§[0] < 0)
         {
            Game.me.§\x0e\b$\r§ = [0];
         }
         card.§\x0fB}F\x03§();
      }
   }
}
