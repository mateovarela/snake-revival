package
{
   import flash.Boot;
   import flash.display.Sprite;
   import haxe.Timer;
   import mt.bumdum9.Col;
   import mt.fx.Manager;
   import pix.Frame;
   
   public class Inter
   {
      
      public static var WIDTH:int = 440;
      
      public static var HEIGHT:int = 210;
      
      public static var MARGIN:int = 110;
      
      public static var §\x164\x12y\x01§:int = 10;
      
      public static var §q1\x04f\x01§:int = 9;
      
      public static var me:Inter;
       
      
      public var vigs:Array;
      
      public var tabs:Array;
      
      public var §)]\x16w§:int;
      
      public var §d8\x16E\x03§:int;
      
      public var §!u\x171\x02§:Array;
      
      public var root:Sprite;
      
      public var players:Array;
      
      public var page:int;
      
      public var groups:Array;
      
      public var fxm:Manager;
      
      public var data:Object;
      
      public var §D ^\x1f\x03§:_ScoreSection;
      
      public function Inter(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         Inter.me = this;
         data = param1;
         root = new Sprite();
         Main.root.addChild(root);
         initBg();
         fxm = new Manager();
         §d8\x16E\x03§ = 0;
         vigs = [];
         §;m_8\x01§();
         §O/-O§(param1._sections);
         §68J?§();
         if(int(param1._sections.length) > 0)
         {
            select(param1._sections[0],0);
         }
      }
      
      public function update() : void
      {
         fxm.update();
      }
      
      public function §\x05M&\x0e\x01§(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1._score[§d8\x16E\x03§]._score);
         var _loc4_:int = int(param2._score[§d8\x16E\x03§]._score);
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ == _loc4_)
         {
            return 0;
         }
         return 1;
      }
      
      public function §\x03*]u\x02§(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1._score[§d8\x16E\x03§]._replayId);
         var _loc4_:int = int(param2._score[§d8\x16E\x03§]._replayId);
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ == _loc4_)
         {
            return 0;
         }
         return 1;
      }
      
      public function §c\fm\x1b\x02§(param1:int) : void
      {
         var _loc5_:* = null as §}\n\x16\n\x03§;
         var _loc2_:§}\n\x16\n\x03§ = tabs[param1];
         var _loc3_:int = 0;
         var _loc4_:Array = tabs;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc5_.§s\x03n\b\x01§(false);
         }
         _loc2_.§s\x03n\b\x01§(true);
         §\x17\x01R5\x02§();
         §\x10s\x0fS\x01§(param1);
      }
      
      public function select(param1:_ScoreSection, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as §}\n\x16\n\x03§;
         var _loc6_:* = null;
         §\x17\x01R5\x02§();
         _loc3_ = 0;
         _loc4_ = groups;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc5_.§s\x03n\b\x01§(false);
         }
         groups[param2].§s\x03n\b\x01§(true);
         §D ^\x1f\x03§ = param1;
         if(!§l%Rc\x01§())
         {
            _loc3_ = 0;
            _loc4_ = tabs;
            while(_loc3_ < int(_loc4_.length))
            {
               _loc5_ = _loc4_[_loc3_];
               _loc3_++;
               _loc5_.visible = false;
            }
         }
         if(Main.dev)
         {
            var me:Inter = this;
            Timer.delay(function():void
            {
               me.§\x0fl6n\x02§(me.§\x15e?;\x02§());
            },1000);
         }
         else
         {
            _loc6_ = {"_s":param1};
            Codec.load(Main.domain + "/selScore",_loc6_,§\x0fl6n\x02§);
         }
      }
      
      public function §\x0fl6n\x02§(param1:Object) : void
      {
         var _loc4_:* = null;
         players = param1._list;
         §)]\x16w§ = 1;
         var _loc2_:int = 0;
         var _loc3_:Array = param1._list;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(int(_loc4_._score.length) > §)]\x16w§)
            {
               §)]\x16w§ = int(_loc4_._score.length);
            }
         }
         §\x10s\x0fS\x01§(§d8\x16E\x03§);
      }
      
      public function §l%Rc\x01§() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = §D ^\x1f\x03§.params;
         switch(int(§D ^\x1f\x03§.index))
         {
            default:
            default:
               return true;
            case 2:
            case 3:
            case 4:
               return false;
            case 5:
            case 6:
               _loc2_ = _loc1_[0];
               _loc3_ = _loc1_[1];
               return false;
         }
      }
      
      public function §;m_8\x01§() : void
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as §}\n\x16\n\x03§;
         tabs = [];
         var me:Inter = this;
         var _loc1_:int = 100;
         var _loc2_:int = 0;
         while(_loc2_ < 3)
         {
            _loc2_++;
            var id:Array = [_loc2_];
            _loc3_ = Lang.§\n'\r\x0b\x01§[int(id[0])];
            _loc4_ = new §}\n\x16\n\x03§(function(param1:Array):Function
            {
               var id:Array = param1;
               return function():void
               {
                  me.§c\fm\x1b\x02§(int(id[0]));
               };
            }(id),_loc3_);
            _loc4_.x = Number(Inter.MARGIN + 2 + (int(id[0]) + 0.5) * _loc1_);
            _loc4_.y = int(Inter.§\x164\x12y\x01§ * 0.5);
            _loc4_.§\x07EvB\x01§(_loc1_,Inter.§\x164\x12y\x01§);
            _loc4_.§Y;\x16~§ = [Gfx.col("green_2"),Gfx.col("green_1"),Gfx.col("green_2"),Gfx.col("green_1")];
            _loc4_.§m\tM6§ = [Gfx.col("green_1"),Gfx.col("green_2"),Gfx.col("green_1"),16777215];
            root.addChild(_loc4_);
            Main.buts.push(_loc4_);
            tabs.push(_loc4_);
         }
         tabs[§d8\x16E\x03§].§s\x03n\b\x01§(true);
      }
      
      public function §68J?§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as §\x01K\x01U§;
         var me:Inter = this;
         §!u\x171\x02§ = [];
         var _loc1_:int = 0;
         while(_loc1_ < 2)
         {
            _loc1_++;
            _loc2_ = _loc1_;
            var sens:Array = [_loc2_ * 2 - 1];
            _loc3_ = 0;
            while(_loc3_ < 2)
            {
               _loc3_++;
               var i:Array = [_loc3_];
               _loc4_ = [];
               _loc5_ = 0;
               while(_loc5_ < 3)
               {
                  _loc5_++;
                  _loc6_ = _loc5_;
                  _loc4_.push(Gfx.bg.get(_loc6_,["but_scroll","but_scroll_fast"][int(i[0])]));
               }
               _loc7_ = new §\x01K\x01U§(function(param1:Array, param2:Array):Function
               {
                  var i:Array = param1;
                  var sens:Array = param2;
                  return function():void
                  {
                     me.§wp1\x05\x02§((1 + int(i[0]) * 9) * int(sens[0]));
                  };
               }(i,sens),_loc4_);
               root.addChild(_loc7_);
               _loc7_.x = Inter.WIDTH - 22;
               _loc7_.y = Number(Number(Inter.§\x164\x12y\x01§ + (Inter.HEIGHT - Inter.§\x164\x12y\x01§) * 0.5) + (59 + int(i[0]) * 31) * int(sens[0]));
               _loc7_.scaleY = -int(sens[0]);
               Main.buts.push(_loc7_);
               _loc7_.§+VZ§ = 0.5;
               _loc7_.§Hp@\x0f\x01§(true);
               §!u\x171\x02§.push(_loc7_);
            }
         }
      }
      
      public function §O/-O§(param1:Array) : void
      {
         var _loc6_:* = null as String;
         var _loc7_:* = null as Function;
         var _loc8_:* = null as §}\n\x16\n\x03§;
         var a:Array = param1;
         var _loc2_:Number = Number(Math.min(Inter.HEIGHT / (int(a.length) + 1),20));
         var _loc3_:int = int((Inter.HEIGHT - _loc2_ * (int(a.length) - 1)) * 0.5);
         if(_loc3_ > 30)
         {
            _loc3_ = 30;
         }
         if(_loc3_ < 7)
         {
            _loc3_ = 7;
         }
         groups = [];
         var me:Inter = this;
         var _loc4_:int = 0;
         var _loc5_:int = int(a.length);
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            var id:Array = [_loc4_];
            _loc6_ = §(X2|\x03§(a[int(id[0])]);
            _loc7_ = function(param1:Array):Function
            {
               var id:Array = param1;
               return function():void
               {
                  me.select(a[int(id[0])],int(id[0]));
               };
            }(id);
            _loc8_ = new §}\n\x16\n\x03§(_loc7_,_loc6_);
            root.addChild(_loc8_);
            _loc8_.x = Inter.MARGIN * 0.5;
            _loc8_.y = _loc3_;
            _loc8_.§\x07EvB\x01§(Inter.MARGIN,12);
            _loc8_.§m\tM6§[0] = 13434760;
            _loc8_.§Y;\x16~§ = [Gfx.col("green_0"),int(Col.brighten(Gfx.col("green_0"),30)),Gfx.col("green_0"),Gfx.col("red_0")];
            _loc8_.§#\x06Jt§ = [null,null,null,16777215];
            _loc3_ = _loc3_ + int(_loc2_);
            Main.buts.push(_loc8_);
            groups.push(_loc8_);
         }
      }
      
      public function initBg() : void
      {
         root.graphics.beginFill(Gfx.col("green_1"));
         root.graphics.drawRect(0,0,Inter.WIDTH,Inter.HEIGHT);
         root.graphics.beginFill(Gfx.col("green_0"));
         root.graphics.drawRect(0,0,Inter.MARGIN,Inter.HEIGHT);
         root.graphics.beginFill(16777215);
         root.graphics.drawRect(Inter.MARGIN,0,1,Inter.HEIGHT);
         root.graphics.beginFill(int(Col.brighten(Gfx.col("green_2"),-50)));
         root.graphics.drawRect(Inter.MARGIN + 1,0,1,Inter.HEIGHT);
         var _loc1_:int = Inter.MARGIN + 2;
         root.graphics.beginFill(int(Col.brighten(Gfx.col("green_2"),-40)));
         root.graphics.drawRect(_loc1_,0,Inter.WIDTH - _loc1_,Inter.§\x164\x12y\x01§);
      }
      
      public function §wp1\x05\x02§(param1:int) : void
      {
         page = page + param1;
         var _loc2_:int = int((int(players.length) - 1) / Inter.§q1\x04f\x01§);
         if(page > _loc2_)
         {
            page = _loc2_;
         }
         if(page < 0)
         {
            page = 0;
         }
         §kQ\x1aI\x03§();
      }
      
      public function §,J$D\x02§() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = players;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_._name == data._me)
            {
               break;
            }
            _loc1_++;
         }
         page = int(_loc1_ / Inter.§q1\x04f\x01§);
      }
      
      public function §(X2|\x03§(param1:_ScoreSection) : String
      {
         var _loc3_:* = null as String;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Array = param1.params;
         switch(int(param1.index))
         {
            case 0:
               return Lang.§(Uh\x01\x03§;
            case 1:
               _loc3_ = _loc2_[0];
               return _loc3_;
            case 2:
               return Lang.§*$M=\x01§;
            case 3:
               return Lang.§Z\x1b\x01g§;
            case 4:
               return Lang.§G'\x178\x02§;
            case 5:
               _loc4_ = _loc2_[0];
               _loc5_ = _loc2_[1];
               return Lang.TOURNAMENT + " " + "ABCDEFGHIJKLMNOPQRSTUVWXYZ".charAt(_loc5_);
            case 6:
               return Lang.§\tr(w\x03§;
         }
      }
      
      public function §\x06;49\x02§() : String
      {
         var _loc1_:Array = ["Dark","White","Snow","Red","Deep","Black","Fried","Fun","Kiki","Lolo","Mimi","Nana","Super","Ultra","Giga","Extra","Mega"];
         var _loc2_:Array = ["Boss","Bison","Sangoku","Neo","Bouzig","Shiva","City","Hunter","Warrior","Saya","Surfer","Skater","Poutre","Blaster","Killer","Ninja","Shinobi","Kikou"];
         var _loc3_:Array = ["du95","2000","33","2010","2009","2008","2007","2006","2004","92","93","94"];
         var _loc4_:String = _loc1_[int(Std.random(int(_loc1_.length)))] + _loc2_[int(Std.random(int(_loc2_.length)))];
         if(int(Std.random(5)) == 0)
         {
            _loc4_ = _loc4_ + _loc3_[int(Std.random(int(_loc3_.length)))];
         }
         return _loc4_;
      }
      
      public function §\x15e?;\x02§() : Object
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc1_:* = {"_list":[]};
         var _loc2_:int = 0;
         while(_loc2_ < 64)
         {
            _loc2_++;
            _loc3_ = _loc2_;
            _loc4_ = {
               "_name":§\x06;49\x02§(),
               "_avatar":"hale.gif",
               "_score":[]
            };
            _loc5_ = 3;
            if(§D ^\x1f\x03§ == _ScoreSection.§@zcy\x02§)
            {
               _loc5_ = 1;
            }
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc6_++;
               _loc7_ = _loc6_;
               _loc8_ = {
                  "_score":int(Std.random(1200)) * 50,
                  "_cards":[],
                  "_replayId":int(Std.random(140000))
               };
               _loc9_ = 2;
               while(_loc9_ < 6 && int(Std.random(2)) == 0)
               {
                  _loc9_++;
               }
               _loc10_ = int(Data.§0\x14UO\x02§());
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  _loc11_++;
                  _loc12_ = _loc11_;
                  _loc8_._cards.push(§\x19\n\t\x01§.getEnum(_CardType,int(Std.random(_loc10_))));
               }
               _loc4_._score.push(_loc8_);
            }
            _loc1_._list.push(_loc4_);
         }
         _loc1_._list[int(Std.random(int(_loc1_._list.length)))]._name = "Bumdum";
         return _loc1_;
      }
      
      public function §\x10s\x0fS\x01§(param1:int) : void
      {
         page = 0;
         §d8\x16E\x03§ = param1;
         if(§d8\x16E\x03§ >= §)]\x16w§)
         {
            §d8\x16E\x03§ = §)]\x16w§ - 1;
         }
         switch(int(§D ^\x1f\x03§.index))
         {
            default:
            default:
               players.sort(§\x05M&\x0e\x01§);
               §,J$D\x02§();
               break;
            case 2:
               players.sort(§\x03*]u\x02§);
               break;
            case 3:
               players.sort(§\x05M&\x0e\x01§);
         }
         §kQ\x1aI\x03§();
      }
      
      public function §kQ\x1aI\x03§() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null as Vig;
         §\x17\x01R5\x02§();
         var _loc1_:int = int((int(players.length) - 1) / Inter.§q1\x04f\x01§);
         var _loc2_:int = 0;
         _loc3_ = Inter.§q1\x04f\x01§;
         while(_loc2_ < _loc3_)
         {
            _loc2_++;
            _loc4_ = _loc2_;
            _loc5_ = page * Inter.§q1\x04f\x01§ + _loc4_;
            if(_loc5_ >= int(players.length))
            {
               break;
            }
            _loc6_ = players[_loc5_];
            _loc7_ = new Vig(_loc6_,§d8\x16E\x03§,_loc5_);
            _loc7_.x = Inter.MARGIN + 4;
            _loc7_.y = 12 + _loc4_ * Vig.HEIGHT;
            vigs.push(_loc7_);
            if(§D ^\x1f\x03§ == _ScoreSection.§\x11Fm\x05§ && _loc5_ < 5)
            {
               _loc7_.§\x06[Q(\x03§(0);
            }
         }
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            _loc2_++;
            _loc3_ = _loc2_;
            §!u\x171\x02§[_loc3_].§Hp@\x0f\x01§(page == (_loc3_ < 2?0:_loc1_));
         }
      }
      
      public function §\x17\x01R5\x02§() : void
      {
         while(int(vigs.length) > 0)
         {
            vigs.pop().kill();
         }
      }
   }
}
