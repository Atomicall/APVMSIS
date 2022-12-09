----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2022 23:35:11
-- Design Name: 
-- Module Name: w1 - Behavioral
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

entity w1 is
port(
 in1: IN std_logic;
 in2: IN std_logic;
  in3: IN std_logic;
   in4: IN std_logic;
    in5: IN std_logic;
     in6: IN std_logic;
      in7: IN std_logic;
       in8: IN std_logic;
        in9: IN std_logic;
         in10: IN std_logic;
         out1: OUT std_logic);
    
end w1;

architecture Behavioral of w1 is

begin
process(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10)
variable v1, v2, v3, v4, v5: std_logic; 
begin
v1:= in1 and in2;
v2:= in3 nand in4;
v3:= v2 and in5 and in6;
v5:= in9 nand in10;
v4:= in7 and in8 and v5;
out1<=v1 or v3 or v4;


end process;
end Behavioral;
