library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.ALL;
 
entity enc_posled_tb is
--  Port ( );
end enc_posled_tb;
 
architecture Behavioral of enc_posled_tb is
--    component enc_parr
--       PORT( i : in std_logic_vector ( 0 to 8);
--                    y : out std_logic_vector ( 0 to 3)
--              );
--    end component;
 
 -- out
    signal I123456789 : std_logic_vector (0 to 8);
 -- in
    signal Y0123 : std_logic_vector (0 to 3);
 
begin
    UUT: entity work.enc_posled port map (i(8)=> I123456789(0),
    i(7)=> I123456789(1),
    i(6)=> I123456789(2),
    i(5)=> I123456789(3),
    i(4)=> I123456789(4),
    i(3)=> I123456789(5),
    i(2)=> I123456789(6),
    i(1)=> I123456789(7),
    i(0)=> I123456789(8),
     y(0)=> Y0123(0),
     y(1)=> Y0123(1),
     y(2)=> Y0123(2),
     y(3)=> Y0123(3)
      );   
   
--    process
--    begin
--    I123456789 <= "000000000";
--        wait for 50 ns;
--         I123456789 <= "111111111";
--                       wait for 50 ns;
--    I123456789 <= "000000001";
--    wait for 50 ns;
--    I123456789 <= "000000010";
--    wait for 50 ns;
--    I123456789 <= "000000100";
--    wait for 50 ns;
--        I123456789 <= "000001000";
--        wait for 50 ns;
--            I123456789 <= "000010000";
--            wait for 50 ns;
--                I123456789 <= "000100000";
--                wait for 50 ns;
--                                I123456789 <= "001000000";
--                                wait for 50 ns;
--                                                I123456789 <= "010000000";
--                                                wait for 50 ns;
--                                                                I123456789 <= "100000000";
                                                                
                                                                
--                                                                wait for 50 ns;
--                                                                                I123456789 <= "000100010";
--                                                                                wait for 50 ns;
--                                                                                                I123456789 <= "010100000";
    
--    -- I123456789 <= I123456789 + '1';

 
        
--    end process;


p1: process
    begin
   
    I123456789 <= "000000000";
     wait for 50 ns;
     I123456789 <= "111111111";
    wait for 50 ns;
    I123456789 <= "011111111";
    wait for 50 ns;
    I123456789 <= "000000000";
    wait for 50 ns;
    I123456789 <= "000000100";
    wait for 50 ns;
    I123456789 <= "000001000";
    wait for 50 ns;
    I123456789 <= "000010000";
     wait for 50 ns;
     I123456789 <= "000100000";
    wait for 50 ns;
    I123456789 <= "001000000";
    wait for 50 ns;
    I123456789 <= "010000000";
     wait for 50 ns;
    I123456789 <= "100000000";
    wait for 50 ns;
    I123456789 <= "000100010";
    wait for 50 ns;
    I123456789 <= "010100000";
    I123456789 <= "000000000";
    wait for 50 ns;
    lp :  for k in 0 to 511 loop
            I123456789 <= I123456789 + '1';
            wait for 50 ns;
            end loop lp;
    end process;

end Behavioral;