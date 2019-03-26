with Ada.Text_IO, Keyboard_Mappings, Pattern, Step, Debug_Printer, Play_Control, Pattern_Control, State;
use Ada.Text_IO, Keyboard_Mappings, Pattern, Step, Debug_Printer;
with Ada.Exceptions; Use Ada.Exceptions;

package body Sequencer is

   task body Play_Loop is
      Active_Pattern_Access :  Pattern.Pattern_Access_Type := Pattern_Control.Agent.Get_Active_Pattern;
      Active_Pattern         : aliased Pattern.Pattern_Type;
      Period : Float;
   begin
      Loop
         Play_Control.Agent.Wait_Till_Played;
         Inner_Loop : loop

            Active_Pattern := Active_Pattern_Access.all;
            Period := 60.0 / Float (Active_Pattern.Get_Tempo);

            delay Standard.Duration(Period);

            Pattern_Control.Agent.Increment_Active_Step;

            Ada.Text_IO.Put_Line("Active Step = " & Active_Pattern.Get_Active_Step'Image);

            if not Play_Control.Agent.Get_Is_Playing then
               exit Inner_Loop;
            end if;
         end loop Inner_Loop;
      end loop;

   end Play_Loop;


end Sequencer;
