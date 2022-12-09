----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2022 23:47:48
-- Design Name: 
-- Module Name: w2 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity w2 is
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
end w2;

architecture Behavioral of w2 is
component dff is port (D, Clock, Set_N, Reset_N: in std_logic;
Q: out std_logic);
end component;

signal Res_s, Set_s, Out_s: std_logic;
signal v1, v2, v3: std_logic;

begin
v1<= not (in1 or v2);
v2<= in2 and v3;
v3<= not (in3 and in4 and in5);

Res_s<=v1;
Set_s<=v3;
--какая то хня с синхронностью clock
-- можно ли мапить выход так?
-- исходное...........................
dflip: dff port map (D=>d1, Clock=>c1, Set_N=>Set_s, Reset_N=>Res_s, Q=>Out_s);
out1<= Out_s;
inversive_out <= not Out_s;


end Behavioral;
