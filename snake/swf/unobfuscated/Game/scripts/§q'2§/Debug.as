package §q'2§
{
   import flash.Boot;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import mt.bumdum9.Filt;
   
   public class Debug extends flash.display.Sprite
   {
       
      
      public var fields:Array;
      
      public function Debug()
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as TextField;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         fields = [];
         var _loc1_:int = 0;
         while(_loc1_ < 3)
         {
            _loc1_++;
            _loc2_ = _loc1_;
            _loc3_ = Cs.getField(16777215,8,-1,"nokia");
            _loc3_.text = "test";
            _loc3_.width = Cs.mcw;
            _loc3_.x = _loc2_ * 60;
            addChild(_loc3_);
            fields.push(_loc3_);
         }
         addEventListener(Event.ENTER_FRAME,update);
         Game.me.dm.add(this,10);
         Filt.glow(this,2,12,17408);
         y = Cs.mch - 12;
      }
      
      public function update(param1:*) : void
      {
         var _loc5_:* = null as TextField;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = fields;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            switch(_loc2_)
            {
               case 0:
                  _loc5_.text = "sprites : " + int(pix.Sprite.all.length);
                  break;
               case 1:
                  _loc5_.text = "parts : " + int(Game.me.parts.length);
                  break;
               case 2:
                  _loc5_.text = "fx : " + int(Game.me.effects.length);
            }
            _loc2_++;
         }
      }
      
      public function kill() : void
      {
         removeEventListener(Event.ENTER_FRAME,update);
         parent.removeChild(this);
      }
   }
}
