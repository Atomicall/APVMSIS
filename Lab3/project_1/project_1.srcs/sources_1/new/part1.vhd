library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity part1 is
port ( R : in STD_LOGIC_VECTOR (1 to 9);
           O_1 : out STD_LOGIC_VECTOR (0 to 3);
           O_2 : out STD_LOGIC_VECTOR (0 to 3));
end part1;

architecture Behavioral of part1 is
component enc_parr 
PORT( i : in std_logic_vector ( 1 to 9);
     y : out std_logic_vector ( 0 to 3) 
);
end component enc_parr;


component enc_posled
PORT( i : in std_logic_vector ( 0 to 8);
     y : out std_logic_vector ( 0 to 3) 
);
end component enc_posled;

begin

D1: enc_parr
port map (i=>R, y=>O_1);

D2: enc_posled
port map (i=>R, y=>O_2);
end Behavioral;
