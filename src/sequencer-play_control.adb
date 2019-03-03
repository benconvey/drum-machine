Separate (Sequencer) 
   
Protected Body Play_Control Is

   Entry Wait_Till_Played When Is_Playing Is
   Begin
      Null;
   End Wait_Till_Played;

   Procedure Set_Is_Playing (Playing : Boolean) Is
   Begin
      Is_Playing := Playing;
   End Set_Is_Playing;

   Function Get_Is_Playing Return Boolean Is
   Begin
      Return Is_Playing;
   End Get_Is_Playing;

End Play_Control;
