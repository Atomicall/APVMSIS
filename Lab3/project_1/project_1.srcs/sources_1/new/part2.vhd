library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity part2 is
port ( R : in STD_LOGIC_VECTOR (1 to 12);
           O_1 : out STD_LOGIC_VECTOR (1 to 6);
           O_2 : out STD_LOGIC_VECTOR (1 to 6));
end part2;

architecture Behavioral of part2 is

component main is 
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


begin

C1: main
port map (
OE_NOT_IN=> R(1),
ENT_IN=> R(6),
ENP_IN=> R(7),
SCLR_NOT_IN=>  R(4),
SLOAD_NOT_IN=>  R(5),
CLK_IN=>R(8),
ACLR_NOT_IN=> R(2),
ALOAD_NOT_IN=>R(3),
A_IN=> R(9),
B_IN=>R(10) ,
C_IN=>R(11) ,
D_IN=>R(12) ,

CCO_OUT=> O_1(1),
RCO_OUT=> O_1(2) ,
QA_OUT=> O_1(3),
QB_OUT=> O_1(4),
QC_OUT=> O_1(5),
QD_OUT=> O_1(6)
);

C2: main
port map (
OE_NOT_IN=> R(1),
ENT_IN=> R(6),
ENP_IN=> R(7),
SCLR_NOT_IN=>  R(4),
SLOAD_NOT_IN=>  R(5),
CLK_IN=>R(8),
ACLR_NOT_IN=> R(2),
ALOAD_NOT_IN=>R(3),
A_IN=> R(9),
B_IN=>R(10) ,
C_IN=>R(11) ,
D_IN=>R(12) ,

CCO_OUT=> O_2(1),
RCO_OUT=> O_2(2) ,
QA_OUT=> O_2(3),
QB_OUT=> O_2(4),
QC_OUT=> O_2(5),
QD_OUT=> O_2(6)
);


end Behavioral;
