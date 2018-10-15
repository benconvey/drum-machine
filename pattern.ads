with Time_Signature; use Time_Signature;
with Step; use Step;

package Pattern is   
   
   type Instance is private;
   type Bars_Type is private; 
   type Pattern_Step_Index_Type is private;   
         
   function Tempo (This: Pattern_Type) return Integer;    
   
   function Bars (This: Pattern_Type)  return Bars_Type; 
   
   function Time_Signature(This: Pattern_Type) return Time_Signature_Access_Type;
   
   function Get_Next_Step(this: Pattern_Type ) return Step.Instance;
   
private
      
   type Bars_Type is range 0..2;                  
   type Numer_Of_Steps : Integer := 64
   type Pattern_Step_Index_Type is Natural 1 .. Number_Of_Steps;
   
   type Steps is array( Pattern_Step_Index_Type ) of Step.Instance;
   type Active_Step is 1 mod Number_Of_Steps;
   
   type Instance is tagged record
      Tempo             : Integer range 40..400;
      ID                : Pattern_Identifier_Type   := A1;
      Bars              : Bars_Type := 1;
      Time_Signature    : Time_Signature_Access_Type;
   end record;                   
   
end Pattern;
