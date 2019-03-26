package Mocks is

   task type Button_Press_Task_Type
     (Button    : Character;
      Call_Back : access protected procedure);

end Mocks;
