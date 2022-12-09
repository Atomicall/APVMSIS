
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

entity part1_tb is
end part1_tb;

architecture tb of part1_tb is


function to_string ( a: std_logic_vector) return string is
variable b : string (1 to a'length) := (others => NUL);
variable stri : integer := 1; 
begin
    for i in a'range loop
        b(stri) := std_logic'image(a((i)))(2);
    stri := stri+1;
    end loop;
return b;
end function;


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
    file test_results : text open read_mode is "D:\output_pt11.txt";
      

begin

    dut : part1
    port map (R   => R_s,
              O_1 => O_1_s,
              O_2 => O_2_s);

    stimuli : process
     variable time: integer := 0;
      variable vector_value_R : std_logic_vector(1 to 9);
      variable vector_value_O : std_logic_vector(0 to 3);
     variable v_ILINE: line;
     variable v_IRESULT: line;
    begin
        wait for 50 ns;
        lp :  for k in 0 to 511 loop
                  readline(test_input, v_ILINE);
                  read(v_ILINE, vector_value_R);
                  readline(test_results, v_ILINE);
                  read(v_ILINE, vector_value_O);
                  
                  R_s<= vector_value_R;
                  wait for 10 ns;
                  time:= time + 10;
                  -- используем только один из компонента, сожержащего два (послед и паралл)
                  if O_1_s /= vector_value_O then
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
           file_close(test_results);
          end process;

end tb;






























--ЗАПИСТЬ ВХОДА И ВЫХОДА В ФАЙЛ
--library IEEE;
--use IEEE.Std_logic_1164.all;
--use IEEE.Numeric_Std.all;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_TEXTIO.ALL;
--use STD.TEXTIO.ALL;

--entity part1_tb is
--end part1_tb;

--architecture tb of part1_tb is


--function to_string ( a: std_logic_vector) return string is
--variable b : string (1 to a'length) := (others => NUL);
--variable stri : integer := 1; 
--begin
--    for i in a'range loop
--        b(stri) := std_logic'image(a((i)))(2);
--    stri := stri+1;
--    end loop;
--return b;
--end function;


--component part1
--        port (R   : in std_logic_vector (1 to 9);
--              O_1 : out std_logic_vector (0 to 3);
--              O_2 : out std_logic_vector (0 to 3));
--end component;

--    signal R_s   : std_logic_vector (1 to 9);
--    signal O_1_s : std_logic_vector (0 to 3);
--    signal O_2_s : std_logic_vector (0 to 3);
--    signal notSame: boolean;
    
    
--    file test_input : text open write_mode is "D:\input_pt11.txt";
--    file test_output : text open write_mode is "D:\output_pt11.txt";
      

--begin

--    dut : part1
--    port map (R   => R_s,
--              O_1 => O_1_s,
--              O_2 => O_2_s);

--    stimuli : process
--     variable time: integer := 0;
--     variable v_ILINE: line;
--     variable v_OLINE: line;
--    begin
--        R_s <= "000000000";
--        wait for 50 ns;
--        lp :  for k in 0 to 511 loop
----                  if O_1 /= O_2 then
----                  report "dggd" & integer'image(time) & "ns";
----                  notSame <= TRUE;
----                  end if;
--                  write(v_OLINE, O_1_s);
--                  write(v_ILINE, R_s);
                  
--                  writeline(test_input, v_ILINE);
--                  writeline(test_output, v_OLINE);    
--                  R_s <= R_s + '1';
--                  wait for 50 ns;
--                  time:= time + 50;
--                  end loop lp;
--           file_close(test_input);
--           file_close(test_output);
--          end process;
--        -- EDIT Add stimuli here
--end tb;