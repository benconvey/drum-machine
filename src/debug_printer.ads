with Pattern; use Pattern;
limited with sequencer;

package Debug_Printer is

   procedure Print_Sequencer
     (Is_Playing  : Boolean;
      Current_Pattern : access Pattern_Type;
      Current_Pattern_Index : Integer);   
   
   Print_Exception : exception;
   
private 
   function Build_Instrument_Debug_Line(Instrument : in Instruments_Type; Current_Pattern : access Pattern_Type) return String;
   
   
   

end Debug_Printer;
