package
{
   import flash.Boot;
   import flash.text.TextField;
   
   public class §}\n\x16\n\x03§ extends But
   {
       
      
      public var §m\tM6§:Array;
      
      public var §#\x06Jt§:Array;
      
      public var field:TextField;
      
      public var §Y;\x16~§:Array;
      
      public function §}\n\x16\n\x03§(param1:Function = undefined, param2:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         §Y;\x16~§ = [0,8912896,0,4456448];
         §m\tM6§ = [16777215,16777215,16777215,16777215];
         §#\x06Jt§ = [null,null,null,null];
         field = §\x19\n\t\x01§.getField(16777215,8,-1,"nokia");
         field.y = field.y - 7;
         field.text = param2;
         addChild(field);
         over();
      }
      
      override public function §p7\x174§(param1:int) : void
      {
         var _loc3_:int = 0;
         super.§p7\x174§(param1);
         graphics.clear();
         var _loc2_:* = §#\x06Jt§[param1];
         if(_loc2_ != null)
         {
            _loc3_ = 1;
            graphics.beginFill(_loc2_);
            graphics.drawRect(-ww * 0.5,-(_loc3_ + hh * 0.5),ww,hh + 2 * _loc3_);
         }
         graphics.beginFill(int(§Y;\x16~§[param1]));
         graphics.drawRect(-ww * 0.5,-hh * 0.5,ww,hh);
         field.textColor = int(§m\tM6§[param1]);
      }
      
      override public function §\x07EvB\x01§(param1:int, param2:int) : void
      {
         field.width = param1;
         field.x = -(int((field.textWidth + 3) * 0.5));
         super.§\x07EvB\x01§(param1,param2);
      }
   }
}
