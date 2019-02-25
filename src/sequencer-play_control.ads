private package Sequencer.Play_Control is

   protected Controller is
      entry Wait_Till_Played;
      procedure Set_Is_Playing(Playing: Boolean);
      function Get_Is_Playing return Boolean;
   private
      Is_Playing : Boolean := false;
      Is_Paused  : Boolean := True;
   end Controller;  

end Sequencer.Play_Control;
