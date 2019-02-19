package Step is
   
   -- ADT
   type Step_Type is tagged private;      
   
   -- ADT instance methods
   function Instrument (This : Step_Type) return Character;
   function Velocity (This : Step_Type) return Integer;
   function Offset (This : Step_Type) return Integer;
   function Active (This : Step_type) return Boolean;
   
   function Initialise
     (Instrument : Character; 
      Velocity: Integer; 
      Offset : Integer; 
      Active : boolean) 
      return Step_Type;

      
private   
   
   type Step_Type is tagged record            
      Instrument  : Character;
      Velocity    : Integer   := 0; 
      Offset      : Integer   := 0;      
      Active      : Boolean   := false;
   end record;
   
   function Initialise
     (Instrument  : Character;
      Velocity     : Integer;
      Offset       : Integer;
      Active       : Boolean)
      return Step_Type 
   is (Instrument => Instrument,
       Velocity   => Velocity,
       Offset     => Offset,
       Active     => Active);
   
end Step;
