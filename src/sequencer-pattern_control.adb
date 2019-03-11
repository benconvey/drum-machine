Separate (Sequencer)

Protected Body Pattern_Control Is

   Function Get_Active_Pattern Return Pattern_Access_Type Is
   Begin
      Return Active_Pattern;
   End Get_Active_Pattern;

   Procedure Set_Active_Pattern (Pattern :  Pattern_Access_Type ) Is
   Begin
      Active_Pattern := Pattern;
   End Set_Active_PAttern;

End Pattern_Control;
