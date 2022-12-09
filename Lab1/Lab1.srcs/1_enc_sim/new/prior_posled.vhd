----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2022 23:46:29
-- Design Name: 
-- Module Name: priority_encoder - Behavioral
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

entity prior_posl is
PORT( i : in std_logic_vector ( 0 to 8);
      y : out std_logic_vector ( 0 to 3)
);
end prior_posl;

architecture Behavioral of prior_posl is
begin
proc1: process (i) 
begin


--y(0)<= not(vars(1) or vars(2) or vars(3) or vars(4) or vars(5));
--y(1)<= not(vars(6) or vars(7) or vars(8) or vars(9));
--y(2)<= not(vars(10) or vars(11) or vars(12) or vars(13));
-- vars 14
--y(3)<= (not i(7)) nor (not (i(8)));


end process proc1;


end Behavioral;
