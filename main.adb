with Sequencer; use Sequencer;
with Keyboard_Mappings; use Keyboard_Mappings;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Button_Pressed : Character;
begin

   loop
      Ada.Text_IO.Get(Button_Pressed);

      case Button_Pressed is
         when Play_Button =>
         when Stop_Button => exit;
         when others => null;
      end case;

   end loop;
end Main;
