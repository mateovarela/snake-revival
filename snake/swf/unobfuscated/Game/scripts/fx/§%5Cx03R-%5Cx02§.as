package fx
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.text.TextField;
   import mt.bumdum9.Col;
   
   public class §\x03R-\x02§ extends Fx
   {
      
      public static var me:§\x03R-\x02§;
       
      
      public var lifetime:Number;
      
      public var §m\x1apt\x02§:TextField;
      
      public var buts:Array;
      
      public var box:Sprite;
      
      public function §\x03R-\x02§()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         §\x03R-\x02§.me = this;
         super();
         box = new Sprite();
         Game.me.dm.add(box,0);
         buts = [];
         var _loc1_:But = new But(Lang.OPTIONS,Game.me.§Q(\x17\x1d\x01§,null,null,4);
         _loc1_.x = 28;
         _loc1_.y = 74;
         _loc1_.mx = 2;
         Col.setColor(_loc1_,0,20);
         box.addChild(_loc1_);
         buts.push(_loc1_);
         var _loc2_:But = new But(Lang.QUIT,leave,null,null,4);
         _loc2_.x = 28;
         _loc2_.y = 90;
         _loc2_.mx = 2;
         Col.setColor(_loc2_,0,20);
         box.addChild(_loc2_);
         buts.push(_loc2_);
         new _x_EtirerJeu(48);
         new §\x15H)L§(-8);
         §m\x1apt\x02§ = Cs.getField(13434760,8,-1,"nokia");
         §m\x1apt\x02§.y = Cs.mch;
         box.addChild(§m\x1apt\x02§);
      }
      
      override public function update() : void
      {
         var _loc3_:* = null as But;
         var _loc4_:* = null as BitmapData;
         var _loc5_:* = null as ColorTransform;
         var _loc6_:* = null as ColorTransform;
         if(Panel.me != null)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:Array = buts;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.update();
         }
         if(§m\x1apt\x02§.y > Cs.mch - 13)
         {
            §m\x1apt\x02§.y = §m\x1apt\x02§.y - 1;
         }
         §m\x1apt\x02§.htmlText = Lang.§9X~g§[Game.me.controlType.index];
         §m\x1apt\x02§.width = Number(§m\x1apt\x02§.textWidth + 3);
         §m\x1apt\x02§.x = int((Cs.mcw - §m\x1apt\x02§.width) * 0.5);
         if(int(Game.me.§\x0e\b$\r§[0] % 2) == 0)
         {
            _loc4_ = Stage.me.gore.bitmapData;
            _loc5_ = new ColorTransform(1,1,1,1,0,0,0,-10);
            _loc6_ = new ColorTransform(1,1,1,1,0,0,0,-10);
            _loc4_.colorTransform(_loc4_.rect,_loc6_);
            Stage.me.§~i\x18[\x02§(_loc4_.rect);
         }
      }
      
      public function leave() : void
      {
         if(Panel.me != null)
         {
            return;
         }
         kill();
         if(sn.dead)
         {
            Game.me.endGame();
            return;
         }
         Game.me.exit();
      }
      
      override public function kill() : void
      {
         super.kill();
         box.parent.removeChild(box);
      }
   }
}
