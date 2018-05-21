-----------------------------------------------------------------------------
-- Engineer: Alberto Salmeron
-- Create Date: 05/20/2018 03:34:40 PM
-- Description: T Flip Flop
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TFF is
    Port ( T, EN, CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end TFF;

architecture Behavioral of TFF is
    signal s1 : std_logic;
begin
    tff: process (T, EN, CLK)
        begin
            if (EN = '0') then
                s1 <= '0';
            elsif (rising_edge(CLK)) then
                if (EN = '1') then
                    s1 <= T xor s1;
                end if;
            end if;
    end process tff;
    Q <= s1;
end Behavioral;
