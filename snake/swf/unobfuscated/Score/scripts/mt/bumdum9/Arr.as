package mt.bumdum9
{
   import mt.Rand;
   
   public class Arr
   {
       
      
      public function Arr()
      {
      }
      
      public static function shuffle(param1:Array, param2:Rand = undefined) : void
      {
         var _loc3_:Function = Std.random;
         if(param2 != null)
         {
            _loc3_ = param2.random;
         }
         var _loc4_:Array = [];
         while(int(param1.length) > 0)
         {
            _loc4_.push(param1.pop());
         }
         while(int(_loc4_.length) > 0)
         {
            param1.insert(int(_loc3_(int(param1.length) + 1)),_loc4_.pop());
         }
      }
   }
}
