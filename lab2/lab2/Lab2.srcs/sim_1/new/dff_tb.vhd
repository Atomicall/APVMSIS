LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY dff_tb IS
END dff_tb;
 
ARCHITECTURE behavior OF dff_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dff
    PORT(
        D:             IN STD_LOGIC;
        Clock:           IN STD_LOGIC;
        Set_N:         IN STD_LOGIC;
        Reset_N:       IN STD_LOGIC;
        Q:               OUT STD_LOGIC
        );
    END COMPONENT;
	 
   --Inputs
   signal D : STD_LOGIC := '0';
   signal Clock : STD_LOGIC := '0';
   signal Set_N : STD_LOGIC := '1';
   signal Reset_N : STD_LOGIC := '1';
   
   
   --Outputs
   signal Q : STD_LOGIC := '0';
   
   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dff PORT MAP (
          D => D,
          Clock => Clock,
          Set_N => Set_N,
          Reset_N => Reset_N,
          Q => Q
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period / 2;
		clock <= '1';
		wait for clock_period / 2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin
   
   D<='1';
   wait for 40 ns;
   
   Reset_N<='0';
   wait for 20 ns;
   Reset_N<='1';
   wait for 20 ns;
   D<='0';
   wait for 20 ns;
     
   Set_N<='0';
   wait for 20 ns;
   Set_N<='1';
   wait for 20 ns;
   
   D<='1';
   wait for 20 ns;
   Reset_N<='0';
   Set_N<='0';
   wait;
   
   end process;

END;
