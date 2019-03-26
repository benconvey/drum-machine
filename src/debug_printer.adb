with Pattern, Ada.Text_IO, Pattern_Control, Play_Control, Record_Control, State; use Pattern,Ada.Text_IO;

package body Debug_Printer is

   Print_Debug_Output : Boolean := true;

   procedure Print_Sequencer is

      Current_Pattern : aliased Pattern.Pattern_Type := Pattern_Control.Agent.Get_Active_Pattern.all;
      Current_Pattern_Index : Integer := Pattern_Control.Agent.Get_Active_Pattern_Number;
      Is_PLaying : Boolean := Play_Control.Agent.Get_Is_Playing;
   begin

      Put(ASCII.ESC & "[2J");
      Put(ASCII.ESC & "[H");
      Put_Line ("Active Step: " & Current_Pattern.Get_Active_Step'Image);
      Put_Line("Active Pattern: " & Current_Pattern_Index'Image);
      Put_Line ("Playing: " & (if Is_Playing then "Playing" else "Paused"));
      Put_Line ("Tempo: " & Current_Pattern.Get_Tempo'Image & "bpm");
      Put_Line ("Record Armed: " & (if Record_Control.Agent.Is_Record_Armed then "yes" else "no"));

      for Instrument in Pattern.Instruments_Type'Range  loop
         Put_Line(Build_Instrument_Debug_Line(Instrument, Current_Pattern));
      end loop;

   end Print_Sequencer;

   function Build_Instrument_Debug_Line(Instrument : in Instruments_Type; Current_Pattern: Pattern_Type) return String is
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

   task Monitor_State;

   task body Monitor_State is
   begin
      if Print_Debug_Output then
         loop
            State.Agent.Wait_Till_Changed;
            Print_Sequencer;
         end loop;
      end if;
   end Monitor_State;

end Debug_Printer;
