package
{
   import flash.display.BlendMode;
   import flash.display.Sprite;
   import flash.§f$\n8\x01§;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import mt.db.§\x0b\b\x0bq\x02§;
   import pix.Element;
   import pix.Frame;
   
   public class §%uF\x01§ extends Sprite
   {
      
      public static var §;\x057\x02§:int = 102;
      
      public static var HEIGHT:int = 94;
       
      
      public var data:Object;
      
      public function §%uF\x01§(param1:Object = undefined)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super();
         data = param1;
         var _loc2_:Element = new Element();
         var _loc3_:int = Boolean(data._visible)?0:1;
         _loc2_.drawFrame(Gfx.bg.get(_loc3_),0,0);
         addChild(_loc2_);
         if(_loc3_ == 0)
         {
            §1u')\x02§();
         }
      }
      
      public function §1u')\x02§() : void
      {
         var _loc1_:§#UX^\x01§ = new §#UX^\x01§();
         _loc1_.§)QR\x01§(data._id);
         _loc1_.x = §%uF\x01§.§;\x057\x02§ * 0.5;
         _loc1_.y = §%uF\x01§.HEIGHT * 0.5 - 11;
         _loc1_.coef = 0.25;
         _loc1_.§]Pzm\x03§();
         addChild(_loc1_);
         if(data._success)
         {
            _loc1_.blendMode = BlendMode.LAYER;
            _loc1_.alpha = 0.25;
         }
         var _loc2_:String = §\x0b\b\x0bq\x02§.§T\x06j'\x03§(data._desc).toUpperCase();
         var _loc3_:TextField = §\x19\n\t\x01§.getField(16777215,8,-1);
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         _loc3_.width = §%uF\x01§.§;\x057\x02§;
         _loc3_.text = _loc2_;
         _loc3_.height = Number(_loc3_.textHeight + 4);
         _loc3_.x = int((§%uF\x01§.§;\x057\x02§ - (Number(_loc3_.textWidth + 3))) * 0.5);
         _loc3_.y = §%uF\x01§.HEIGHT - (int(Number(12 + _loc3_.textHeight * 0.5)));
         addChild(_loc3_);
         if(!data._success)
         {
            return;
         }
         _loc3_.alpha = 0.5;
         var _loc4_:TextField = §\x19\n\t\x01§.getField(16729156,8,-1,"nokia");
         _loc4_.text = Lang.SUCCESS;
         addChild(_loc4_);
         _loc4_.x = _loc1_.x - (_loc4_.textWidth + 3) * 0.5;
         _loc4_.y = _loc1_.y - 8;
         _loc4_.filters = [new GlowFilter(16777215,1,2,2,100)];
      }
   }
}
