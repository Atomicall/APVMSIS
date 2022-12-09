
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
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
end main;

architecture Behavioral of main is

component w2 is 
port (
in1: IN std_logic;
in2: IN std_logic;
in3: IN std_logic;
in4: IN std_logic;
in5: IN std_logic;
c1: in std_logic;
d1: in std_logic;
out1: out std_logic;
inversive_out: out std_logic
);
end component w2;

component w3 is port (
in1: in std_logic;
en: in std_logic;
out1: out std_logic);
end component w3;

component w5 is port (
oe_not_in: in std_logic;
ent_in: in std_logic;
enp_in: in std_logic;
sclr_not_in: in std_logic;
sload_not_in: in std_logic;
clk_in: in std_logic;
fb1_in: in std_logic;
fb2_in: in std_logic;
fb3_in: in std_logic;
fb4_in: in std_logic;
cco_out: out std_logic;
rco_out: out std_logic;
oe_out: out std_logic;
out1: out std_logic;
out2: out std_logic;
out3: out std_logic
);
end component w5;

signal DFF_OUTS_S: std_logic_vector(4 downto 1);
signal DFF_NOT_OUTS_S: std_logic_vector(4 downto 1);
signal TMP_OUTS_S: std_logic_vector(4 downto 1);
signal OUT1_S, OUT2_S, OUT3_S: std_logic;
signal OE_S: std_logic;

signal ACLR_S, ALOAD_S, CLK_NOT_S: std_logic;


begin

WTF5: w5 port map (oe_not_in=>OE_NOT_IN, ent_in=>ENT_IN, enp_in=>ENP_IN, sclr_not_in=>SCLR_NOT_IN, sload_not_in=>SLOAD_NOT_IN,
clk_in=>CLK_IN, fb1_in=>DFF_OUTS_S(1), fb2_in=>DFF_OUTS_S(2), fb3_in=>DFF_OUTS_S(3), fb4_in=>DFF_OUTS_S(4),
cco_out=>CCO_OUT, rco_out=>RCO_OUT, oe_out=>OE_S, out1=>OUT1_S, out2=>OUT2_S, out3=>OUT3_S);

-- port (in1: IN std_logic;
--in2: IN std_logic;
--in3: IN std_logic;
--in4: IN std_logic;
--in5: IN std_logic;
--c1: in std_logic;
--d1: in std_logic;
--out1: out std_logic;
--out1_not: out std_logic); --

D4: w2 port map (in1=>ACLR_S, in2=>ALOAD_S,  in3=> A_IN, in4=>ALOAD_S, in5=>ACLR_NOT_IN,c1=> CLK_IN, d1=>TMP_OUTS_S(4), 
out1=> DFF_OUTS_S(4), inversive_out=> DFF_NOT_OUTS_S(4));

D3: w2 port map (in1=>ACLR_S, in2=>ALOAD_S,  in3=>B_IN , in4=>ALOAD_S, in5=>ACLR_NOT_IN,c1=> CLK_IN, d1=>TMP_OUTS_S(3), 
out1=> DFF_OUTS_S(3), inversive_out=> DFF_NOT_OUTS_S(3)); 

D2: w2 port map (in1=>ACLR_S, in2=>ALOAD_S,  in3=>C_IN , in4=>ALOAD_S, in5=>ACLR_NOT_IN,c1=> CLK_IN, d1=>TMP_OUTS_S(2), 
out1=> DFF_OUTS_S(2), inversive_out=> DFF_NOT_OUTS_S(2)); 

D1: w2 port map (in1=>ACLR_S, in2=>ALOAD_S,  in3=>D_IN , in4=>ALOAD_S, in5=>ACLR_NOT_IN,c1=> CLK_IN, d1=>TMP_OUTS_S(1), 
out1=> DFF_OUTS_S(1), inversive_out => DFF_NOT_OUTS_S(1)); 

--in1: in std_logic;
--en: in std_logic;
--out1: out std_logic);

-- исходное
-- инвертеры надо включить
N4: w3 port map (in1=>DFF_NOT_OUTS_S(4), en=>OE_S, out1=>QA_OUT);
N3: w3 port map (in1=>DFF_NOT_OUTS_S(3), en=>OE_S, out1=>QB_OUT);
N2: w3 port map (in1=>DFF_NOT_OUTS_S(2), en=>OE_S, out1=>QC_OUT);
N1: w3 port map (in1=>DFF_NOT_OUTS_S(1), en=>OE_S, out1=>QD_OUT);



TMP_OUTS_S(4)<= (  (A_IN )and (OUT3_S)  ) or (   (OUT2_S) and (DFF_OUTS_S(4)) and not (OUT1_S)   ) 
or ( (OUT1_S)and (  not ( (OUT2_S)and(DFF_OUTS_S(4)) ) ) );

TMP_OUTS_S(3)<=  ( (B_IN )and(OUT3_S)) or
(( not ((OUT1_S) and (DFF_OUTS_S(4)))  ) and (DFF_OUTS_S(3)) and (OUT2_S)) or
((OUT1_S) and (DFF_OUTS_S(4)) and (not ((OUT2_S) and (DFF_OUTS_S(3)))));

TMP_OUTS_S(2)<= ((C_IN) and OUT3_S) or 
((not ((OUT1_S) and (DFF_OUTS_S(3)) and (DFF_OUTS_S(4))) and (DFF_OUTS_S(2)) and (OUT2_S))) or 
((OUT1_S) and (DFF_OUTS_S(3)) and (DFF_OUTS_S(4)) and (not ((DFF_OUTS_S(2)) and (OUT2_S))));

TMP_OUTS_S(1)<= ((D_IN) and (OUT3_S)) or
(not ((OUT1_S) and (DFF_OUTS_S(2)) and (DFF_OUTS_S(3)) and (DFF_OUTS_S(4))) and (DFF_OUTS_S(1)) and (OUT2_S)) or
((OUT1_S) and (DFF_OUTS_S(2)) and (DFF_OUTS_S(3)) and (DFF_OUTS_S(4)) and (not ((DFF_OUTS_S(1))and(OUT2_S) )));

CLK_NOT_S<=not CLK_IN;
ACLR_S <= not ACLR_NOT_IN;
ALOAD_S<= not ALOAD_NOT_IN;

---- "Ѕ-ј"№
--QA_OUT<= DFF_OUTS_S(4);
--QB_OUT<= DFF_OUTS_S(3);
--QC_OUT<= DFF_OUTS_S(2);
--QD_OUT<= DFF_OUTS_S(1);
end Behavioral;
