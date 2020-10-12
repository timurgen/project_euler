with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
   Needed_Sum_Of_ABC : constant Natural := 1000;

   function Is_Compliant
     (A : Natural;
      B : Natural;
      C : Natural) return Boolean with
      Inline,
      Post => (if Is_Compliant'Result = True then A**2 + B**2 = C**2) is
   begin
      return (A + B + C) = Needed_Sum_Of_ABC;
   end Is_Compliant;
   A, B, C, M, N : Natural;
   Result        : Long_Integer;
begin
   M := 3;
   loop
      N := 2;
      loop

         A := M**2 - N**2;
         B := 2 * M * N;
         C := M**2 + N**2;

         N := N + 1;
         exit when Is_Compliant (A => A, B => B, C => C)
           or else A + B + C > 1000
           or else N >= M;
      end loop;
      exit when Is_Compliant (A => A, B => B, C => C) or else M > 1000;
      M := M + 1;
   end loop;
   Result := Long_Integer (A * B * C);
   Put_Line
     (M'Image &
      " " &
      N'Image &
      " (" &
      A'Image &
      " " &
      B'Image &
      " " &
      C'Image &
      ") = " &
      Result'Image);

end Main;
