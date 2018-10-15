package body Pattern is

   -----------
   -- Tempo --
   -----------

   function Tempo (This: Pattern_Type) return Integer is
   begin
      return This.Tempo;
   end Tempo;

   --------------------
   -- Time_Signature --
   --------------------

   function Time_Signature (This: Pattern_Type) return Time_Signature_Access_Type is
   begin
      return This.Time_Signature;
   end Time_Signature;

   ----------
   -- Bars --
   ----------

   function Bars (This: Pattern_Type) return Bars_Type is
   begin
      return This.Bars;
   end Bars;

end Pattern;
