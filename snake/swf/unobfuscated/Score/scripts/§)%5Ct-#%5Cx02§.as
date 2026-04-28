package
{
   import flash.Boot;
   import flash.Lib;
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import haxe.Unserializer;
   import mt.data.Mods;
   import pix.Element;
   
   public dynamic class §)\t-#\x02§ extends Boot
   {
       
      
      public function §)\t-#\x02§()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(Lib.current == null)
         {
            Lib.current = this;
         }
         start();
      }
      
      override public function init() : void
      {
         var _loc2_:* = null as Array;
         var _loc1_:* = Date;
         _loc1_.now = function():*
         {
            return new Date();
         };
         _loc1_.fromTime = function(param1:*):Date
         {
            var _loc2_:Date = new Date();
            _loc2_.setTime(param1);
            return _loc2_;
         };
         _loc1_.fromString = function(param1:String):Date
         {
            var _loc2_:* = null as Array;
            var _loc3_:* = null as Date;
            var _loc4_:* = null as Array;
            var _loc5_:* = null as Array;
            switch(param1.length)
            {
               default:
               default:
               default:
               default:
               default:
               default:
               default:
               default:
                  Boot.lastError = new Error();
                  throw "Invalid date format : " + param1;
               case 8:
               default:
                  _loc2_ = param1.split(":");
                  _loc3_ = new Date();
                  _loc3_.setTime(0);
                  _loc3_.setUTCHours(_loc2_[0]);
                  _loc3_.setUTCMinutes(_loc2_[1]);
                  _loc3_.setUTCSeconds(_loc2_[2]);
                  return _loc3_;
               case 10:
               default:
               default:
               default:
               default:
               default:
               default:
               default:
               default:
                  _loc2_ = param1.split("-");
                  return new Date(int(_loc2_[0]),_loc2_[1] - 1,int(_loc2_[2]),0,0,0);
               case 19:
                  _loc2_ = param1.split(" ");
                  _loc4_ = _loc2_[0].split("-");
                  _loc5_ = _loc2_[1].split(":");
                  return new Date(int(_loc4_[0]),_loc4_[1] - 1,int(_loc4_[2]),int(_loc5_[0]),int(_loc5_[1]),int(_loc5_[2]));
            }
         };
         _loc1_.prototype["toString"] = function():String
         {
            var _loc1_:Date = this;
            var _loc2_:int = int(_loc1_.getMonth()) + 1;
            var _loc3_:int = int(_loc1_.getDate());
            var _loc4_:int = int(_loc1_.getHours());
            var _loc5_:int = int(_loc1_.getMinutes());
            var _loc6_:int = int(_loc1_.getSeconds());
            return int(_loc1_.getFullYear()) + "-" + (_loc2_ < 10?"0" + _loc2_:"" + _loc2_) + "-" + (_loc3_ < 10?"0" + _loc3_:"" + _loc3_) + " " + (_loc4_ < 10?"0" + _loc4_:"" + _loc4_) + ":" + (_loc5_ < 10?"0" + _loc5_:"" + _loc5_) + ":" + (_loc6_ < 10?"0" + _loc6_:"" + _loc6_);
         };
         Math.NaN = Number(Number.NaN);
         Math.NEGATIVE_INFINITY = Number(Number.NEGATIVE_INFINITY);
         Math.POSITIVE_INFINITY = Number(Number.POSITIVE_INFINITY);
         Math.isFinite = function(param1:Number):Boolean
         {
            return isFinite(param1);
         };
         Math.isNaN = function(param1:Number):Boolean
         {
            return isNaN(param1);
         };
         if(!Element.init__)
         {
            Element.init__ = true;
            Element.NEUTRAL_CT = new ColorTransform(1,1,1,1,0,0,0,0);
            Element.MAT = new Matrix();
         }
         if(!Codec.init__)
         {
            Codec.init__ = true;
            Codec.types = new Hash();
         }
         if(!Unserializer.init__)
         {
            Unserializer.init__ = true;
            Unserializer.DEFAULT_RESOLVER = Type;
         }
         if(!§\x12s}r§.init__)
         {
            §\x12s}r§.init__ = true;
            _loc2_ = Mods.extract("6870d93ba2a5b442c7cbd120ae1485dc",[Boot.__unprotect__("Heathenness"),Boot.__unprotect__("fruit"),Boot.__unprotect__("name")],[]);
            §\x12s}r§.TEXT = _loc2_;
         }
         if(!Data.init__)
         {
            Data.init__ = true;
            _loc2_ = Mods.extract("e46abf40e865dd2492a7843ceda578be",[Boot.__unprotect__("\x0e-EY\x01"),Boot.__unprotect__("id"),Boot.__unprotect__("mojo"),Boot.__unprotect__("multi"),Boot.__unprotect__("time")],[_CardType]);
            Data.CARDS = _loc2_;
            Data.TEXT = §\x12s}r§.TEXT;
            Data.§\t;\x1cH\x02§ = [_CardType.TRAINING,_CardType.MAGNET,_CardType.CRYSTAL_BALL,_CardType.___WINDFARM_SMALL,_CardType.POTION_BLUE,_CardType.SCISSOR,_CardType.HOURGLASS,_CardType.SALT];
            Data.___quetes = [_CardType.FEATHER,_CardType.TONGUE,_CardType.___MASSACRE,_CardType.LOUD_SPEAKER,_CardType.RAINBOW,_CardType.KAZOO];
         }
         if(!Lang.init__)
         {
            Lang.init__ = true;
            Lang.§\x0b\x1a7u\x01§ = "Vous ne pouvez pas atteindre 6 points" + Lang.§[y\n*\x01§ + " de mojo avec vos cartes actives" + Lang.§[y\n*\x01§ + ".\nToute vos cartes seront\n réactivées à minuit !\n\nVous pouvez également acheter des" + Lang.§[y\n*\x01§ + " cartes supplémentaires en boutique:";
            Lang.§9X~g§ = ["Le serpent suis le pointeur de la " + Lang.col("souris",Lang.WHITE) + ". Utiliser le " + Lang.col("clic gauche",Lang.WHITE) + " pour accélérer.","Flèche " + Lang.col("haut bas gauche",Lang.WHITE) + " et " + Lang.col("droite",Lang.WHITE) + " pour choisir l\'orientation du serpent.\n" + Lang.col("Barre espace",Lang.WHITE) + " pour accélérer.","Flèches " + Lang.col("gauche",Lang.WHITE) + " et " + Lang.col("droite",Lang.WHITE) + " de votre clavier pour faire pivoter le serpent.\nFlèche " + Lang.col("haut",Lang.WHITE) + " pour accélérer.",Lang.col("Concentrez vous",Lang.WHITE) + " sur un point de l\'arène pour que le serpent s\'y dirige.\nPour accélérer, concentrez-vous " + Lang.col("plus fort",Lang.WHITE) + "."];
            Lang.§6\x1d)m\x03§ = "Il te faut au moins " + Lang.col("%1","#FF6666") + " cartes pour pouvoir entrer dans le bazar !!";
            Lang.§;eq,§ = "Chaque jour des tournois de %1 joueurs sont lancés entre %2 heures et %3 heures.\n\nLe tournoi est actuellement " + Lang.col("fermé",Lang.WHITE) + ", prochain tournoi dans %4 ";
            Lang.§xBj?\x01§ = Lang.col("Règles du tournoi",Lang.WHITE) + " : Chaque joueur reçoit " + Lang.col("10 nouvelles cartes","#FF0088") + ", il en choisit " + Lang.col("une","#FF0088") + " puis fait passer le paquet à son voisin. On répète l\'opération jusqu\'à épuisement des cartes. Chacun joue ensuite autant de parties qu\'il le peut avec les 10 cartes choisies, puis " + Lang.col("le plus haut score","#FF0088") + " emporte le tournoi.\nUne partie de tournoi peut contenir entre " + Lang.col("1","#88DD00") + " et " + Lang.col("6 pts","#88DD00") + " de mojo.\nChacun repart avec ses 10 cartes et les 3 meilleurs reçoivent un prix.";
            Lang.ABORT = "Le tournoi a été " + Lang.col("annulé","#FF5555") + " !\n" + Lang.col("(C\'est un scandale)","#88DD00") + "\nVos " + Data.§gtE\f§ + " jetons ont été remboursés.";
         }
         Main.main();
      }
   }
}
