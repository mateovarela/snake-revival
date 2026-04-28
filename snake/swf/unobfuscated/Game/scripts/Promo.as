package
{
   import flash.Boot;
   import flash.display.Sprite;
   import flash.external.ExternalInterface;
   import flash.filters.DropShadowFilter;
   import flash.text.TextField;
   
   public class Promo extends Sprite
   {
      
      public static var §;\x057\x02§:int = 136;
      
      public static var HEIGHT:int = 200;
       
      
      public var but:But;
      
      public function Promo()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         initBg();
         but = new But(Lang.§J)\x11\x01§,subscribe);
         addChild(but);
         but.x = Promo.§;\x057\x02§ * 0.5;
         but.y = Promo.HEIGHT - 20;
         §\f@7l\x02§();
      }
      
      public function update() : void
      {
         but.update();
      }
      
      public function subscribe() : void
      {
         ExternalInterface.call("_twSignUp",[]);
      }
      
      public function red(param1:String) : String
      {
         return "<font color=\'#FF6666\'>" + param1 + "</font>";
      }
      
      public function §\f@7l\x02§() : void
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as TextField;
         var _loc1_:int = 7;
         var _loc2_:Number = 20;
         if(Main.slogan == null)
         {
            Main.slogan = "param slogan not found!";
         }
         var _loc3_:Array = Main.slogan.split(";");
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc3_.length))
         {
            _loc5_ = _loc3_[_loc4_];
            _loc4_++;
            _loc6_ = Cs.getField(16777215,8,0,"nokia");
            _loc6_.width = Promo.§;\x057\x02§ - (_loc1_ + 1);
            _loc6_.multiline = true;
            _loc6_.wordWrap = true;
            _loc6_.htmlText = center(_loc5_);
            _loc6_.x = _loc1_;
            _loc6_.y = _loc2_;
            _loc6_.height = Number(_loc6_.textHeight + 6);
            addChild(_loc6_);
            _loc2_ = Number(_loc2_ + (Number(_loc6_.height + 6)));
            _loc6_.filters = [new DropShadowFilter(1,90,Gfx.col("green_1"),1,0,0,10)];
         }
      }
      
      public function initBg() : void
      {
         var _loc1_:int = 1;
         var _loc2_:int = 1;
         graphics.beginFill(16777215);
         graphics.drawRect(0,0,Promo.§;\x057\x02§,Promo.HEIGHT);
         graphics.beginFill(Gfx.col("green_1"));
         graphics.drawRect(_loc1_,_loc1_,Promo.§;\x057\x02§ - _loc1_ * 2,Promo.HEIGHT - _loc1_ * 2);
         var _loc3_:int = _loc1_ + _loc2_;
         graphics.beginFill(Gfx.col("green_0"));
         graphics.drawRect(_loc3_,_loc3_,Promo.§;\x057\x02§ - _loc3_ * 2,Promo.HEIGHT - _loc3_ * 2);
         graphics.beginFill(Gfx.col("green_2"));
         graphics.drawRect(0,Promo.HEIGHT,Promo.§;\x057\x02§,1);
      }
      
      public function center(param1:String) : String
      {
         return "<p align=\'center\'>" + param1 + "</p>";
      }
   }
}
