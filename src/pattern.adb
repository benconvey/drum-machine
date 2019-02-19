with Ada.Text_IO, Ada.Strings.Fixed; use Ada.Text_IO, Ada.Strings.Fixed;

package body Pattern is

   function Get_Tempo (This: Pattern_Type) return Integer is
   begin
      return This.Tempo;
   end Get_Tempo;

   function Get_Bars (This: Pattern_Type) return Bars_Type is
   begin
      return This.Bars;
   end Get_Bars;

   function Get_Basic_Beat return Pattern_Type is
   begin
      return Basic_Beat;
   end Get_Basic_Beat;

   function Get_Active_Step(This : Pattern_Type) return Active_Step_Type is
   begin
      return This.Active_Step;
   end Get_Active_Step;

   procedure Increment_Active_Step(This : in out Pattern_Type)  is
   begin
      This.Active_Step := This.Active_Step + 1;
   end Increment_Active_Step;


   function Get_Steps(this: Pattern_Type) return Steps_Type is
   begin
      return This.Steps;
   end Get_Steps;

   function Get_Row_Of_Steps(This : Pattern_Type; Index : Instrument_Index) return Step_Row_Type is
   begin
      return This.Steps(Index);
   end Get_Row_Of_Steps;


end Pattern;
