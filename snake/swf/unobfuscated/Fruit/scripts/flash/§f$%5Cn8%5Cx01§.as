package flash
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   
   public class §f$\n8\x01§ extends MovieClip
   {
      
      public static var tf:TextField;
      
      public static var lines:Array;
      
      public static var lastError:Error;
      
      public static var skip_constructor:Boolean = false;
       
      
      public function §f$\n8\x01§()
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public static function enum_to_string(param1:Object) : String
      {
         var _loc5_:* = null;
         if(param1.§N\nM\x03§ == null)
         {
            return param1.tag;
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = param1.§N\nM\x03§;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_.push(§f$\n8\x01§.__string_rec(_loc5_,""));
         }
         return param1.tag + "(" + _loc2_.join(",") + ")";
      }
      
      public static function __instanceof(param1:*, param2:*) : Boolean
      {
         var _loc4_:* = null;
         if(param2 == Dynamic)
         {
            return true;
         }
         return param1 is param2;
      }
      
      public static function __clear_trace() : void
      {
         if(§f$\n8\x01§.tf == null)
         {
            return;
         }
         §f$\n8\x01§.tf.parent.removeChild(§f$\n8\x01§.tf);
         §f$\n8\x01§.tf = null;
         §f$\n8\x01§.lines = null;
      }
      
      public static function __set_trace_color(param1:uint) : void
      {
         §f$\n8\x01§.getTrace().textColor = param1;
      }
      
      public static function getTrace() : TextField
      {
         var _loc2_:* = null as TextFormat;
         var _loc1_:MovieClip = Lib.current;
         if(§f$\n8\x01§.tf == null)
         {
            §f$\n8\x01§.tf = new TextField();
            _loc2_ = §f$\n8\x01§.tf.getTextFormat();
            _loc2_.font = "_sans";
            §f$\n8\x01§.tf.defaultTextFormat = _loc2_;
            §f$\n8\x01§.tf.selectable = false;
            §f$\n8\x01§.tf.width = _loc1_.stage == null?800:_loc1_.stage.stageWidth;
            §f$\n8\x01§.tf.autoSize = TextFieldAutoSize.LEFT;
            §f$\n8\x01§.tf.mouseEnabled = false;
         }
         if(_loc1_.stage == null)
         {
            _loc1_.addChild(§f$\n8\x01§.tf);
         }
         else
         {
            _loc1_.stage.addChild(§f$\n8\x01§.tf);
         }
         return §f$\n8\x01§.tf;
      }
      
      public static function __trace(param1:*, param2:Object) : void
      {
         var _loc3_:TextField = §f$\n8\x01§.getTrace();
         var _loc4_:String = param2 == null?"(null)":param2.fileName + ":" + int(param2.lineNumber);
         if(§f$\n8\x01§.lines == null)
         {
            §f$\n8\x01§.lines = [];
         }
         §f$\n8\x01§.lines = §f$\n8\x01§.lines.concat((_loc4_ + ": " + §f$\n8\x01§.__string_rec(param1,"")).split("\n"));
         _loc3_.text = §f$\n8\x01§.lines.join("\n");
         var _loc5_:Stage = Lib.current.stage;
         if(_loc5_ == null)
         {
            return;
         }
         while(int(§f$\n8\x01§.lines.length) > 1 && _loc3_.height > _loc5_.stageHeight)
         {
            §f$\n8\x01§.lines.shift();
            _loc3_.text = §f$\n8\x01§.lines.join("\n");
         }
      }
      
      public static function __string_rec(param1:*, param2:String) : String
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as Array;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null as String;
         var _loc11_:Boolean = false;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null as String;
         var _loc4_:String = getQualifiedClassName(param1);
         _loc5_ = _loc4_;
         if(_loc5_ == "Object")
         {
            _loc8_ = 0;
            _loc7_ = [];
            _loc9_ = param1;
            while(§§hasnext(param1,_loc8_))
            {
               _loc7_.push(§§nextname(_loc8_,_loc9_));
            }
            _loc6_ = _loc7_;
            _loc10_ = "{";
            _loc11_ = true;
            _loc8_ = 0;
            _loc12_ = int(_loc6_.length);
            while(_loc8_ < _loc12_)
            {
               _loc8_++;
               _loc13_ = _loc8_;
               _loc14_ = _loc6_[_loc13_];
               if(_loc14_ == "toString")
               {
                  return param1.toString();
               }
               if(_loc11_)
               {
                  _loc11_ = false;
               }
               else
               {
                  _loc10_ = _loc10_ + ",";
               }
               _loc10_ = _loc10_ + (" " + _loc14_ + " : " + §f$\n8\x01§.__string_rec(param1[_loc14_],param2));
            }
            if(!_loc11_)
            {
               _loc10_ = _loc10_ + " ";
            }
            _loc10_ = _loc10_ + "}";
            return _loc10_;
         }
         if(_loc5_ == "Array")
         {
            if(param1 == Array)
            {
               return "#Array";
            }
            _loc10_ = "[";
            _loc11_ = true;
            _loc6_ = param1;
            _loc8_ = 0;
            _loc12_ = int(_loc6_.length);
            while(_loc8_ < _loc12_)
            {
               _loc8_++;
               _loc13_ = _loc8_;
               if(_loc11_)
               {
                  _loc11_ = false;
               }
               else
               {
                  _loc10_ = _loc10_ + ",";
               }
               _loc10_ = _loc10_ + §f$\n8\x01§.__string_rec(_loc6_[_loc13_],param2);
            }
            return _loc10_ + "]";
         }
         _loc5_ = typeof param1;
         if(_loc5_ == "function")
         {
            return "<function>";
         }
         return new String(param1);
      }
      
      public static function __unprotect__(param1:String) : String
      {
         return param1;
      }
      
      public function start() : void
      {
         var _loc2_:MovieClip = Lib.current;
         try
         {
            if(_loc2_ == this && _loc2_.stage != null && _loc2_.stage.align == "")
            {
               _loc2_.stage.align = "TOP_LEFT";
            }
         }
         catch(_loc3_:*)
         {
         }
         if(_loc2_.stage == null)
         {
            _loc2_.addEventListener(Event.ADDED_TO_STAGE,doInitDelay);
         }
         else if(_loc2_.stage.stageWidth == 0)
         {
            setTimeout(start,1);
         }
         else
         {
            init();
         }
      }
      
      public function init() : void
      {
         §f$\n8\x01§.lastError = new Error();
         throw "assert";
      }
      
      public function doInitDelay(param1:*) : void
      {
         Lib.current.removeEventListener(Event.ADDED_TO_STAGE,doInitDelay);
         start();
      }
   }
}
