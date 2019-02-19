with Step; use Step;

package Pattern is   
         
   -- ADT
   type Pattern_Type is tagged private;
   
   -- ADT components   
   Number_Of_Steps : constant Integer := 32;
   Number_Of_Instruments :constant Integer := 4;
   subtype Instrument_Index is Integer range 1 .. Number_Of_Instruments; 
   type Active_Step_Type is mod Number_Of_Steps; 
   type Bars_Type is range 1 .. 2;    
   type Step_Row_Type is array( 1..Number_Of_Steps) of Step_Type;
   type Steps_Type is array( 1..Number_Of_Instruments ) of Step_Row_Type;
   
   
   -- ADT instance methods
   function Get_Tempo (This: Pattern_Type) return Integer;       
   function Get_Bars (This: Pattern_Type)  return Bars_Type;    
   function Get_Steps (This: Pattern_Type) return Steps_Type;   
   function Get_Active_Step(This: Pattern_Type) return Active_Step_Type;
   function Get_Row_Of_Steps(This: Pattern_Type; Index : Instrument_Index) return Step_Row_Type;
   
   procedure Increment_Active_Step(This :in out Pattern_Type);
   
   -- Static methods
   function Get_Basic_Beat return Pattern_Type;
   
private        
   
   type Pattern_Type is tagged record
      Tempo             : Integer range 40..400;
      Bars              : Bars_Type := 1;
      Steps             : Steps_Type;
      Active_Step       : Active_Step_Type := 1;
   end record;                   
   
   -- Package variable
   Basic_Beat : Pattern_Type := 
     ( Tempo => 125, 
       Steps => Steps_Type'(
         1 => Step_Row_Type'(1|4|8|12|16|20|24|28 => Step.Initialise('K', 127, 0, True), others => Step.Initialise('K', 0 ,0, false)),         
         2 => Step_Row_Type'(4|12|20|28 => Step.Initialise('S', 127, 0, True), others => Step.Initialise('S', 0 ,0, false)),
         3 => Step_Row_Type'(others => Step.Initialise('H', 0, 0, True)),
         4 => Step_Row_Type'(others => Step.Initialise('T', 0, 0, False))         
        ),others => <>
      );
   
end Pattern;
