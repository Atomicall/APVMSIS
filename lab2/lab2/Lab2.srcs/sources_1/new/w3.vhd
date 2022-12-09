----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2022 00:04:16
-- Design Name: 
-- Module Name: w3 - Behavioral
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

entity w3 is
port( in1: in std_logic;
en: in std_logic;
out1: out std_logic);
end w3;

architecture Behavioral of w3 is

begin
process(in1, en)
begin

--out1<= not in1;
if (en = '0') then
out1 <= 'Z';
else out1<= not in1;
end if;

end process;
end Behavioral;
