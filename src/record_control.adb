with State;

package body Record_Control is

   protected body Agent is

      procedure Toggle_Record_Arm is
      begin
         Record_Arm := not Record_Arm;
         State.Agent.Set_Has_Changed;
      end Toggle_Record_Arm;

      function Is_Record_Armed return Boolean is
      begin
         return Record_Arm;
      end Is_Record_Armed;

   end Agent;

end Record_Control;
