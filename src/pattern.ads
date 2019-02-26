with Step; use Step;

package Pattern is   
         
   -- ADT
   type Pattern_Type is tagged private;
   
   -- ADT components   
   Number_Of_Steps_In_A_Pattern  : constant Integer := 32;
   type Instruments_Type is (Kick, Snare, Open_Hat, Closed_Hat);
   type Active_Step_Type is mod Number_Of_Steps_In_A_Pattern;
   
   -- The array that holds a pattern
   type Step_Row_Type is array(1 .. Number_Of_Steps_In_A_Pattern) of Step_Type;
   type Steps_Array_Type is array(Instruments_Type'Range) of Step_Row_Type; 
   
   -- ADT instance methods
   function Get_Tempo (This: Pattern_Type) return Integer;       
   function Get_Bars (This: Pattern_Type)  return Integer;    
   function Get_Steps (This: Pattern_Type) return Steps_Array_Type;   
   function Get_Active_Step(This: Pattern_Type) return Active_Step_Type;
   
   procedure Increment_Active_Step(This :in out Pattern_Type);
   
   -- Static methods
   function Get_Basic_Beat return Pattern_Type;
   function Get_Trippy_Beat return Pattern_Type;
   
private        
   
   type Pattern_Type is tagged record
      Tempo             : Integer range 40..400;
      Length_In_Bars    : Integer := 1;
      Steps             : Steps_Array_Type;
      Active_Step       : Active_Step_Type := 1; -- The first beat of the pattern
   end record;                   
   
   -- Package variable
   Basic_Beat : Pattern_Type := 
     ( Tempo => 125, 
       Steps => Steps_Array_Type'(
         Kick        => (1|4|8|12|16|20|24|28 => Step.Initialise('K', 127, 0, True), others => Step.Initialise('K', 0 ,0, false)),         
         Snare       =>  (4|12|20|28 => Step.Initialise('S', 127, 0, True), others => Step.Initialise('S', 0 ,0, false)),
         Open_Hat    => (others => Step.Initialise('H', 0, 0, True)),
         Closed_Hat  => (others => Step.Initialise('T', 0, 0, False))         
        ),others => <>
      );
   
   Trippy_Beat : Pattern_Type := 
     ( Tempo => 70, 
       Steps => Steps_Array_Type'(
         Kick        => (1|28 => Step.Initialise('K', 127, 0, True), others => Step.Initialise('K', 0 ,0, false)),         
         Snare       =>  (20|28 => Step.Initialise('S', 127, 0, True), others => Step.Initialise('S', 0 ,0, false)),
         Open_Hat    => (others => Step.Initialise('H', 0, 0, True)),
         Closed_Hat  => (others => Step.Initialise('T', 0, 0, False))         
        ),others => <>
      );
   
   
end Pattern;
