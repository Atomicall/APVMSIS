----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2022 17:54:20
-- Design Name: 
-- Module Name: Div - Behavioral
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

entity Div is
    Port ( 
           CLK_IN : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end Div;

architecture Behavioral of Div is
    signal i: integer := 0;
    signal temp: std_logic := '0';
    
    --constant divide_value: integer := 10000000;
     constant divide_value: integer := 100000000;
begin
    process (CLK_IN)
    begin
        if CLK_IN'event and CLK_IN = '1' then
            if (i = divide_value) then
                i <= 0;
                temp <= not temp;
            else i <= i + 1;
            end if;
        end if;
    end process;
    
    CLK_OUT <= temp;       
end Behavioral;
