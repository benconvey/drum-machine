package body Input_Note

task body Check_Inputs is
   Pad_Controller : Pad_Interrupt;
   Pad_Id         : Integer;
   Velocity       : Interger;
   Pattern        : Pattern.Instace;
begin
   loop

      Pad_Controller.Pad_Pressed(Pad_Id, Velocity, Time);
        -- store the pressed note into the sequence
        Pattern.AddNote(Pad_Id, Velocity);
      requeue Pad_Controller.Pad_Pressed(Pad_Id)
   end loop;
end Input_Note;
