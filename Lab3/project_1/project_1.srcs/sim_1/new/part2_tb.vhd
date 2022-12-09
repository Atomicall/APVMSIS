library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

entity part2_tb is
--  Port ( );
end part2_tb;

architecture Behavioral of part2_tb is
component part2
        port (R : in STD_LOGIC_VECTOR (1 to 12);
           O_1 : out STD_LOGIC_VECTOR (1 to 6);
           O_2 : out STD_LOGIC_VECTOR (1 to 6));
end component;
   signal R_s   : std_logic_vector (1 to 12);
   signal O_1_s : std_logic_vector (1 to 6);
   signal O_2_s : std_logic_vector (1 to 6);
    signal clock : std_logic := '0';
    constant clock_period : time := 50 ns;
   signal notSame: boolean;
   signal CLK_S : std_logic;
   file test_input : text open read_mode is "D:\input_pt2.txt";
begin

dut : part2
    port map (R   => R_s,
              O_1 => O_1_s,
              O_2 => O_2_s);
       CLK_S<= clock;    
          
           clock_process :process
                begin
                     clock <= '0';
                     wait for clock_period / 2;
                     clock <= '1';
                     wait for clock_period / 2;
                end process;    
     stimuli : process
                   variable time: integer := 0;
                    variable vector_value_R : std_logic_vector(1 to 12);
                   variable v_ILINE: line;
                  begin
                      lp :  while not endfile(test_input) loop
                                readline(test_input, v_ILINE);
                                read(v_ILINE, vector_value_R);
                                R_s<= vector_value_R;
                                R_s(8)<=CLK_S;
                                 wait for 40 ns;
                                 time:= time + 40;
                                if O_1_s /= O_2_s then 
                                report "Different work on: " & integer'image(time) & "ns";
                                notSame <= TRUE;
                                end if;
                                end loop lp;
                         if notSame = TRUE then
                         report "RESULTS are not the same!";
                         end if;
                         if notSame = FALSE then
                         report "!!!!RESULTS are the same!";
                         end if;       
                         file_close(test_input);
                        end process;         
end Behavioral;
