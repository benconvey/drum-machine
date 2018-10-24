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
   
   -- Static methods
   function Get_Basic_Beat return Pattern_Type;
   procedure Debug_Print(This:Pattern_Type);
   
   
private
        
   type Bars_Type is range 0..2;                  
   Number_Of_Steps : constant Integer := 32;
   Number_Of_Instruments :constant Integer := 4;   
   type Active_Step_Type is mod Number_Of_Steps; 
   
   type Step_Row_Type is array( 1..Number_Of_Steps) of Step_Type;
   type Steps_Type is array( 1..Number_Of_Instruments ) of Step_Row_Type;

   
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
         1 => Step_Row_Type'(1|4|8|12|16|20|24|28 => Step.Initialise('K', 127, 0, True), others => Step.Initialise('K', 0 ,0, false)),         
         2 => Step_Row_Type'(4|12|20|28 => Step.Initialise('S', 127, 0, True), others => Step.Initialise('S', 0 ,0, false)),
         3 => Step_Row_Type'(others => Step.Initialise('H', 127, 0, True)),
         4 => Step_Row_Type'(others => Step.Initialise('T', 127, 0, False))         
        ),others => <>
      );
   
end Pattern;
