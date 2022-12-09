----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2022 00:30:58
-- Design Name: 
-- Module Name: w5 - Behavioral
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

entity w5 is
port (
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
end w5;

architecture Behavioral of w5 is
signal v1, v2, v3, v4 : std_logic;
begin

oe_out <= not oe_not_in;
v1<= not (ent_in and enp_in and sload_not_in);
v2<= ent_in nand enp_in;
out1<= (not v1) and (sclr_not_in);
out2<= sload_not_in and (sclr_not_in);
out3<= (not sload_not_in) and (sclr_not_in);

v3<= ent_in and fb1_in and fb2_in and fb3_in and fb4_in;
rco_out<= v3;
-- внимательно с clk
v4<= (not v2) and (not clk_in) and v3;
cco_out<= v4;


end Behavioral;
