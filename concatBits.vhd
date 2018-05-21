----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date: 05/20/2018 06:12:05 PM
-- Description: 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity concatBits is
    Port ( b3, b2, b1, b0 : in STD_LOGIC;
           b : out STD_LOGIC_VECTOR (3 downto 0));
end concatBits;

architecture Behavioral of concatBits is

begin
    b(3) <= b3;
    b(2) <= b2;
    b(1) <= b1;
    b(0) <= b0;

end Behavioral;
