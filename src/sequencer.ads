with Pattern; use Pattern;

package Sequencer is
  
   procedure   start;   
   procedure   stop;  
   procedure   Switch_Pattern(Pattern_Button : Character);
   procedure   Update_Pattern(Instrument : Character);
   function    Is_Playing return Boolean;
   function    Get_Active_Pattern_Number return Character;
   
   Print_Debug_Output : Boolean := True;
   
Private
   
   Task Play_Loop;   
   
end Sequencer;
