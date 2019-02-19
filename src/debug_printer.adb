with Pattern, Ada.Text_IO; use Pattern,Ada.Text_IO;

package body Debug_Printer is

   procedure Print_Sequencer(Is_Playing : Boolean; Current_Pattern : Pattern_Type) is
   begin

      Put(ASCII.ESC & "[2J");
      Put(ASCII.ESC & "[H");
      Put_Line("Active Step: " & Current_Pattern.Get_Active_Step'Image);
      Put_Line("Playing: " & (if Is_Playing then "Playing" else "Paused"));

      for index in 1 .. Pattern.Number_Of_Instruments  loop
         Put_Line(Build_Instrument_Debug_Line(index, Current_Pattern));
      end loop;

   end Print_Sequencer;

   function Build_Instrument_Debug_Line(Instrument_Index : in Integer; Current_Pattern: in Pattern_Type) return String is
      Instrument_Line : Step_Row_Type;
      Result : String(1..32);
   begin

      -- Get a line of steps
      Instrument_Line := Current_Pattern.Get_Row_Of_Steps(Instrument_Index);


      for Index in Instrument_Line'Range loop

         Result(Instrument_Index) :=  (if Instrument_Line(Index).Active then Instrument_Line(Index).Instrument else '.');

      end loop;

      return Result;

   end Build_Instrument_Debug_Line;


end Debug_Printer;
