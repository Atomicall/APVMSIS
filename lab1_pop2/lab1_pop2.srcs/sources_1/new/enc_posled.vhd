----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 14:25:04
-- Design Name: 
-- Module Name: enc_posled - Behavioral
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

entity enc_posled is
PORT( i : in std_logic_vector ( 0 to 8);
     -- y : out std_logic_vector ( 0 to 3) := (others => '1')
     y : out std_logic_vector ( 0 to 3) 
);
end enc_posled;

architecture Behavioral of enc_posled is

begin

process(i)
begin

--case i is
--when "111111111" => y <= "1111";
--when "--------0" => y<= "0110";
--when "-------01" => y<= "0111";
--when "------011" => y<= "1000";
--when "-----0111" => y<= "1001";
--when "----01111" => y<= "1010";
--when "---011111" => y<= "1011";
--when "--0111111" => y<= "1100";
--when "-01111111" => y<= "1101";
--when "011111111" => y<= "1110";
--when others => y<="0000";
--end case;

if (i = "111111111") then
y <= "1111";
end if;

if (i = "011111111") then
y <= "1110";
end if;

if (i(8)='0') then
y <= "0110";
end if;

if (i(7)='0' and i(8) = '1') then
y <= "0111";
end if;


if (i(6)='0' and i(7) = '1' and i(8) = '1') then
y <= "1000";
end if;


if (i(5)='0' and i(6) = '1' and i(7) = '1' and i(8) = '1') then
y <= "1001";
end if;

if (i(4)='0' and i(5) = '1' and i(6) = '1' and i(7) = '1' and i(8) = '1') then
y <= "1010";
end if;


if (i(3)='0' and i(4) = '1' and i(5) = '1' and i(6) = '1' and i(7) = '1' and i(8) = '1') then
y <= "1011";
end if;

if (i(2)='0' and i(3) = '1' and i(4) = '1' and i(5) = '1' and i(6) = '1' and i(7) = '1' and i(8) = '1') then
y <= "1100";
end if;

if (i(1)='0' and i(2) = '1' and i(3) = '1' and i(4) = '1' and i(5) = '1' and i(6) = '1' and i(7) = '1' and i(8) = '1') then
y <= "1101";
end if;


end process;


end Behavioral;
