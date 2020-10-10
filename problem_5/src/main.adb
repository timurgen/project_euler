with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Start_Number : Long_Integer := 2520;

   function Is_EvenlyDivisibleBy1To20 (N : Long_Integer) return Boolean is
      Numbers : constant array (1 .. 20) of Long_Integer :=
        (1,
         2,
         3,
         4,
         5,
         6,
         7,
         8,
         9,
         10,
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20);
   begin
      return (for all I of Numbers => N rem I = 0);
   end Is_EvenlyDivisibleBy1To20;
begin
   loop
      exit when Is_EvenlyDivisibleBy1To20 (Start_Number);
      Start_Number := Start_Number + 10;
   end loop;
   Put_Line (Start_Number'Image);
end Main;
