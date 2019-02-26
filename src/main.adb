with Ada.Text_IO; use Ada.Text_IO;
with Sequencer; use Sequencer;
With Keyboard_Mappings;

procedure Main is

   package Keyboard renames Keyboard_Mappings;
   Button_Pressed : Character;

   task Main_task;

   task body Main_Task is
   begin
      loop
         Ada.Text_IO.Get(Button_Pressed);

         case Button_Pressed is
            when Keyboard.Play_Button => Sequencer.start;
            when Keyboard.Stop_Button => Sequencer.stop;
            when Keyboard.Pattern_1 .. Keyboard.Pattern_8 => Sequencer.Switch_Pattern(Button_Pressed);
            when Keyboard.Kick_Drum | Keyboard.Snare_Drum => Sequencer.Update_Pattern(Button_Pressed);
            when others => null;
         end case;
      end loop;
   end Main_Task;

begin
   null;

end Main;
