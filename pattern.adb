with Ada.Text_IO, Ada.Strings.Fixed; use Ada.Text_IO, Ada.Strings.Fixed;

package body Pattern is

   function Tempo (This: Pattern_Type) return Integer is
   begin
      return This.Tempo;
   end Tempo;

   function Bars (This: Pattern_Type) return Bars_Type is
   begin
      return This.Bars;
   end Bars;

   function Get_Basic_Beat return Pattern_Type is
   begin
      return Basic_Beat;
   end Get_Basic_Beat;

   function Active_Step(This : Pattern_Type) return Active_Step_Type is
   begin
      return This.Active_Step;
   end Active_Step;

   procedure Increment_Active_Step(This : in out Pattern_Type)  is
   begin
      This.Active_Step := This.Active_Step + 1;
   end Increment_Active_Step;


   function Steps(this: Pattern_Type) return Steps_Type is
   begin
      return This.Steps;
   end Steps;

   function Build_Instrument_Debug_Line(This:Pattern_Type; Instrument_Index: in Integer) return String;

   procedure Debug_Print(This:Pattern_Type) is
   begin
      Put(ASCII.ESC & "[H");
      Put_Line("Active Step: " & This.Active_Step'Image);
      Put_Line((if Sequencer.Is_Playing then "Play" else "Paused"));
      for index in 1..Number_Of_Instruments loop
         Put_Line(This.Build_Instrument_Debug_Line(index));
      end loop;
   end;

   function Build_Instrument_Debug_Line(This: Pattern_Type; Instrument_Index : in Integer) return String is
      Instrument_Line :  Step_Row_Type;
      Result : String(1..32);
   begin
      -- Get a line of steps
      Instrument_Line := This.Steps(Instrument_Index);


      for Index in Instrument_Line'Range loop

         Result(Instrument_Index) :=  (if Instrument_Line(Index).Active then Instrument_Line(Index).Instrument else '.');

      end loop;

      return Result;

   end Build_Instrument_Debug_Line;



end Pattern;
