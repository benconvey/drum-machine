package body Pattern is

   function Tempo (This: Pattern_Type) return Integer is
   begin
      return This.Tempo;
   end Tempo;

   function Bars (This: Pattern_Type) return Bars_Type is
   begin
      return This.Bars;
   end Bars;

   function Get_Next_Step(This : Pattern_Type) return Step_Type is
   begin
      return This.Steps( This.Active_Step + 1);
   end Get_Next_Step;

   function Get_Basic_Beat return Pattern_Type is
   begin
      return Basic_Beat;
   end Get_Basic_Beat;

end Pattern;
