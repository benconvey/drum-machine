with Input_Controller;
with Pattern;
with Ada.Interrupts.Names

package body Sequencer is

   Current_Pattern : Pattern.Pattern_Access_Type;


   Task Play is
   begin
      loop

         -- A protected entry
         Input_Controller.Play_Button.Was_Pressed;
         select
            Input_Controller.Stop_Button.Was_Pressed
              requeue
         then

         end select;


      end loop;
   end Play;

begin


end Sequencer;
