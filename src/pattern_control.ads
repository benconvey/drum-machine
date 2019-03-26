with Pattern;

package Pattern_Control is

   type Pattern_Array_Type is array (1 .. 8) of aliased Pattern.Pattern_Type;

   protected Agent is

      function Get_Active_Pattern return Pattern.Pattern_Access_Type;
      function Get_Active_Pattern_Number return Integer;
      procedure Change_Pattern (Number : Integer );
      procedure Increment_Active_Step;
      procedure Increase_Tempo;
      procedure Decrease_Tempo;
   private
      Patterns : Pattern_Array_Type := (1 => Pattern.Get_Basic_Beat, others => <>);
      Active_Pattern_Number   : Integer := 1;
   end Agent;

end Pattern_Control;
