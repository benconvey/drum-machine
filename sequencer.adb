with Ada.Text_IO; use Ada.Text_IO;

package body Sequencer is

   protected Play_Control is
      entry Wait_Till_Played;
      procedure Set_Is_Playing(Playing: Boolean);
      function Get_Is_Playing return Boolean;
   private
      Is_Playing : Boolean := false;
   end Play_Control;

   protected body Play_Control is

      entry Wait_Till_Played when Is_Playing is
      begin

      end Wait_Till_Played;

      procedure Set_Is_Playing(Playing : Boolean) is
      begin
         Is_Playing := Playing;
      end Set_Is_Playing;

      function Get_Is_Playing return boolean is
      begin
         return Is_PLaying;
      end Get_Is_Playing;

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


      loop
         if Play_Control.Get_Is_Playing then
            loop
               exit when not Play_Control.Get_Is_Playing;
               delay Standard.Duration(1);
               Put_Line("In the loop");
            end loop;
         else
            Play_Control.Wait_Till_Played;
         end if;
      end loop;
   end Play_Loop;


end Sequencer;
