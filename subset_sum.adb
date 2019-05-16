-- Subsetsum Problem implementation in Ada
-- the SSS problem aims to determine if any subset
-- of a set of numbers can sum to a specified number
-- for example, the set {2, 8, 4} and sum {3}
-- are incompatible: there is no combination of
-- set elements that will equal 3. But consider 10:
-- 2 + 8 = 10, so there is a subset sum. Likewise 14:
-- 2 + 8 + 4 = 14. Et cetera

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_line; use Ada.Command_Line;

procedure Subset_Sum is
    -- a set of numbers to find subset sum on
    type Set is array(0..4) of Integer;
    Arr : Set;

    -- find if subset sum exists in a set
    -- @param Arr - the set to check
    -- @param S - the sum to check against Arr
    -- @param N - for iteration; equals Arr.length
    -- @returns - truth value on whether subset sum exists
    function Find_Subset (Arr : in Set; S, N : in Integer) return Boolean is
    begin
        -- a sum of zero is always possible
        if S = 0 then
            return True;
        -- base case, if surpassed all elements of Set
        elsif N = 0 then
            return False;
        end if;
        -- if last is bigger than sum, ignore and go deeper
        if (Arr(N-1)) > S then
            return Find_Subset(Arr, S, N-1);
        end if;
        -- check including the last
        -- and excluding the last
        return Find_Subset(Arr, S, N-1) 
            or else Find_Subset(Arr, S-Arr(N-1), N-1);
    end Find_Subset;
    
    -- verifies arguments are correct before continuing
    -- @returns - truth value on whether args valid
    function Verify_Args return Boolean is
    begin
        -- only six arguments allowed
        -- one for sum, five for set
        if Argument_Count /= 6 then
            -- instruct user how to use args
            Put("Invalid arguments."); New_Line;
            Put("Use arguments '<arg1> <args2>'."); New_Line;
            Put("<arg1> is the sum to find, <args2> is space delimited list of 5 numbers.");
            return False;
        end if;
        return True;
    end Verify_Args;
    
begin
    -- if valid arguments
    if Verify_Args then
        Put("{");
        -- populate Arr with arguments
        for i in 0..4 loop
            Arr(i) := Integer'value(Argument(i+2));
            Put(Integer'Image(Arr(i)));
            if i /= 4 then
                Put(", ");
            end if;
        end loop;
        Put("} ");
        -- determine if a subset sum exists
        if Find_Subset(Arr, Integer'Value(Argument(1)), Arr'Length) = False then
            Put("does not contain subset sum " & Argument(1));
        else
            Put("contains subset sum " & Argument(1));
        end if;
    end if;    
end Subset_Sum;
