with Pattern; use Pattern;

package Debug_Printer is

   procedure Print_Sequencer
     (Is_Playing  : Boolean;
      Current_Pattern : access Pattern_Type;
      Current_Pattern_Index : Character);   
   
   Print_Exception : exception;
   
private 
   function Build_Instrument_Debug_Line(Instrument : in Instruments_Type; Current_Pattern : access Pattern_Type) return String;
   
   
   

end Debug_Printer;
