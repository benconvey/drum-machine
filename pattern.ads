with Step; use Step;

package Pattern is   
         
   -- ADT
   type Pattern_Type is tagged private;
   
   -- ADT components
   type Bars_Type is private; 
   type Steps_Type is private;
   type Active_Step_Type is private;
         	
   -- ADT instance methods
   function Tempo (This: Pattern_Type) return Integer;       
   function Bars (This: Pattern_Type)  return Bars_Type;    
   function Steps (This: Pattern_Type) return Steps_Type;   
   function Active_Step(This: Pattern_Type) return Active_Step_Type;
   
   procedure Increment_Active_Step(This :in out Pattern_Type);
   function Current_Step(This: Pattern_Type) return Step_Type;
   function Next_Step_Is_Active(This: Pattern_Type ) return Boolean;   
   
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
      Active_Step       : Active_Step_Type := 0;
   end record;                   
   
   -- Package variable
   Basic_Beat : Pattern_Type := 
     ( Tempo => 125, 
       Steps => Steps_Type'(
         0|4|8|12|16|20|24|28 => Step.Initialise('K', 127, 0, True),
         others => Step.Initialise('H', 127 ,0, true)), 
       others => <> );
   
end Pattern;
