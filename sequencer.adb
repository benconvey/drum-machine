with Ada.Text_IO; use Ada.Text_IO;

package body Sequencer is

   protected Play_Control is
      entry Wait_Till_Played;
      entry Continue_Till_Stopped;
      procedure Set_Is_Playing(Playing: Boolean);
      private
      Is_Playing : Boolean := false;
   end Play_Control;

   protected body Play_Control is

      entry Wait_Till_Played when Is_Playing is
      begin
         Is_Playing := true;
      end Wait_Till_Played;

      entry  Continue_Till_Stopped when Is_Playing is
      begin
         Is_Playing := false;
         requeue Wait_Till_Played;
      end Continue_Till_Stopped;

      procedure Set_Is_Playing(Playing : Boolean) is
      begin
         Is_Playing := Playing;
      end Set_Is_Playing;

   end Play_Control;

   procedure start is
      begin
      Play_Control.Set_Is_Playing(true);
   end start;

   procedure stop is
      begin
      Play_Control.Set_Is_Playing(false);
   end stop;

   task Play_Loop;

   task body Play_Loop is
   begin
      Put_Line("Sequencer intialised");
      Play_Control.Wait_Till_Played;
      loop
         select
            Play_Control.Continue_Till_Stopped;
         else
            loop
               Put_Line("In the loop");
            end loop;

         end select;

      end loop;
   end Play_Loop;


end Sequencer;
