with Ada.Text_IO, Keyboard_Mappings, Pattern, Step, Debug_Printer;
use Ada.Text_IO, Keyboard_Mappings, Pattern, Step, Debug_Printer;

package body Sequencer is

   Protected Play_Control Is
      Entry Wait_Till_Played;
      Procedure Set_Is_Playing (Playing : Boolean);
      Function Get_Is_Playing Return Boolean;
   Private
      Is_Playing : Boolean := False;
      Is_Paused  : Boolean := True;
   End Play_Control;

   protected body Play_Control is separate;

   procedure start is
   begin
      Play_Control.Set_Is_Playing(true);
   end start;

   procedure stop is
   begin
      Play_Control.Set_Is_Playing(false);
   end stop;

   function Is_Playing return Boolean is
   begin
      return Play_Control.Get_Is_Playing;
   end;


   procedure Switch_Pattern(Pattern: Character) is
   Begin
      Null;
   end Switch_Pattern;

   procedure Update_Pattern(Instrument : Character) is
   begin
      null;
   end Update_Pattern;


   Active_Pattern : Pattern_Type := Pattern.Get_Basic_Beat;

   Task Play_Loop;

   task body Play_Loop is

   begin
      loop

         Play_Control.Wait_Till_Played;

         Inner_Loop: Loop

            Active_Pattern.Increment_Active_Step;

            if Print_Debug_Output then
               Debug_Printer.Print_Sequencer(Play_Control.Get_Is_Playing, Active_Pattern);
            end if;


            delay Standard.Duration(1);

            if not Play_Control.Get_Is_Playing Then
               exit Inner_Loop;
            end if;

         end loop Inner_Loop;
      end loop;
   end Play_Loop;


end Sequencer;
