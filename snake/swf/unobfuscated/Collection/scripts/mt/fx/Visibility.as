package mt.fx
{
   import flash.display.DisplayObject;
   import flash.§f$\n8\x01§;
   import flash.filters.BlurFilter;
   
   public class Visibility extends Fx
   {
       
      
      public var root:DisplayObject;
      
      public var §MIvi\x03§:Object;
      
      public var §YHqr\x02§:Object;
      
      public var §Ib(`\x03§:Boolean;
      
      public var alpha:Number;
      
      public function Visibility(param1:DisplayObject = undefined)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super();
         root = param1;
      }
      
      public function §/\x15kH§(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(§Ib(`\x03§)
         {
            root.alpha = param1 * alpha;
         }
         if(§YHqr\x02§ != null)
         {
            root.filters = [new BlurFilter(§YHqr\x02§.x * (1 - param1),§YHqr\x02§.y * (1 - param1))];
         }
         if(§MIvi\x03§ != null)
         {
            _loc2_ = int(§MIvi\x03§.sx);
            if(_loc2_ == -1)
            {
               root.scaleX = §MIvi\x03§.scx / param1;
            }
            else if(_loc2_ == 1)
            {
               root.scaleX = §MIvi\x03§.scx * param1;
            }
            _loc2_ = int(§MIvi\x03§.sy);
            if(_loc2_ == -1)
            {
               root.scaleY = §MIvi\x03§.scy / param1;
            }
            else if(_loc2_ == 1)
            {
               root.scaleY = §MIvi\x03§.scy * param1;
            }
         }
      }
   }
}
