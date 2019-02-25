private package body Sequencer.Play_Control is
   protected body Controller is

      entry Wait_Till_Played when Is_Playing is
      begin
         null;
      end Wait_Till_Played;

      procedure Set_Is_Playing(Playing : Boolean) is
      begin
         Is_Playing := Playing;
      end Set_Is_Playing;

      function Get_Is_Playing return boolean is
      begin
         return Is_Playing;
      end Get_Is_Playing;

   end Controller;

end Sequencer.Play_Control;
