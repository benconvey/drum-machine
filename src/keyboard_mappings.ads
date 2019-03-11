package Keyboard_Mappings is
   Stop_Button : constant Character := 'v';     -- the 'v' key
   Play_Button : constant Character := ' ';   -- whatever value the space bar sends
   Kick_Drum   : constant Character := 'k';
   Snare_Drum  : constant Character := 's';
   Open_Hat    : constant Character := 'o';
   Closed_Hat  : constant Character := 'c';
   Pattern_1   : constant Character := '1';
   Pattern_2   : constant Character := '2';
   Pattern_3   : constant Character := '3';
   Pattern_4   : constant Character := '4';
   Pattern_5   : constant Character := '5';
   Pattern_6   : constant Character := '6';
   Pattern_7   : constant Character := '7';
   Pattern_8   : constant Character := '8';

   Pattern_Button_Character_Lookup_Table : array (1 .. 8) of Character
     := (Pattern_1, Pattern_2, Pattern_3, Pattern_4, Pattern_5, Pattern_6, Pattern_7, Pattern_8);
end Keyboard_Mappings;
