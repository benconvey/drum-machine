package Step is
   
   -- ADT
   type Step_Type is tagged private;      
   
   -- ADT instance methods
   function Instrument (This : Step_Type) return Character;
   function Velocity (This : Step_Type) return Integer;
   function Offset (This : Step_Type) return Integer;
   function Active (This : Step_type) return Boolean;
      
private   
   
   type Step_Type is tagged record            
      Instrument  : Character := 'z';      
      Velocity    : Integer := 127; 
      Offset      : Integer := 0;      
      Active      : Boolean := true;
   end record;
   
end Step;
