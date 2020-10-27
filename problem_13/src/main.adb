with Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;     use Ada.Strings.Fixed;

procedure Main is
   use Ada;

   type Numbers_Arr_T is array (1 .. 100) of String (1 .. 50);

   Input_File    : Text_IO.File_Type;
   Numbers_Arr   : Numbers_Arr_T;
   Counter       : Positive         := Numbers_Arr'First;
   Result_String : Unbounded_String := To_Unbounded_String ("");
   Reminder      : Integer          := 0;

begin
   Text_IO.Open
     (File => Input_File, Mode => Text_IO.In_File, Name => "input.txt");
   loop
      exit when Text_IO.End_Of_File (Input_File);
      Numbers_Arr (Counter) := Text_IO.Get_Line (Input_File);
      Counter               := Counter + 1;
   end loop;
   Text_IO.Close (Input_File);

   for I in reverse 1 .. 50 loop
      declare
         Column_Sum : Integer := 0;
         Result     : Integer;

      begin
         for J in Numbers_Arr'Range loop
            Column_Sum :=
              Column_Sum + Integer'Value (Numbers_Arr (J) (I) & "");
         end loop;
         Column_Sum := Column_Sum + Reminder;
         Result     := Column_Sum rem 10;
         Reminder   := Column_Sum / 10;

         Result_String :=
           To_Unbounded_String (Trim (Result'Image, Ada.Strings.Both)) &
           Result_String;

         if I = 1 then
            Result_String :=
              To_Unbounded_String (Reminder'Image) & Result_String;
         end if;
      end;

   end loop;
   Ada.Text_IO.Put_Line (To_String (Result_String) (1 .. 11));
end Main;
