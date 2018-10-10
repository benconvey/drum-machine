package Input_Controller is

   protected Play_Button is
      entry Was_Pressed;
      procedure Press;
   private
      Pressed : Boolean := False;
   end Play_Button;   
   
   protected Body Play_Button is
      
      entry Was_Pressed when Pressed is
      begin
         Pressed := False;   
      end Was_Pressed;
      
      procedure Press is
      begin
         Pressed := True;
      end Press;
      
   end Play_Button;         
   
   protected Stop_Button is
      entry Was_Pressed;
      procedure Press;
   private
      Pressed : Boolean := False;
   end Stop_Button;
   
   protected body Stop_Button is 
      entry Was_Pressed when Pressed is
      begin
         Pressed := False;   
      end Was_Pressed;
      
      procedure Press is
      begin
         Pressed := True;
      end Press;
   end Stop_Button;
   
      

end Input_Controller;
