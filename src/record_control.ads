package Record_Control is

   protected Agent is
      procedure Toggle_Record_Arm;
      function Is_Record_Armed return Boolean;
   private
      Record_Arm : Boolean := False;
   end Agent;   

end Record_Control;
