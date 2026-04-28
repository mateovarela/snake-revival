package
{
   import flash.display.BlendMode;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.§f$\n8\x01§;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import mt.bumdum9.Filt;
   import mt.fx.Flash;
   import pix.Element;
   import pix.Frame;
   
   public class §0=\r}\x01§ extends MovieClip
   {
      
      public static var SIDE:int = 52;
       
      
      public var title:TextField;
      
      public var id:int;
      
      public var icon:Element;
      
      public var bg:Element;
      
      public var action:Function;
      
      public function §0=\r}\x01§(param1:int = 0)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         id = param1;
         super();
         blendMode = BlendMode.LAYER;
         bg = new Element();
         bg.drawFrame(Gfx.collection.get(null,"section_bg_small"),0,0);
         icon = new Element();
         icon.drawFrame(Gfx.collection.get(param1,"section_icons"));
         icon.x = §0=\r}\x01§.SIDE * 0.5;
         icon.y = Number(§0=\r}\x01§.SIDE * 0.5 + 3);
         title = Main.getField(16777215,8,-1,"nokia");
         title.text = Lang.§\x1b71T\x03§[param1];
         title.width = Number(title.textWidth + 3);
         title.x = int((§0=\r}\x01§.SIDE - title.width) * 0.5);
         title.y = -1;
         title.filters = [new GlowFilter(Gfx.col("green_2"),1,4,4,40)];
         addChild(bg);
         addChild(icon);
         addChild(title);
         addEventListener(MouseEvent.CLICK,select);
      }
      
      public function §\tBh]\x01§() : void
      {
         title.textColor = Gfx.col("green_0");
         icon.filters = [];
         mouseEnabled = true;
      }
      
      public function select(param1:*) : void
      {
         if(!mouseEnabled || §\x13pn\x15\x02§.§{\x01§.motion)
         {
            return;
         }
         light();
         action();
      }
      
      public function light() : void
      {
         var _loc3_:* = null as §0=\r}\x01§;
         var _loc1_:int = 0;
         var _loc2_:Array = §\x13pn\x15\x02§.§{\x01§.buts;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_ != this)
            {
               _loc3_.§\tBh]\x01§();
            }
         }
         title.textColor = 16777215;
         Filt.glow(icon,4,400,16777215);
         new Flash(icon,0.07);
         new Flash(bg,0.15);
         mouseEnabled = false;
      }
   }
}
