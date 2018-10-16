package body Time_Signatures is

   function Beats_Per_Measure (This : Time_Signature) return Integer is
   begin
      return This.Beats_Per_Measure;
   end Beats_Per_Measure;

   function Beat_Length (This : Time_Signature) return Integer is
   begin
      return This.Beat_Length;
   end Beat_Length;

end Time_Signatures;
