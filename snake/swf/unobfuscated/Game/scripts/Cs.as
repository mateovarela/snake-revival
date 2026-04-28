package
{
   import flash.Lib;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import haxe.§Xew§;
   import pix.Anim;
   import pix.Sprite;
   
   public class Cs implements §Xew§
   {
      
      public static var init__:Boolean;
      
      public static var mcw:int = 400;
      
      public static var mch:int = 210;
      
      public static var §@f2[\x02§:Array = [];
      
      public static var §v\x1e\x1d=\x03§:_x_TYPE = null;
      
      public static var §Mw\x11/\x02§:Array = [];
      
      public static var §\t;\x1cH\x02§:Array;
      
      public static var §T!)M\x03§:int = 6;
      
      public static var §n\x0e?\x1e\x01§:int = 6;
      
      public static var §eQU\x19\x01§:int = 120;
      
      public static var §\x1a60^\x02§:Number = 0.3;
      
      public static var §0'`;\x01§:Number = 1.3;
      
      public static var §+k-\t§:int = 2;
      
      public static var §\x1eT|\x17\x02§:int = 6;
      
      public static var §QF\x1cT\x01§:Number = 0.105;
      
      public static var §;B0C§:int = 360;
      
      public static var §B;O_\x03§:int = 360;
      
      public static var §Sw\\\x01§:int = 100;
      
      public static var §4@Ua\x03§:int = 200;
      
      public static var §]-a8\x01§:int = 90;
      
      public static var §\x1f\x18\r\x1e§:int = 10000;
      
      public static var _x_tempsClignotement:int = 80;
      
      public static var §;\rFd\x03§:Array = [65,90,69,82,84,89];
      
      public static var PIX:String = "<font color=\'#92d930\'>.</font>";
      
      public static var §[y\n*\x01§:String = "<font color=\'#52b31e\'>.</font>";
       
      
      public function Cs()
      {
      }
      
      public static function getField(param1:int = 16777215, param2:int = 10, param3:int = 0, param4:String = undefined) : TextField
      {
         if(param4 == null)
         {
            param4 = "04b03";
         }
         var _loc5_:TextField = new TextField();
         _loc5_.selectable = true;
         _loc5_.embedFonts = true;
         var _loc6_:TextFormat = _loc5_.getTextFormat();
         _loc6_.color = param1;
         _loc6_.font = param4;
         _loc6_.size = param2;
         _loc6_.align = [TextFormatAlign.LEFT,TextFormatAlign.CENTER,TextFormatAlign.RIGHT][param3 + 1];
         _loc5_.defaultTextFormat = _loc6_;
         return _loc5_;
      }
      
      public static function getEnum(param1:Class, param2:int) : Object
      {
         return Type.createEnum(param1,Type.getEnumConstructs(param1)[param2]);
      }
      
      public static function formatTime(param1:Number) : String
      {
         var _loc2_:String = Std.string(int(int(param1 / 1000) % 60));
         var _loc3_:String = Std.string(int(int(param1 / 60000) % 60));
         var _loc4_:int = int(param1 / 3600000);
         while(_loc2_.length < 2)
         {
            _loc2_ = "0" + _loc2_;
         }
         while(_loc3_.length < 2)
         {
            _loc3_ = "0" + _loc3_;
         }
         if(_loc4_ == 0)
         {
            return _loc3_ + ":" + _loc2_;
         }
         var _loc5_:String = Std.string(_loc4_);
         while(_loc5_.length < 2)
         {
            _loc5_ = "0" + _loc5_;
         }
         return _loc5_ + ":" + _loc3_ + ":" + _loc2_;
      }
      
      public static function §,\x13\x14X\x03§() : Object
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.x = Cs.mcw * 0.5;
         _loc1_.y = Cs.mch * 0.5;
         _loc1_.setAnim(Gfx.main.getAnim("loading_bar"));
         var _loc2_:TextField = Cs.getField(16777215,8,-1,"nokia");
         _loc2_.text = Lang.LOADING;
         _loc2_.width = Number(_loc2_.textWidth + 3);
         _loc2_.x = -(int(_loc2_.width * 0.5));
         _loc2_.y = -15;
         _loc1_.addChild(_loc2_);
         return {
            "base":_loc1_,
            "field":_loc2_,
            "field2":_loc2_,
            "n":0
         };
      }
      
      public static function §\x0b@;v\x01§(param1:DisplayObject) : Object
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         while(param1 != null)
         {
            _loc2_ = Number(_loc2_ + param1.x);
            _loc3_ = Number(_loc3_ + param1.y);
            param1 = param1.parent;
         }
         var _loc4_:MovieClip = Lib.current;
         _loc2_ = -(_loc2_ - _loc4_.mouseX * 0.5);
         _loc3_ = -(_loc3_ - _loc4_.mouseY * 0.5);
         return {
            "x":_loc2_,
            "y":_loc3_
         };
      }
   }
}
