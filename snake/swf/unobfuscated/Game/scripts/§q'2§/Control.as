package §q'2§
{
   import flash.Boot;
   import flash.Lib;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.net.SharedObject;
   import flash.text.TextField;
   import pix.Element;
   import pix.Frame;
   
   public class Control extends Panel
   {
      
      public static var me:Control;
       
      
      public var next:Function;
      
      public var §In-\b\x02§:Element;
      
      public var fieldDesc:TextField;
      
      public var §=;Hv§:Object;
      
      public var buts:Array;
      
      public function Control(param1:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         next = param1;
         pww = 200;
         phh = 150;
         Control.me = this;
         super();
         Game.me.dm.add(this,10);
         Game.me.action = update;
         Lib.current.stage.addEventListener(MouseEvent.CLICK,validate);
      }
      
      public function validate(param1:*) : void
      {
         if(§=;Hv§ == null)
         {
            return;
         }
         var _loc2_:SharedObject = SharedObject.getLocal("snake");
         if(_loc2_.data.controlType == §=;Hv§)
         {
            _loc2_.data.§+(5V\x02§ = _loc2_.data.§+(5V\x02§ + 1;
         }
         else
         {
            _loc2_.data.§+(5V\x02§ = 0;
         }
         _loc2_.data.controlType = §=;Hv§;
         _loc2_.flush();
         leave();
         Lib.current.stage.removeEventListener(MouseEvent.CLICK,validate);
      }
      
      override public function §3\f;8§() : void
      {
         var _loc3_:* = null as §=\x1a5%\x01§;
         var _loc1_:int = 0;
         var _loc2_:Array = buts;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.update();
         }
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      public function §\f}2§(param1:Object) : void
      {
         §=;Hv§ = param1;
         §\x13pcA\x03§(param1);
      }
      
      override public function kill() : void
      {
         super.kill();
         next();
      }
      
      public function §S%;3\x01§(param1:Object) : void
      {
         if(§=;Hv§ != param1)
         {
            return;
         }
         §\x13pcA\x03§();
         §=;Hv§ = null;
         §In-\b\x02§.visible = false;
      }
      
      public function §\x13pcA\x03§(param1:Object = undefined) : void
      {
         var _loc2_:String = "";
         if(param1 != null)
         {
            _loc2_ = Lang.§9X~g§[§=;Hv§];
         }
         fieldDesc.htmlText = _loc2_;
         §\x04\x0f3Q\x02§(fieldDesc,width);
         §In-\b\x02§.visible = true;
         §In-\b\x02§.drawFrame(Gfx.main.get(int([2,3,0][param1]),"art_control"));
         if(param1 == 3)
         {
            §In-\b\x02§.visible = false;
         }
      }
      
      override public function display() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as §=\x1a5%\x01§;
         super.display();
         §\x05`FE§(Lang.§6[yv\x02§);
         §In-\b\x02§ = new Element();
         §In-\b\x02§.x = Cs.mcw * 0.5;
         §In-\b\x02§.y = 80;
         box.addChild(§In-\b\x02§);
         §In-\b\x02§.filters = [new DropShadowFilter(3,45,Gfx.col("green_1"),1,0,0,10)];
         buts = [];
         var _loc1_:int = 6;
         var _loc2_:int = 0;
         while(_loc2_ < 3)
         {
            _loc2_++;
            _loc3_ = _loc2_;
            _loc4_ = new §=\x1a5%\x01§(_loc3_);
            _loc4_.x = Number(Number(Cs.mcw * 0.5 + (_loc3_ - 1.5) * (§=\x1a5%\x01§.§;\x057\x02§ + 2)) + 1);
            _loc4_.y = Number(§In-\b\x02§.y + 40);
            box.addChild(_loc4_);
            buts.push(_loc4_);
         }
         fieldDesc = §\x19\n\t\x01§.getField(14548906,8,-1,"nokia");
         fieldDesc.x = Game.MARGIN;
         fieldDesc.y = Number(§In-\b\x02§.y + 60);
         fieldDesc.multiline = true;
         fieldDesc.wordWrap = true;
         fieldDesc.width = width;
         fieldDesc.filters = [new GlowFilter(Gfx.col("green_1"),1,2,2,100)];
         box.addChild(fieldDesc);
         var _loc5_:SharedObject = SharedObject.getLocal("snake");
         var _loc6_:* = _loc5_.data.controlType;
         if(_loc6_ == null)
         {
            _loc6_ = 0;
         }
         buts[_loc6_].select();
      }
   }
}
