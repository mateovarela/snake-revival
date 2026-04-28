package
{
   import flash.display.Sprite;
   import flash.§f$\n8\x01§;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import mt.bumdum9.Col;
   import mt.flash.§-F\fN\x01§;
   import pix.Element;
   import pix.Frame;
   import pix.§W\x1bSS\x01§;
   
   public class §#UX^\x01§ extends Sprite
   {
      
      public static var §;\x057\x02§:int = 43;
      
      public static var HEIGHT:int = 62;
      
      public static var art:§W\x1bSS\x01§;
       
      
      public var type:_CardType;
      
      public var title:TextField;
      
      public var mojo:TextField;
      
      public var §In-\b\x02§:Element;
      
      public var §8J\b\x02§:Element;
      
      public var §*L|)\x03§:Element;
      
      public var §i1\x04q\x03§:Number;
      
      public var §A6h_\x01§:TextField;
      
      public var face:Sprite;
      
      public var data:Object;
      
      public var coef:Number;
      
      public var box:Sprite;
      
      public var §O\no%\x01§:Sprite;
      
      public function §#UX^\x01§(param1:Number = 1.0)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         §#UX^\x01§.§\x01`k\x0e§();
         super();
         coef = 0;
         §i1\x04q\x03§ = param1;
         §\b\x07e\x19\x03§();
         §)QR\x01§(_CardType.ARROSOIR);
      }
      
      public static function §\x01`k\x0e§() : void
      {
         if(§#UX^\x01§.art != null)
         {
            return;
         }
         var _loc1_:__mcFruitsEffects = new __mcFruitsEffects(0,0);
         §-F\fN\x01§.run(_loc1_);
         §#UX^\x01§.art = new §W\x1bSS\x01§(_loc1_);
         §#UX^\x01§.art.addIndex("main");
         var _loc2_:int = 10;
         var _loc3_:int = int(Math.ceil(int(Data.§0\x14UO\x02§()) / _loc2_));
         §#UX^\x01§.art.slice(0,0,37,43,_loc2_,_loc3_);
      }
      
      public function §)QR\x01§(param1:_CardType) : void
      {
         type = param1;
         var _loc2_:int = int(type.index);
         data = Data.CARDS[_loc2_];
         §In-\b\x02§.drawFrame(§#UX^\x01§.art.get(_loc2_),0.5,0.5);
         title.text = Data.TEXT[_loc2_].name;
         title.width = Number(Math.min(§#UX^\x01§.§;\x057\x02§,Number(title.textWidth + 3)));
         title.x = -(int(title.width * 0.5));
         mojo.text = Std.string(int(data.mojo));
         §*L|)\x03§.visible = data.§/;`[\x03§ != null;
         §8J\b\x02§.drawFrame(Gfx.main.get(int(§\t\x0exo§(data.§\x0e-EY\x01§)),"icon_freq"));
      }
      
      public function §]Pzm\x03§() : void
      {
         face.scaleX = Number(§\x19\n\t\x01§.sin(coef * 6.28));
         §O\no%\x01§.scaleX = -face.scaleX;
         face.visible = face.scaleX > 0;
         §O\no%\x01§.visible = §O\no%\x01§.scaleX > 0;
         var _loc1_:int = 120;
         var _loc2_:int = int(§\x19\n\t\x01§.cos(coef * 6.28) * _loc1_);
         Col.setColor(face,0,-_loc2_);
         Col.setColor(§O\no%\x01§,0,_loc2_);
      }
      
      public function kill() : void
      {
         parent.removeChild(this);
      }
      
      public function §\t\x0exo§(param1:String) : int
      {
         if(param1 == "C")
         {
            return 0;
         }
         if(param1 == "U")
         {
            return 1;
         }
         if(param1 == "R")
         {
            return 2;
         }
         return -1;
      }
      
      public function §\b\x07e\x19\x03§() : void
      {
         var _loc1_:int = int(§#UX^\x01§.§;\x057\x02§ * 0.5);
         var _loc2_:int = int(§#UX^\x01§.HEIGHT * 0.5);
         var _loc3_:GlowFilter = new GlowFilter(5583616,1,2 * §i1\x04q\x03§,2 * §i1\x04q\x03§,30);
         var _loc4_:int = 15654280;
         face = new Sprite();
         §In-\b\x02§ = new Element();
         §In-\b\x02§.setAlign(0,0);
         §In-\b\x02§.x = int((§#UX^\x01§.§;\x057\x02§ - §In-\b\x02§.width) * 0.5 - _loc1_);
         §In-\b\x02§.y = (§#UX^\x01§.HEIGHT - §In-\b\x02§.height) * 0.5 - _loc2_ - 1;
         §In-\b\x02§.pxx();
         §*L|)\x03§ = new Element();
         §*L|)\x03§.drawFrame(Gfx.main.get(null,"icon_flash"));
         §*L|)\x03§.x = -13;
         §*L|)\x03§.y = §#UX^\x01§.HEIGHT * 0.5 - 6;
         §8J\b\x02§ = new Element();
         §8J\b\x02§.x = 13;
         §8J\b\x02§.y = §#UX^\x01§.HEIGHT * 0.5 - 7;
         var _loc5_:TextField = §\x19\n\t\x01§.getField(_loc4_,8,-1);
         _loc5_.width = 12;
         _loc5_.x = 3 - int(_loc5_.width * 0.5);
         _loc5_.y = §#UX^\x01§.HEIGHT * 0.5 - 12;
         _loc5_.filters = [_loc3_];
         mojo = _loc5_;
         title = §\x19\n\t\x01§.getField(_loc4_,8,0);
         title.y = -§#UX^\x01§.HEIGHT * 0.5;
         title.filters = [_loc3_];
         var _loc6_:Element = new Element();
         _loc6_.drawFrame(Gfx.main.get(1,"cards"));
         face.addChild(§In-\b\x02§);
         face.addChild(_loc6_);
         face.addChild(_loc5_);
         face.addChild(title);
         face.addChild(§*L|)\x03§);
         face.addChild(§8J\b\x02§);
         §O\no%\x01§ = new Sprite();
         var _loc7_:Element = new Element();
         _loc7_.drawFrame(Gfx.main.get(0,"cards"));
         §O\no%\x01§.addChild(_loc7_);
         box = new Sprite();
         addChild(box);
         box.addChild(face);
         box.addChild(§O\no%\x01§);
      }
      
      public function §\x05c'u§(param1:int) : void
      {
         if(§A6h_\x01§ == null)
         {
            §A6h_\x01§ = §\x19\n\t\x01§.getField(16777215,8,-1,"nokia");
            face.addChild(§A6h_\x01§);
            §A6h_\x01§.filters = [new GlowFilter(0,1,2 * §i1\x04q\x03§,2 * §i1\x04q\x03§,20)];
            §A6h_\x01§.x = 7;
            §A6h_\x01§.y = 10;
            §A6h_\x01§.width = 20;
         }
         §A6h_\x01§.text = "x" + Std.string(param1);
         §A6h_\x01§.x = 10 - int(§A6h_\x01§.textWidth * 0.5);
         §A6h_\x01§.visible = param1 > 1;
      }
   }
}
