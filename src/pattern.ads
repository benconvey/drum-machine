with Step; use Step;

package Pattern is   
         
   -- ADT
   type Pattern_Type is tagged private;
   type Pattern_Access_Type is not null access constant Pattern_Type;
   
   -- ADT components   
   Number_Of_Steps_In_A_Pattern  : constant Integer := 32;
   type Instruments_Type is (Kick, Snare, Open_Hat, Closed_Hat);
   type Active_Step_Type is mod Number_Of_Steps_In_A_Pattern;
   
   -- The array that holds a pattern
   type Step_Row_Type is array(1 .. Number_Of_Steps_In_A_Pattern) of Step_Type;
   type Steps_Array_Type is array(Instruments_Type'Range) of Step_Row_Type; 
   
   -- ADT instance methods
   function Get_Tempo (This : Pattern_Type) return Integer;       
   function Get_Bars (This: Pattern_Type)  return Integer;    
   function Get_Steps (This: Pattern_Type) return Steps_Array_Type;   
   function Get_Active_Step(This: access Pattern_Type) return Active_Step_Type;
   
   procedure Set_Tempo (This : access Pattern_Type; New_Tempo : Integer);
   procedure Increment_Active_Step (This : access Pattern_Type);
   procedure Set_Active_Step(This : access Pattern_Type; Step : Active_Step_Type);
   
   -- Static methods
   Function Get_Basic_Beat Return Pattern_Type;
   
private        
   
   type Pattern_Type is tagged record
      Tempo             : Integer range 40..400 := 120;
      Length_In_Bars    : Integer := 1;
      Steps             : Steps_Array_Type 
        := (Kick        => (Others => Step.Initialise ('K', 0, 0, False)),                                                                              
            Snare       => (others => Step.Initialise ('S', 0, 0, False)),                         
            Open_Hat    => (others => Step.Initialise ('H', 0, 0, True)),                         
            Closed_Hat  => (others => Step.Initialise ('T', 0, 0, False))
               
               
                            );                              
      Active_Step       : Active_Step_Type := 1; -- The first beat of the pattern
   end record;                   
   
   -- Package variable
   Basic_Beat : Pattern_Type := 
     ( Tempo => 125, 
       Steps => Steps_Array_Type'(         
         Kick        => (1 | 4 | 8 | 12 | 16 | 20 | 24 | 28 => Step.Initialise ('K', 127, 0, True), Others => Step.Initialise ('K', 0 , 0, False)),                  
         Snare       =>  (4|12|20|28 => Step.Initialise('S', 127, 0, True), others => Step.Initialise('S', 0 ,0, false)),
         Open_Hat    => (others => Step.Initialise('H', 0, 0, True)),
         Closed_Hat  => (others => Step.Initialise('T', 0, 0, False))         
        ),others => <>
      );  
                   
   
end Pattern;
