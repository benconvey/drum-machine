with Pattern; use Pattern;

package Sequencer is
  
   procedure   start;   
   procedure   stop;  
   procedure   Switch_Pattern(Pattern : Character);
   procedure   Update_Pattern(Instrument : Character);
   function    Is_Playing return Boolean;
   procedure   DebugPrint(Pattern: Pattern_Type);            
   
end Sequencer;
