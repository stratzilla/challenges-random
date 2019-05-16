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

procedure Main is

    -- a set of numbers to find subset sum on
    type Set is array(0..4) of Integer;
    Arr : Set;
    -- boolean values used later for recursion
    A, B : Boolean;
    
    -- find if subset sum exists in a set
    -- @param Arr - the set to check
    -- @param S - the sum to check against Arr
    -- @param N - for iteration; equals Arr.length
    -- @returns - truth value on whether subset sum exists
    function SubsetSum (Arr : Set; S, N : Integer) return Boolean is
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
            return SubsetSum(Arr, S, N-1);
        end if;
        -- check including the last
        A := SubsetSum(Arr, S, N-1);
        -- and excluding the last
        B := SubsetSum(Arr, S-Arr(N-1), N-1);
        return A or B;
    end SubsetSum;
    
    -- verifies arguments are correct before
    -- continuing
    -- @returns - truth value on whether args valid
    function VerifyArgs return Boolean is
    begin
        -- only six arguments allowed
        -- one for sum, five for set
        if Argument_Count /= 6 then
            -- instruct user how to use args
            Put("Invalid arguments.");
            New_Line;
            Put("Use arguments 's a..e'.");
            New_Line;
            Put("s = sum to check, a..e = the five elements of the set.");
            New_Line;
            Put("For example, '12 5 2 6 3 4':");
            Put("Will check for subset sum of 12 in {5, 2, 6, 3, 4}");
            return False;
        end if;
        return True;
    end VerifyArgs;
    
begin
    -- if valid arguments
    if VerifyArgs = True then
        Put("Checking {");
        -- populate Arr with arguments
        for i in 0..4 loop
            Arr(i) := Integer'value(Argument(i+2));
            Put(Integer'Image(Arr(i)));
            if i /= Argument_Count then
                Put(", ");
            end if;
        end loop;
        Put("} for Subset Sum of " & Argument(1));
        New_Line;
        -- determine if a subset sum exists
        if SubsetSum(Arr, Integer'Value(Argument(1)), Arr'Length) = False then
            Put("There is no subset sum.");
        else
            Put("There is a subset sum.");
        end if;
    end if;
    
end Main;
