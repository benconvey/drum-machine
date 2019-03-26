with Pattern; use Pattern;
limited with sequencer;

package Debug_Printer is

   procedure Print_Sequencer;
    
   Print_Exception : exception;
   
private 
   function Build_Instrument_Debug_Line(Instrument : in Instruments_Type; Current_Pattern : Pattern_Type) return String;
      

end Debug_Printer;
