with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
   Current_Natural_Number  : Long_Long_Integer := 0;
   Current_Triangle_Number : Long_Long_Integer := 0;
   Dividers: Natural := 0;

   function Count_Dividers (N : Long_Long_Integer) return Natural is
      Dividers : Natural := 1;
   begin
      --Put("Checking triangle number " & N'Image);
      for I in reverse 1 .. (N/2) loop
         if N rem I = 0 then
            Dividers := Dividers + 1;
         end if;
      end loop;
      --Put_Line(" that has " & Dividers'Image & " dividers");
      return Dividers;
   end Count_Dividers;
begin
   loop
      Current_Natural_Number := Current_Natural_Number + 1;
      Current_Triangle_Number := Current_Triangle_Number + Current_Natural_Number;
      Dividers := Count_Dividers(N => Current_Triangle_Number);


      exit when Dividers > 500;
   end loop;
   Put_Line(Current_Triangle_Number'Image & " " & Dividers'Image);
end Main;
