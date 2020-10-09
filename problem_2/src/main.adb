-- https://projecteuler.net/problem=2
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Term_1    : Integer := 1;
   Term_2    : Integer := 2;
   Next_Term : Integer;

   Max_Terms         : Natural := 4_000_000;
   Sum_Of_Even_Terms : Integer := Term_2;
begin
   loop
      Next_Term := Term_1 + Term_2;
      Term_1    := Term_2;
      Term_2    := Next_Term;

      if Next_Term mod 2 = 0 then
         Sum_Of_Even_Terms := Sum_Of_Even_Terms + Next_Term;
      end if;
      exit when Next_Term >= Max_Terms;
   end loop;
   Put_Line (Sum_Of_Even_Terms'Img);
end Main;
