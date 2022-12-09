library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main_tb_tb is

end main_tb_tb;

architecture Behavioral of main_tb_tb is
component main
port (
OE_NOT_IN: in std_logic;
ENT_IN:  in std_logic;
ENP_IN: in std_logic;
SCLR_NOT_IN: in std_logic;
SLOAD_NOT_IN: in std_logic;
CLK_IN:  in std_logic;
ACLR_NOT_IN: in std_logic;
ALOAD_NOT_IN:  in std_logic;
A_IN: in std_logic;
B_IN: in std_logic;
C_IN: in std_logic;
D_IN: in std_logic;

CCO_OUT: out std_logic;
RCO_OUT: out std_logic;
QA_OUT: out std_logic;
QB_OUT: out std_logic;
QC_OUT: out std_logic;
QD_OUT: out std_logic
);
end component;


signal clock : std_logic := '0';
constant clock_period : time := 100 ns;
signal OE_NOT_S : std_logic;
signal ENT_S : std_logic;
signal ENP_S : std_logic;
signal SCLR_NOT_S : std_logic;
signal SLOAD_NOT_S : std_logic;
signal CLK_S : std_logic;
signal ACLR_NOT_S : std_logic;
signal ALOAD_NOT_S : std_logic;
signal A_S : std_logic;
signal B_S : std_logic;
signal C_S : std_logic;
signal D_S : std_logic;
signal CCO_S : std_logic;
signal RCO_S : std_logic;
signal QA_S : std_logic;
signal QB_S : std_logic;
signal QC_S : std_logic;
signal QD_S : std_logic;


begin

counter: main port map (
OE_NOT_IN=> OE_NOT_S,
ENT_IN=> ENT_S,
ENP_IN=> ENP_S,
SCLR_NOT_IN=>  SCLR_NOT_S,
SLOAD_NOT_IN=>  SLOAD_NOT_S,
CLK_IN=>CLK_S,
ACLR_NOT_IN=> ACLR_NOT_S,
ALOAD_NOT_IN=>ALOAD_NOT_S,
A_IN=> A_S,
B_IN=>B_S ,
C_IN=>C_S ,
D_IN=>D_S ,

CCO_OUT=> CCO_S,
RCO_OUT=> RCO_S ,
QA_OUT=> QA_S,
QB_OUT=> QB_S,
QC_OUT=> QC_S,
QD_OUT=> QD_S 
);

CLK_S<= clock;
 clock_process :process
   begin
		clock <= '0';
		wait for clock_period / 2;
		clock <= '1';
		wait for clock_period / 2;
   end process;
   
   
   
   counter_process: process
   begin
    OE_NOT_S<='1';
    wait for 40 ns;
    
-- test async load    
    A_S <= '1';
    B_S <= '0';
    C_S <= '1';
    D_S <= '0';
    ACLR_NOT_S <= '1';
    ALOAD_NOT_S<='0';
    OE_NOT_S<='0';
    wait for 10 ns;
 --test async clear 
    ACLR_NOT_S<='0';
    OE_NOT_S<='0';
     wait for 120 ns; 
 -- test sync load
     A_S <= '1';
     B_S <= '1';
     C_S <= '1';
     D_S <= '1';
     ACLR_NOT_S <= '1';
     ALOAD_NOT_S<='1';
     OE_NOT_S<='0';
     SCLR_NOT_S<='1';
     SLOAD_NOT_S <= '0';
     wait for 120 ns; 
-- test sycn clead    
    ACLR_NOT_S <= '1';
    ALOAD_NOT_S<='1';
    OE_NOT_S<='0';
    SCLR_NOT_S <= '0';
    wait for 200 ns; 
--count
    ACLR_NOT_S<='0';
    OE_NOT_S<='0';
    wait for 10 ns;
    A_S <= '1';
    B_S <= '0';
    C_S <= '1';
    D_S <= '0';
    ACLR_NOT_S <= '1';
    ALOAD_NOT_S<='0';
    wait for 10 ns;
    
    ACLR_NOT_S<='1';
    ALOAD_NOT_S<='1';
    SCLR_NOT_S<='1';
    SLOAD_NOT_S<='1';
    ENT_S<='1';
    ENP_S<='1';
    
    wait;
    

   
   
   end process;
end Behavioral;
