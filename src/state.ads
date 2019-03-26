package State is

   protected Agent is
      entry Wait_Till_Changed;
      procedure Set_Has_Changed;
   private
      Has_Changed : Boolean := False;
   end Agent;
   
end State;
