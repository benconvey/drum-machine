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

      Procedure Change_Pattern (Number : Integer ) Is
      Begin
         Active_Pattern_Number := Number;
         Patterns(Active_Pattern_Number).Set_Active_Step(Pattern.Active_Step_Type(0));
         State.Agent.Set_Has_Changed;
      end Change_Pattern;

      procedure Increment_Active_Step is
         Active_Pattern : access Pattern.Pattern_Type := Patterns(Active_Pattern_Number)'Access;
      begin
         Active_Pattern.Increment_Active_Step;
         State.Agent.Set_Has_Changed;
      end Increment_Active_Step;

   end Agent;


End Pattern_Control;
