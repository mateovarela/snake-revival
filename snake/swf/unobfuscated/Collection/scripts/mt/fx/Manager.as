package mt.fx
{
   import flash.§f$\n8\x01§;
   
   public class Manager
   {
       
      
      public var fxs:Array;
      
      public function Manager()
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         fxs = [];
         if(Fx.DEFAULT_MANAGER == null)
         {
            Fx.DEFAULT_MANAGER = this;
         }
      }
      
      public function update() : void
      {
         var _loc3_:* = null as Fx;
         var _loc1_:Array = fxs.copy();
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            _loc3_.update();
         }
      }
      
      public function remove(param1:Fx) : void
      {
         fxs.remove(param1);
      }
      
      public function clean() : void
      {
         while(int(fxs.length) > 0)
         {
            fxs[0].kill();
         }
      }
      
      public function add(param1:Fx) : void
      {
         fxs.push(param1);
      }
   }
}
