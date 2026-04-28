package fx
{
   import flash.Boot;
   import flash.display.Sprite;
   import mt.bumdum9.Filt;
   
   public class Virus extends §\x12\bHb\x03§
   {
      
      public static var me:Virus;
      
      public static var tag:_x_TYPE;
      
      public static var board:Sprite;
       
      
      public function Virus(param1:Card = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         Virus.me = this;
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      public function §\x10\x1f\x16F\x01§(param1:Fruit) : void
      {
         var _loc4_:* = null as _x_TYPE;
         Virus.tag = null;
         var _loc2_:int = 0;
         var _loc3_:Array = param1.data.tags;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            switch(int(_loc4_.index))
            {
               default:
                  continue;
               case 1:
               default:
               default:
               default:
               default:
               default:
               case 7:
               default:
               default:
               default:
               default:
               default:
               default:
               case 14:
               default:
               default:
               case 17:
               case 18:
               case 19:
                  Virus.tag = _loc4_;
                  continue;
            }
         }
         card.§\x0fB}F\x03§();
         _loc2_ = 80;
         var _loc6_:* = {
            "r":_loc2_,
            "g":0,
            "b":0
         };
         if(Virus.tag == _x_TYPE.Green)
         {
            _loc6_ = {
               "r":0,
               "g":_loc2_,
               "b":0
            };
         }
         if(Virus.tag == _x_TYPE.Blue)
         {
            _loc6_ = {
               "r":0,
               "g":0,
               "b":_loc2_
            };
         }
         if(Virus.tag == _x_TYPE.Pink)
         {
            _loc6_ = {
               "r":_loc2_,
               "g":0,
               "b":_loc2_
            };
         }
         if(Virus.tag == _x_TYPE.Orange)
         {
            _loc6_ = {
               "r":_loc2_,
               "g":_loc2_ >> 1,
               "b":0
            };
         }
         if(Virus.tag == _x_TYPE.Yellow)
         {
            _loc6_ = {
               "r":_loc2_,
               "g":_loc2_,
               "b":0
            };
         }
         card.gfx.§In-\b\x02§.filters = [];
         Filt.grey(card.gfx.§In-\b\x02§,Virus.tag == null?0:1,null,_loc6_);
      }
      
      override public function kill() : void
      {
         super.kill();
         Virus.me = null;
      }
      
      public function §l\x16/\x01§(param1:Object) : Boolean
      {
         var _loc4_:* = null as _x_TYPE;
         if(Virus.tag == null)
         {
            return true;
         }
         var _loc2_:int = 0;
         var _loc3_:Array = param1.tags;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_ == Virus.tag)
            {
               return false;
            }
         }
         return true;
      }
   }
}
