package
{
   import haxe.§Xew§;
   
   public class Data implements §Xew§
   {
      
      public static var init__:Boolean;
      
      public static var §L\x102d\x01§:String = "0";
      
      public static var CARDS:Array;
      
      public static var TEXT:Array;
      
      public static var §(k6e§:int = 10;
      
      public static var §r;\x024\x02§:int = 50;
      
      public static var §l\f\x0e)\x02§:int = 460;
      
      public static var §T,Fb\x02§:int = 10;
      
      public static var §J\x06F?§:int = 30000;
      
      public static var §n\x14?w\x01§:int = 20;
      
      public static var §\x0b8j8\x03§:int = 25;
      
      public static var §gtE\f§:int = 500;
      
      public static var §z\x0eh\x1e\x03§:int = 6;
      
      public static var §\x03)\x02t§:int = 18;
      
      public static var §Ri\x03G\x03§:int = 20;
      
      public static var §\tA c§:int = 8000;
      
      public static var §@B3\x03\x01§:Array = [200,100,50];
      
      public static var §\x1a]\x07%\x01§:int = 6;
      
      public static var §\t;\x1cH\x02§:Array;
      
      public static var §#?@\x05\x03§:Array;
      
      public static var §\x01q\x0b\x14\x01§:Array = [5,15,30];
      
      public static var §\x1a\x1ew_§:Array = [5,3,1];
      
      public static var §_T\x12x\x01§:Array = [0,1,2,2,2,3,3,3,3,4,4,4,5,6,7];
      
      public static var §Ox6\x03\x01§:Array = [1,2,2,2,2,3,3,3,4,4,5];
      
      public static var §~vFJ\x02§:int = 20;
       
      
      public function Data()
      {
      }
      
      public static function §\tw4/\x01§() : int
      {
         return Data.§\x03)\x02t§;
      }
      
      public static function §OS}`\x01§() : int
      {
         return Data.§Ri\x03G\x03§;
      }
      
      public static function §Ghn\x02§() : Object
      {
         var _loc1_:Date = Date.now();
         var _loc2_:int = int(_loc1_.getDate());
         var _loc3_:int = int(_loc1_.getMonth());
         var _loc4_:int = int(_loc1_.getFullYear());
         return {
            "open":new Date(_loc4_,_loc3_,_loc2_,int(Data.§\tw4/\x01§()),0,0),
            "close":new Date(_loc4_,_loc3_,_loc2_,int(Data.§OS}`\x01§()),0,0)
         };
      }
      
      public static function §#1\tf\x02§(param1:int) : int
      {
         return Data.§\tA c§ * param1;
      }
      
      public static function §\x16\x1fm\x02\x03§(param1:_CardType, param2:int) : Object
      {
         var _loc9_:int = 0;
         var _loc3_:String = Data.CARDS[int(param1.index)].§\x0e-EY\x01§;
         var _loc5_:String = _loc3_;
         var _loc4_:int = _loc5_ == "C"?1:_loc5_ == "U"?3:_loc5_ == "R"?5:int(null);
         var _loc6_:int = param2 + int(Std.random(_loc4_)) * (int(Std.random(2)) * 2 - 1);
         var _loc7_:int = 0;
         if(int(Std.random(2)) == 0)
         {
            _loc7_ = int(Std.random(_loc4_ * 2));
         }
         _loc6_ = _loc6_ - _loc7_;
         var _loc8_:Array = [];
         while(_loc7_ > 0 && int(_loc8_.length) < 10)
         {
            if(int(Std.random(2)) == 0)
            {
               _loc9_ = int(Std.random(_loc7_)) + 1;
               _loc7_ = _loc7_ - _loc9_;
               _loc8_.push(_loc9_);
            }
            _loc8_.push(null);
         }
         return {
            "price":_loc6_,
            "deal":_loc8_
         };
      }
      
      public static function §0\x14UO\x02§() : int
      {
         var _loc1_:Array = Type.getEnumConstructs(_CardType);
         return int(_loc1_.length);
      }
   }
}
