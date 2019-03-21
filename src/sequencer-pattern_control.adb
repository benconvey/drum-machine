Separate (Sequencer)

Protected Body Pattern_Control Is

   Function Get_Active_Pattern Return Pattern_Access_Type Is
   begin
      if Active_Pattern.A then

      end if;

      Return Active_Pattern;
   End Get_Active_Pattern;

   function Get_Active_Pattern_Number return Integer is
   begin
      return Pattern_Number;
   end;

   Procedure Set_Active_Pattern (Pattern :  Pattern_Access_Type; Number : Integer ) Is
   Begin
      Active_Pattern := Pattern;
      Pattern_Number := Number;
   End Set_Active_PAttern;

End Pattern_Control;
