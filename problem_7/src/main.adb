with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   package Num_F is new Ada.Numerics.Generic_Elementary_Functions(Float_Type => Long_Long_Float);

   function Is_Prime (N : Long_Long_Integer) return Boolean with
     Inline,
     Pre  => N > 1,
     Post =>
       (if Is_Prime'Result = True then (for all I in 2 .. N - 1 => N rem I > 0))
   is
   begin
      return (for all I in 2..Long_Long_Integer(Num_F.Sqrt(Long_Long_Float(N))) => N rem I > 0);
   end Is_Prime;

   Nth_Prime: Natural := 10001;
   Current_Prime: Natural := 1;
   Counter : Long_Long_Integer := 2;
begin
   loop
      exit when Current_Prime = Nth_Prime;
      Counter := Counter + 1;
      if Is_Prime(Counter) then
         Current_Prime := Current_Prime + 1;
      end if;

   end loop;

   Put_Line(Counter'Image);
end Main;
