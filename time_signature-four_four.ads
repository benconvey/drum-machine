package Time_Signature.Four_four is

   type Instance_Type is private;
   type Instance_Type_Access is access all Instance_Type;
   
   function Instance  return Instance_Type_Access;      
      
private   
      
   type Instance_Type is new Time_Signature'(Beats_Per_Measure := 4, Beat_Length :=4)         

end Time_Signature.Four_four;
