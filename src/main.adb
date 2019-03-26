with Play_Control, Pattern_Control, Ada.Text_IO, Sequencer;

procedure Main is
   Input : Character;
   Key_Pressed : Boolean := false;

   function Get_Pattern_Number_For_Character (Input_Character : Character) return Integer is
   begin
      return Character'Pos(Input_Character) - 48;
   end Get_Pattern_Number_For_Character;

begin
   loop
      Ada.Text_Io.Get_Immediate (Input, Key_Pressed);
      if Key_Pressed then
         case Input is
            when ' '          => Play_Control.Agent.Set_Is_Playing;
            when 'v'          => Play_Control.Agent.Set_Is_Not_Playing;
            when '1' .. '8'   => Pattern_Control.Agent.Change_Pattern ( Get_Pattern_Number_For_Character ( Input ) );
            when '+'          => Pattern_Control.Agent.Increase_Tempo;
            when '-'          => Pattern_Control.Agent.Decrease_Tempo;
            when others       => Ada.Text_Io.Put_Line ("Uknown character bro");
         end case;
      end if;
   end loop;
end Main;



