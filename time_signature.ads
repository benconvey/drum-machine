package Time_Signatures is

   type Time_Signature is abstract tagged private;
   function Beat_Length (This : Time_Signature) return Integer;       
   function Beats_Per_Measure (This : Time_Signature) return Integer; 
   
private
   
   type Time_Signature is tagged record
      Beat_Length       : Integer;     -- The length of each pulse 
      Beats_Per_Measure : Integer;     -- The number of pulses per bar
   end record;         

end Time_Signature;
