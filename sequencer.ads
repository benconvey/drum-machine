with Pattern; use Pattern;

package Sequencer is
  
   procedure   start;   
   procedure   stop;  
   procedure   Switch_Pattern(Pattern : Character);
   procedure   Update_Pattern(Instrument : Character);
   function    Is_Playing return Boolean;
   procedure   Debug_Print(Pattern: Pattern_Type);            
   
private    
   function Build_Instrument_Debug_Line(Instrument_Index : in Integer) return String;
   
end Sequencer;
