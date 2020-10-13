with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   package Num_F is new Ada.Numerics.Generic_Elementary_Functions
     (Float_Type => Float);

   function Is_Prime (N : Natural) return Boolean with
      Inline,
      Pre  => N > 1,
      Post =>
      (if Is_Prime'Result = True then (for all I in 2 .. N - 1 => N rem I > 0))
   is
   begin
      return
        (for all I in 2 .. Natural (Num_F.Sqrt (Float (N))) => N rem I > 0);
   end Is_Prime;

   Max_Number    : Natural           := 2_000_000;
   Sum_Of_Primes : Long_Long_Integer := 0;
begin
   for I in 2 .. Max_Number loop
      if Is_Prime (I) then
         Sum_Of_Primes := Sum_Of_Primes + Long_Long_Integer (I);
      end if;
   end loop;
   Put_Line (Sum_Of_Primes'Image);
end Main;
