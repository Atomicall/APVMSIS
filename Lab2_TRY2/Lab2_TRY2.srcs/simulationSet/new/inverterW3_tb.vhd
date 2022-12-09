LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY inverterW3_tb IS
END inverterW3_tb;
 
ARCHITECTURE behavior OF inverterW3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT w3
    Port( in1: in std_logic;
    en: in std_logic;
    out1: out std_logic);
    END COMPONENT;
	 
   --Inputs
   signal In_s : STD_LOGIC;
   signal En_s : STD_LOGIC;
   signal Out_s : STD_LOGIC;
   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: w3 PORT MAP (
          in1=>In_s, 
          en=> En_s,
          out1=> Out_s
        );

   -- Clock process definitions
   stim_proc: process
   begin
   
  En_s<= '0';
  wait for 40 ns;
  In_s<='0';
   wait for 40 ns;
   In_s<='1';
   
    wait for 40 ns;
    En_s<= '1';
     wait for 40 ns;
    In_s<='0';
     wait for 40 ns;
     In_s<='1';
      wait for 40 ns;
      In_s<='1';
       wait for 40 ns;
       In_s<='0';
        wait;
   end process;

END;
