package pix
{
   import flash.Boot;
   import mt.bumdum9.Col;
   
   public class Part extends Sprite
   {
       
      
      public var yy:Number;
      
      public var xx:Number;
      
      public var weight:Number;
      
      public var vy:Number;
      
      public var vx:Number;
      
      public var timer:Object;
      
      public var sleep:Object;
      
      public var _x_effetALaMort:Function;
      
      public var ground:Object;
      
      public var frict:Number;
      
      public var fadeType:int;
      
      public var fadeLimit:int;
      
      public function Part()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         xx = 0;
         yy = 0;
         vx = 0;
         vy = 0;
         frict = 1;
         weight = 0;
         fadeLimit = 10;
         fadeType = 0;
      }
      
      public function updatePos() : void
      {
         x = xx;
         y = yy;
      }
      
      override public function update() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(sleep != null)
         {
            sleep = sleep - 1;
            if(sleep <= 0)
            {
               sleep = null;
               visible = true;
            }
            return;
         }
         vy = Number(vy + weight);
         vx = vx * frict;
         vy = vy * frict;
         xx = Number(xx + vx);
         yy = Number(yy + vy);
         if(ground != null && yy >= Number(ground.y))
         {
            yy = Number(ground.y);
            vx = vx * ground.frx;
            vy = vy * -ground.fry;
         }
         updatePos();
         if(timer != null)
         {
            timer = timer - 1;
            if(timer < fadeLimit)
            {
               _loc1_ = timer / fadeLimit;
               switch(fadeType)
               {
                  case 0:
                     break;
                  case 1:
                     alpha = _loc1_;
                     break;
                  case 2:
                     _loc2_ = _loc1_;
                     scaleY = _loc2_;
                     scaleX = _loc2_;
                     break;
                  case 3:
                     visible = timer % 4 < 2;
                     break;
                  case 4:
                     Col.setColor(this,0,int(255 * (1 - _loc1_)));
               }
            }
            if(timer <= 0)
            {
               kill();
            }
         }
         super.update();
      }
      
      public function setPos(param1:Number, param2:Number) : void
      {
         xx = param1;
         yy = param2;
         updatePos();
      }
      
      public function setGround(param1:Number, param2:Number = 1.0, param3:Number = 0.5) : void
      {
         ground = {
            "y":param1,
            "frx":param2,
            "fry":param3
         };
      }
      
      override public function kill() : void
      {
         if(_x_effetALaMort != null)
         {
            _x_effetALaMort();
         }
         super.kill();
      }
   }
}
