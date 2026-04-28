package
{
   import flash.Boot;
   
   public class DateTools
   {
      
      public static var DAYS_OF_MONTH:Array = [31,28,31,30,31,30,31,31,30,31,30,31];
       
      
      public function DateTools()
      {
      }
      
      public static function __format_get(param1:Date, param2:String) : String
      {
         var _loc4_:int = 0;
         var _loc3_:String = param2;
         if(_loc3_ == "%")
         {
            §§push("%");
         }
         else if(_loc3_ == "C")
         {
            §§push(StringTools.lpad(Std.string(int(int(param1.getFullYear()) / 100)),"0",2));
         }
         else if(_loc3_ == "d")
         {
            §§push(StringTools.lpad(Std.string(int(param1.getDate())),"0",2));
         }
         else if(_loc3_ == "D")
         {
            §§push(DateTools.__format(param1,"%m/%d/%y"));
         }
         else if(_loc3_ == "e")
         {
            §§push(Std.string(int(param1.getDate())));
         }
         else
         {
            if(_loc3_ != "H")
            {
               if(_loc3_ != "k")
               {
                  if(_loc3_ != "I")
                  {
                     if(_loc3_ != "l")
                     {
                        if(_loc3_ == "m")
                        {
                           §§push(StringTools.lpad(Std.string(int(param1.getMonth()) + 1),"0",2));
                        }
                        else if(_loc3_ == "M")
                        {
                           §§push(StringTools.lpad(Std.string(int(param1.getMinutes())),"0",2));
                        }
                        else if(_loc3_ == "n")
                        {
                           §§push("\n");
                        }
                        else if(_loc3_ == "p")
                        {
                           §§push(int(param1.getHours()) > 11?"PM":"AM");
                        }
                        else if(_loc3_ == "r")
                        {
                           §§push(DateTools.__format(param1,"%I:%M:%S %p"));
                        }
                        else if(_loc3_ == "R")
                        {
                           §§push(DateTools.__format(param1,"%H:%M"));
                        }
                        else if(_loc3_ == "s")
                        {
                           §§push(Std.string(int(param1.getTime() / 1000)));
                        }
                        else if(_loc3_ == "S")
                        {
                           §§push(StringTools.lpad(Std.string(int(param1.getSeconds())),"0",2));
                        }
                        else if(_loc3_ == "t")
                        {
                           §§push("\t");
                        }
                        else if(_loc3_ == "T")
                        {
                           §§push(DateTools.__format(param1,"%H:%M:%S"));
                        }
                        else if(_loc3_ == "u")
                        {
                           _loc4_ = int(param1.getDay());
                           §§push(_loc4_ == 0?"7":Std.string(_loc4_));
                        }
                        else if(_loc3_ == "w")
                        {
                           §§push(Std.string(int(param1.getDay())));
                        }
                        else if(_loc3_ == "y")
                        {
                           §§push(StringTools.lpad(Std.string(int(int(param1.getFullYear()) % 100)),"0",2));
                        }
                        else if(_loc3_ == "Y")
                        {
                           §§push(Std.string(int(param1.getFullYear())));
                        }
                        else
                        {
                           Boot.lastError = new Error();
                           throw "Date.format %" + param2 + "- not implemented yet.";
                        }
                     }
                  }
                  _loc4_ = int(int(param1.getHours()) % 12);
                  §§push(StringTools.lpad(Std.string(_loc4_ == 0?12:_loc4_),param2 == "I"?"0":" ",2));
               }
            }
            §§push(StringTools.lpad(Std.string(int(param1.getHours())),param2 == "H"?"0":" ",2));
         }
         return §§pop();
      }
      
      public static function __format(param1:Date, param2:String) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:StringBuf = new StringBuf();
         var _loc4_:int = 0;
         while(true)
         {
            _loc5_ = int(param2.indexOf("%",_loc4_));
            if(_loc5_ < 0)
            {
               break;
            }
            _loc6_ = _loc5_ - _loc4_;
            if(_loc6_ == null)
            {
               _loc3_.b = _loc3_.b + param2.substr(_loc4_);
            }
            else
            {
               _loc3_.b = _loc3_.b + param2.substr(_loc4_,_loc6_);
            }
            _loc3_.b = _loc3_.b + DateTools.__format_get(param1,param2.substr(_loc5_ + 1,1));
            _loc4_ = _loc5_ + 2;
         }
         _loc6_ = param2.length - _loc4_;
         if(_loc6_ == null)
         {
            _loc3_.b = _loc3_.b + param2.substr(_loc4_);
         }
         else
         {
            _loc3_.b = _loc3_.b + param2.substr(_loc4_,_loc6_);
         }
         return _loc3_.b;
      }
      
      public static function format(param1:Date, param2:String) : String
      {
         return DateTools.__format(param1,param2);
      }
      
      public static function delta(param1:Date, param2:Number) : Date
      {
         return Date.fromTime(Number(Number(param1.getTime()) + param2));
      }
      
      public static function §GU[/\x03§(param1:Date) : int
      {
         var _loc2_:int = int(param1.getMonth());
         var _loc3_:int = int(param1.getFullYear());
         if(_loc2_ != 1)
         {
            return int(DateTools.DAYS_OF_MONTH[_loc2_]);
         }
         var _loc4_:Boolean = int(_loc3_ % 4) == 0 && int(_loc3_ % 100) != 0 || int(_loc3_ % 400) == 0;
         return !!_loc4_?29:28;
      }
      
      public static function seconds(param1:Number) : Number
      {
         return param1 * 1000;
      }
      
      public static function minutes(param1:Number) : Number
      {
         return param1 * 60 * 1000;
      }
      
      public static function hours(param1:Number) : Number
      {
         return param1 * 60 * 60 * 1000;
      }
      
      public static function days(param1:Number) : Number
      {
         return param1 * 24 * 60 * 60 * 1000;
      }
      
      public static function parse(param1:Number) : Object
      {
         var _loc2_:Number = param1 / 1000;
         var _loc3_:Number = _loc2_ / 60;
         var _loc4_:Number = _loc3_ / 60;
         return {
            "ms":param1 % 1000,
            "seconds":int(_loc2_ % 60),
            "minutes":int(_loc3_ % 60),
            "hours":int(_loc4_ % 24),
            "days":int(_loc4_ / 24)
         };
      }
      
      public static function make(param1:Object) : Number
      {
         return Number(Number(param1.ms) + 1000 * (int(param1.seconds) + 60 * (int(param1.minutes) + 60 * (int(param1.hours) + 24 * int(param1.days)))));
      }
   }
}
