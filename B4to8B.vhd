----------------------------------------------------------------------------------
-- Engineer: Alberto Salmeron
-- Create Date: 05/21/2018 11:32:21 AM
-- Description: Converts 4bit number to 8 bit
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity B4to8B is
    Port ( B4 : in STD_LOGIC_VECTOR (3 downto 0);
           B8 : out STD_LOGIC_VECTOR (7 downto 0));
end B4to8B;

architecture Behavioral of B4to8B is

begin
    B8(0) <= B4(0);
    B8(1) <= B4(1);
    B8(2) <= B4(2);
    B8(3) <= B4(3);
    B8(4) <= '0';
    B8(5) <= '0';
    B8(6) <= '0';
    B8(7) <= '0';

end Behavioral;
