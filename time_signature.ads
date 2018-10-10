package Time_Signature is

   type Time_Signature_Type is abstract tagged private;
   type Time_Signature_Access_Type is access all Time_Signature_Type;
   function Beat_Length (This : Time_Signature_Type) return Integer;       
   function Beats_Per_Measure (This : Time_Signature_Type) return Integer; 
   
private
   
   type Time_Signature_Type is tagged record
      Beat_Length       : Integer;     -- The length of each pulse 
      Beats_Per_Measure : Integer;     -- The number of pulses per bar
   end record;         

end Time_Signature;
