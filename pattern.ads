with Time_Signature; use Time_Signature;

package Pattern is   
   
   type Pattern_Type is private;
   type Pattern_Identifier_Type is private;
   type Bars_Type is private; 
   
   type Pattern_Access_Type is access all Pattern_Type;
         
   function Tempo (This: Pattern_Type) return Integer;  
   
   function Id (This: Pattern_Type)    return Pattern_Identifier_Type;   
   
   function Bars (This: Pattern_Type)  return Bars_Type; 
   
   function Time_Signature(This: Pattern_Type) return Time_Signature_Access_Type;
   
   function Instance return Pattern_Access_Type;
   
private
      
   type Bars_Type is range 0..2;
               
   type Pattern_Identifier_Type is (A1, A2, A3, A4, B1, B2, B3, B4);
   
   type Pattern_Type is tagged record
      Tempo             : Integer range 40..400;
      ID                : Pattern_Identifier_Type   := A1;
      Bars              : Bars_Type := 2;
      Time_Signature    : Time_Signature_Access_Type;
   end record;                   
   
end Pattern;
