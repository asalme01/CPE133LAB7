----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2018 04:05:15 PM
-- Design Name: 
-- Module Name: mux1B - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux1B is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           s : in STD_LOGIC;
           res : out STD_LOGIC);
end mux1B;

architecture Behavioral of mux1B is

begin
    res <= A when (s = '1') else
           B when (s = '0');

end Behavioral;
