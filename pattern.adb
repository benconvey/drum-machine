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


end Pattern;
