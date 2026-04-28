package
{
   import flash.Lib;
   import flash.display.MovieClip;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import pix.Anim;
   import pix.Sprite;
   
   public class Main
   {
      
      public static var root:MovieClip;
      
      public static var price:String;
      
      public static var mcw:int = 300;
      
      public static var mch:int = 120;
      
      public static var domain:String;
      
      public static var data:Object;
       
      
      public function Main()
      {
      }
      
      public static function main() : void
      {
         var _loc2_:* = null as Array;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         Codec.VERSION = Data.§L\x102d\x01§;
         Lang.init();
         var _loc1_:* = Lib.current.loaderInfo.parameters;
         Main.domain = Reflect.field(Lib.current.loaderInfo.parameters,"dom");
         Main.data = Codec.getData("data");
         if(Main.data == 1586)
         {
            _loc2_ = Type.getEnumConstructs(_CardType);
            Main.data = {
               "_priceCard":50,
               "_pricePack":460,
               "_priceTicket":10,
               "_tickets":0,
               "_totalTickets":0,
               "_cards":[],
               "_deal":{
                  "_card":_CardType.BUCKET,
                  "_price":8
               },
               "_lotteryCard":_CardType.BUCKET,
               "_lotteryWinner":{
                  "_name":"bumdum",
                  "_url":"http://www.frutiparc.com"
               }
            };
            _loc3_ = 0;
            while(_loc3_ < 100)
            {
               _loc3_++;
               _loc4_ = _loc3_;
               _loc5_ = 0;
               _loc6_ = 0;
               while(_loc6_ < 30)
               {
                  _loc6_++;
                  _loc7_ = _loc6_;
                  if(int(Std.random(10)) < 3)
                  {
                     _loc5_++;
                  }
               }
               Main.data._cards.push({
                  "_type":Type.createEnum(_CardType,_loc2_[_loc4_]),
                  "_num":_loc5_
               });
            }
         }
         Gfx.init();
         var _loc8_:§\x13pn\x15\x02§ = new §\x13pn\x15\x02§();
         Lib.current.addChild(_loc8_);
         var _loc9_:Number = 2;
         _loc8_.scaleY = _loc9_;
         _loc8_.scaleX = _loc9_;
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
         _loc5_.gridFitType = GridFitType.PIXEL;
         var _loc6_:TextFormat = _loc5_.getTextFormat();
         _loc6_.color = param1;
         _loc6_.font = param4;
         _loc6_.size = param2;
         _loc6_.align = [TextFormatAlign.LEFT,TextFormatAlign.CENTER,TextFormatAlign.RIGHT][param3 + 1];
         _loc5_.defaultTextFormat = _loc6_;
         _loc5_.selectable = false;
         return _loc5_;
      }
      
      public static function getEnum(param1:Class, param2:int) : Object
      {
         return Type.createEnum(param1,Type.getEnumConstructs(param1)[param2]);
      }
      
      public static function §,\x13\x14X\x03§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.setAnim(Gfx.main.getAnim("loading_bar"));
         var _loc2_:TextField = §\x19\n\t\x01§.getField(16777215,8,-1,"nokia");
         _loc2_.text = Lang.LOADING;
         _loc2_.width = Number(_loc2_.textWidth + 3);
         _loc2_.x = -(int(_loc2_.width * 0.5));
         _loc2_.y = -15;
         _loc1_.addChild(_loc2_);
         return _loc1_;
      }
      
      public static function §GFB*\x02§(param1:_CardType) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:Array = Main.data._cards;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_._type == param1)
            {
               _loc2_ = _loc5_;
               break;
            }
         }
         if(_loc2_ == null)
         {
            _loc2_ = {
               "_type":param1,
               "_num":0
            };
            Main.data._cards.push(_loc2_);
         }
         _loc2_._num = int(_loc2_._num) + 1;
      }
   }
}
