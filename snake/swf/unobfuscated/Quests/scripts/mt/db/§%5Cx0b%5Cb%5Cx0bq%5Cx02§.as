package mt.db
{
   import flash.§f$\n8\x01§;
   import haxe.io.Bytes;
   
   public class §\x0b\b\x0bq\x02§
   {
      
      public static var tables:Array;
       
      
      public var §\n\x01§:String;
      
      public function §\x0b\b\x0bq\x02§()
      {
         if(§f$\n8\x01§.skip_constructor)
         {
            return;
         }
         if(§\x0b\b\x0bq\x02§.tables == null)
         {
            §\x0b\b\x0bq\x02§.§]'\x1bT§();
         }
      }
      
      public static function §]'\x1bT§() : void
      {
         §\x0b\b\x0bq\x02§.tables = [{
            "terminal":null,
            "table":[]
         }];
         §\x0b\b\x0bq\x02§.repl("EAU","O");
         §\x0b\b\x0bq\x02§.repl("AU","O");
         §\x0b\b\x0bq\x02§.repl("OU","U");
         §\x0b\b\x0bq\x02§.repl("EU","e");
         §\x0b\b\x0bq\x02§.repl("AI","e");
         §\x0b\b\x0bq\x02§.repl("ER","e");
         §\x0b\b\x0bq\x02§.repl("CH","sh");
         §\x0b\b\x0bq\x02§.repl("OE","e");
         §\x0b\b\x0bq\x02§.repl("PH","F");
         §\x0b\b\x0bq\x02§.repl("H","");
         §\x0b\b\x0bq\x02§.repl("S$","$");
         §\x0b\b\x0bq\x02§.repl("T$","$");
         §\x0b\b\x0bq\x02§.repl("TS$","$");
         §\x0b\b\x0bq\x02§.repl("E$","$");
         §\x0b\b\x0bq\x02§.repl("ES$","$");
         §\x0b\b\x0bq\x02§.repl("P$","$");
         §\x0b\b\x0bq\x02§.repl("X$","$");
         §\x0b\b\x0bq\x02§.repl("ER$","e$");
         §\x0b\b\x0bq\x02§.repl("EE","e");
         §\x0b\b\x0bq\x02§.repl("AA","A");
         §\x0b\b\x0bq\x02§.repl("OO","O");
         §\x0b\b\x0bq\x02§.repl("UU","U");
         §\x0b\b\x0bq\x02§.repl("II","I");
         §\x0b\b\x0bq\x02§.repl("LL","L");
         §\x0b\b\x0bq\x02§.repl("TT","T");
         §\x0b\b\x0bq\x02§.repl("SS","S");
         §\x0b\b\x0bq\x02§.repl("NN","N");
         §\x0b\b\x0bq\x02§.repl("MM","N");
         §\x0b\b\x0bq\x02§.repl("RR","R");
         §\x0b\b\x0bq\x02§.repl("PP","P");
         §\x0b\b\x0bq\x02§.repl("FF","F");
         §\x0b\b\x0bq\x02§.repl("C","K");
         §\x0b\b\x0bq\x02§.repl("CE","SE");
         §\x0b\b\x0bq\x02§.repl("CS","X");
         §\x0b\b\x0bq\x02§.repl("CK","K");
         §\x0b\b\x0bq\x02§.repl("SK","K");
         §\x0b\b\x0bq\x02§.repl("QU","K");
         §\x0b\b\x0bq\x02§.repl("GU","G");
         §\x0b\b\x0bq\x02§.repl("GE","J");
         §\x0b\b\x0bq\x02§.repl("Y","I");
         §\x0b\b\x0bq\x02§.repl("Z","S");
         §\x0b\b\x0bq\x02§.repl("TIO","SIO");
         §\x0b\b\x0bq\x02§.repl("TIA","SIA");
         §\x0b\b\x0bq\x02§.repl("ERT","ert");
         §\x0b\b\x0bq\x02§.repl("EN","n");
         §\x0b\b\x0bq\x02§.repl("ON","n");
         §\x0b\b\x0bq\x02§.repl("ION","ioN");
         §\x0b\b\x0bq\x02§.repl("IN","n");
         §\x0b\b\x0bq\x02§.repl("INE","iNE");
         §\x0b\b\x0bq\x02§.repl("AIN","n");
         §\x0b\b\x0bq\x02§.repl("AN","n");
         §\x0b\b\x0bq\x02§.repl("AM","n");
         §\x0b\b\x0bq\x02§.repl("EM","n");
         §\x0b\b\x0bq\x02§.repl("OM","n");
         §\x0b\b\x0bq\x02§.repl("EMM","em");
         §\x0b\b\x0bq\x02§.repl("AMM","am");
         §\x0b\b\x0bq\x02§.repl("OMM","om");
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
            _loc7_ = §\x0b\b\x0bq\x02§.tables[_loc3_].table;
            _loc8_ = param1.charCodeAt(_loc6_);
            _loc3_ = int(_loc7_[_loc8_]);
            if(_loc3_ == null)
            {
               _loc3_ = int(§\x0b\b\x0bq\x02§.tables.length);
               _loc7_[_loc8_] = _loc3_;
               §\x0b\b\x0bq\x02§.tables.push({
                  "terminal":null,
                  "table":[]
               });
            }
         }
         var _loc9_:* = §\x0b\b\x0bq\x02§.tables[_loc3_];
         if(_loc9_.terminal != null)
         {
            §f$\n8\x01§.lastError = new Error();
            throw "Duplicate replace " + param1;
         }
         if(param1.length < param2.length)
         {
            §f$\n8\x01§.lastError = new Error();
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
         param1 = §\x0b\b\x0bq\x02§.§T\x06j'\x03§(param1);
         param1 = param1.toUpperCase();
         var _loc2_:StringBuf = new StringBuf();
         var _loc3_:Bytes = Bytes.ofString("$" + new EReg("[^A-Z]+","g").split(param1).join("$") + "$");
         var _loc4_:int = 0;
         var _loc5_:int = _loc3_.§_^\nv\x03§;
         var _loc6_:Array = §\x0b\b\x0bq\x02§.tables;
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
               _loc12_ = _loc10_.§_^\nv\x03§;
               _loc4_ = _loc9_ - _loc12_;
               _loc3_.blit(_loc4_,_loc10_,0,_loc12_);
            }
         }
         return _loc2_.b;
      }
      
      public function get(param1:int) : int
      {
         return §\n\x01§.charCodeAt(param1);
      }
   }
}
