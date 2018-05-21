----------------------------------------------------------------------------------
-- Engineer: Alberto Salmeron
-- Create Date: 05/20/2018 04:45:01 PM
-- Description: Checks the bits to see if they're all activated.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity chkBits is
    Port ( b1, b2, b3 : in STD_LOGIC;
           res : out STD_LOGIC);
end chkBits;

architecture Behavioral of chkBits is

begin
    chk: process (b1, b2, b3)
    begin
        if (b1 = '1' AND b2 = '1' AND b3 = '1') then
            res <= '1';
        else res <= '0';
        end if;
    end process;
end Behavioral;
