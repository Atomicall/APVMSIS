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

entity priority_encoder is
PORT( i : in std_logic_vector ( 0 to 8);
      y : out std_logic_vector ( 0 to 3)
);
end priority_encoder;

architecture Behavioral of priority_encoder is
signal vars: std_logic_vector (1 to 14);
begin 


vars(14)<= not((not i(7)) or (not (i(8))));

vars(1)<=  (not i(0)) and (i(1)) and i(3) and i(5) and vars(14);
vars(2)<= (not i(2)) and (i(3)) and i(5) and vars(14);
vars(3)<= (not i(4)) and i(5) and vars(14);
vars(4)<= (not (i(6))) and vars(14);
vars(5)<= not(i(8));

vars(6)<= (not i(1) ) and (i(3)) and (i(4)) and vars(14);
vars(7)<= (not i(2) )and (i(3)) and (i(4)) and vars(14);
vars(8)<= (not (i(5))) and vars(14);
vars(9)<= (not (i(6))) and vars(14);


vars(10)<= (not (i(3))) and vars(14);
vars(11)<= (not (i(4))) and vars(14);
vars(12)<= (not (i(5))) and vars(14);
vars(13)<= (not (i(6))) and vars(14);

y(0)<= not(vars(1) or vars(2) or vars(3) or vars(4) or vars(5));
y(1)<= not(vars(6) or vars(7) or vars(8) or vars(9));
y(2)<= not(vars(10) or vars(11) or vars(12) or vars(13));
-- vars 14
y(3)<= not((not i(7)) or (not (i(8))));




end Behavioral;
