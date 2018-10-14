with Ada.Text_IO; use Ada.Text_IO;
with Sequencer; use Sequencer;
with Keyboard_Mappings; use Keyboard_Mappings;

procedure Main is
   Button_Pressed : Character;

   task Main_task;

   task body Main_Task is
   begin
      loop
         Put_Line("waiting for input");
         Ada.Text_IO.Get(Button_Pressed);

         case Button_Pressed is
            when Play_Button => Sequencer.start;
            when Stop_Button => Sequencer.stop;
            when others => null;
         end case;
      end loop;
   end Main_Task;

begin
   null;

end Main;
