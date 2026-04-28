package fx
{
   import flash.Boot;
   import flash.display.Sprite;
   import mt.bumdum9.Col;
   
   public class §z\x1f)\x11\x01§ extends Fx
   {
       
      
      public var queue:Array;
      
      public var mcq:Sprite;
      
      public var coef:Number;
      
      public var burning:Boolean;
      
      public function §z\x1f)\x11\x01§(param1:Number = 0.0, param2:Number = 0.0)
      {
         var _loc5_:* = null;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         coef = 0;
         mcq = new Sprite();
         Stage.me.dm.add(mcq,Stage.§|r;h§);
         var _loc3_:Array = Game.me.snake.queue;
         queue = [];
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc3_.length))
         {
            _loc5_ = _loc3_[_loc4_];
            _loc4_++;
            if(Number(_loc5_.pos) >= param1 && Number(_loc5_.pos) <= param2)
            {
               queue.push(_loc5_);
            }
         }
         if(int(queue.length) == 0)
         {
            kill();
         }
      }
      
      override public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null as Part;
         coef = Number(Math.min(Number(coef + 0.07),1));
         mcq.graphics.clear();
         Snake.§^LL*§(queue,mcq.graphics,1 - coef);
         if(burning)
         {
            _loc1_ = 0;
            _loc2_ = 0.2;
            if(coef < _loc2_)
            {
               _loc3_ = 1 - coef / _loc2_;
               _loc1_ = int(Col.§73du\x02§({
                  "r":255,
                  "g":int(_loc3_ * 255),
                  "b":0
               }));
            }
            else
            {
               _loc3_ = Number(Math.max(1 - (coef - _loc2_) / (1 - _loc2_) * 2,0));
               _loc1_ = int(Col.§73du\x02§({
                  "r":int(255 * _loc3_),
                  "g":0,
                  "b":0
               }));
            }
            Col.setPercentColor(mcq,1,_loc1_);
            _loc4_ = int(Number(Math.max(1,int(queue.length) / 4)));
            _loc3_ = Number(4 + (1 - coef) * 14);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc5_++;
               _loc6_ = _loc5_;
               _loc7_ = queue[int(Std.random(int(queue.length)))];
               _loc8_ = stg.§X\x0f;z\x03§("miniflame");
               _loc8_.x = Number(Number(_loc7_.x) + (Math.random() - 0.5) * _loc3_);
               _loc8_.y = Number(Number(_loc7_.y) + (Math.random() - 0.5) * _loc3_);
               _loc8_.weight = -0.1;
            }
         }
         if(coef == 1)
         {
            kill();
         }
      }
      
      public function §/\x0b&T§() : void
      {
         burning = true;
      }
      
      override public function kill() : void
      {
         mcq.parent.removeChild(mcq);
         super.kill();
      }
   }
}
