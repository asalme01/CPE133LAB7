----------------------------------------------------------------------------------
-- Engineer: Bridget Benson
-- Create Date: 09/21/2015 09:02:18 AM
-- Description: Template file for test benches
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--make the entity name of your simulation file the same name as the file you  wish to simulate
--with the word Sim at the end of it.  The entity is empty because a simulation file does not 
--connect to anything on the board.
entity simulation is
--  Port ( );
end simulation;

architecture Behavioral of simulation is

    -- Component Declaration for the Unit Under Test (UUT) (the module you are testing)
    COMPONENT counter4B is
        Port ( EN, CLK : in STD_LOGIC;
               B : out STD_LOGIC_VECTOR (3 downto 0));
    END COMPONENT;

    --Signal declarions - can be the same names as the ports
    signal EN : std_logic := '0';
	--For designs with a CLK, uncomment the following
	signal CLK : std_logic := '0';
	signal B : std_logic_vector(3 downto 0);
	--For designs with a CLK uncomment the following
	constant CLK_period: time := 5 ns;
	
    begin
    
		-- Map the UUT's ports to the signals
        uut: counter4B PORT MAP (
            EN => EN,
            CLK => CLK,
            B => B
        );

		--For designs with a CLK uncomment the following
		CLK_process : process
		begin
			CLK <= '0';
			wait for CLK_period/2;
			CLK <= '1'; 
			wait for CLK_period/2;
		end process;
		
		
        stim_proc: process
        begin
            -- now assign values to the input signals
			-- you should include at least 8 test cases for all labs that 
			-- are representative of different inputs for your circuit
			-- if you can do an exhaustive test (like those that have only 8
			-- or 16 possible input combinations) - do an exhaustive test
			wait for 20 ns;
                EN <= '0';
			    wait for 20 ns;
                EN <= '1';
                wait for 60 ns;
                EN <= '0';
                wait for 20 ns;
                EN <= '1';
                wait for 20 ns;
                EN <= '0';
            wait;
        end process;
end Behavioral;
