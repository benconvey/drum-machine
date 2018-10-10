package body Sequencer is

   protected Play_Control is
      procedure Set_Is_Playing(Playing : boolean);
      entry Stop;
      private
      Is_Playing : Boolean := false;
   end Play_Control;

   protected body Play_Control is

      procedure Set_Is_Playing(Playing: Boolean) is
      begin
         Is_Playing := Playing;
      end Set_Is_Playing;

      entry Stop when Is_Playing;

   end Play_Control;

   procedure start is
      begin
      Play_Control.Set_Is_Playing(true);
   end start;

   procedure stop is
      begin
      Play_Control.Set_Is_Playing(false);
   end stop;

   task Play_Loop is
   begin
      loop
         select
            Play_Control.Stop
         then exit;
            Put_Line("hello");
         end select;
   end Play_Loop;


end Sequencer;
