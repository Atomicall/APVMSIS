----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 13:25:57
-- Design Name: 
-- Module Name: enc_parr - Behavioral
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

entity enc_parr is
PORT( i : in std_logic_vector ( 1 to 9);
     -- y : out std_logic_vector ( 0 to 3) := (others => '1')
     y : out std_logic_vector ( 0 to 3) 
);
end enc_parr;

architecture Behavioral of enc_parr is

begin

y(0)<= not
(
 (not i(9) )
 or 
 (i(9) and not i(8))
);
y(1)<= not (
(not i(7) and i(8) and i(9)) or
(not i(6) and i(7) and i(8) and i(9)) or
(not i(5) and i(6) and i(7) and i(8)and i(9))  or
(not i(4) and i(5) and i(6) and i(7)and i(8) and i(9))
);

y(2)<= not (
(not i(7) and i(8) and i(9)) or
(not i(6) and i(7) and i(8) and i(9)) or
(not i(3) and i(4) and i(5) and i(6) and i(7) and i(8) and i(9)) or
(not i(2) and i(3) and i(4) and i(5) and i(6) and i(7) and i(8) and i(9))
);

y(3)<= not (
(not i(7) and i(8) and i(9)) or
(not i(9) ) or
(not i(5) and i(6) and i(7) and i(8)and i(9)) or
(not i(3) and i(4) and i(5) and i(6) and i(7) and i(8) and i(9)) or
(not i(1) and i(2) and i(3) and i(4) and i(5) and i(6) and i(7) and i(8) and i(9))

);



end Behavioral;





