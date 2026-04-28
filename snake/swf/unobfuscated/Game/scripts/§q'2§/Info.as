package §q'2§
{
   import flash.Boot;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   
   public class Info extends Panel
   {
      
      public static var TIME:int = 8;
       
      
      public var title:String;
      
      public var timer:int;
      
      public var §K\n4o§:TextField;
      
      public var desc:String;
      
      public var but:But;
      
      public function Info(param1:String = undefined, param2:String = undefined, param3:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         pww = 200;
         phh = 92;
         timer = param3;
         title = param1;
         desc = param2;
         super();
         Game.me.dm.add(this,2);
         Game.me.action = update;
         timer = Info.TIME * 40;
      }
      
      override public function §3\f;8§() : void
      {
         super.§3\f;8§();
         timer = timer - 1;
         §K\n4o§.text = Lang.§W8y\r\x01§ + int(timer / 40) + " " + Lang.SECONDES;
         if(timer < 0)
         {
            if(§K\n4o§.visible)
            {
               §K\n4o§.visible = false;
               but = new But(Lang.START,leave);
               box.addChild(but);
               but.y = §K\n4o§.y;
               but.x = Cs.mcw * 0.5;
            }
            but.update();
         }
      }
      
      override public function kill() : void
      {
         super.kill();
         Game.me.§[\x16u\x01\x01§();
      }
      
      override public function display() : void
      {
         super.display();
         §\x05`FE§(title);
         var _loc1_:TextField = §\x19\n\t\x01§.getField(14548906,8,-1,"nokia");
         _loc1_.x = Game.MARGIN;
         _loc1_.y = 82;
         _loc1_.multiline = true;
         _loc1_.wordWrap = true;
         _loc1_.width = width;
         _loc1_.filters = [new GlowFilter(Gfx.col("green_1"),1,2,2,100)];
         box.addChild(_loc1_);
         _loc1_.text = desc;
         §\x04\x0f3Q\x02§(_loc1_);
         §K\n4o§ = §\x19\n\t\x01§.getField(14548906,8,-1,"nokia");
         §K\n4o§.text = "";
         §\x04\x0f3Q\x02§(§K\n4o§);
         §K\n4o§.y = 132;
         box.addChild(§K\n4o§);
      }
   }
}
