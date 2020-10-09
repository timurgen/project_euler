with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

   Up_To : constant Natural := 1000;
   Sum   : Integer          := 0;
begin
   for I in Natural'First .. Up_To - 1 loop
      if I mod 3 = 0 or I mod 5 = 0 then
         Sum := Sum + I;
      end if;

   end loop;
   Put_Line (Sum'Img);
end Main;
