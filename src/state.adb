package body State is

   protected body Agent is

      entry Wait_Till_Changed when Has_Changed is
      begin
         Has_Changed := False;
      end Wait_Till_Changed;

      procedure Set_Has_Changed is
      begin
         Has_Changed := True;
      end Set_Has_Changed;

   end Agent;

end State;
