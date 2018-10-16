with Step; use Step;

package Pattern is   
         
   -- ADT
   type Pattern_Type is tagged private;
   
   -- ADT components
   type Bars_Type is private; 
   type Pattern_Step_Index_Type is private;   
   type Numer_Of_Steps_Type is private;
         	
   -- ADT instance methods
   function Tempo (This: Pattern_Type) return Integer;       
   function Bars (This: Pattern_Type)  return Bars_Type;    
   function Get_Next_Step(This: Pattern_Type ) return Step_Type;
   
   -- Package variable
   Basic_Beat : Pattern_Type := (tempo => 125);
   
private
      
   type Bars_Type is range 0..2;                  
   Number_Of_Steps : Integer := 64;
   type Pattern_Step_Index_Type is new  Natural range  1 .. Number_Of_Steps;
   
   type Steps_Type is array( Pattern_Step_Index_Type ) of Step_Type;
   type Active_Step_Type is mod Number_Of_Steps;
   
   type Pattern_Type is tagged record
      Tempo             : Integer range 40..400;
      Bars              : Bars_Type := 1;
      Steps             : Steps_Type;
      Active_Step       : Active_Step_Type := 1;
   end record;                   
   
end Pattern;
