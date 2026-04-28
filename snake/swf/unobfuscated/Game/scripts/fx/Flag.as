package fx
{
   import flash.Boot;
   import flash.text.TextField;
   import mt.bumdum9.Filt;
   
   public class Flag extends §\x12\bHb\x03§
   {
      
      public static var me:Flag;
       
      
      public var step:int;
      
      public var score:Array;
      
      public var field:TextField;
      
      public function Flag(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         Flag.me = this;
         field = Cs.getField(16777215,8,-1);
         card.gfx.§In-\b\x02§.addChild(field);
         Filt.glow(field,2,4,0);
         step = 0;
      }
      
      override public function update() : void
      {
         super.update();
         if(step == 1)
         {
            _x_leaderboardScore();
         }
      }
      
      public function _x_leaderboardScore() : void
      {
         var _loc1_:int = 2 * score[0] - Game.me.score[0];
         field.text = Std.string(_loc1_);
         field.x = -(int(field.textWidth * 0.5));
         if(_loc1_ < 0)
         {
            field.visible = false;
            card.§\x1b\x03\x11K\x02§();
            card.cash(score[0]);
            kill();
         }
      }
      
      override public function kill() : void
      {
         super.kill();
         Flag.me = null;
         field.parent.removeChild(field);
      }
      
      public function _x_act() : void
      {
         score = [Game.me.score[0]];
         _x_leaderboardScore();
         card.§R&2Q\x03§();
         step = 1;
         card.§\x0fB}F\x03§();
      }
   }
}
