package body Time_Signature is

   ----------------------
   -- Beats_Per_Minute --
   ----------------------

   function Beats_Per_Measure (This : Time_Signature_Type) return Integer is
   begin
      return This.Beats_Per_Measure;
   end Beats_Per_Measure;

   -----------------
   -- Beat_Length --
   -----------------

   function Beat_Length (This : Time_Signature_Type) return Integer is
   begin
      return This.Beat_Length;
   end Beat_Length;

end Time_Signature;
