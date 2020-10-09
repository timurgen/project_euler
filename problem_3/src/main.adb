with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;

procedure Main is
   package N_M_func is new Ada.Numerics.Generic_Elementary_Functions(Float_Type => Float);
   N: Long_Long_Integer := 600_851_475_143;
   Divider : Long_Long_Integer := Long_Long_Integer(N_M_func.Sqrt(Float(N)));

   function Is_Prime(N: Long_Long_Integer) return Boolean is
   begin
      Put("Checking " & N'Image);
      for I in 2..Long_Long_Integer(N_M_func.Sqrt(Float(N))) loop
         if N mod I = 0 then
            Put_Line(" not prime");
            return False;
         end if;
      end loop;
      return True;
   end Is_Prime;

begin
   loop
      exit when Divider = 0;
      if N mod Divider = 0 and then Is_Prime(Divider) then
         Put(Divider'Image & " <- here it is");
         exit;
      end if;
      Divider := Divider - 1;
   end loop;
end Main;
