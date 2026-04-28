package §q'2§
{
   import flash.Boot;
   import flash.net.SharedObject;
   import flash.system.System;
   import flash.text.TextField;
   
   public class Pause extends Panel
   {
       
      
      public var buts:Array;
      
      public var §p\\\x1f§:But;
      
      public var §/5H`\x02§:But;
      
      public function Pause()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         pww = 100;
         phh = 110;
         super();
         Game.me.dm.add(this,10);
      }
      
      override public function §3\f;8§() : void
      {
         var _loc3_:* = null as But;
         super.§3\f;8§();
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
      
      public function §jcLg\x01§() : void
      {
         var _loc5_:int = 0;
         var _loc1_:SharedObject = SharedObject.getLocal("snake");
         var _loc2_:* = _loc1_.data.gore;
         if(_loc2_ == null)
         {
            _loc2_ = true;
         }
         _loc2_ = !_loc2_;
         _loc1_.data.gore = _loc2_;
         _loc1_.flush();
         Game.me.§L\x1e9\x02§(_loc2_);
         §\x1b\x0bn@\x01§();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < 628)
         {
            _loc4_++;
            _loc5_ = _loc4_;
            _loc3_.push(int(Math.round(Math.cos(_loc5_ * 0.01) * 1000)));
         }
         System.setClipboard(_loc3_.join(","));
      }
      
      public function §3wB@§() : void
      {
         var _loc1_:SharedObject = SharedObject.getLocal("snake");
         var _loc2_:int = _loc1_.data.controlType;
         var _loc3_:int = int((_loc2_ + 1) % 3);
         _loc1_.data.controlType = _loc3_;
         Game.me.§\n\x0b#\t\x03§(§\x19\n\t\x01§.getEnum(§o\x0f\x10E\x01§,_loc3_));
         _loc1_.flush();
         §bz[$\x03§();
      }
      
      override public function kill() : void
      {
         §/5H`\x02§.kill();
         §p\\\x1f§.kill();
         super.kill();
         Game.me.§\x12NF§ = null;
      }
      
      public function §$-p\x03§(param1:String) : TextField
      {
         var _loc2_:TextField = Cs.getField(16777215,8,-1,"nokia");
         _loc2_.text = param1;
         _loc2_.width = Number(_loc2_.textWidth + 3);
         _loc2_.x = int((Cs.mcw - _loc2_.width) * 0.5);
         box.addChild(_loc2_);
         return _loc2_;
      }
      
      public function §\x1b\x0bn@\x01§() : void
      {
         var _loc1_:SharedObject = SharedObject.getLocal("snake");
         var _loc2_:* = _loc1_.data.gore;
         if(_loc2_ == null)
         {
            _loc2_ = true;
         }
         §p\\\x1f§.§\x05`FE§(!!_loc2_?Lang.YES:Lang.NO,null);
      }
      
      public function §bz[$\x03§() : void
      {
         var _loc1_:SharedObject = SharedObject.getLocal("snake");
         var _loc2_:int = _loc1_.data.controlType;
         §/5H`\x02§.§\x05`FE§(Lang.§\x13o'\x1c\x02§[_loc2_],null);
      }
      
      override public function display() : void
      {
         super.display();
         §\x05`FE§(Lang.§cT\x1e\x12\x01§);
         buts = [];
         var _loc1_:Number = Number((Cs.mch - phh) * 0.5 + 20);
         var _loc2_:TextField = §$-p\x03§(Lang.CONTROL);
         _loc2_.y = _loc1_;
         _loc1_ = Number(_loc1_ + 14);
         var _loc3_:But = new But("",§3wB@§,null,null);
         _loc3_.x = Cs.mcw * 0.5;
         _loc3_.y = _loc1_;
         box.addChild(_loc3_);
         buts.push(_loc3_);
         §/5H`\x02§ = _loc3_;
         §bz[$\x03§();
         _loc1_ = Number(_loc1_ + 16);
         var _loc4_:TextField = §$-p\x03§(Lang.GORE);
         _loc4_.y = _loc1_;
         _loc1_ = Number(_loc1_ + 14);
         var _loc5_:But = new But("",§jcLg\x01§,null,null);
         _loc5_.x = Cs.mcw * 0.5;
         _loc5_.y = _loc1_;
         box.addChild(_loc5_);
         buts.push(_loc5_);
         §p\\\x1f§ = _loc5_;
         §\x1b\x0bn@\x01§();
         var _loc6_:But = new But(Lang.§5\\q\x01§,fadeOut,null);
         _loc6_.x = Cs.mcw * 0.5;
         _loc6_.y = (Cs.mch + phh) * 0.5 - 16;
         buts.push(_loc6_);
         box.addChild(_loc6_);
      }
   }
}
