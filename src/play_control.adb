with Ada.Text_IO, State;

package body Play_Control is 

   protected body Agent is
    
      Entry Wait_Till_Played When Is_Playing Is
      Begin
         Null;
      End Wait_Till_Played;
   
      Procedure Set_Is_Playing  Is
      Begin
         Is_Playing := True;
         State.Agent.Set_Has_Changed;
      end Set_Is_Playing;
      
      procedure Set_Is_Not_Playing is
      begin
         Is_Playing := False;
         State.Agent.Set_Has_Changed;         
      end Set_Is_Not_Playing;      
   
      Function Get_Is_Playing Return Boolean Is
      Begin
         Return Is_Playing;
      End Get_Is_Playing;
    
    End Agent;

end Play_Control;

   
