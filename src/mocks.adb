with Ada.Text_IO;

package body Mocks is

   task body Button_Press_Task_Type is
      Input : Character;
   begin
      loop
         Ada.Text_Io.Get (Input);
         if Input = Button then
            Call_Back.all;
         else
            Ada.Text_IO.Put_Line("I was expecting " & Button'Image & " but I received " & Input'Image);
         end if;
      end loop;

   end Button_Press_Task_Type;

end Mocks;
