
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

entity part1_tb2 is
end part1_tb2;

architecture tb of part1_tb2 is

component part1
        port (R   : in std_logic_vector (1 to 9);
              O_1 : out std_logic_vector (0 to 3);
              O_2 : out std_logic_vector (0 to 3));
end component;

    signal R_s   : std_logic_vector (1 to 9);
    signal O_1_s : std_logic_vector (0 to 3);
    signal O_2_s : std_logic_vector (0 to 3);
    signal notSame: boolean;
    file test_input : text open read_mode is "D:\input_pt11.txt";
     

begin

    dut : part1
    port map (R   => R_s,
              O_1 => O_1_s,
              O_2 => O_2_s);

    stimuli : process
     variable time: integer := 0;
      variable vector_value_R : std_logic_vector(1 to 9);
     variable v_ILINE: line;
    begin
        wait for 50 ns;
        lp :  for k in 0 to 511 loop
                  readline(test_input, v_ILINE);
                  read(v_ILINE, vector_value_R);
                 
                  R_s<= vector_value_R;
                  wait for 10 ns;
                  time:= time + 10;
                  -- используем оба компонента
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

end tb;
