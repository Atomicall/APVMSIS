----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2022 00:11:00
-- Design Name: 
-- Module Name: w4 - Behavioral
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

entity w4 is
port (in1: in std_logic;
in2: in std_logic;
in3: in std_logic;
in4: in std_logic;
in5: in std_logic;
in6: in std_logic;
in7: in std_logic;
in8: in std_logic;
out1: out std_logic);
end w4;

architecture Behavioral of w4 is
signal v1, v2, v3, v4: std_logic;
begin
v1<= in1 and in2;
v2<=in3 and in4 and (not in5);
v3<= in6 and v4;
v4<= in7 nand in8;
out1<= v1 or v2 or v3;

end Behavioral;
