package browser
{
   import browser._Draft.§Ki\x12a\x02§;
   import flash.Boot;
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.external.ExternalInterface;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import haxe.Log;
   import haxe.Timer;
   import mt.bumdum9.Col;
   import mt.bumdum9.Filt;
   import mt.bumdum9.Num;
   import mt.fx.Sleep;
   import mt.fx.Tween;
   import pix.Element;
   import pix.Frame;
   import tora.Protocol;
   
   public class Draft extends Browser
   {
      
      public static var §\x1a2u1\x03§:int = 60;
      
      public static var §(m\\\x06\x03§:int = 43;
       
      
      public var wait:Boolean;
      
      public var slots:Array;
      
      public var read:Boolean;
      
      public var protocol:Protocol;
      
      public var §TZ?Y§:Timer;
      
      public var now:Number;
      
      public var §\x01]\x15o\x03§:Object;
      
      public var §&\x01\x01^§:Object;
      
      public var §r)\x1b\x01\x01§:TextField;
      
      public function Draft(param1:Object = undefined)
      {
         var _loc3_:* = null as But;
         var _loc4_:int = 0;
         var _loc5_:* = null as Array;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null as Array;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         Log.setColor(16711680);
         action = §~\t5A\x03§;
         §\x13ET]\x02§.visible = false;
         §\x1a vx\x03§ = 1;
         slots = [];
         var _loc2_:Array = param1._draft._step.§N\nM\x03§;
         switch(int(param1._draft._step.index))
         {
            case 0:
               §1z13\x01§();
               §7D'q\x03§();
               break;
            case 1:
               §1z13\x01§();
               §7D'q\x03§();
               §-\x13YL\x02§(Lang.§\x04\x1en5\x01§);
               _loc3_ = §\x1f\r\b}§(Lang.§J)\x11\x01§,subscribe);
               _loc3_.§\x1bm)N§("500",true);
               _loc3_.x = _loc3_.x - 20;
               _loc4_ = 0;
               _loc5_ = param1._draft._players;
               while(_loc4_ < int(_loc5_.length))
               {
                  _loc6_ = _loc5_[_loc4_];
                  _loc4_++;
                  _loc7_ = {
                     "_data":_loc6_,
                     "_cards":0,
                     "_packs":0,
                     "_score":0,
                     "_cardDetails":[],
                     "_per":null
                  };
                  §\x017E\x19§(_loc7_,§Ki\x12a\x02§.§uj\\(\x02§);
               }
               break;
            case 2:
               §uU'\x1d\x03§();
               §\x04M|W\x01§();
               connect();
               break;
            case 3:
               _loc5_ = _loc2_[0];
               §uU'\x1d\x03§();
               §\x13ET]\x02§.visible = true;
               _loc8_ = _loc5_.copy();
               _loc8_.sort(§\x04\x1e\x17P§);
               _loc4_ = 0;
               while(_loc4_ < int(_loc5_.length))
               {
                  _loc6_ = _loc5_[_loc4_];
                  _loc4_++;
                  _loc9_ = 1;
                  _loc10_ = 0;
                  while(_loc10_ < int(_loc8_.length))
                  {
                     _loc7_ = _loc8_[_loc10_];
                     _loc10_++;
                     if(_loc7_ == _loc6_)
                     {
                        break;
                     }
                     _loc9_++;
                  }
                  §\x017E\x19§(_loc6_,§Ki\x12a\x02§.§*/?\n§,_loc9_);
               }
               §\x04M|W\x01§();
         }
      }
      
      public function §~\t5A\x03§() : void
      {
         var _loc4_:* = null as String;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null;
         var _loc8_:* = null as §_\x19X\x13\x03§;
         now = Number(Main.now());
         var _loc1_:* = data._draft;
         var _loc2_:Number = _loc1_._timeLimit - now;
         if(_loc2_ <= 0)
         {
            return;
         }
         var _loc3_:Array = _loc1_._step.§N\nM\x03§;
         switch(int(_loc1_._step.index))
         {
            case 0:
               §-\x13YL\x02§(Lang.rep(Lang.§;eq,§,Std.string(Data.§z\x0eh\x1e\x03§),Std.string(Data.§\x03)\x02t§),Std.string(Data.§Ri\x03G\x03§),Cs.formatTime(_loc2_)));
               break;
            case 1:
               _loc4_ = Std.string(Data.§z\x0eh\x1e\x03§ - int(data._draft._players.length));
               §-\x13YL\x02§(Lang.rep(Lang.§\x04\x1en5\x01§,Cs.formatTime(_loc2_),_loc4_));
               break;
            case 2:
               if(!wait)
               {
                  §=3a\x0e\x02§();
               }
               _loc5_ = 0;
               _loc6_ = slots;
               while(_loc5_ < int(_loc6_.length))
               {
                  _loc7_ = _loc6_[_loc5_];
                  _loc5_++;
                  §\x03\x16\x17X\x01§(_loc7_);
               }
               §r)\x1b\x01\x01§.visible = int(slots.length) < Data.§z\x0eh\x1e\x03§;
               break;
            case 3:
               _loc6_ = _loc3_[0];
               §=3a\x0e\x02§();
         }
         if(§r)\x1b\x01\x01§ != null)
         {
            §r)\x1b\x01\x01§.text = Lang.§L_\x1a\x19\x03§ + " " + Cs.formatTime(_loc2_);
         }
         _loc5_ = 0;
         _loc3_ = §K\x16-]\x03§;
         while(_loc5_ < int(_loc3_.length))
         {
            _loc8_ = _loc3_[_loc5_];
            _loc5_++;
            _loc8_.update();
         }
      }
      
      public function §W5)\x01\x01§(param1:_DraftMsg) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var th:Draft = this;
         var _loc2_:Function = function(param1:Boolean, param2:Boolean, param3:Boolean):void
         {
            var _loc4_:String = Lang.col(Lang.§i6u?\x03§[0],"#FF4444");
            if(param1)
            {
               _loc4_ = _loc4_ + ("\n\n" + Lang.§i6u?\x03§[1]);
            }
            if(param2)
            {
               _loc4_ = _loc4_ + ("\n\n" + Lang.§i6u?\x03§[2]);
            }
            if(param3)
            {
               _loc4_ = _loc4_ + ("\n\n" + Lang.§i6u?\x03§[2]);
            }
            th.§-\x13YL\x02§(_loc4_);
            Timer.delay(Main.refresh,4000);
         };
         var _loc3_:Array = param1.§N\nM\x03§;
         switch(int(param1.index))
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
               _loc2_(false,false,true);
               break;
            case 10:
               _loc4_ = _loc3_[0];
               _loc5_ = _loc3_[1];
               _loc6_ = _loc3_[2];
               if(_loc4_)
               {
                  Main.refresh();
                  break;
               }
               _loc2_(_loc5_,_loc6_,false);
               break;
         }
      }
      
      public function subscribe() : void
      {
         buts.pop().kill();
         §-\x13YL\x02§(Lang.§\x14\x0b0W§,0);
         action = null;
         protocol = Codec.connect(data._draft._serverUrl,_DraftCmd.§D\x10^*\x01§(data._draft._pKey),§W5)\x01\x01§);
      }
      
      public function stopChrono(param1:Object) : void
      {
         param1.§NN\x0b4\x03§ = null;
         param1.§T\n8\x02§.gotoAndStop(1);
         Col.setPercentColor(param1.av,0,0);
      }
      
      public function §\x1bKzj\x01§(param1:Object, param2:Object) : void
      {
         param1.§NN\x0b4\x03§ = param2;
         Col.setPercentColor(param1.av,0,0);
      }
      
      public function §\x04\x1e\x17P§(param1:Object, param2:Object) : int
      {
         if(int(param1._score) > int(param2._score))
         {
            return -1;
         }
         return 1;
      }
      
      public function §\x05`FE§(param1:String) : void
      {
         ExternalInterface.call("_title",param1);
      }
      
      public function send(param1:_DraftCmd, param2:* = undefined) : void
      {
         wait = true;
         Codec.send(protocol,data._draft._serverUrl,param1);
      }
      
      public function §PJ\x01\x1d§(param1:§_\x19X\x13\x03§) : void
      {
         var _loc6_:* = null as §_\x19X\x13\x03§;
         read = false;
         pick(§\x01]\x15o\x03§);
         §\x17\x11gT§(param1);
         var _loc2_:* = §\bDFG\x03§(int(§\x01]\x15o\x03§.id),1);
         var _loc3_:Draft = this;
         var _loc4_:Array = hand.copy();
         var _loc5_:int = 0;
         while(_loc5_ < int(_loc4_.length))
         {
            _loc6_ = _loc4_[_loc5_];
            _loc5_++;
            if(_loc6_ != param1)
            {
               _loc6_.moveTo(Number(_loc2_.x),Number(_loc2_.y));
               hand.remove(_loc6_);
               §K\x16-]\x03§.push(_loc6_);
               _loc6_.§V[t\x11\x02§ = _loc6_.kill;
            }
         }
      }
      
      public function receive(param1:_DraftMsg) : void
      {
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as _CardType;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null as §_\x19X\x13\x03§;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null as Element;
         var _loc18_:* = null as Tween;
         var _loc19_:* = null as _DraftMsg;
         var _loc2_:Array = param1.§N\nM\x03§;
         switch(int(param1.index))
         {
            case 0:
               _loc3_ = _loc2_[0];
               _loc4_ = _loc2_[1];
               _loc5_ = 0;
               while(_loc5_ < int(_loc4_.length))
               {
                  _loc6_ = _loc4_[_loc5_];
                  _loc5_++;
                  _loc7_ = §\x017E\x19§(_loc6_,§Ki\x12a\x02§.§j=\x1ce\x01§);
                  if(_loc7_.data._per != null)
                  {
                     §\x1bKzj\x01§(_loc7_,_loc6_._per);
                  }
               }
               _loc8_ = [];
               _loc5_ = 0;
               while(_loc5_ < int(_loc3_.length))
               {
                  _loc9_ = _loc3_[_loc5_];
                  _loc5_++;
                  _loc8_.push({
                     "_type":_loc9_,
                     "_available":true
                  });
               }
               nav.set(_loc8_);
               §}ukO\x02§();
               break;
            case 1:
               _loc3_ = _loc2_[0];
               _loc5_ = _loc2_[1];
               _loc10_ = _loc2_[2];
               if(int(§\x01]\x15o\x03§.data._data._id) != _loc5_)
               {
                  return;
               }
               read = true;
               §-\x13YL\x02§("");
               _loc6_ = §\bDFG\x03§(int(§\x01]\x15o\x03§.id),-1);
               _loc11_ = 0;
               _loc12_ = 0;
               while(_loc12_ < int(_loc3_.length))
               {
                  _loc9_ = _loc3_[_loc12_];
                  _loc12_++;
                  _loc13_ = new §_\x19X\x13\x03§({
                     "_type":_loc9_,
                     "_available":true
                  });
                  _loc13_.x = Number(_loc6_.x);
                  _loc13_.y = Number(_loc6_.y);
                  _loc13_.§\x01\x03\x1b(\x01§();
                  _loc13_.§Hp@\x0f\x01§(_loc11_);
                  _loc11_ = _loc11_ + 3;
               }
               _loc12_ = 0;
               _loc4_ = hand;
               while(_loc12_ < int(_loc4_.length))
               {
                  _loc13_ = _loc4_[_loc12_];
                  _loc12_++;
                  _loc13_.§\x01\x03\x1b(\x01§();
               }
               §\x1bKzj\x01§(§\x01]\x15o\x03§,_loc10_);
               §\x05`FE§(Lang.§QgcU\x03§);
               break;
            case 2:
               _loc9_ = _loc2_[0];
               _loc5_ = _loc2_[1];
               if(int(§\x01]\x15o\x03§.data._data._id) != _loc5_)
               {
                  return;
               }
               _loc11_ = 0;
               _loc3_ = hand;
               while(_loc11_ < int(_loc3_.length))
               {
                  _loc13_ = _loc3_[_loc11_];
                  _loc11_++;
                  if(_loc13_.data._type == _loc9_)
                  {
                     §PJ\x01\x1d§(_loc13_);
                  }
               }
               if(wait)
               {
                  wait = false;
               }
               break;
            case 3:
               _loc5_ = _loc2_[0];
               _loc11_ = _loc2_[1];
               _loc12_ = _loc2_[2];
               _loc6_ = §p90'\x03§(_loc5_);
               if(_loc6_ != §\x01]\x15o\x03§)
               {
                  pick(_loc6_);
               }
               if(_loc5_ == int(§\x01]\x15o\x03§.data._data._id))
               {
                  return;
               }
               if(_loc11_ == int(§\x01]\x15o\x03§.data._data._id) && int(§\x01]\x15o\x03§.data._packs) == 0)
               {
                  return;
               }
               _loc7_ = §\bDFG\x03§(int(_loc6_.id),0);
               _loc14_ = §\bDFG\x03§(int(_loc6_.id),1);
               _loc15_ = 0;
               while(_loc15_ < _loc12_)
               {
                  _loc15_++;
                  _loc16_ = _loc15_;
                  _loc17_ = new Element();
                  _loc17_.drawFrame(Gfx.main.get(null,"medium_card"));
                  _loc17_.x = Number(_loc7_.x);
                  _loc17_.y = Number(_loc7_.y);
                  dm.add(_loc17_,5);
                  _loc18_ = new Tween(_loc17_,Number(_loc14_.x),Number(_loc14_.y));
                  _loc18_.§*r*_\x03§(10);
                  _loc18_.curveInOut();
                  _loc18_.onFinish = _loc17_.kill;
                  new Sleep(_loc18_,null,(_loc12_ - _loc16_) * 5);
               }
               break;
            case 4:
               _loc6_ = _loc2_[0];
               §\x017E\x19§(_loc6_,§Ki\x12a\x02§.§j=\x1ce\x01§);
               §}ukO\x02§();
               break;
            case 5:
               Main.refresh();
               break;
            case 6:
               _loc3_ = _loc2_[0];
               _loc5_ = 0;
               while(_loc5_ < int(_loc3_.length))
               {
                  _loc19_ = _loc3_[_loc5_];
                  _loc5_++;
                  receive(_loc19_);
               }
               break;
            case 7:
               _loc5_ = _loc2_[0];
               if(§&\x01\x01^§ == _loc5_)
               {
                  §&\x01\x01^§ = null;
               }
               break;
            case 8:
               _loc5_ = _loc2_[0];
               if(§&\x01\x01^§ == _loc5_)
               {
                  §&\x01\x01^§ = null;
               }
               break;
            case 9:
               §au3{\x02§();
         }
      }
      
      public function pick(param1:Object) : void
      {
         param1.data._cards = int(param1.data._cards) + 1;
         param1.data._packs = int(param1.data._packs) - 1;
         §\x1fF\rd\x03§(param1);
         var _loc2_:* = §XxV;\x02§(param1);
         _loc2_.data._packs = int(_loc2_.data._packs) + 1;
         §\x1fF\rd\x03§(_loc2_);
         if(int(param1.data._packs) > 0)
         {
            §\x1bKzj\x01§(param1,Number(now + int(Data.§#1\tf\x02§(10 - int(param1.data._cards)))));
         }
         else
         {
            stopChrono(param1);
         }
         if(int(_loc2_.data._packs) == 1)
         {
            §\x1bKzj\x01§(_loc2_,Number(now + int(Data.§#1\tf\x02§(10 - int(_loc2_.data._cards)))));
         }
         §}ukO\x02§();
      }
      
      public function §DfSP\x02§() : void
      {
         if(§&\x01\x01^§ != null)
         {
            §\\)lF§();
            §TZ?Y§.stop();
            try
            {
               protocol.close();
               return;
            }
            catch(_loc2_:*)
            {
               return;
            }
            return;
         }
         §&\x01\x01^§ = int(Std.random(65536));
         Codec.send(protocol,data._draft._serverUrl,_DraftCmd.§T\x1fw\x1a\x02§(§&\x01\x01^§));
      }
      
      public function §eL]\x19\x01§(param1:Object, param2:int, param3:§Ki\x12a\x02§, param4:Object = undefined) : Object
      {
         var _loc13_:* = null as TextField;
         var _loc17_:int = 0;
         var _loc18_:* = null as Element;
         var _loc19_:* = null as TextField;
         var _loc20_:* = null as But;
         var _loc5_:int = Draft.§\x1a2u1\x03§;
         var _loc6_:int = Draft.§(m\\\x06\x03§;
         var _loc7_:Sprite = new Sprite();
         dm.add(_loc7_,Browser.§(Xc\x05\x01§);
         var _loc8_:int = 10;
         if(param3 == §Ki\x12a\x02§.§*/?\n§)
         {
            _loc8_ = _loc8_ * 2;
         }
         var _loc9_:int = _loc6_ - _loc8_;
         var slot:Object = {
            "base":_loc7_,
            "data":param1,
            "av":null,
            "fields":[],
            "id":param2,
            "dmo":param3,
            "avs":_loc9_,
            "T\n8\x02":null,
            "NN\x0b4\x03":null
         };
         var _loc10_:Graphics = _loc7_.graphics;
         var _loc11_:Number = param2 / Data.§z\x0eh\x1e\x03§;
         var _loc12_:int = int(Col.getRainbow((0.5 + _loc11_ * 0.8) % 1));
         _loc10_.beginFill(_loc12_);
         _loc10_.drawRect(0,0,_loc5_,_loc6_);
         _loc10_.endFill();
         _loc10_.beginFill(int(Col.brighten(_loc12_,-80)));
         _loc10_.drawRect(0,0,_loc5_,10);
         _loc10_.endFill();
         if(param3 == §Ki\x12a\x02§.§*/?\n§)
         {
            _loc10_.beginFill(int(Col.brighten(_loc12_,-40)));
            _loc10_.drawRect(0,10,_loc5_,10);
            _loc10_.endFill();
            _loc13_ = Cs.getField(int(Col.brighten(_loc12_,80)),8,-1,"nokia");
            _loc13_.y = 8;
            _loc13_.htmlText = Lang.col(param4 + "> ","#FFFFFF") + int(param1._score);
            _loc7_.addChild(_loc13_);
         }
         Filt.glow(_loc7_,2,40,16777215);
         _loc13_ = Cs.getField(int(Col.brighten(_loc12_,140)),8,-1,"nokia");
         _loc13_.text = param1._data._name;
         _loc13_.y = -2;
         _loc7_.addChild(_loc13_);
         slot.av = new Avatar(_loc9_,param1._data._avatar);
         slot.av.y = _loc8_;
         _loc7_.addChild(slot.av);
         slot.§T\n8\x02§ = new ebIW();
         slot.base.addChild(slot.§T\n8\x02§);
         slot.§T\n8\x02§.scaleX = int(slot.avs) / 100;
         slot.§T\n8\x02§.scaleY = slot.§T\n8\x02§.scaleX;
         slot.§T\n8\x02§.stop();
         slot.§T\n8\x02§.y = _loc8_;
         Col.setColor(slot.§T\n8\x02§,_loc12_,-40);
         slot.§T\n8\x02§.alpha = 0.75;
         var _loc14_:Array = [0,1,2];
         if(param3 == §Ki\x12a\x02§.§*/?\n§)
         {
            _loc14_ = [0,2];
         }
         var _loc15_:int = 0;
         var _loc16_:int = int(_loc14_.length);
         while(_loc15_ < _loc16_)
         {
            _loc15_++;
            _loc17_ = _loc15_;
            _loc18_ = new Element();
            _loc18_.drawFrame(Gfx.main.get(int(_loc14_[_loc17_]),"icon_draft"),0,0);
            _loc18_.x = _loc9_ + 1;
            _loc18_.y = _loc8_ + 1 + _loc17_ * 11;
            _loc19_ = Cs.getField(16777215,8,-1,"nokia");
            _loc19_.y = _loc18_.y - 2;
            _loc19_.filters = [new GlowFilter(0,0.1,2,2,40)];
            slot.fields.push(_loc19_);
            _loc7_.addChild(_loc18_);
            _loc7_.addChild(_loc19_);
         }
         if(param3 == §Ki\x12a\x02§.§*/?\n§)
         {
            _loc20_ = new But();
            _loc20_.x = _loc5_ * 0.5;
            _loc20_.§?]ao\x02§(_loc5_,_loc6_);
            slot.base.addChild(_loc20_);
            var me:Draft = this;
            _loc20_.§i\x1b06\x03§ = function():void
            {
               me.§FB;K\x01§(slot);
            };
            _loc20_.§\x01d,I\x02§ = §;dA'\x02§;
            buts.push(_loc20_);
         }
         §\x1fF\rd\x03§(slot);
         return slot;
      }
      
      public function §\x03\x16\x17X\x01§(param1:Object) : void
      {
         if(param1.§NN\x0b4\x03§ == null)
         {
            return;
         }
         var _loc2_:Number = param1.§NN\x0b4\x03§ - now;
         var _loc3_:int = int(Data.§#1\tf\x02§(10 - int(param1.data._cards)));
         var _loc4_:Number = 1 - _loc2_ / _loc3_;
         _loc4_ = Number(Num.mm(0,_loc4_,1));
         param1.§T\n8\x02§.gotoAndStop(int(_loc4_ * 160) + 1);
      }
      
      public function §\x1fF\rd\x03§(param1:Object) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as TextField;
         var _loc8_:* = null as String;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:* = param1.data;
         var _loc3_:Array = [int(_loc2_._cards),int(_loc2_._packs),int(_loc2_._data._rank) * 0.1];
         if(param1.dmo == §Ki\x12a\x02§.§*/?\n§)
         {
            _loc3_ = [int(_loc2_._cards),int(_loc2_._data._rank) * 0.1];
         }
         var _loc4_:int = 0;
         var _loc5_:int = int(_loc3_.length);
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc7_ = param1.fields[_loc6_];
            _loc8_ = Std.string(Number(_loc3_[_loc6_]));
            _loc7_.text = _loc8_.substr(0,3);
            _loc9_ = 6;
            _loc10_ = int((Draft.§\x1a2u1\x03§ - (int(param1.avs) + _loc9_)) * 0.5);
            _loc7_.x = int(param1.avs) + _loc9_ + _loc10_ - int(_loc7_.textWidth * 0.5);
         }
      }
      
      public function §}ukO\x02§() : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(read)
         {
            return;
         }
         var _loc1_:int = Data.§z\x0eh\x1e\x03§ - int(slots.length);
         if(_loc1_ > 0)
         {
            §-\x13YL\x02§(Lang.rep(Lang.§KE*+\x02§,Std.string(_loc1_)));
            §\x05`FE§(Lang.§\x14\x0b0W§);
            return;
         }
         if(int(§\x01]\x15o\x03§.data._packs) > 0)
         {
            §-\x13YL\x02§(Lang.§\x14\x0b0W§,0);
            §\x05`FE§(Lang.§\x14\x0b0W§);
            return;
         }
         var _loc2_:String = "nobody";
         var _loc3_:int = 0;
         var _loc4_:int = Data.§z\x0eh\x1e\x03§;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            _loc6_ = §XxV;\x02§(§\x01]\x15o\x03§,-(1 + _loc5_));
            if(int(_loc6_.data._packs) > 0)
            {
               _loc2_ = _loc6_.data._data._name;
               break;
            }
         }
         §-\x13YL\x02§(Lang.§\f\x1d6y\x02§ + _loc2_);
         §\x05`FE§(Lang.§\x14\x0b0W§);
      }
      
      override public function §Qb%g§() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null as Tween;
         super.§Qb%g§();
         §r)\x1b\x01\x01§.visible = false;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = slots;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = new Tween(_loc4_.base,_loc4_.base.x,Number(_loc4_.base.y + 100));
            _loc5_.curveIn(2);
            new Sleep(_loc5_,null,_loc4_ == §\x01]\x15o\x03§?18:_loc1_);
            dm.over(_loc4_.base);
            _loc1_++;
         }
      }
      
      public function §\x1a#3o§(param1:int) : Object
      {
         var _loc2_:int = int(slots.length);
         var _loc3_:int = 6;
         var _loc4_:int = int((Cs.mcw - (Draft.§\x1a2u1\x03§ * _loc2_ + _loc3_ * (_loc2_ - 1))) * 0.5);
         return {
            "x":_loc4_ + (Draft.§\x1a2u1\x03§ + _loc3_) * param1,
            "y":Cs.mch - (Draft.§(m\\\x06\x03§ + _loc3_)
         };
      }
      
      public function §\bDFG\x03§(param1:int, param2:int) : Object
      {
         var _loc3_:* = slots[int(Number(Num.sMod(param1 + param2,Data.§z\x0eh\x1e\x03§)))];
         return {
            "x":Number(_loc3_.base.x + Draft.§\x1a2u1\x03§ * 0.5),
            "y":Number(_loc3_.base.y + Draft.§(m\\\x06\x03§ * 0.5)
         };
      }
      
      public function §p90'\x03§(param1:int) : Object
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:Array = slots;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(int(_loc4_.data._data._id) == param1)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function §XxV;\x02§(param1:Object, param2:int = 1) : Object
      {
         return slots[int(Number(Num.sMod(int(param1.id) + param2,Data.§z\x0eh\x1e\x03§)))];
      }
      
      override public function §\x05\x1fxE§() : int
      {
         return int(super.§\x05\x1fxE§()) - 19;
      }
      
      public function §7D'q\x03§() : void
      {
         var _loc9_:int = 0;
         var _loc10_:* = null as TextField;
         var _loc11_:* = null as TextField;
         var _loc12_:Number = NaN;
         var _loc13_:* = null as String;
         var _loc14_:* = null as Element;
         var _loc1_:Sprite = new Sprite();
         _loc1_.x = 10;
         _loc1_.y = 104;
         dm.add(_loc1_,10);
         var _loc2_:int = 70;
         var _loc3_:* = Gfx.col("green_0");
         var _loc4_:int = int(Col.brighten(_loc3_,60));
         var _loc5_:int = 16777215;
         var _loc6_:int = 0;
         var _loc7_:int = 16676984;
         var _loc8_:int = 0;
         while(_loc8_ < 4)
         {
            _loc8_++;
            _loc9_ = _loc8_;
            if(_loc9_ == 0)
            {
               _loc10_ = Cs.getField(16777215,8,-1,"nokia");
               _loc10_.text = Lang.PRIZES;
               _loc10_.x = 1;
               _loc1_.addChild(_loc10_);
            }
            else
            {
               _loc10_ = Cs.getField(_loc5_,8,-1,"nokia");
               _loc10_.x = 1;
               _loc10_.y = _loc6_;
               _loc10_.text = Lang.POS[_loc9_ - 1] + ">";
               _loc11_ = Cs.getField(_loc5_,8,1,"nokia");
               _loc11_.x = _loc10_.x;
               _loc11_.y = _loc6_;
               _loc11_.width = _loc2_ - 12;
               _loc11_.text = Std.string(int(Data.§@B3\x03\x01§[_loc9_ - 1]));
               _loc12_ = 1;
               _loc11_.alpha = _loc12_;
               _loc10_.alpha = _loc12_;
               _loc13_ = BlendMode.OVERLAY;
               _loc11_.blendMode = _loc13_;
               _loc10_.blendMode = _loc13_;
               _loc14_ = new Element();
               _loc14_.drawFrame(Gfx.main.get(null,"icon_token"),0,0);
               _loc14_.x = Number(_loc11_.x + _loc11_.width);
               _loc14_.y = Number(_loc11_.y + 2);
               _loc1_.addChild(_loc14_);
               _loc1_.addChild(_loc10_);
               _loc1_.addChild(_loc11_);
            }
            _loc7_ = int(Col.brighten(_loc7_,-20));
            _loc1_.graphics.beginFill(_loc7_);
            _loc1_.graphics.drawRect(0,_loc6_,_loc2_,12);
            _loc1_.graphics.endFill();
            _loc6_ = _loc6_ + 12;
         }
         _loc1_.filters = [new DropShadowFilter(2,225,0,0.25,0,0)];
      }
      
      public function §FB;K\x01§(param1:Object) : void
      {
         displayHint("les cartes de " + param1.data._data._name);
         nav.set(param1.data._cardDetails);
      }
      
      override public function §EB\x17e\x02§() : void
      {
         displayHint(Lang.§ sUc§,0.2);
      }
      
      public function §;dA'\x02§() : void
      {
         displayHint("");
         nav.set(data._cards);
      }
      
      public function §\x04M|W\x01§() : void
      {
         var _loc1_:TextField = Cs.getField(16777215,8,-1,"nokia");
         dm.add(_loc1_,Browser.§ZH)#\x02§);
         _loc1_.width = 120;
         _loc1_.x = Cs.mcw - _loc1_.width;
         _loc1_.y = 88;
         _loc1_.text = "!!";
         _loc1_.textColor = Gfx.col("green_0");
         §r)\x1b\x01\x01§ = _loc1_;
      }
      
      public function §1z13\x01§() : void
      {
         §e\x1cv;§(Lang.rep(Lang.§bTSl\x02§,Std.string(Data.§\x03)\x02t§),Std.string(Data.§Ri\x03G\x03§)));
         §\f\x03h§.y = 77;
         var _loc1_:int = 16;
         var _loc2_:TextField = Cs.getField(8947848,8,-1,"nokia");
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.x = _loc1_;
         _loc2_.y = 7;
         _loc2_.width = Cs.mcw - 2 * _loc1_;
         _loc2_.htmlText = Lang.§xBj?\x01§;
         _loc2_.height = Number(_loc2_.textHeight + 6);
         dm.add(_loc2_,1);
      }
      
      public function §\\)lF§() : void
      {
         §~Evl\x03§();
         §-\x13YL\x02§(Lang.DISCONNECT,0);
         §\x1f\r\b}§(Lang.RECONNECT,Main.refresh);
      }
      
      public function §au3{\x02§() : void
      {
         §~Evl\x03§();
         §-\x13YL\x02§(Lang.§ U\x05\x18\x01§,0);
         §\x1f\r\b}§(Lang.QUIT,Main.refresh);
      }
      
      public function connect() : void
      {
         §-\x13YL\x02§(Lang.§z\x01T\x0b§,0);
         wait = false;
         read = false;
         protocol = Codec.connect(data._draft._serverUrl,_DraftCmd.§1\\'Y\x01§,receive);
         §TZ?Y§ = new Timer(10000);
         §TZ?Y§.run = §DfSP\x02§;
      }
      
      override public function click(param1:*) : void
      {
         var _loc3_:* = null as Draft;
         var _loc4_:* = null as Array;
         var _loc2_:Array = data._draft._step.§N\nM\x03§;
         switch(int(data._draft._step.index))
         {
            default:
            default:
               break;
            case 2:
               if(wait || !read)
               {
                  return;
               }
               if(selection != null)
               {
                  _loc3_ = this;
                  send(_DraftCmd.§]]~a\x03§(selection.data._type));
               }
               break;
            case 3:
               _loc4_ = _loc2_[0];
               super.click(param1);
         }
      }
      
      public function §~Evl\x03§() : void
      {
         while(int(§K\x16-]\x03§.length) > 0)
         {
            §K\x16-]\x03§[0].kill();
         }
         while(int(hand.length) > 0)
         {
            hand[0].kill();
         }
         while(int(slots.length) > 0)
         {
            slots.pop().base.visible = false;
         }
      }
      
      public function §\x017E\x19§(param1:Object, param2:§Ki\x12a\x02§, param3:Object = undefined) : Object
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc4_:* = §eL]\x19\x01§(param1,int(slots.length),param2,param3);
         slots.push(_loc4_);
         var _loc5_:* = §\x1a#3o§(int(_loc4_.id));
         _loc4_.base.x = int(_loc5_.x);
         _loc4_.base.y = int(_loc5_.y) + 80;
         if(int(param1._data._id) == int(data._me._id))
         {
            §\x01]\x15o\x03§ = _loc4_;
         }
         var _loc6_:int = 0;
         var _loc7_:Array = slots;
         while(_loc6_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc6_];
            _loc6_++;
            _loc9_ = §\x1a#3o§(int(_loc8_.id));
            new Tween(_loc8_.base,int(_loc9_.x),int(_loc9_.y)).curveInOut();
         }
         return _loc4_;
      }
   }
}
