package
{
   import flash.display.Sprite;
   import flash.§f$\n8\x01§;
   import flash.text.TextField;
   
   public class §k\f_(\x02§ extends Sprite
   {
      
      public static var MARGIN:int = 52;
       
      
      public var mid:int;
      
      public var mcw:int;
      
      public var mch:int;
      
      public function §k\f_(\x02§()
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         mcw = §\x13pn\x15\x02§.§;\x057\x02§ - §k\f_(\x02§.MARGIN;
         mch = §\x13pn\x15\x02§.HEIGHT;
         super();
         x = §k\f_(\x02§.MARGIN;
         §\x13pn\x15\x02§.§{\x01§.addChild(this);
      }
      
      public function update() : void
      {
      }
      
      public function kill() : void
      {
         §\x13pn\x15\x02§.§{\x01§.removeChild(this);
      }
      
      public function init() : void
      {
      }
      
      public function §)O\x1f\x16§(param1:String) : TextField
      {
         var _loc2_:TextField = §\x19\n\t\x01§.getField(Gfx.col("green_0",50),20,-1,"upheaval");
         _loc2_.text = param1;
         _loc2_.width = Number(_loc2_.textWidth + 4);
         _loc2_.x = int((mcw - _loc2_.width) * 0.5);
         return _loc2_;
      }
   }
}
