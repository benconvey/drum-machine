with Ada.Text_IO; use Ada.Text_IO;
with Sequencer; use Sequencer;
with Keyboard_Mappings; use Keyboard_Mappings;

procedure Main is
   Button_Pressed : Character;
begin

   loop
      Put_Line("waiting for input");
      Ada.Text_IO.Get(Button_Pressed);

      Put_Line("starting");
      case Button_Pressed is
         when Play_Button => Sequencer.start;
         when Stop_Button => Sequencer.stop;
         when others => null;
      end case;

   end loop;
end Main;
