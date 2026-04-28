package
{
   import browser.Build;
   import browser.Draft;
   import flash.Lib;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.net.URLRequest;
   import haxe.Serializer;
   import haxe.Unserializer;
   import haxe.io.Bytes;
   import mt.DepthManager;
   import mt.flash.§L\n\x01§;
   import part.Line;
   import part.§Y9u~\x03§;
   import part.§zG\t9\x03§;
   
   public class Main
   {
      
      public static var init__:Boolean;
      
      public static var root:MovieClip;
      
      public static var dm:DepthManager;
      
      public static var game:Game;
      
      public static var dt:Number;
      
      public static var domain:String;
      
      public static var subscribe:String;
      
      public static var slogan:String;
      
      public static var lang:String;
      
      public static var §tt%\f\x02§:Object;
      
      public static var rec:Bytes;
      
      public static var §;uCf\x03§:Object;
      
      public static var DEMO:Array = ["oy4:_sidi7402y3:_idzy4:_recs166:eNrFVUEOwCAIK:L:Py9uh2UoFR1u7c1gqw0i4EJEb0KLQwRo9pxQzr7ApFFQn63t4uUijAZNAZZILZ06phJVHp9ZPuAf:khuGqRq2fvv048%Ltv%3VeRnX9oKEVHybvRtOLfjotnRMXDMJf6EVDM6dEM8zqsJnIAhUoN7gy5:_handajy9:_CardType:12:0jR4:18:0jR4:46:0hg","oy4:_sidi3425y3:_idzy4:_recs251:eNqtVFEWwyAIA2zvf%W9usnAAiJt8mXrA0yiAAs0aMi8VlTiKReQKgQOeRykP5JjyDqZbrs19wRCi5fopDHaKFeo3HaScWLvgx0yB9ZI9EifQ:%OjKDXadfX38IdrIjQZivGuXNBhrNBZWtmnouRyUjFDTjQYvIhnPq69cglV7d8qKi%2pfy8z4wJK4dmYKGz5ZxrxWsonF9cEbN5bD0QmSi2EX92v0b6P1HARMEM%OO2SqgEr4jHyZ7Ds8y5:_handajy9:_CardType:30:0jR4:14:0jR4:53:0hg","oy4:_sidi8092y3:_idzy4:_recs219:eNqlVEkSwCAIC:r:P9facSmyqeHSsQokLIAGIsqUUS2ZhsXEex3OYwSCYsvYqwqWx4dB:UX7bPcVBn528h:%qsj9Q94xk7qLERSRgssslbSYdL56cgzS:fcq:eRj7SzyDkXXzu2CxGU36nkglc8Yrqo8FWuY4:O8M9:pqAPdOOk278lPMKsbLmuvq610uB%Ptef7cpo%eUQxb9Q2ocXFAzLaDDcy5:_handajy9:_CardType:19:0jR4:33:0jR4:56:0hg","oy4:_sidi9863y3:_idzy4:_recs196:eNq1VFsOgCAM20q4:5UVRRFwHZDQ:hFgj3YTIVDV8MMaaBB8ygTZGyzRizT%x1J8QKLsRtbie5QyTpqeCtJut1K6V5caj3Xx6hK9RJ3g1L1K2BdR5zVhwPHhKMENa:mCeF%:vIqJxFxANOKNzdfjSIH1fsYYRKe8yhK%q62gE5Y3KQ%S6v45ttZyKeaW4AB0qglBy5:_handajy9:_CardType:40:0jR4:36:0jR4:46:0hg","oy4:_sidi896y3:_idzy4:_recs214:eNqtU0kOwCAIBEz6:ye3aWWRRW3a4WIUWYYBYAJsauCMvtqFOwfajMRABT94v35yX0OSgN4AvrSkyApM0sAlNyNP7B1op4oz4T77VQ4xx46rbbeMH5RREMjwmoIpF1X5rgmrk:aXRWH6OdlbPmptVM6w1tCsz0xpPWRal9S2DLNTg2LI7nM9q9pShYybDxRWdoK1GKTHltlGjuME3m8G1Qy5:_handajy9:_CardType:21:0jR4:22:0jR4:10:0hg","oy4:_sidi4222y3:_idzy4:_recs342:eNqtVlsSwyAIXGjH%x%5mcb4QFAMwkc6DSgLCwSQ8nmUhEIoC4VpYft41L4VkzurpvyjlWXwPWjhzbYfO9JyLhnzEvFrhSvqCKq9COGM6CxSz:medrB8UzS4YqkxerdN:K2HF6jhauP92mnne4bVWYbEeSiVFjoSYEGCFooP5iZ5zNn63ypEiYqg2ParJ%Unz:BUt3ogtdbKG0duZDa%GnCtChFWzerL49ZRNhCWJ52L%f1Ezv8nGBJOpF6szS%WQr1jAYybOQLPc%s4T29gHlA3dmvBcNe0ubs0hg2CKYPF%YUTl58mqY6IUq92ZvTWfdhkSqzop9roSeEP%aYXEAy5:_handajy9:_CardType:13:0jR4:41:0jR4:23:0hg","oy4:_sidi3780y3:_idzy4:_recs211:eNq1VNESgCAMYuv::7k6zWbFpM7gpbx1MtgCCJZIr4RIS6nUfGGv9R:yHvvTVrfBCl51McEPgzf87EU87TU0CEmdnpmxLxXvQJSdtxCNw1vx3KWqrcWBrsVPg%5kTOQ1NIT5yAaFm5nZ7CQGyNyqR7M7Tluiv0miwB8hSs2boG5M5%zf75FYjjD5qMuww8Pz9T3sTcU9sLoSK8cdDRoy5:_handajy9:_CardType:25:0jR4:7:0jR4:46:0hg","oy4:_sidi5927y3:_idzy4:_recs235:eNq1VVkWgCAIZHnd:8rtpbFbzfzxRGAQBAiAiCwJTB0n4gohIJXp%45EKOejAFuwQwQ4fdyLG:Pq1cJ0:0BdeYdeB9jnfCnspLBEGGCTIteZl7UTYiDKO2VQbdvkCRe9glfTIqY23gRPu9XI0TcebqgN3oNeztyzuh:XxtIp0wUmQPRD7VmFDvv%b3R:SHYRlmfYvCX:mckd1a9mff:KvmSm8JJFbZ0RSS10BiD6Dpoy5:_handajy9:_CardType:7:0jR4:14:0jR4:25:0hg","oy4:_sidi5927y3:_idzy4:_recs235:eNq1VVkWgCAIZHnd:8rtpbFbzfzxRGAQBAiAiCwJTB0n4gohIJXp%45EKOejAFuwQwQ4fdyLG:Pq1cJ0:0BdeYdeB9jnfCnspLBEGGCTIteZl7UTYiDKO2VQbdvkCRe9glfTIqY23gRPu9XI0TcebqgN3oNeztyzuh:XxtIp0wUmQPRD7VmFDvv%b3R:SHYRlmfYvCX:mckd1a9mff:KvmSm8JJFbZ0RSS10BiD6Dpoy5:_handajy9:_CardType:7:0jR4:14:0jR4:25:0hg"];
       
      
      public function Main()
      {
      }
      
      public static function main() : void
      {
         var _loc4_:* = null;
         Serializer.USE_ENUM_INDEX = true;
         Codec.VERSION = Data.§L\x102d\x01§;
         Main.root = Lib.current;
         Main.dm = new DepthManager(Main.root);
         var _loc1_:* = Lib.current.loaderInfo.parameters;
         Main.domain = Reflect.field(_loc1_,"dom");
         Main.subscribe = Reflect.field(_loc1_,"sub");
         Main.slogan = Reflect.field(_loc1_,"slogan");
         Main.lang = Reflect.field(_loc1_,"lang");
         Main.dt = Std.parseFloat(Reflect.field(_loc1_,"time")) - Date.now().getTime();
         Fruit.init();
         Gfx.init();
         Lang.init();
         var _loc2_:String = Reflect.field(_loc1_,"mode");
         var _loc3_:String = _loc2_;
         if(_loc3_ != "browser")
         {
            if(_loc3_ != null)
            {
               if(_loc3_ == "demo")
               {
                  Main.§Ym'*\x03§();
               }
               else if(_loc3_ == "replay")
               {
                  _loc4_ = Codec.getData("data");
                  Main.§z\x1cSD§(int(_loc4_._id),_loc4_._hand,int(_loc4_._sid),_loc4_._rec);
                  Main.game.§((*\x01§(_loc4_._player,int(_loc4_._score),_loc4_._dateString);
               }
            }
            addr160:
            return;
         }
         Main.§tt%\f\x02§ = Codec.getData("data");
         if(Main.§tt%\f\x02§._draft == null)
         {
            new Build(Main.§tt%\f\x02§);
         }
         else
         {
            new Draft(Main.§tt%\f\x02§);
         }
         §§goto(addr160);
      }
      
      public static function §z\x1cSD§(param1:int, param2:Array, param3:int, param4:Bytes = undefined, param5:Object = undefined) : void
      {
         if(Main.game != null)
         {
            Main.root.removeEventListener(Event.ENTER_FRAME,Main.game.§;\x0bF\b§);
            Main.game.kill();
         }
         Main.game = new Game(param1,param2,param3,param4,param5);
         Main.root.addEventListener(Event.ENTER_FRAME,Main.game.§;\x0bF\b§);
      }
      
      public static function §ua\x0b\x06\x02§() : void
      {
         §L\n\x01§.init();
      }
      
      public static function refresh() : void
      {
         var _loc1_:URLRequest = new URLRequest(Main.domain);
         Codec.displayError = function(param1:*):void
         {
         };
         Lib.getURL(_loc1_,"_self");
      }
      
      public static function now() : Number
      {
         return Number(Number(Date.now().getTime()) + Main.dt);
      }
      
      public static function §Ym'*\x03§() : void
      {
         if(Main.§;uCf\x03§ == null)
         {
            Main.§;uCf\x03§ = int(Std.random(int(Main.DEMO.length)));
         }
         Main.§;uCf\x03§ = int((int(Main.§;uCf\x03§ + 1)) % int(Main.DEMO.length));
         var _loc1_:* = Unserializer.run(Main.DEMO[Main.§;uCf\x03§]);
         Main.§z\x1cSD§(int(_loc1_._id),_loc1_._hand,int(_loc1_._sid),_loc1_._rec,true);
      }
      
      public static function §Z\x17\x18&\x02§() : void
      {
         Part.POOL = [];
         Bonus.POOL = [];
         Fruit.POOL = [];
         §Y9u~\x03§.POOL = [];
         Line.POOL = [];
         §zG\t9\x03§.POOL = [];
      }
   }
}
