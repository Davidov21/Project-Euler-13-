with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;


procedure Main is

   NumFile : File_Type;
   Num_List : constant String :="Number File.txt";
   Sum, new_row : Big_Integer;
   type Num_Type is array (1..50 , 1..100) of Big_Integer;
   Num_array : Num_Type;
   str : String(1..50);

begin
   Sum := 0;
   --text into an array
   Open(NumFile, In_File, Num_List);
   for row in 1..100 loop
      for char in 1..50 loop
         if not End_Of_File(NumFile) then
            Get(File => NumFile, Item => str(char));
         end if;
      end loop;
      new_row := From_String(str);
      Sum := Sum + new_row;
   end loop;
   Close(NumFile);
   Put_Line(To_String(Sum));
end Main;
