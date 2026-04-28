package
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.§f$\n8\x01§;
   import mod.§$=\x18S\x02§;
   import mod.§;R\x16v\x01§;
   import mod.SU4g;
   import mod.§W+\x0b(\x01§;
   import mt.DepthManager;
   import mt.fx.Manager;
   import mt.fx.Tween;
   
   public class §\x13pn\x15\x02§ extends flash.display.Sprite
   {
      
      public static var §;\x057\x02§:int = 400;
      
      public static var HEIGHT:int = 208;
      
      public static var §h\f#;\x03§:Number = 0.05;
      
      public static var §{\x01§:§\x13pn\x15\x02§;
       
      
      public var step:int;
      
      public var motion:Boolean;
      
      public var module:§k\f_(\x02§;
      
      public var fxm:Manager;
      
      public var dm:DepthManager;
      
      public var buts:Array;
      
      public var action:Function;
      
      public function §\x13pn\x15\x02§()
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as §0=\r}\x01§;
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super();
         §\x13pn\x15\x02§.§{\x01§ = this;
         dm = new DepthManager(this);
         motion = false;
         graphics.beginFill(Gfx.col("green_0"));
         graphics.drawRect(0,0,§\x13pn\x15\x02§.§;\x057\x02§,§\x13pn\x15\x02§.HEIGHT);
         buts = [];
         var _loc1_:int = 0;
         while(_loc1_ < 4)
         {
            _loc1_++;
            _loc2_ = _loc1_;
            _loc3_ = new §0=\r}\x01§(_loc2_);
            _loc3_.y = _loc2_ * §0=\r}\x01§.SIDE;
            dm.add(_loc3_,1);
            _loc3_.action = function(param1:Function, param2:int):Function
            {
               var f:Function = param1;
               var a1:int = param2;
               return function():void
               {
                  return f(a1);
               };
            }(§\x1dBJ4\x01§,_loc2_);
            buts.push(_loc3_);
         }
         fxm = new Manager();
         addEventListener(Event.ENTER_FRAME,update);
         buts[0].select(null);
      }
      
      public function update(param1:*) : void
      {
         var _loc4_:* = null as pix.Sprite;
         fxm.update();
         var _loc2_:Array = pix.Sprite.all.copy();
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc2_.length))
         {
            _loc4_ = _loc2_[_loc3_];
            _loc3_++;
            _loc4_.update();
         }
         module.update();
      }
      
      public function §\x1dBJ4\x01§(param1:int) : void
      {
         var _loc3_:* = null as Tween;
         var _loc2_:int = 1;
         if(module != null)
         {
            _loc2_ = module.mid < param1?-1:1;
            _loc3_ = new Tween(module,module.x,§\x13pn\x15\x02§.HEIGHT * _loc2_,§\x13pn\x15\x02§.§h\f#;\x03§);
            _loc3_.onFinish = module.kill;
            _loc3_.curveInOut();
         }
         switch(param1)
         {
            case 0:
               module = new SU4g(Main.data._cards);
               break;
            case 1:
               module = new §$=\x18S\x02§();
               break;
            case 2:
               module = new §W+\x0b(\x01§();
               break;
            case 3:
               module = new §;R\x16v\x01§();
         }
         module.mid = param1;
         module.y = -§\x13pn\x15\x02§.HEIGHT * _loc2_;
         _loc3_ = new Tween(module,module.x,0,§\x13pn\x15\x02§.§h\f#;\x03§);
         _loc3_.curveInOut();
         _loc3_.onFinish = function():void
         {
            §\x13pn\x15\x02§.§{\x01§.motion = false;
            §\x13pn\x15\x02§.§{\x01§.module.init();
         };
         motion = true;
      }
      
      public function §\x0e\x05od\x02§() : void
      {
         if(module == null)
         {
            return;
         }
         removeChild(module);
         module = null;
      }
   }
}
