with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;
procedure Main is

   Max_Multiplier : constant Long_Integer := 999;
   Multiplier_1: Long_Integer := 0;
   Multiplier_2: Long_Integer := 0;
   Product: Long_Integer;
   Largest_Found : Long_Integer := 0;

   function Reverse_String (Item : String) return String is
      Result : String (Item'Range);
   begin
      for I in Item'range loop
         Result (Result'Last - I + Item'First) := Item (I);
      end loop;
      return Result;
   end Reverse_String;

   function Is_Palindrome (N: Long_Integer) return Boolean is
      Image : String := Ada.Strings.Fixed.Trim(Long_Integer'Image(N),Side => Ada.Strings.Both);
      Reversed_Image : String := Reverse_String(Image);
   begin
      return Image = Reversed_Image;
   end Is_Palindrome;

begin
   loop
      Multiplier_2 := 0;

      loop
         Product := Multiplier_1 * Multiplier_2;

         if Is_Palindrome(Product) and then Product > Largest_Found then
            Largest_Found := Product;
         end if;

         Multiplier_2 := Multiplier_2 + 1;
         exit when Multiplier_2 > Max_Multiplier;
      end loop;

      Multiplier_1 := Multiplier_1 + 1;
      exit when Multiplier_1 > Max_Multiplier;
   end loop;
   Put_Line(Largest_Found'Image);
end Main;
