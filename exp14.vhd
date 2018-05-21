----------------------------------------------------------------------------------
-- Engineer: Alberto Salmeron
-- Create Date: 05/21/2018 11:10:09 AM
-- Description: This module takes the counter and converts it into values that can
-- be displayed on the board.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exp14 is
  Port (EN   : in std_logic;
        clk  : in std_logic;
        seg  : out std_logic_vector(7 downto 0);
        DISP : out std_logic_vector(3 downto 0));
end exp14;

architecture Behavioral of exp14 is

    component sseg_dec is
        Port ( ALU_VAL : in std_logic_vector(7 downto 0); 
			      SIGN : in std_logic;
			     VALID : in std_logic;
                   CLK : in std_logic;
               DISP_EN : out std_logic_vector(3 downto 0);
              SEGMENTS : out std_logic_vector(7 downto 0));
    end component;
    
    component clk_div2 is
        Port (  clk : in std_logic;
               sclk : out std_logic);
    end component;
    
    component counter4B is
        Port ( EN, CLK : in STD_LOGIC;
               B : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component B4to8B is
        Port ( B4 : in STD_LOGIC_VECTOR (3 downto 0);
               B8 : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal nclk : std_logic;
    signal b4 : std_logic_vector(3 downto 0);
    signal b8 : std_logic_vector(7 downto 0);
begin
    ck: clk_div2 port map(clk => clk,
                          sclk => nclk);
    
    count: counter4B port map(EN => EN,
                              CLK => nclk,
                              B => b4);
                              
    conv: B4to8B port map(B4 => b4,
                          B8 => b8);
                          
    sseg: sseg_dec port map(ALU_VAL => b8,
                            SIGN => '0',
                            VALID => '1',
                            CLK => clk,
                            DISP_EN => DISP,
                            SEGMENTS => seg);

end Behavioral;
