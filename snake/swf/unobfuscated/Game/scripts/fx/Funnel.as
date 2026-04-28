package fx
{
   import flash.Boot;
   
   public class Funnel extends §\x12\bHb\x03§
   {
       
      
      public function Funnel(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function update() : void
      {
         var _loc4_:* = null as Fruit;
         var _loc5_:int = 0;
         super.update();
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = Game.me.fruits;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!_loc4_.dummy)
            {
               _loc1_.push(_loc4_);
            }
         }
         _loc2_ = 12;
         if(Game.me.have(_CardType.SOAP))
         {
            _loc2_ = _loc2_ >> 1;
         }
         if(int(_loc1_.length) >= _loc2_)
         {
            card.§\x0fB}F\x03§();
            _loc5_ = 0;
            while(_loc5_ < int(_loc1_.length))
            {
               _loc4_ = _loc1_[_loc5_];
               _loc5_++;
               new §P\x1f%\x1d\x02§(_loc4_,8,sn);
            }
         }
      }
   }
}
