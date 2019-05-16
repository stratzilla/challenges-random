-- Subsetsum Problem implementation in Ada
-- the SSS problem aims to determine if any subset
-- of a set of numbers can sum to a specified number
-- for example, the set {2, 8, 4} and sum {3}
-- are incompatible: there is no combination of
-- set elements that will equal 3. But consider 10:
-- 2 + 8 = 10, so there is a subset sum. Likewise 14:
-- 2 + 8 + 4 = 14.

with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
    -- a set of numbers to find subset sum on
    type Set is array(1..5) of Integer;
    Arr : Set := (2, 8, 4, 9, 1);
    
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
        -- if surpassed all elements of Set
        elsif N = 1 then
            return False;
        end if;
        -- if it is still possible for a sum to exist
        if (Arr(N-1)) > S then
            return SubsetSum(Arr, S, N-1);
        end if;
        return (SubsetSum(Arr, S, N-1) or SubsetSum(Arr, S-Arr(N-1), N-1));
    end SubsetSum;
begin
    if SubsetSum(Arr, 11, Arr'Length) = False then
        Put("There is no subset sum.");
    else
        Put("There is a subset sum.");
    end if;
end Main;
