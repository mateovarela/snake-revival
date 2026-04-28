package
{
   import flash.Boot;
   import flash.Lib;
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.net.URLRequest;
   import flash.system.System;
   import flash.text.TextField;
   import fx.Flash;
   import haxe.Log;
   import mt.DepthManager;
   import mt.bumdum9.Col;
   import mt.bumdum9.Filt;
   import pix.Anim;
   import pix.Frame;
   
   public class §s\x1ddi\x03§ extends flash.display.Sprite
   {
      
      public static var §;\x057\x02§:int = 160;
      
      public static var HEIGHT:int = 200;
      
      public static var TEMPO:int = 3;
      
      public static var WHITE:int = 16777215;
      
      public static var §{Mj\f\x03§:int = 16777215;
       
      
      public var work:Array;
      
      public var timer:int;
      
      public var step:int;
      
      public var §gF-'§:int;
      
      public var §\x15\x06\x01\x1d§:int;
      
      public var log:Object;
      
      public var dm:DepthManager;
      
      public var §T`uu\x01§:String;
      
      public var data:Object;
      
      public var §$\n\x01§:int;
      
      public var §;;\x17y\x02§:But;
      
      public function §s\x1ddi\x03§(param1:Object = undefined, param2:Object = undefined, param3:String = undefined)
      {
         var _loc4_:* = null as TextField;
         var _loc5_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         §T`uu\x01§ = param3;
         data = param1;
         log = param2;
         super();
         Game.me.dm.add(this,3);
         dm = new DepthManager(this);
         if(int(param1._err) < 0)
         {
            _loc4_ = Cs.getField(16777215,8,-1,"nokia");
            dm.add(_loc4_,0);
            _loc4_.multiline = true;
            _loc4_.wordWrap = true;
            _loc4_.width = §s\x1ddi\x03§.HEIGHT;
            _loc5_ = int(param1._err);
            if(_loc5_ == -1)
            {
               _loc4_.text = "Le tournoi s\'est terminé avant la fin de votre partie.\nCe score ne peut être enregistré.";
            }
            _loc4_.x = (Cs.mcw - _loc4_.width) * 0.5;
            _loc4_.y = (Cs.mch - _loc4_.textHeight) * 0.5;
            return;
         }
         _loc5_ = 16777215;
         var _loc6_:* = Gfx.col("green_0");
         var _loc7_:int = int(Col.brighten(_loc6_,20));
         var _loc8_:int = int(Col.desaturate(_loc7_,0.1));
         var _loc9_:* = Gfx.col("green_1");
         var _loc10_:int = int(Col.brighten(_loc9_,20));
         var _loc11_:* = Gfx.col("green_2");
         var _loc12_:int = int(Col.brighten(_loc11_,20));
         §s\x1ddi\x03§.§{Mj\f\x03§ = int(Col.brighten(Gfx.col("green_0"),50));
         x = (Cs.mcw - §s\x1ddi\x03§.§;\x057\x02§) * 0.5;
         y = (Cs.mch - §s\x1ddi\x03§.HEIGHT) * 0.5;
         §$\n\x01§ = 7;
         graphics.beginFill(Gfx.col("green_0"));
         graphics.drawRect(0,0,§s\x1ddi\x03§.§;\x057\x02§,§s\x1ddi\x03§.HEIGHT);
         §gF-'§ = 0;
         step = 1;
         timer = 0;
      }
      
      public function update() : void
      {
         var _loc1_:int = 0;
         switch(step)
         {
            default:
               break;
            case 1:
               _loc1_ = timer;
               timer = timer - 1;
               if(_loc1_ <= 0)
               {
                  displayScore();
               }
               break;
            case 2:
               timer = timer - 1;
               if(timer <= 0)
               {
                  timer = §s\x1ddi\x03§.TEMPO;
                  §x;t\r§();
                  if(§gF-'§ == 4)
                  {
                     §$\n\x01§ = §$\n\x01§ - 10;
                     §9\x0fay\x02§(Lang.BONUS,int(log.bonus.length));
                  }
               }
               break;
            case 3:
               timer = timer - 1;
               if(timer <= 0)
               {
                  timer = §s\x1ddi\x03§.TEMPO;
                  if(int(log.bonus.length) == 0)
                  {
                     §9\x0fay\x02§(Lang.§s\x03sl\x01§,int(data._progression.length));
                  }
                  else
                  {
                     §ow{9\x02§();
                  }
               }
               break;
            case 4:
               timer = timer - 1;
               if(timer <= 0)
               {
                  timer = §s\x1ddi\x03§.TEMPO;
                  if(int(data._progression.length) == 0)
                  {
                     §@1;p\x03§();
                  }
                  else
                  {
                     §Z\x07\x17\x14\x02§();
                  }
               }
               break;
            case 5:
               §;;\x17y\x02§.update();
         }
      }
      
      public function §\x05`FE§(param1:String) : void
      {
         var _loc2_:TextField = Cs.getField(§s\x1ddi\x03§.WHITE,8,-1,"nokia");
         addChild(_loc2_);
         _loc2_.y = §$\n\x01§;
         _loc2_.text = param1;
         center(_loc2_);
         var _loc3_:DropShadowFilter = new DropShadowFilter(1,90,Gfx.col("green_1"),1,0,0,1);
         _loc2_.filters = [_loc3_];
      }
      
      public function replay() : void
      {
         if(§T`uu\x01§ != null)
         {
            System.setClipboard(§T`uu\x01§);
            Log.trace("copy dataReplay !",{
               "fileName":"Debriefing.hx",
               "lineNumber":278,
               "className":"Debriefing",
               "methodName":"replay"
            });
            return;
         }
         var _loc1_:URLRequest = new URLRequest(Main.domain);
         Lib.getURL(_loc1_,"_self");
      }
      
      public function § 7cx\x01§(param1:pix.Sprite) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:* = null as Part;
         param1.y = §$\n\x01§;
         dm.add(param1,0);
         work.push(param1);
         §Ajx\x02\x01§(work);
         var _loc2_:Flash = new Flash(param1,0.05,1);
         _loc2_.glow(3,8);
         var _loc3_:int = 50;
         var _loc4_:int = 8;
         var _loc5_:int = 4;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc6_++;
            _loc7_ = _loc6_;
            _loc8_ = _loc7_ / _loc4_;
            _loc9_ = Part.get();
            _loc9_.sprite.setAnim(Gfx.fx.getAnim("spark_dust"));
            dm.add(_loc9_.sprite,2);
            _loc9_.§\nMo7§(_loc8_ * 6.28,Number(Math.random()),0);
            _loc9_.timer = 15 + int(Std.random(20));
            _loc9_.frict = 0.95;
            _loc9_.x = Number(_loc9_.vx * _loc5_ + param1.x);
            _loc9_.y = Number(Number(_loc9_.vy * _loc5_ + param1.y) + _loc3_);
            _loc9_.z = -_loc3_;
            _loc9_.weight = Number(0.03 + Math.random() * 0.05);
            _loc9_.sprite.anim.gotoRandom();
            _loc9_.sprite.blendMode = BlendMode.ADD;
            Filt.glow(_loc9_.sprite,4,1,16777215);
         }
      }
      
      public function §\x19h;\x01\x01§(param1:String, param2:Object) : But
      {
         var _loc3_:But = new But(param1,param2);
         dm.add(_loc3_,0);
         _loc3_.y = §s\x1ddi\x03§.HEIGHT - 20;
         _loc3_.x = int(§s\x1ddi\x03§.§;\x057\x02§ * 0.5);
         §}Ud#\x02§(_loc3_.x - _loc3_.width * 0.5,_loc3_.y,_loc3_.ww,_loc3_.hh);
         return _loc3_;
      }
      
      public function §}Ud#\x02§(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Part = Part.get();
         var _loc6_:Graphics = _loc5_.sprite.graphics;
         _loc6_.beginFill(16777215);
         _loc6_.drawRect(0,0,param3,param4);
         _loc5_.x = param1;
         _loc5_.y = param2;
         _loc5_.timer = 10;
         _loc5_.fadeType = 1;
         _loc5_.sprite.blendMode = BlendMode.ADD;
         addChild(_loc5_.sprite);
      }
      
      public function §@1;p\x03§() : void
      {
         step = step + 1;
         §;;\x17y\x02§ = §\x19h;\x01\x01§(Lang.§]d-e§,replay);
      }
      
      public function §9\x0fay\x02§(param1:String, param2:int) : void
      {
         §$\n\x01§ = §$\n\x01§ + 18;
         §\x05`FE§(param1);
         §$\n\x01§ = §$\n\x01§ + 27;
         band(§$\n\x01§ - 8,16);
         step = step + 1;
         timer = 0;
         work = [];
         §}Ud#\x02§(0,§$\n\x01§ - 8,§s\x1ddi\x03§.§;\x057\x02§,16);
         §\x15\x06\x01\x1d§ = param2;
      }
      
      public function displayScore() : void
      {
         step = step + 1;
         timer = 5;
         var _loc1_:TextField = Cs.getField(§s\x1ddi\x03§.WHITE,20,-1,"upheavel");
         dm.add(_loc1_,0);
         _loc1_.y = §$\n\x01§;
         _loc1_.text = Std.string(int(log.score));
         _loc1_.filters = [new DropShadowFilter(1,90,Gfx.col("green_1"),1,0,0,1)];
         center(_loc1_);
         band(Number(_loc1_.y + 4),16);
         §$\n\x01§ = §$\n\x01§ + 25;
         §}Ud#\x02§(0,Number(_loc1_.y + 4),§s\x1ddi\x03§.§;\x057\x02§,16);
      }
      
      public function §x;t\r§() : void
      {
         var _loc2_:int = §gF-'§;
         §gF-'§ = §gF-'§ + 1;
         var _loc1_:int = _loc2_;
         var _loc3_:String = Cs.formatTime(Number(log.chrono));
         var _loc4_:String = Std.string(int(log.fruits.length));
         var _loc5_:String = Std.string(int(Number(log.§\b[F§))) + "%";
         var _loc6_:String = Std.string(int(Number(log.§?[Qy\x01§))) + Lang.§U\x17\x1d\x02\x03§;
         var _loc7_:Array = [_loc3_,_loc4_,_loc5_,_loc6_];
         var _loc8_:TextField = Cs.getField(§s\x1ddi\x03§.§{Mj\f\x03§,8,-1);
         _loc8_.x = 0;
         _loc8_.y = §$\n\x01§;
         _loc8_.width = §s\x1ddi\x03§.§;\x057\x02§;
         _loc8_.text = Lang.§S0\x1ei\x03§[_loc1_];
         var _loc9_:TextField = Cs.getField(§s\x1ddi\x03§.WHITE,8,1);
         _loc9_.x = 0;
         _loc9_.y = §$\n\x01§;
         _loc9_.width = §s\x1ddi\x03§.§;\x057\x02§;
         _loc9_.text = _loc7_[_loc1_];
         dm.add(_loc8_,0);
         dm.add(_loc9_,0);
         §}Ud#\x02§(0,§$\n\x01§ + 2,§s\x1ddi\x03§.§;\x057\x02§,8);
         §$\n\x01§ = §$\n\x01§ + 8;
      }
      
      public function §Ajx\x02\x01§(param1:Array) : void
      {
         var _loc7_:* = null as pix.Sprite;
         var _loc2_:int = §\x15\x06\x01\x1d§;
         var _loc3_:int = 18;
         var _loc4_:Number = 0;
         if(_loc2_ > 1)
         {
            _loc4_ = (§s\x1ddi\x03§.§;\x057\x02§ - 2 * _loc3_) / (_loc2_ - 1);
         }
         _loc4_ = Number(Math.min(_loc4_,32));
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < int(param1.length))
         {
            _loc7_ = param1[_loc6_];
            _loc6_++;
            _loc7_.x = Number(§s\x1ddi\x03§.§;\x057\x02§ * 0.5 + (_loc5_ + 0.5 - _loc2_ * 0.5) * _loc4_);
            _loc7_.pxx();
            _loc5_++;
         }
      }
      
      public function center(param1:TextField, param2:Object = undefined) : void
      {
         if(param2 == null)
         {
            param2 = §s\x1ddi\x03§.§;\x057\x02§ * 0.5;
         }
         param1.width = Number(param1.textWidth + 3);
         param1.x = int(param2 - param1.width * 0.5);
      }
      
      public function band(param1:Number, param2:Number) : void
      {
         var _loc3_:* = Gfx.col("green_0");
         var _loc4_:int = int(Col.brighten(_loc3_,20));
         _loc4_ = int(Col.desaturate(_loc4_,0.1));
         graphics.beginFill(_loc4_);
         graphics.drawRect(0,param1,§s\x1ddi\x03§.§;\x057\x02§,param2);
      }
      
      public function §Z\x07\x17\x14\x02§() : void
      {
         var _loc1_:* = data._progression.shift();
         var _loc2_:pix.Sprite = new pix.Sprite();
         _loc2_.drawFrame(Gfx.fruits.get(int(_loc1_._id)));
         var _loc3_:TextField = Cs.getField(16777215,8,-1,"nokia");
         _loc3_.text = Lang.§n((\x17§ + int(_loc1_._lvl);
         _loc2_.addChild(_loc3_);
         _loc3_.x = -12;
         _loc3_.y = 11;
         var _loc4_:* = [Gfx.col("green_2"),16755200,Gfx.col("red_0"),12255368,26316][int(_loc1_._lvl) - 1];
         _loc3_.filters = [new GlowFilter(_loc4_,1,2,2,100)];
         if(§\x15\x06\x01\x1d§ > 6)
         {
            _loc3_.y = Number(_loc3_.y + int(int(work.length) % 2) * 8);
         }
         § 7cx\x01§(_loc2_);
      }
      
      public function §ow{9\x02§() : void
      {
         var _loc1_:BonusType = log.bonus.shift();
         var _loc2_:pix.Sprite = new pix.Sprite();
         _loc2_.drawFrame(Gfx.bonus.get(_loc1_.index));
         § 7cx\x01§(_loc2_);
      }
   }
}
