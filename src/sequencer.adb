with Ada.Text_IO, Keyboard_Mappings, Pattern, Step, Debug_Printer;
use Ada.Text_IO, Keyboard_Mappings, Pattern, Step, Debug_Printer;
with Ada.Exceptions; Use Ada.Exceptions;

package body Sequencer is

   Patterns : array (1 .. 8) of aliased Pattern_Type := (1 => Pattern.Get_Basic_Beat, others => <>);

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

   Protected Pattern_Control Is
      Function Get_Active_Pattern Return Pattern_Access_Type;
      Procedure Set_Active_Pattern (Pattern : Pattern_Access_Type);
   Private
      Active_Pattern : Pattern_Access_Type;
   End Pattern_Control;

   protected body Pattern_Control is separate;

   Procedure Switch_Pattern (Pattern_Button : Character) Is
      Character_Index : Integer;
   Begin
      Character_Index := Character'Pos(Pattern_Button);
      Pattern_Control.Set_Active_Pattern(Patterns(Character_Index - 48)'access);
   end Switch_Pattern;

   procedure Update_Pattern(Instrument : Character) is
   begin
      null;
   end Update_Pattern;

   function Get_Active_Pattern_Number return Character is
      found_at_index : integer;
   begin
      for index in Patterns'Range loop
         if Patterns(index)'access = Pattern_Control.Get_Active_Pattern then
            found_at_index := index;
         end if;
      end loop;
      return Character'Val(Found_At_Index + 48);
   end Get_Active_Pattern_Number;



   task body Play_Loop is
   begin

      Pattern_Control.Set_Active_Pattern(Patterns(1)'Access);

      Loop

         Play_Control.Wait_Till_Played;

         Inner_Loop: Loop

            Pattern_Control.Get_Active_Pattern.Increment_Active_Step;

            if Print_Debug_Output then

               Debug_Printer.Print_Sequencer
                 (Play_Control.Get_Is_Playing,
                  Pattern_Control.Get_Active_Pattern,
                  Get_Active_Pattern_Number);
            end if;

            delay Standard.Duration(1);

            if not Play_Control.Get_Is_Playing Then
               exit Inner_Loop;
            end if;

         end loop Inner_Loop;
      end loop;
   exception
      when Error : others =>
         Put_Line ("An exception has occured");
         Put_Line (Exception_Name (Error));
         Put (Exception_Message (Error));

   end Play_Loop;


end Sequencer;
