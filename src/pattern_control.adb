with State;

package body Pattern_Control is

   protected body Agent is

      function Get_Active_Pattern return Pattern.Pattern_Access_Type is
      begin
         return  Patterns(Active_Pattern_Number)'Access;
      End Get_Active_Pattern;

      function Get_Active_Pattern_Number return Integer is
      begin
         return Active_Pattern_Number;
      end;

      Procedure Set_Active_Pattern_Number (Number : Integer ) Is
      Begin
         Active_Pattern_Number := Number;
         State.Agent.Set_Has_Changed;
      end Set_Active_Pattern_Number;

      procedure Increment_Active_Step is
         Active_Pattern : access Pattern.Pattern_Type := Patterns(Active_Pattern_Number)'Access;
      begin
         Active_Pattern.Increment_Active_Step;
         State.Agent.Set_Has_Changed;
      end Increment_Active_Step;

   end Agent;


End Pattern_Control;
