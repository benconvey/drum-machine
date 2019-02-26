package body Step is

   function Instrument (This : Step_Type) return Character is
   begin
      return This.Instrument;
   end Instrument;

   function Velocity (This : Step_Type) return Integer is
   begin
      return This.Velocity;
   end Velocity;

   function Offset (This : Step_Type) return Integer is
   begin
      return This.Offset;
   end Offset;

   function Active (This : Step_type) return Boolean is
   begin
      return This.Active;
   end Active;




end Step;
