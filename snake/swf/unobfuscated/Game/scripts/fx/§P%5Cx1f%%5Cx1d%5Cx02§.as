package fx
{
   import flash.Boot;
   
   public class §P\x1f%\x1d\x02§ extends Fx
   {
       
      
      public var trg:Object;
      
      public var speed:Number;
      
      public var fruit:Fruit;
      
      public var fid:int;
      
      public function §P\x1f%\x1d\x02§(param1:Fruit = undefined, param2:Number = 0.0, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         trg = param3;
         fruit = param1;
         fid = fruit.§8\x15J{\x02§;
         speed = param2;
         param1.dummy = true;
      }
      
      override public function update() : void
      {
         super.update();
         if(fruit.§8\x15J{\x02§ != fid)
         {
            return;
         }
         if(fruit.z < -1)
         {
            return;
         }
         fruit.vz = 0;
         fruit.z = 0;
         var _loc1_:Number = trg.x - fruit.x;
         var _loc2_:Number = trg.y - fruit.y;
         var _loc3_:Number = Number(Math.atan2(_loc2_,_loc1_));
         var _loc4_:Number = Number(Math.sqrt(Number(_loc1_ * _loc1_ + _loc2_ * _loc2_)));
         if(_loc4_ < speed)
         {
            speed = _loc4_;
            fruit.dummy = false;
            kill();
         }
         fruit.x = Number(fruit.x + §\x19\n\t\x01§.cos(_loc3_) * speed);
         fruit.y = Number(fruit.y + §\x19\n\t\x01§.sin(_loc3_) * speed);
      }
   }
}
