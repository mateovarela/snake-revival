package
{
   import flash.Boot;
   import flash.display.Sprite;
   import mt.bumdum9.Col;
   import pix.Frame;
   import pix.§l\x0b/@\x03§;
   
   public class §2Uh[\x01§ extends Sprite
   {
       
      
      public var §M9\x023\x03§:Number;
      
      public var flh:Object;
      
      public var bg:§l\x0b/@\x03§;
      
      public var bar:§l\x0b/@\x03§;
      
      public function §2Uh[\x01§(param1:int = 0, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         §M9\x023\x03§ = param1 - 8;
         Inter.me.root.addChild(this);
         bg = new §l\x0b/@\x03§(Gfx.main.get(0,"frutibar_bg"),4,8);
         bar = new §l\x0b/@\x03§(Gfx.main.get(param2,"frutibar"),4,9);
         addChild(bg);
         addChild(bar);
         bg.setWidth(§M9\x023\x03§);
      }
      
      public function update() : void
      {
         var _loc1_:int = 0;
         if(flh != null)
         {
            flh = flh * 0.75;
            _loc1_ = int(flh * 255);
            if(_loc1_ < 10)
            {
               _loc1_ = 0;
               flh = null;
            }
            Col.setColor(bar,0,_loc1_);
         }
      }
      
      public function set(param1:Number) : void
      {
         bar.setWidth(param1 * §M9\x023\x03§);
      }
      
      public function §g\x12\x01$\x01§() : Number
      {
         return Number(x + bar.width * 0.5);
      }
      
      public function flash(param1:Number = 1.0) : void
      {
         flh = param1;
         Col.setColor(bar,0,int(flh * 255));
      }
   }
}
