package browser
{
   import flash.Boot;
   import flash.display.Sprite;
   import mt.bumdum9.Num;
   
   public class Nav
   {
      
      public static var HEIGHT:int = 72;
       
      
      public var vx:Number;
      
      public var slots:Array;
      
      public var selection:Object;
      
      public var §\f\x03h§:Sprite;
      
      public var root:Sprite;
      
      public var active:Boolean;
      
      public function Nav()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         root = new Sprite();
         Browser.me.dm.add(root,1);
         slots = [];
         vx = 0;
         initBg();
         §\f\x03h§ = new Sprite();
         §\f\x03h§.mouseEnabled = false;
         root.addChild(§\f\x03h§);
      }
      
      public function updateScroll() : void
      {
         var _loc1_:Number = root.mouseX * 0.5;
         var _loc2_:Number = root.mouseY * 0.5;
         var _loc3_:Number = _loc1_ - Cs.mcw * 0.5;
         var _loc4_:int = 80;
         var _loc5_:Number = _loc3_ / Math.abs(_loc3_);
         if(_loc3_ == 0)
         {
            _loc5_ = 1;
         }
         _loc3_ = Math.max(0,Math.abs(_loc3_) - _loc4_) * _loc5_;
         var _loc6_:Number = 0;
         if(active)
         {
            _loc6_ = -_loc3_ * 0.3;
         }
         vx = _loc6_;
         var _loc7_:Number = §\f\x03h§.x;
         §\f\x03h§.x = Number(Num.mm(Cs.mcw - (Number(§\f\x03h§.width + 4)),Number(§\f\x03h§.x + vx),0));
         §\f\x03h§.x = int(§\f\x03h§.x);
         var _loc8_:Number = §\f\x03h§.x - _loc7_;
         §\f\x03h§.filters = [];
         var _loc9_:Number = Number(Math.abs(_loc8_));
         var _loc10_:int = 14;
      }
      
      public function update() : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:* = null;
         var _loc1_:Number = root.mouseY * 0.5;
         active = _loc1_ >= 0 && _loc1_ < Nav.HEIGHT;
         updateScroll();
         var _loc2_:int = 0;
         var _loc3_:Array = slots;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.tx != null)
            {
               _loc5_ = _loc4_.tx - _loc4_.card.sprite.x;
               _loc4_.card.sprite.x = Number(_loc4_.card.sprite.x + _loc5_ * 0.5);
               if(Number(Math.abs(_loc5_)) < 2)
               {
                  _loc4_.card.sprite.x = _loc4_.tx;
                  _loc4_.tx = null;
               }
            }
         }
         if(!active)
         {
            §n\x0f]P\x02§();
            return;
         }
         _loc4_ = null;
         _loc2_ = 0;
         _loc3_ = slots;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc6_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc6_.card.sprite.x - (§\f\x03h§.mouseX - §\f\x03h§.x) * 0.5;
            if(Number(Math.abs(_loc5_)) < Card.§;\x057\x02§ * 0.5)
            {
               _loc4_ = _loc6_;
            }
         }
         if(_loc4_ != selection)
         {
            §n\x0f]P\x02§();
            select(_loc4_);
         }
      }
      
      public function §n\x0f]P\x02§() : void
      {
         if(selection == null)
         {
            return;
         }
         selection.card.§\x19X+o\x01§();
         Browser.me.removeHint();
         selection = null;
      }
      
      public function §\x1cXox§(param1:Object, param2:Object) : int
      {
         var _loc3_:int = param1.card.type.index;
         var _loc4_:int = param2.card.type.index;
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 1;
      }
      
      public function §o\x07\x0fG§(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1.card.data.mojo) * 1000 + param1.card.type.index;
         var _loc4_:int = int(param2.card.data.mojo) * 1000 + param2.card.type.index;
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         return int(§\x1cXox§(param1,param2));
      }
      
      public function § 9kK§(param1:Object, param2:Object) : int
      {
         if(param1.card.mojo[0] > param2.card.mojo[0])
         {
            return -1;
         }
         if(param1.card.mojo[0] == param2.card.mojo[0])
         {
            return 0;
         }
         return 1;
      }
      
      public function §l\x03|L\x03§(param1:Object, param2:Object) : int
      {
         if(param1.card.type.index < param2.card.type.index)
         {
            return -1;
         }
         return 1;
      }
      
      public function §\fNp^§(param1:Object, param2:Object) : int
      {
         if(param1._available)
         {
            return 1;
         }
         return -1;
      }
      
      public function set(param1:Array) : void
      {
         var _loc2_:* = null;
         while(int(slots.length) > 0)
         {
            _loc2_ = slots.pop();
            _loc2_.card.sprite.parent.removeChild(_loc2_.card.sprite);
         }
         param1.sort(§\fNp^§);
         var _loc3_:int = 0;
         while(_loc3_ < int(param1.length))
         {
            _loc2_ = param1[_loc3_];
            _loc3_++;
            add(_loc2_,false);
         }
         maj();
      }
      
      public function §Z\x01\x19f§(param1:Object) : void
      {
         var _loc3_:* = null as String;
         var _loc4_:int = 0;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as §_\x19X\x13\x03§;
         var _loc2_:int = int(Browser.me.§y\x1cPQ\x03§());
         if(int(Browser.me.§\x02zI\x1c\x01§()) >= _loc2_)
         {
            _loc3_ = Lang.§4l#]§;
            _loc3_ = StringTools.replace(_loc3_,"%0",Std.string(_loc2_));
            Browser.me.displayHint(_loc3_,1,true);
            return;
         }
         if(param1.card.data.multi == null)
         {
            _loc4_ = 0;
            _loc5_ = Browser.me.hand;
            while(_loc4_ < int(_loc5_.length))
            {
               _loc6_ = _loc5_[_loc4_];
               _loc4_++;
               if(_loc6_.card.type == param1.card.type)
               {
                  Browser.me.displayHint(Lang.§\x05\x1d\\G\x02§,1,true);
                  return;
               }
            }
         }
         var _loc7_:* = param1.§|k\x12\r\x02§[int(param1.§|k\x12\r\x02§.length) - 1];
         remove(_loc7_);
         _loc6_ = new §_\x19X\x13\x03§(_loc7_);
         _loc6_.x = Number(§\f\x03h§.x + param1.card.sprite.x);
         _loc6_.y = Number(Number(root.y + §\f\x03h§.y) + param1.card.sprite.y);
         Browser.me.§GFB*\x02§(_loc6_);
      }
      
      public function select(param1:Object) : void
      {
         selection = param1;
         if(selection == null)
         {
            return;
         }
         if(!param1.available)
         {
            Browser.me.§EB\x17e\x02§();
            return;
         }
         selection.card.§AQ \n\x02§();
         Browser.me.displayHint(selection.card.§|sq8§());
      }
      
      public function remove(param1:Object) : void
      {
         var _loc2_:* = §p90'\x03§(param1);
         _loc2_.§|k\x12\r\x02§.remove(param1);
         if(int(_loc2_.§|k\x12\r\x02§.length) == 0)
         {
            §\f\x03h§.removeChild(_loc2_.card.sprite);
            slots.remove(_loc2_);
         }
         maj();
      }
      
      public function maj() : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null as Card;
         var _loc8_:* = null;
         slots.sort(§l\x03|L\x03§);
         var _loc1_:Array = slots.copy();
         _loc1_.sort(§o\x07\x0fG§);
         var _loc2_:int = 3;
         var _loc3_:Number = (Cs.mcw - (int(_loc1_.length) * Card.§;\x057\x02§ + (int(_loc1_.length) - 1) * 3)) * 0.5;
         _loc3_ = int(Number(Math.max(0,_loc3_)));
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < int(_loc1_.length))
         {
            _loc6_ = _loc1_[_loc5_];
            _loc5_++;
            _loc7_ = _loc6_.card;
            _loc6_.tx = Number(Number(24 + _loc3_) + _loc4_ * (Card.§;\x057\x02§ + _loc2_));
            if(_loc6_.teleport)
            {
               _loc6_.card.sprite.x = _loc6_.tx;
               _loc6_.teleport = false;
            }
            _loc7_.sprite.y = Nav.HEIGHT * 0.5;
            _loc7_.§\x0eX\x1c4\x01§();
            _loc7_.coef = [1];
            _loc8_ = _loc6_.§|k\x12\r\x02§[int(_loc6_.§|k\x12\r\x02§.length) - 1];
            _loc6_.available = Boolean(_loc8_._available);
            if(!_loc6_.available)
            {
               _loc6_.card.§e\x1fSH\x02§();
            }
            else
            {
               _loc6_.card.§z\x03\r\x15\x02§();
            }
            _loc6_.card.§\x05c'u§(int(_loc6_.§|k\x12\r\x02§.length));
            _loc4_++;
         }
      }
      
      public function initBg() : void
      {
         var _loc1_:* = null as Sprite;
      }
      
      public function §1]\x1d\x17\x01§(param1:Object) : Object
      {
         var _loc2_:* = add(param1);
         var _loc3_:Number = _loc2_.card.sprite.x;
         var _loc4_:Number = _loc2_.card.sprite.y;
         remove(param1);
         return {
            "x":Number(§\f\x03h§.x + _loc3_),
            "y":Number(§\f\x03h§.y + _loc4_)
         };
      }
      
      public function §p90'\x03§(param1:Object) : Object
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:Array = slots;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.card.type == param1._type)
            {
               return _loc4_;
            }
         }
         var _loc5_:Card = new Card(param1._type);
         _loc4_ = {
            "card":_loc5_,
            "c":0,
            "tx":null,
            "teleport":true,
            "available":false,
            "|k\x12\r\x02":[]
         };
         _loc5_.§T\n8\x02§.visible = false;
         §\f\x03h§.addChild(_loc5_.sprite);
         slots.push(_loc4_);
         return _loc4_;
      }
      
      public function formatTime(param1:Number) : String
      {
         var _loc2_:* = DateTools.parse(param1);
         var _loc3_:String = Std.string(int(_loc2_.minutes));
         var _loc4_:String = Std.string(int(_loc2_.seconds));
         while(_loc3_.length < 2)
         {
            _loc3_ = "0" + _loc3_;
         }
         while(_loc4_.length < 2)
         {
            _loc4_ = "0" + _loc4_;
         }
         return int(_loc2_.hours) + ":" + _loc3_ + ":" + _loc4_;
      }
      
      public function click() : void
      {
         if(!active || selection == null || !selection.available || !Browser.me.§\x13ET]\x02§.visible)
         {
            return;
         }
         §Z\x01\x19f§(selection);
      }
      
      public function add(param1:Object, param2:Boolean = true) : Object
      {
         var _loc3_:* = §p90'\x03§(param1);
         _loc3_.§|k\x12\r\x02§.push(param1);
         if(param2)
         {
            maj();
         }
         return _loc3_;
      }
   }
}
