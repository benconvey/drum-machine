package Step is

   type Instance is record            
      Instrument  : Character;      
      Note        : Note_Type
      Velocity    : Integer; 
      Offset      : Integer;      
      Active      : Boolean;
   end record;
   
      
  
end Step;
