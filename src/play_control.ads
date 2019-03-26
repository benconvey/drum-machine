package Play_Control is

   protected Agent is
      entry Wait_Till_Played;
      procedure Set_Is_Playing;
      procedure Set_Is_Not_Playing;
      function Get_Is_Playing return Boolean;
   private
      Is_Playing : Boolean := False;
      Is_Paused  : Boolean := True;
   end Agent;

end Play_Control;
