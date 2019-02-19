with Pattern; use Pattern;

package Sequencer is
  
   procedure   start;   
   procedure   stop;  
   procedure   Switch_Pattern(Pattern : Character);
   procedure   Update_Pattern(Instrument : Character);
   function    Is_Playing return Boolean;
   
   Print_Debug_Output : Boolean := True;
   
end Sequencer;
