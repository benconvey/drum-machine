with Step; use Step;

package Pattern is   
         
   -- ADT
   type Pattern_Type is tagged private;
   
   -- ADT components
   type Bars_Type is private; 
         	
   -- ADT instance methods
   function Tempo (This: Pattern_Type) return Integer;       
   function Bars (This: Pattern_Type)  return Bars_Type;    
   function Get_Next_Step(This: Pattern_Type ) return Step_Type;   
   
   -- Static methods
   function Get_Basic_Beat return Pattern_Type;
   
private
        
   type Bars_Type is range 0..2;                  
   Number_Of_Steps : constant Natural := 32;
   
   type Active_Step_Type is mod Number_Of_Steps;   
   type Steps_Type is array( Active_Step_Type ) of Step_Type;

   
   type Pattern_Type is tagged record
      Tempo             : Integer range 40..400;
      Bars              : Bars_Type := 1;
      Steps             : Steps_Type;
      Active_Step       : Active_Step_Type := 1;
   end record;                   
   
   -- Package variable
   Basic_Beat : Pattern_Type := 
     ( Tempo => 125, 
       Steps => <>, 
       others => <> );
   
end Pattern;
