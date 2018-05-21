----------------------------------------------------------------------------------
-- Engineer: Alberto Salmeron
-- Create Date: 05/20/2018 04:32:46 PM 
-- Description: This module counts from 0-15(4 bits)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter4B is
    Port ( EN, CLK : in STD_LOGIC;
           B : out STD_LOGIC_VECTOR (3 downto 0));
end counter4B;

architecture Behavioral of counter4B is

    component TFF is
        Port ( T, EN, CLK : in STD_LOGIC;
                        Q : out STD_LOGIC);
    end component;
    
    component chkBits is
        Port ( b1, b2, b3 : in STD_LOGIC;
               res : out STD_LOGIC);
    end component;
    
    component mux1B is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               s : in STD_LOGIC;
               res : out STD_LOGIC);
    end component;
    
    component concatBits is
        Port ( b3, b2, b1, b0 : in STD_LOGIC;
               b : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal b0, b1, b2, b3, s1, s2, s3, sclk, nclk : std_logic;
begin
    mux1: mux1B port map(A => CLK,
                         B => '0',
                         s => EN,
                         res => nclk);
                         
    t0: TFF port map(T => '1',
                     EN => '1',
                     CLK => nclk,
                     Q => b0);
                     
    c1: chkBits port map(b1 => '1',
                         b2 => '1',
                         b3 => b0,
                         res => s1);
                         
    t1: TFF port map(T => s1,
                     EN => '1',
                     CLK => nclk,
                     Q => b1);
                     
    c2: chkBits port map(b1 => '1',
                         b2 => b1,
                         b3 => b0,
                         res => s2);
                         
    t2: TFF port map(T => s2,
                     EN => '1',
                     CLK => nclk,
                     Q => b2);
                     
    c3: chkBits port map(b1 => b2,
                         b2 => b1,
                         b3 => b0,
                         res => s3);
                         
    t3: TFF port map(T => s3,
                     EN => '1',
                     CLK => nclk,
                     Q => b3);
                     
    cct: concatBits port map(b3 => b3,
                             b2 => b2,
                             b1 => b1,
                             b0 => b0,
                             b => B);
end Behavioral;
