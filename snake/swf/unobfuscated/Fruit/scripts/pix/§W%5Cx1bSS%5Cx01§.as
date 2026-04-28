package pix
{
   import flash.display.BitmapData;
   import flash.§f$\n8\x01§;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class §W\x1bSS\x01§
   {
       
      
      public var timelines:§_g\nX\x01§;
      
      public var texture:BitmapData;
      
      public var lastIndex:int;
      
      public var index:§_g\nX\x01§;
      
      public var frames:Array;
      
      public var ddy:int;
      
      public var ddx:int;
      
      public function §W\x1bSS\x01§(param1:BitmapData = undefined)
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         texture = param1;
         frames = [];
         ddx = 0;
         ddy = 0;
         lastIndex = 0;
         index = new §_g\nX\x01§();
         timelines = new §_g\nX\x01§();
      }
      
      public function swapTexture(param1:BitmapData) : void
      {
         var _loc4_:* = null as Frame;
         texture = param1;
         var _loc2_:int = 0;
         var _loc3_:Array = frames;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc4_.texture = texture;
         }
      }
      
      public function slice90(param1:int, param2:int, param3:int, param4:int, param5:int = 1, param6:int = 1) : void
      {
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < 4)
         {
            _loc7_++;
            _loc8_ = _loc7_;
            slice(param1,param2,param3,param4,param5,param6,false,false,_loc8_ * 1.57);
         }
      }
      
      public function slice(param1:int, param2:int, param3:int, param4:int, param5:int = 1, param6:int = 1, param7:Boolean = false, param8:Boolean = false, param9:Object = undefined) : void
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc10_:int = 0;
         while(_loc10_ < param6)
         {
            _loc10_++;
            _loc11_ = _loc10_;
            _loc12_ = 0;
            while(_loc12_ < param5)
            {
               _loc12_++;
               _loc13_ = _loc12_;
               addFrame(param1 + _loc13_ * param3,param2 + _loc11_ * param4,param3,param4,param7,param8,param9);
            }
         }
      }
      
      public function §=XG)\x01§(param1:int = 0, param2:int = 0) : void
      {
         ddx = param1;
         ddy = param2;
      }
      
      public function getTextField() : TextField
      {
         var _loc1_:TextField = new TextField();
         var _loc2_:TextFormat = _loc1_.getTextFormat();
         _loc2_.color = 16777215;
         _loc2_.font = "04b03";
         _loc2_.size = 8;
         _loc1_.defaultTextFormat = _loc2_;
         _loc1_.filters = [new GlowFilter(0,1,2,2,10)];
         return _loc1_;
      }
      
      public function getLength() : int
      {
         return int(frames.length);
      }
      
      public function getAnims(param1:Array) : Array
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as Anim;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < int(param1.length))
         {
            _loc4_ = param1[_loc3_];
            _loc3_++;
            _loc5_ = new Anim(this);
            _loc5_.§o\x11Fv\x03§ = timelines.get(_loc4_);
            _loc2_.push(_loc5_);
         }
         return _loc2_;
      }
      
      public function getAnimLib(param1:int = 200) : flash.display.Sprite
      {
         var _loc8_:* = null as String;
         var _loc9_:* = null as Anim;
         var _loc10_:* = null as pix.Sprite;
         var _loc11_:Number = NaN;
         var _loc12_:* = null as TextField;
         var _loc13_:Number = NaN;
         var _loc2_:flash.display.Sprite = new flash.display.Sprite();
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:* = timelines.keys();
         var _loc7_:* = _loc6_;
         while(_loc7_.hasNext())
         {
            _loc8_ = _loc7_.next();
            _loc9_ = getAnim(_loc8_);
            _loc10_ = new pix.Sprite();
            _loc2_.addChild(_loc10_);
            _loc10_.setAlign(0,0);
            _loc10_.setAnim(_loc9_);
            _loc10_.x = _loc3_;
            _loc10_.y = _loc4_;
            _loc11_ = _loc10_.width;
            _loc12_ = getTextField();
            _loc2_.addChild(_loc12_);
            _loc12_.x = _loc3_;
            _loc12_.y = Number(_loc4_ + _loc10_.height);
            _loc12_.text = _loc8_;
            _loc12_.width = Number(_loc12_.textWidth + 3);
            _loc13_ = _loc12_.width - _loc11_;
            _loc10_.x = Number(_loc10_.x + _loc13_ * 0.5);
            _loc11_ = Number(Math.max(_loc11_,_loc12_.width));
            _loc3_ = Number(_loc3_ + _loc11_);
            _loc5_ = Number(Math.max(_loc5_,Number(_loc10_.height + 10)));
            if(_loc3_ > param1)
            {
               _loc3_ = 0;
               _loc4_ = Number(_loc4_ + _loc5_);
               _loc5_ = 0;
            }
         }
         return _loc2_;
      }
      
      public function getAnim(param1:String) : Anim
      {
         var _loc2_:Anim = new Anim(this);
         _loc2_.§o\x11Fv\x03§ = timelines.get(param1);
         return _loc2_;
      }
      
      public function get(param1:Object = undefined, param2:String = undefined) : Frame
      {
         if(param1 == null)
         {
            param1 = 0;
         }
         if(param2 != null)
         {
            param1 = param1 + index.get(param2);
         }
         return frames[param1];
      }
      
      public function addIndex(param1:String) : void
      {
         index.set(param1,int(frames.length));
         lastIndex = int(frames.length);
      }
      
      public function addFrame(param1:Object, param2:Object, param3:Object, param4:Object, param5:Boolean = false, param6:Boolean = false, param7:Object = undefined) : Frame
      {
         var _loc8_:Frame = new Frame(texture,param1,param2,param3,param4,param5,param6,param7);
         _loc8_.ddx = ddx;
         _loc8_.ddy = ddy;
         frames.push(_loc8_);
         return _loc8_;
      }
      
      public function addAnim(param1:String, param2:Array, param3:Array = undefined, param4:int = 1) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null as Array;
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < int(param2.length))
         {
            _loc8_ = int(param2[_loc7_]);
            _loc7_++;
            _loc9_ = 1;
            if(param3 != null)
            {
               if(_loc6_ < int(param3.length))
               {
                  _loc9_ = int(param3[_loc6_]);
               }
               else
               {
                  _loc9_ = int(param3[int(param3.length) - 1]);
               }
            }
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               _loc10_++;
               _loc11_ = _loc10_;
               _loc5_.push(_loc8_ + lastIndex);
            }
            _loc6_++;
         }
         if(param4 > 1)
         {
            _loc7_ = 0;
            while(_loc7_ < param4)
            {
               _loc7_++;
               _loc8_ = _loc7_;
               _loc12_ = [];
               _loc9_ = _loc8_ * int(_loc5_.length);
               _loc10_ = 0;
               while(_loc10_ < int(_loc5_.length))
               {
                  _loc11_ = int(_loc5_[_loc10_]);
                  _loc10_++;
                  _loc12_.push(_loc11_ + _loc9_);
               }
               timelines.set(param1 + "_" + _loc8_,_loc5_);
            }
         }
         else
         {
            timelines.set(param1,_loc5_);
         }
      }
   }
}
