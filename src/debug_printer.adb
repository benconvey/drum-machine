with Pattern, Ada.Text_IO; use Pattern,Ada.Text_IO;

package body Debug_Printer is

   procedure Print_Sequencer(Is_Playing : Boolean; Current_Pattern : Pattern_Type) is
   begin

      Put(ASCII.ESC & "[2J");
      Put(ASCII.ESC & "[H");
      Put_Line("Active Step: " & Current_Pattern.Get_Active_Step'Image);
      Put_Line("Playing: " & (if Is_Playing then "Playing" else "Paused"));

      for Instrument in Pattern.Instruments_Type'Range  loop
         Put_Line(Build_Instrument_Debug_Line(Instrument, Current_Pattern));
      end loop;

   end Print_Sequencer;

   function Build_Instrument_Debug_Line(Instrument : in Instruments_Type; Current_Pattern: in Pattern_Type) return String is
      Result : String(1..32);
      Pattern_Steps : Pattern.Steps_Array_Type;
      Instrument_Steps : Pattern.Step_Row_Type;
   begin

      Pattern_Steps := Current_Pattern.Get_Steps;

      -- Get a line of steps
      Instrument_Steps := Pattern_Steps(Instrument);

      for Index in Instrument_Steps'Range loop

         Result(Index) :=  (if Instrument_Steps(Index).Active then Instrument_Steps(Index).Instrument else '.');

      end loop;

      return Result;

   end Build_Instrument_Debug_Line;

end Debug_Printer;
