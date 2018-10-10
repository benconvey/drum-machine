--with Sequencer;
--with Input_Controller;
--with Keyboard_Mappings;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Button_Pressed : Character;
begin

   loop
      Ada.Text_IO.Get(Button_Pressed);
--      case Button_Pressed is
  --       when Play_Button => Input_Controller.Play_Button.Press;
    --     when Stop_Button => Input_Controller.Stop_Button.Press;

     -- end case;

   end loop;
end Main;
