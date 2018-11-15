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

   function Is_Playing return Boolean is
   begin
      return Play_Control.Get_Is_Playing;
   end;


   procedure Switch_Pattern(Pattern: Character) is
   begin
      null;
   end Switch_Pattern;

   procedure Update_Pattern(Instrument : Character) is
   begin
      null;
   end Update_Pattern;

   procedure Debug_Print(Current_Pattern:Pattern_Type) is
   begin
      Put(ASCII.ESC & "[H");
      Put_Line("Active Step: " & Pattern.Active_Step'Image);
      Put_Line("Playing: " & (if Is_Playing then "Playing" else "Paused"));
      for index in 1..Pattern.Number_Of_Instruments loop
         Put_Line(Build_Instrument_Debug_Line(index));
      end loop;
   end;

   function Build_Instrument_Debug_Line(Instrument_Index : in Integer) return String is
      Instrument_Line :  Step_Row_Type;
      Result : String(1..32);
   begin
      -- Get a line of steps
      Instrument_Line := This.Steps(Instrument_Index);


      for Index in Instrument_Line'Range loop

         Result(Instrument_Index) :=  (if Instrument_Line(Index).Active then Instrument_Line(Index).Instrument else '.');

      end loop;

      return Result;

   end Build_Instrument_Debug_Line;



   Active_Pattern : Pattern_Type := Pattern.Get_Basic_Beat;

   task Play_Loop;

   task body Play_Loop is
   begin

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
