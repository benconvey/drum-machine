with Pattern; use Pattern;

package Debug_Printer is

   procedure Print_Sequencer
     (Is_Playing  : Boolean;
      Current_Pattern : Pattern_Type);
   
   Print_Exception : exception;
   
private 
   function Build_Instrument_Debug_Line(Instrument : in Instruments_Type; Current_Pattern : in Pattern_Type) return String;
   
   
   

end Debug_Printer;
