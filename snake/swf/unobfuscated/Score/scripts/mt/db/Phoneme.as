package mt.db
{
   import flash.Boot;
   import haxe.io.Bytes;
   
   public class Phoneme
   {
      
      public static var tables:Array;
       
      
      public var s:String;
      
      public function Phoneme()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(Phoneme.tables == null)
         {
            Phoneme.§]'\x1bT§();
         }
      }
      
      public static function §]'\x1bT§() : void
      {
         Phoneme.tables = [{
            "terminal":null,
            "table":[]
         }];
         Phoneme.repl("EAU","O");
         Phoneme.repl("AU","O");
         Phoneme.repl("OU","U");
         Phoneme.repl("EU","e");
         Phoneme.repl("AI","e");
         Phoneme.repl("ER","e");
         Phoneme.repl("CH","sh");
         Phoneme.repl("OE","e");
         Phoneme.repl("PH","F");
         Phoneme.repl("H","");
         Phoneme.repl("S$","$");
         Phoneme.repl("T$","$");
         Phoneme.repl("TS$","$");
         Phoneme.repl("E$","$");
         Phoneme.repl("ES$","$");
         Phoneme.repl("P$","$");
         Phoneme.repl("X$","$");
         Phoneme.repl("ER$","e$");
         Phoneme.repl("EE","e");
         Phoneme.repl("AA","A");
         Phoneme.repl("OO","O");
         Phoneme.repl("UU","U");
         Phoneme.repl("II","I");
         Phoneme.repl("LL","L");
         Phoneme.repl("TT","T");
         Phoneme.repl("SS","S");
         Phoneme.repl("NN","N");
         Phoneme.repl("MM","N");
         Phoneme.repl("RR","R");
         Phoneme.repl("PP","P");
         Phoneme.repl("FF","F");
         Phoneme.repl("C","K");
         Phoneme.repl("CE","SE");
         Phoneme.repl("CS","X");
         Phoneme.repl("CK","K");
         Phoneme.repl("SK","K");
         Phoneme.repl("QU","K");
         Phoneme.repl("GU","G");
         Phoneme.repl("GE","J");
         Phoneme.repl("Y","I");
         Phoneme.repl("Z","S");
         Phoneme.repl("TIO","SIO");
         Phoneme.repl("TIA","SIA");
         Phoneme.repl("ERT","ert");
         Phoneme.repl("EN","n");
         Phoneme.repl("ON","n");
         Phoneme.repl("ION","ioN");
         Phoneme.repl("IN","n");
         Phoneme.repl("INE","iNE");
         Phoneme.repl("AIN","n");
         Phoneme.repl("AN","n");
         Phoneme.repl("AM","n");
         Phoneme.repl("EM","n");
         Phoneme.repl("OM","n");
         Phoneme.repl("EMM","em");
         Phoneme.repl("AMM","am");
         Phoneme.repl("OMM","om");
      }
      
      public static function repl(param1:String, param2:String) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as Array;
         var _loc8_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.length;
         while(_loc4_ < _loc5_)
         {
            _loc4_++;
            _loc6_ = _loc4_;
            _loc7_ = Phoneme.tables[_loc3_].table;
            _loc8_ = param1.charCodeAt(_loc6_);
            _loc3_ = int(_loc7_[_loc8_]);
            if(_loc3_ == null)
            {
               _loc3_ = int(Phoneme.tables.length);
               _loc7_[_loc8_] = _loc3_;
               Phoneme.tables.push({
                  "terminal":null,
                  "table":[]
               });
            }
         }
         var _loc9_:* = Phoneme.tables[_loc3_];
         if(_loc9_.terminal != null)
         {
            Boot.lastError = new Error();
            throw "Duplicate replace " + param1;
         }
         if(param1.length < param2.length)
         {
            Boot.lastError = new Error();
            throw "Invalid replace " + param1 + ":" + param2;
         }
         _loc9_.terminal = Bytes.ofString(param2);
      }
      
      public static function §T\x06j'\x03§(param1:String) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc2_:StringBuf = new StringBuf();
         var _loc3_:int = 0;
         var _loc4_:int = param1.length;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            _loc6_ = param1.charCodeAt(_loc5_);
            _loc7_ = _loc6_;
            if(_loc7_ != 233)
            {
               if(_loc7_ != 232)
               {
                  if(_loc7_ != 234)
                  {
                     if(_loc7_ != 235)
                     {
                        if(_loc7_ != 201)
                        {
                           if(_loc7_ != 200)
                           {
                              if(_loc7_ != 202)
                              {
                                 if(_loc7_ != 203)
                                 {
                                    if(_loc7_ != 224)
                                    {
                                       if(_loc7_ != 226)
                                       {
                                          if(_loc7_ != 228)
                                          {
                                             if(_loc7_ != 225)
                                             {
                                                if(_loc7_ != 192)
                                                {
                                                   if(_loc7_ != 194)
                                                   {
                                                      if(_loc7_ != 196)
                                                      {
                                                         if(_loc7_ != 193)
                                                         {
                                                            if(_loc7_ != 249)
                                                            {
                                                               if(_loc7_ != 251)
                                                               {
                                                                  if(_loc7_ != 252)
                                                                  {
                                                                     if(_loc7_ != 250)
                                                                     {
                                                                        if(_loc7_ != 217)
                                                                        {
                                                                           if(_loc7_ != 219)
                                                                           {
                                                                              if(_loc7_ != 220)
                                                                              {
                                                                                 if(_loc7_ != 218)
                                                                                 {
                                                                                    if(_loc7_ != 238)
                                                                                    {
                                                                                       if(_loc7_ != 239)
                                                                                       {
                                                                                          if(_loc7_ != 237)
                                                                                          {
                                                                                             if(_loc7_ != 206)
                                                                                             {
                                                                                                if(_loc7_ != 207)
                                                                                                {
                                                                                                   if(_loc7_ != 205)
                                                                                                   {
                                                                                                      if(_loc7_ != 244)
                                                                                                      {
                                                                                                         if(_loc7_ != 243)
                                                                                                         {
                                                                                                            if(_loc7_ != 246)
                                                                                                            {
                                                                                                               if(_loc7_ != 245)
                                                                                                               {
                                                                                                                  if(_loc7_ != 212)
                                                                                                                  {
                                                                                                                     if(_loc7_ != 211)
                                                                                                                     {
                                                                                                                        if(_loc7_ != 214)
                                                                                                                        {
                                                                                                                           if(_loc7_ != 230)
                                                                                                                           {
                                                                                                                              if(_loc7_ != 198)
                                                                                                                              {
                                                                                                                                 if(_loc7_ != 339)
                                                                                                                                 {
                                                                                                                                    if(_loc7_ != 338)
                                                                                                                                    {
                                                                                                                                       if(_loc7_ == 231)
                                                                                                                                       {
                                                                                                                                          _loc2_.b = _loc2_.b + String.fromCharCode(99);
                                                                                                                                       }
                                                                                                                                       else if(_loc7_ == 199)
                                                                                                                                       {
                                                                                                                                          _loc2_.b = _loc2_.b + String.fromCharCode(67);
                                                                                                                                       }
                                                                                                                                       else if(_loc7_ == 241)
                                                                                                                                       {
                                                                                                                                          _loc2_.b = _loc2_.b + String.fromCharCode(110);
                                                                                                                                       }
                                                                                                                                       else if(_loc7_ == 209)
                                                                                                                                       {
                                                                                                                                          _loc2_.b = _loc2_.b + String.fromCharCode(78);
                                                                                                                                       }
                                                                                                                                       else
                                                                                                                                       {
                                                                                                                                          _loc8_ = _loc6_;
                                                                                                                                          _loc2_.b = _loc2_.b + String.fromCharCode(_loc8_);
                                                                                                                                       }
                                                                                                                                       continue;
                                                                                                                                    }
                                                                                                                                 }
                                                                                                                                 _loc2_.b = _loc2_.b + String.fromCharCode(111);
                                                                                                                                 _loc2_.b = _loc2_.b + String.fromCharCode(101);
                                                                                                                                 continue;
                                                                                                                              }
                                                                                                                           }
                                                                                                                           _loc2_.b = _loc2_.b + String.fromCharCode(97);
                                                                                                                           _loc2_.b = _loc2_.b + String.fromCharCode(101);
                                                                                                                           continue;
                                                                                                                        }
                                                                                                                     }
                                                                                                                  }
                                                                                                                  _loc2_.b = _loc2_.b + String.fromCharCode(79);
                                                                                                                  continue;
                                                                                                               }
                                                                                                            }
                                                                                                         }
                                                                                                      }
                                                                                                      _loc2_.b = _loc2_.b + String.fromCharCode(111);
                                                                                                      continue;
                                                                                                   }
                                                                                                }
                                                                                             }
                                                                                             _loc2_.b = _loc2_.b + String.fromCharCode(73);
                                                                                             continue;
                                                                                          }
                                                                                       }
                                                                                    }
                                                                                    _loc2_.b = _loc2_.b + String.fromCharCode(105);
                                                                                    continue;
                                                                                 }
                                                                              }
                                                                           }
                                                                        }
                                                                        _loc2_.b = _loc2_.b + String.fromCharCode(85);
                                                                        continue;
                                                                     }
                                                                  }
                                                               }
                                                            }
                                                            _loc2_.b = _loc2_.b + String.fromCharCode(117);
                                                            continue;
                                                         }
                                                      }
                                                   }
                                                }
                                                _loc2_.b = _loc2_.b + String.fromCharCode(65);
                                                continue;
                                             }
                                          }
                                       }
                                    }
                                    _loc2_.b = _loc2_.b + String.fromCharCode(97);
                                    continue;
                                 }
                              }
                           }
                        }
                        _loc2_.b = _loc2_.b + String.fromCharCode(69);
                        continue;
                     }
                  }
               }
            }
            _loc2_.b = _loc2_.b + String.fromCharCode(101);
         }
         return _loc2_.b;
      }
      
      public function make(param1:String) : String
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc10_:* = null as Bytes;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         param1 = Phoneme.§T\x06j'\x03§(param1);
         param1 = param1.toUpperCase();
         var _loc2_:StringBuf = new StringBuf();
         var _loc3_:Bytes = Bytes.ofString("$" + new EReg("[^A-Z]+","g").split(param1).join("$") + "$");
         var _loc4_:int = 0;
         var _loc5_:int = _loc3_.length;
         var _loc6_:Array = Phoneme.tables;
         var _loc9_:int = 0;
         while(_loc4_ < _loc5_)
         {
            _loc10_ = null;
            _loc11_ = _loc4_;
            _loc7_ = _loc6_[0];
            do
            {
               _loc8_ = int(_loc7_.table[int(_loc3_.b[_loc4_])]);
               if(_loc8_ == null)
               {
                  break;
               }
               _loc7_ = _loc6_[_loc8_];
               _loc4_++;
               if(_loc7_.terminal != null)
               {
                  _loc10_ = _loc7_.terminal;
                  _loc9_ = _loc4_;
               }
            }
            while(_loc4_ < _loc5_);
            
            if(_loc10_ == null)
            {
               _loc4_ = _loc11_;
               _loc12_ = int(_loc3_.b[_loc4_]);
               if(_loc12_ >= 97 && _loc12_ <= 122)
               {
                  _loc12_ = _loc12_ + -32;
               }
               _loc2_.b = _loc2_.b + String.fromCharCode(_loc12_);
               _loc4_++;
            }
            else
            {
               _loc12_ = _loc10_.length;
               _loc4_ = _loc9_ - _loc12_;
               _loc3_.blit(_loc4_,_loc10_,0,_loc12_);
            }
         }
         return _loc2_.b;
      }
      
      public function get(param1:int) : int
      {
         return s.charCodeAt(param1);
      }
   }
}
