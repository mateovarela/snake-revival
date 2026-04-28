package
{
   import haxe.Public;
   import mt.db.Phoneme;
   
   public class Lang implements Public
   {
      
      public static var init__:Boolean;
      
      public static var PIX:String = "<font color=\'#92d930\'>.</font>";
      
      public static var §[y\n*\x01§:String = "<font color=\'#52b31e\'>.</font>";
      
      public static var §\x16cY'\x01§:String = "#FF8888";
      
      public static var PINK:String = "#FFAAAA";
      
      public static var WHITE:String = "#FFFFFF";
      
      public static var §*\tK\x0e\x01§:String = "mojo restant";
      
      public static var §[DhN§:String = "mojo en trop";
      
      public static var §\x1bW2V\x03§:String = "Pas assez de cartes : ";
      
      public static var §\tG@p§:String = "Trop de cartes : ";
      
      public static var START_GAME:String = "Démarrer la partie";
      
      public static var §9_'\x1b\x03§:String = "Dépensez tous vos points de mojo pour lancer une partie.";
      
      public static var §QCq(§:String = "Retirez des cartes de votre main pour lancer une partie.";
      
      public static var §\x1fAG\x01\x03§:String = "A chaque utilisation : ";
      
      public static var §J)\x11\x01§:String = "Jouer maintenant !";
      
      public static var §n((\x17§:String = "niv.";
      
      public static var §\t]S^§:Array = ["Trier par couts","Masquer cartes trop chères","Masquer cartes en régénération"];
      
      public static var §93t\x10\x03§:String = "Choisissez vos cartes pour un total de 6 points de mojo.";
      
      public static var §\x0b\x1a7u\x01§:String;
      
      public static var §4l#]§:String = "Vous ne pouvez jouer que %0 cartes";
      
      public static var §\x05\x1d\\G\x02§:String = "Vous ne pouvez jouer qu\'un seul exemplaire de cette carte.";
      
      public static var §nZ;t\x02§:String = "Cette carte sera de nouveau utilisable à minuit.";
      
      public static var BUY_CARD:String = "acheter une carte";
      
      public static var BUY:String = "acheter";
      
      public static var SUCCESS:String = "Quête réussie!";
      
      public static var FRUIT_UNKNOWN:String = "fruit inconnu";
      
      public static var ___FAMILLES:Array = ["sucre","rouge","feuille","petit","noix","fleur","agrume","vert","liane","alien","baie","long","courge","poire","bleu","pomme","crotte","orange","jaune","rose"];
      
      public static var CONTROL:String = "controles";
      
      public static var §6[yv\x02§:String = "choisissez votre mode déplacement :";
      
      public static var §\x13o'\x1c\x02§:Array = ["souris","clavier A","clavier B"];
      
      public static var §9X~g§:Array;
      
      public static var §cT\x1e\x12\x01§:String = "jeu en pause";
      
      public static var §5\\q\x01§:String = "reprendre";
      
      public static var GORE:String = "sang";
      
      public static var YES:String = "oui";
      
      public static var NO:String = "non";
      
      public static var QUIT:String = "quitter";
      
      public static var OPTIONS:String = "options";
      
      public static var STATS:Array = ["temps de jeu","fruits ramassés","frutibar maximum","longueur maximum"];
      
      public static var §(Uh\x01\x03§:String = "mes amis";
      
      public static var §*$M=\x01§:String = "mes archives";
      
      public static var §Z\x1b\x01g§:String = "panthéon";
      
      public static var §G'\x178\x02§:String = "mon tournoi";
      
      public static var §\tr(w\x03§:String = "Arc-en-ciel";
      
      public static var __CANNOT_CONNECT_TEXT:String = "Connexion impossible";
      
      public static var §w\x03\n_§:String = "tentative";
      
      public static var LOADING:String = "chargement";
      
      public static var §s\x03sl\x01§:String = "Progression Encyclopefruit";
      
      public static var BONUS:String = "Bonus";
      
      public static var §]d-e§:String = "rejouer";
      
      public static var §U\x17\x1d\x02\x03§:String = "cm";
      
      public static var §z\x14im\x02§:String = "Partie d\'essai";
      
      public static var §=7'(\x02§:String = "Apprenez à manier le serpent grâce à cette partie.\nA chaque échec vous pourrez changer les controles.";
      
      public static var §\x06\x1ed[\x02§:String = "calories";
      
      public static var §fi1#\x01§:String = "mg";
      
      public static var §flUg\x02§:Array = ["score","vitamine","nutrition","conservation"];
      
      public static var §JU\t~\x02§:String = "sec";
      
      public static var §q\b\x03\x01\x02§:String = "prix d\'une carte : ";
      
      public static var DRAW:String = "tirage en cours...";
      
      public static var s4ba:String = "carte ajoutée a votre collection";
      
      public static var NOT_ENOUGH_TOKEN:String = "pas assez de jetons !";
      
      public static var §\n'\r\x0b\x01§:Array = ["Cette semaine","Ce mois-ci","Cette année"];
      
      public static var PAGE:String = "page";
      
      public static var CARDS:String = "cartes";
      
      public static var COMPLETION:String = "complétion";
      
      public static var §\x1b71T\x03§:Array = ["Collection","Boutique","Tombola","Bazar"];
      
      public static var §b^u(§:String = "Tous les soirs à minuit, la carte du jour est tirée au sort entre tous les participants de la loterie.";
      
      public static var YESTERDAY_WINNER:String = "Gagnant d\'hier : ";
      
      public static var §,}\x04\x19\x02§:String = "La boutique de Serpentin";
      
      public static var §@Pq(§:String = "La tombola de Loterine";
      
      public static var §;Fxz§:String = "La bazar de Mephistouf";
      
      public static var §\x17b?~\x01§:Array = ["Carte supplémentaire","Lot de 10x cartes","Ticket de loterie"];
      
      public static var §\x12%\x18§:Array = ["La carte est tirée au hasard:\n- carte commune : 60%\n- carte normale : 30%\n- carte rare : 10%","Lot de 10 cartes tirées au hasard :\n -6x cartes communes\n- 3x cartes normales\n- 1x carte rare","Un ticket de loterie pour la carte du jour !\nTirage ce soir à minuit..."];
      
      public static var §,~&\x02\x02§:String = "Carte du jour :";
      
      public static var §\x11\x07\x1dJ\x02§:Array = ["Vous possédez :","Tickets vendus :","Chance de gain :"];
      
      public static var PLAY:String = "jouer";
      
      public static var §W8y\r\x01§:String = "La partie commencera dans ";
      
      public static var SECONDES:String = "secondes";
      
      public static var START:String = "commencer!";
      
      public static var §'Bs\x14\x01§:Array = ["Je suis interessé par ta carte %1... Je t\'en donne %2 jetons. Qu\'est ce que tu en dis ?","Il me faut absolument ta carte %1, C\'est une carte %3, donc je t\'en donne %2 jetons !","Je te donne %2 jetons contre ta carte %1. Ca te va ?","Je peux te donner %2 jetons en échange de ta carte %1. Ca marche ?","J\'ai une super combo à tester avec %4 et %5 il me manque juste %1, tu me l\'échanges pour %2 jetons ?","Waaah tu as %1 !! Si tu veux je te donne %2 jetons en échange, ok ?","Mouef... Bon à part %1, je ne vois rien qui m\'intéresse... Je te la prend contre %2 jetons ?"];
      
      public static var §X\x1fJ\x12\x01§:Array = ["Arch ! Bon %2 jetons, mais c\'est mon dernier mot !","T\'es dur en affaire toi ! Va pour %2 jetons !","Quoi ? Mais c\'est juste une carte %3 ! Tsss.. Bon ok pour %2 jetons alors..."];
      
      public static var §\r\x01\x06\x12§:Array = ["Non y\'a pas moyen ! C\'est %2 jetons à prendre ou à laisser !","%2 jetons pour cette carte, tu trouveras pas mieux, alors je touche pas à mon prix.","Non non non, je te rends déjà service en te débarassant de %1 donc c\'est %2 ou rien du tout !","J\'arriverai à trouver une carte %1 pour %2 jetons ailleurs tu sais... ","Je monterai jamais au dessus de %2 jetons pour une %3","Bah j\'aimerais bien mais j\'ai que %2 jetons sur moi..."];
      
      public static var §\x1b\x0e%\n\x03§:Array = ["Tu m\'as pris pour un pigeon ? Laisse tomber pour cette carte...","Bon je crois qu\'on y arrivera pas pour cette carte...","Je paierai pas plus pour %1, donc passons à la suite !","Bon je crois que je vais plutot garder mes sous pour une autre carte...","Tant pis, voyons voir la suite..."];
      
      public static var §+\x1e\x12\t\x02§:Array = ["Pas grave !","Dommage.","Bon si tu en as besoin...","Bon pas grave, je sais ou je peux en trouver une.","Comme tu veux !","C\'est toi qui vois !","Argh, j\'arriverai jamais à en trouver une..."];
      
      public static var §UG=d\x02§:Array = ["Bon y\'a pas moyen de faire affaire avec toi, je décolle !","Ok je pense que je peux trouver un vendeur moins radin.","J\'ai pas assez de tokens, désolé...","Je crois qu\'on m\'appelle, à plus !","Bon je reviendrai demain, voir si t\'es plus sympa","Je passe sous un \'crr\' tunnel, j\'crchh\' à la prochaine \'cccrrrhh\'"];
      
      public static var §\x07wq8\x03§:Array = ["Il y a plus rien qui m\'intéresse pour l\'instant...","Bon à part ça, il n\'y a pas de cartes qui m\'intéressent dans ta collection"];
      
      public static var §PZl?\x01§:Array = ["Chouette !! je la cherchais depuis 3 jours !","Merci !","Cool !","Merci beaucoup !","C\'est un plaisir de faire des affaires avec toi !"];
      
      public static var §\x01\fkE§:Array = ["Je la garde","Non!","Plutôt crever","Jamais!","Non merci"];
      
      public static var §\\r0-\x02§:Array = ["C\'est pas assez","Plus de jetons!","Encore un effort","Prix pourri","Un peu plus ?"];
      
      public static var §|\nPY§:Array = ["D\'accord!","Ok!","Tope-là!"];
      
      public static var __BAZAR_OPTIONS:Array = ["Je la garde","Plus cher","D\'accord"];
      
      public static var §6\x1d)m\x03§:String;
      
      public static var §F&Aj\x03§:String = "Mephistouf est parti ! Si il est de bonne humeur, il reviendra probablement demain pour t\'acheter de nouvelles cartes.";
      
      public static var __CARD_RARITY:Array = ["commune","normale","rare"];
      
      public static var §;eq,§:String;
      
      public static var §\x04\x1en5\x01§:String = "Les inscriptions pour le tournoi sont ouvertes pendant %1.\nIl reste encore %2 place(s) libre(s) !";
      
      public static var §i6u?\x03§:Array = ["Votre inscription n\'est pas acceptée!","Vous n\'avez pas assez de jetons.","Plus de place libre pour ce tournoi."];
      
      public static var §xBj?\x01§:String;
      
      public static var §bTSl\x02§:String = "Les tournois sont disponibles tous les jours entre %1h et %2h --- Les 10 cartes séléctionnées dans un tournoi iront dans votre collection --- Dans un tournoi une partie peut être lancée avec seulement un point de mojo --- Visionnez les parties de votre tournoi dans la section classement --- ";
      
      public static var § sUc§:String = "Cette carte ne peut plus être utilisée pour le tournoi.";
      
      public static var §L_\x1a\x19\x03§:String = "Temps restant";
      
      public static var §QgcU\x03§:String = "Choisissez une carte !";
      
      public static var §z\x01T\x0b§:String = "connexion au serveur...";
      
      public static var §\f\x1d6y\x02§:String = "En attente du joueur : ";
      
      public static var §\x14\x0b0W§:String = "veuillez patienter";
      
      public static var §KE*+\x02§:String = "Attente de %1 joueur(s) supplémentaire(s)";
      
      public static var ABORT:String;
      
      public static var DISCONNECT:String = "Vous êtes déconnecté.\nPas de panique, vous pouvez rejoindre le tournoi à nouveau :";
      
      public static var RECONNECT:String = "Reconnecter";
      
      public static var §\x14p\x16N§:String = "Impossible de se connecter au serveur. Merci de réessayer dans quelques instants.";
      
      public static var PRIZES:String = "Récompenses";
      
      public static var POS:Array = ["1er","2ème","3ème"];
      
      public static var TOURNAMENT:String = "Tournoi";
       
      
      public function Lang()
      {
      }
      
      public static function white(param1:String) : String
      {
         return Lang.col(param1,Lang.WHITE);
      }
      
      public static function pink(param1:String) : String
      {
         return Lang.col(param1,"#FF0088");
      }
      
      public static function red(param1:String) : String
      {
         return Lang.col(param1,"#FF5555");
      }
      
      public static function green(param1:String) : String
      {
         return Lang.col(param1,"#88DD00");
      }
      
      public static function col(param1:String, param2:String) : String
      {
         return "<font color=\'" + param2 + "\'>" + param1 + "</font>";
      }
      
      public static function ___getName(param1:String) : String
      {
         return Phoneme.§T\x06j'\x03§(param1);
      }
      
      public static function init() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as String;
         var _loc5_:* = null;
         var _loc1_:* = null;
      }
      
      public static function rep(param1:String, param2:String, param3:String = undefined, param4:String = undefined, param5:String = undefined, param6:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = "b";
         }
         if(param4 == null)
         {
            param4 = "c";
         }
         if(param5 == null)
         {
            param5 = "d";
         }
         if(param6 == null)
         {
            param6 = "e";
         }
         param1 = StringTools.replace(param1,"%1",param2);
         param1 = StringTools.replace(param1,"%2",param3);
         param1 = StringTools.replace(param1,"%3",param4);
         param1 = StringTools.replace(param1,"%4",param5);
         param1 = StringTools.replace(param1,"%5",param6);
         return param1;
      }
   }
}
