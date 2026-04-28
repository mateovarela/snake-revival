package
{
   import flash.Boot;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.text.TextField;
   import flash.ui.Mouse;
   import fx.Brandy;
   import fx.Flash;
   import pix.Anim;
   import pix.Frame;
   import pix.Text;
   
   public class Inter
   {
      
      public static var me:Inter;
       
      
      public var width:Number;
      
      public var timer:TextField;
      
      public var shields:Array;
      
      public var score:Text;
      
      public var root:flash.display.Sprite;
      
      public var §dQ\n'\x03§:Part;
      
      public var frutibar:§2Uh[\x01§;
      
      public function Inter()
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as pix.Sprite;
         if(Boot.skip_constructor)
         {
            return;
         }
         Inter.me = this;
         root = new flash.display.Sprite();
         Game.me.dm.add(root,Game.Umu$);
         root.x = Game.MARGIN;
         root.y = -100;
         width = Stage.me.width;
         var _loc1_:DropShadowFilter = new DropShadowFilter(1,90,17408,1,0,0,4);
         var _loc2_:int = 0;
         score = new Text(Gfx.§e@\fX§);
         root.addChild(score);
         score.x = _loc2_;
         score.y = 5;
         score.ec = Number(score.ec + 1);
         score.filters = [_loc1_];
         _x_leaderboardScore();
         _loc2_ = _loc2_ + 39;
         var _loc3_:int = 28;
         timer = Cs.getField(16777215,8,-1);
         timer.x = int(width - _loc3_);
         timer.y = 1;
         timer.text = "00:00";
         timer.width = Number(timer.textWidth + 5);
         root.addChild(timer);
         timer.filters = [_loc1_];
         shields = [];
         var _loc4_:int = 0;
         var _loc5_:int = Game.me.§(A;o\x01§[0];
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc7_ = new pix.Sprite();
            _loc7_.drawFrame(Gfx.main.get(0,"shield"),0,0);
            _loc7_.x = _loc2_;
            _loc7_.y = 2;
            root.addChild(_loc7_);
            _loc2_ = _loc2_ + 8;
            shields.push(_loc7_);
         }
         _loc2_ = _loc2_ + 1;
         frutibar = new §2Uh[\x01§(int(width - 100),0);
         frutibar.x = _loc2_;
         frutibar.y = 2;
         _x_updateSpriteFruitibar(0);
      }
      
      public function §\x05\x13iv\x03§() : void
      {
         if(Game.me.controlType != §o\x0f\x10E\x01§.§\x19%{\x03§ || Game.me.demo[0] || Game.me.mode == GameMode.§\nu((\x02§)
         {
            if(§dQ\n'\x03§ != null)
            {
               §dQ\n'\x03§.kill();
               §dQ\n'\x03§ = null;
            }
            Mouse.show();
            return;
         }
         if(§dQ\n'\x03§ == null)
         {
            §dQ\n'\x03§ = Part.get();
            §dQ\n'\x03§.sprite.setAnim(Gfx.main.getAnim("mouse_icon"));
            §dQ\n'\x03§.sprite.anim.stop();
            §dQ\n'\x03§.FFfR();
            Stage.me.dm.add(§dQ\n'\x03§.sprite,Stage.DP_FX);
         }
         var _loc1_:* = Cs.§\x0b@;v\x01§(Stage.me.root);
         _loc1_.x = Number(Number(_loc1_.x) + Number(Brandy.DECAL.x));
         _loc1_.y = Number(Number(_loc1_.y) + Number(Brandy.DECAL.y));
         _loc1_ = Stage.me.clamp(Number(_loc1_.x),Number(_loc1_.y),5);
         §dQ\n'\x03§.x = Number(_loc1_.x);
         §dQ\n'\x03§.y = Number(_loc1_.y);
         var _loc2_:Boolean = Boolean(Stage.me.isIn(Number(_loc1_.x),Number(_loc1_.y),8));
         if(_loc2_)
         {
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
      }
      
      public function §\rs;\x07\x03§(param1:Number) : void
      {
         timer.text = Cs.formatTime(param1);
         Game.me.gameLog.chrono = param1;
      }
      
      public function §}k\x1c\x0b\x01§(param1:Boolean) : void
      {
         if(§dQ\n'\x03§ == null)
         {
            return;
         }
         §dQ\n'\x03§.sprite.anim.play(!!param1?1:0);
         if(!!param1 && int(Game.me.§\x0e\b$\r§[0] % 10) == 0)
         {
            new Flash(§dQ\n'\x03§.sprite);
         }
      }
      
      public function §\x1dpZ$\x03§() : void
      {
         var _loc5_:* = null as pix.Sprite;
         var _loc6_:int = 0;
         var _loc1_:int = Game.me.shield[0];
         var _loc2_:Number = Game.me.§ ;f?§[0];
         var _loc3_:int = 0;
         var _loc4_:Array = shields;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = 0;
            if(_loc1_ > 0)
            {
               _loc1_--;
               _loc6_ = 9;
            }
            else if(_loc2_ > 0)
            {
               _loc6_ = int(_loc2_ * 9);
               _loc2_ = 0;
            }
            _loc5_.drawFrame(Gfx.main.get(_loc6_,"shield"));
         }
      }
      
      public function _x_leaderboardScore() : void
      {
         var _loc1_:String = Std.string(Game.me.score[0]);
         while(_loc1_.length < 6)
         {
            _loc1_ = "0" + _loc1_;
         }
         score.setText(_loc1_);
         if(Game.me.score[0] == 0)
         {
            return;
         }
         score.§[o\x02\r§(0,2,40,90,0.8);
      }
      
      public function _x_updateSpriteFruitibar(param1:Number) : void
      {
         frutibar.set(param1);
      }
   }
}
