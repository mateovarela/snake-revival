package mt
{
   import flash.Boot;
   import flash.Lib;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Shape;
   
   public class DepthManager
   {
       
      
      public var root:DisplayObjectContainer;
      
      public var plans:Array;
      
      public var baseChildren:int;
      
      public function DepthManager(param1:DisplayObjectContainer = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         root = param1;
         baseChildren = root.numChildren;
         plans = [];
      }
      
      public function ysort(param1:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as DisplayObject;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:* = null as DisplayObject;
         var _loc2_:Number = -99999999;
         var _loc3_:int = int(getBottom(param1));
         var _loc4_:int = int(root.getChildIndex(§8gu\x02§(param1)));
         var _loc5_:int = _loc3_;
         while(_loc5_ < _loc4_)
         {
            _loc5_++;
            _loc6_ = _loc5_;
            _loc7_ = root.getChildAt(_loc6_);
            _loc8_ = _loc7_.y;
            if(_loc8_ >= _loc2_)
            {
               _loc2_ = _loc8_;
            }
            else
            {
               _loc9_ = _loc6_ - 1;
               while(_loc9_ >= _loc3_)
               {
                  _loc10_ = root.getChildAt(_loc9_);
                  if(_loc10_.y <= _loc8_)
                  {
                     break;
                  }
                  _loc9_--;
               }
               root.addChildAt(_loc7_,_loc9_ + 1);
            }
         }
      }
      
      public function under(param1:DisplayObject) : void
      {
         var _loc2_:int = int(getMCPlan(param1));
         root.addChildAt(param1,int(getBottom(_loc2_)));
      }
      
      public function over(param1:DisplayObject) : void
      {
         var _loc2_:int = int(getMCPlan(param1));
         root.addChildAt(param1,int(root.getChildIndex(§8gu\x02§(_loc2_))) - 1);
      }
      
      public function §8gu\x02§(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = plans[param1];
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         _loc2_ = new Shape();
         _loc2_.visible = false;
         _loc2_.name = "Plan#" + param1;
         root.addChildAt(_loc2_,int(getBottom(param1)));
         plans[param1] = _loc2_;
         return _loc2_;
      }
      
      public function getMCPlan(param1:DisplayObject) : int
      {
         var _loc5_:int = 0;
         var _loc6_:* = null as DisplayObject;
         var _loc2_:int = int(root.getChildIndex(param1));
         var _loc3_:int = 0;
         var _loc4_:int = int(plans.length);
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            _loc6_ = plans[_loc5_];
            if(_loc6_ != null && int(root.getChildIndex(_loc6_)) > _loc2_)
            {
               return _loc5_;
            }
         }
         return 0;
      }
      
      public function getMC() : DisplayObjectContainer
      {
         return root;
      }
      
      public function getBottom(param1:int) : int
      {
         var _loc3_:* = null as DisplayObject;
         var _loc2_:int = param1;
         while(true)
         {
            _loc2_--;
            if(_loc2_ < 0)
            {
               break;
            }
            _loc3_ = plans[_loc2_];
            if(_loc3_ != null)
            {
               return int(root.getChildIndex(_loc3_)) + 1;
            }
         }
         return baseChildren;
      }
      
      public function empty(param1:int) : MovieClip
      {
         var _loc2_:MovieClip = new MovieClip();
         root.addChildAt(_loc2_,int(root.getChildIndex(§8gu\x02§(param1))));
         return _loc2_;
      }
      
      public function destroy() : void
      {
         var _loc1_:* = null as DisplayObject;
         while(root.numChildren > baseChildren)
         {
            _loc1_ = root.getChildAt(baseChildren);
            _loc1_.parent.removeChild(_loc1_);
         }
         plans = [];
      }
      
      public function clear(param1:int) : void
      {
         var _loc2_:DisplayObject = §8gu\x02§(param1);
         var _loc3_:int = int(getBottom(param1));
         var _loc4_:int = int(root.getChildIndex(_loc2_)) - _loc3_;
         while(_loc4_ > 0)
         {
            root.removeChildAt(_loc3_);
            _loc4_--;
         }
      }
      
      public function attach(param1:String, param2:int) : MovieClip
      {
         var _loc3_:MovieClip = Lib.attach(param1);
         root.addChildAt(_loc3_,int(root.getChildIndex(§8gu\x02§(param2))));
         return _loc3_;
      }
      
      public function add(param1:Object, param2:int) : Object
      {
         var _loc3_:DisplayObject = param1 as DisplayObject;
         if(_loc3_.parent != null)
         {
            _loc3_.parent.removeChild(_loc3_);
         }
         root.addChildAt(_loc3_,int(root.getChildIndex(§8gu\x02§(param2))));
         return param1;
      }
   }
}
