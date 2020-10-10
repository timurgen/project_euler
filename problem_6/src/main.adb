with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Sum_Of_Squares : Long_Long_Integer := 0;
   Square_Of_Sum  : Long_Long_Integer := 0;
   Result         : Long_Long_Integer := 0;

   Up_To : Long_Long_Integer := 100;
begin
   for I in 1 .. Up_To loop
      Sum_Of_Squares := Sum_Of_Squares + I**2;
      Square_Of_Sum  := Square_Of_Sum + I;
   end loop;

   Square_Of_Sum := Square_Of_Sum**2;
   Result        := Square_Of_Sum - Sum_Of_Squares;

   Put_Line (Result'Image);
end Main;
