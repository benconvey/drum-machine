with Ada.Text_IO, Keyboard_Mappings, Pattern, Step;
use Ada.Text_IO, Keyboard_Mappings, Pattern, Step;

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

   end Play_Control;

   procedure start is
   begin
      Play_Control.Set_Is_Playing(true);
   end start;

   procedure stop is
   begin
      Play_Control.Set_Is_Playing(false);
   end stop;



   procedure Switch_Pattern(Pattern: Character) is
   begin
      null;
   end Switch_Pattern;

   procedure Update_Pattern(Instrument : Character) is
   begin
      null;
   end Update_Pattern;

   Active_Pattern : Pattern_Type := Pattern.Get_Basic_Beat;

   task Play_Loop;

   task body Play_Loop is
   begin
      Put_Line("Sequencer intialised");

      loop

         Play_Control.Wait_Till_Played;

         Inner_Loop: loop

            Active_Pattern.Debug_Print;

            Active_Pattern.Increment_Active_Step;

            delay Standard.Duration(1);

            if not Play_Control.Get_Is_Playing then
               exit Inner_Loop;
            end if;


         end loop Inner_Loop;
      end loop;
   end Play_Loop;

end Sequencer;
