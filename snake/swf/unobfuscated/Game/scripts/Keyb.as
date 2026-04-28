package
{
   import flash.Lib;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import haxe.Log;
   import haxe.§Xew§;
   
   public class Keyb implements §Xew§
   {
      
      public static var TRACE:Boolean = false;
      
      public static var §4\x1e)\x03§:int = 38;
      
      public static var §W,\x03n\x01§:int = 40;
      
      public static var §\x16o}k\x01§:int = 37;
      
      public static var §fB2z\x03§:int = 39;
      
      public static var §}{Z2§:int = 32;
      
      public static var §j\x0e|\x1d\x01§:int = 27;
      
      public static var §\x17\x17§:int = 9;
      
      public static var §f`U\x03§:int = 222;
      
      public static var control:Boolean = false;
      
      public static var alt:Boolean = false;
      
      public static var §PB&\x0b\x01§:Function;
      
      public static var §jx\x1d@\x03§:Function;
      
      public static var §\t\x1d4E§:Function;
      
      public static var §v,4@\x02§:Function;
      
      public static var §\x1d8\fx\x03§:Function;
      
      public static var §@\x14U&\x03§:Function;
      
      public static var §\x15GQH\x03§:Function;
      
      public static var §\x0fcE\x1b\x01§:Function;
      
      public static var §l3nk\x02§:Function;
      
      public static var pressKey:Function;
      
      public static var §\x05;\x14-\x03§:Array;
      
      public static var actions:Array;
      
      public static var a:Array = [];
       
      
      public function Keyb()
      {
      }
      
      public static function init() : void
      {
         Keyb.§\x05;\x14-\x03§ = [];
         Keyb.actions = [];
         var _loc1_:flash.display.Stage = Lib.current.stage;
         _loc1_.addEventListener(KeyboardEvent.KEY_DOWN,Keyb.onKeyDown);
         _loc1_.addEventListener(KeyboardEvent.KEY_UP,Keyb.onKeyUp);
         _loc1_.addEventListener(Event.DEACTIVATE,Keyb.§`$\x18$\x03§);
         Keyb.clean();
      }
      
      public static function §C\x05\x1f\x13\x01§(param1:int, param2:Function) : void
      {
         Keyb.§\x05;\x14-\x03§[param1] = param2;
      }
      
      public static function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc3_:* = null as String;
         var _loc5_:* = null as Function;
         Keyb.a[param1.keyCode] = true;
         Keyb.control = param1.ctrlKey;
         Keyb.alt = param1.altKey;
         var _loc2_:String = String.fromCharCode(param1.charCode);
         if(Keyb.TRACE)
         {
            _loc3_ = String.fromCharCode(param1.charCode);
            Log.trace(" keyCode : " + param1.keyCode,{
               "fileName":"Keyb.hx",
               "lineNumber":67,
               "className":"Keyb",
               "methodName":"onKeyDown"
            });
         }
         if(param1.keyCode >= 65 && param1.keyCode <= 90)
         {
            Keyb.§l3nk\x02§(param1.keyCode);
         }
         Keyb.pressKey(param1.keyCode);
         var _loc4_:uint = param1.keyCode;
         if(_loc4_ == Keyb.§4\x1e)\x03§)
         {
            Keyb.§PB&\x0b\x01§();
         }
         else if(_loc4_ == Keyb.§W,\x03n\x01§)
         {
            Keyb.§jx\x1d@\x03§();
         }
         else if(_loc4_ == Keyb.§\x16o}k\x01§)
         {
            Keyb.§\t\x1d4E§();
         }
         else if(_loc4_ == Keyb.§fB2z\x03§)
         {
            Keyb.§v,4@\x02§();
         }
         else if(_loc4_ == Keyb.§}{Z2§)
         {
            Keyb.§\x1d8\fx\x03§();
         }
         else if(_loc4_ == Keyb.§j\x0e|\x1d\x01§)
         {
            Keyb.§@\x14U&\x03§();
         }
         else if(_loc4_ == Keyb.§\x17\x17§)
         {
            Keyb.§\x15GQH\x03§();
         }
         else if(_loc4_ == Keyb.§f`U\x03§)
         {
            Keyb.§\x0fcE\x1b\x01§();
         }
         else
         {
            _loc5_ = Keyb.actions[param1.keyCode];
            if(_loc5_ != null)
            {
               _loc5_();
            }
         }
      }
      
      public static function onKeyUp(param1:KeyboardEvent) : void
      {
         Keyb.a[param1.keyCode] = false;
         Keyb.control = param1.ctrlKey;
         Keyb.alt = param1.altKey;
      }
      
      public static function clean() : void
      {
         var _loc4_:* = null as Function;
         Keyb.actions = [];
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = Keyb.§\x05;\x14-\x03§;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            Keyb.actions[_loc1_] = _loc4_;
            _loc1_++;
         }
         Keyb.§PB&\x0b\x01§ = function():void
         {
         };
         Keyb.§jx\x1d@\x03§ = function():void
         {
         };
         Keyb.§\t\x1d4E§ = function():void
         {
         };
         Keyb.§v,4@\x02§ = function():void
         {
         };
         Keyb.§\x1d8\fx\x03§ = function():void
         {
         };
         Keyb.§@\x14U&\x03§ = function():void
         {
         };
         Keyb.§\x15GQH\x03§ = function():void
         {
         };
         Keyb.§\x0fcE\x1b\x01§ = function():void
         {
         };
         Keyb.§l3nk\x02§ = function(param1:int):void
         {
         };
         Keyb.pressKey = function(param1:int):void
         {
         };
      }
      
      public static function getKeyName(param1:int) : String
      {
         if(param1 >= 65 && param1 <= 90)
         {
            return String.fromCharCode(97 + (param1 - 65));
         }
         switch(param1)
         {
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return "?";
            case 13:
            default:
            default:
               return "enter";
            case 16:
               return "shift";
            case 17:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return "control";
            case 32:
               return "space";
         }
      }
      
      public static function §\x15(@1\x02§() : Boolean
      {
         return Boolean(Keyb.a[16]);
      }
      
      public static function §Z\x14\x0bN\x01§() : Boolean
      {
         return Boolean(Keyb.a[Keyb.§4\x1e)\x03§]);
      }
      
      public static function isDown() : Boolean
      {
         return Boolean(Keyb.a[Keyb.§W,\x03n\x01§]);
      }
      
      public static function § ur_\x01§() : Boolean
      {
         return Boolean(Keyb.a[Keyb.§\x16o}k\x01§]);
      }
      
      public static function §&!15\x01§() : Boolean
      {
         return Boolean(Keyb.a[Keyb.§fB2z\x03§]);
      }
      
      public static function §E\bD\x07\x02§() : Boolean
      {
         return Boolean(Keyb.a[Keyb.§}{Z2§]);
      }
      
      public static function §\x17,\x1dg\x01§() : Boolean
      {
         return Boolean(Keyb.a[Keyb.§j\x0e|\x1d\x01§]);
      }
      
      public static function §Ycj\x03§() : Boolean
      {
         return Boolean(Keyb.a[Keyb.§\x17\x17§]);
      }
      
      public static function §BZvA\x03§() : Boolean
      {
         return Boolean(Keyb.a[Keyb.§f`U\x03§]);
      }
      
      public static function §`$\x18$\x03§(param1:*) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(Keyb.a.length);
         while(_loc2_ < _loc3_)
         {
            _loc2_++;
            _loc4_ = _loc2_;
            Keyb.a[_loc4_] = false;
         }
      }
   }
}
