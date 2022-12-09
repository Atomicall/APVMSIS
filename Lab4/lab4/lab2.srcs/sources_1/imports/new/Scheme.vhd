library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Scheme is
    Port ( 
        ledsmain: out std_logic_vector(3 downto 0);
        ledsboard: out std_logic_vector(3 downto 0);
        pushbuttons: in std_logic_vector(4 downto 0);
        dipswitch: in std_logic_vector(3 downto 0);
        --clock diff pair
        sysclk_p: in std_logic;
        sysclk_n: in std_logic
    );
end Scheme;

architecture Behavioral of Scheme is

component main
port (
OE_NOT_IN: in std_logic;
ENT_IN:  in std_logic;
ENP_IN: in std_logic;
SCLR_NOT_IN: in std_logic;
SLOAD_NOT_IN: in std_logic;
CLK_IN:  in std_logic;
ACLR_NOT_IN: in std_logic;
ALOAD_NOT_IN:  in std_logic;
A_IN: in std_logic;
B_IN: in std_logic;
C_IN: in std_logic;
D_IN: in std_logic;

CCO_OUT: out std_logic;
RCO_OUT: out std_logic;
QA_OUT: out std_logic;
QB_OUT: out std_logic;
QC_OUT: out std_logic;
QD_OUT: out std_logic
);
end component;

    component ibufds
        Port (
               i, ib : in std_logic; 
               o : out std_logic);
    end component;
    
    component Div is
        Port ( 
               CLK_IN : in STD_LOGIC;
               CLK_OUT : out STD_LOGIC);
    end component;
    
signal CCK : std_logic;
signal CCK_NO_DIV : std_logic;


-- pb0 sw3 sclear
-- pb1 sw7 sload
--pb2 sw6 aclr
--pb3 sw4 aload
--pb4 sw5 oe
    

signal OE_NOT_S : std_logic := '0';
--1
signal ENT_S : std_logic := '1';
--1
signal ENP_S : std_logic := '1';
--pb 0
signal SCLR_NOT_S : std_logic := '1';
--pb 1
signal SLOAD_NOT_S : std_logic := '1';


--pb 2
signal ACLR_NOT_S : std_logic := '1';
--pb 3
signal ALOAD_NOT_S : std_logic := '1';

--dips
signal A_S : std_logic := '0';
signal B_S : std_logic := '0';
signal C_S : std_logic := '0';
signal D_S : std_logic := '0';

--leds on sub
signal CCO_S : std_logic := '0';
signal RCO_S : std_logic := '0';
--leds on main
signal QA_S : std_logic := '0';
signal QB_S : std_logic := '0';
signal QC_S : std_logic := '0';
signal QD_S : std_logic := '0';
    
    
begin
    SCLR_NOT_S <= not pushbuttons(0);
    SLOAD_NOT_S <= not pushbuttons(1);
    ACLR_NOT_S <= not pushbuttons(2);
    ALOAD_NOT_S <= not pushbuttons(3);
    OE_NOT_S<= pushbuttons(4);
    
    A_S <= dipswitch(0);
    B_S <= dipswitch(1);
    C_S <= dipswitch(2);
    D_S <= dipswitch(3);
    
    ledsboard(0) <= CCO_S;
    ledsboard(3) <= RCO_S;
    ledsmain(0) <= QA_S;
    ledsmain(1) <= QB_S;
    ledsmain(2) <= QC_S;
    ledsmain(3) <= QD_S;
    
    
    
    counter: main port map (
    OE_NOT_IN=> OE_NOT_S,
    ENT_IN=> ENT_S,
    ENP_IN=> ENP_S,
    SCLR_NOT_IN=>  SCLR_NOT_S,
    SLOAD_NOT_IN=>  SLOAD_NOT_S,
    CLK_IN=>CCK,
    ACLR_NOT_IN=> ACLR_NOT_S,
    ALOAD_NOT_IN=>ALOAD_NOT_S,
    A_IN=> A_S,
    B_IN=>B_S ,
    C_IN=>C_S ,
    D_IN=>D_S ,
    CCO_OUT=> CCO_S,
    RCO_OUT=> RCO_S ,
    QA_OUT=> QA_S,
    QB_OUT=> QB_S,
    QC_OUT=> QC_S,
    QD_OUT=> QD_S 
    );
    
    buffds: ibufds port map (
        i => sysclk_p, 
        ib => sysclk_n, 
        o => CCK_NO_DIV
    );
    
    divider: Div port map (
        CLK_IN => CCK_NO_DIV, 
        CLK_OUT => CCK
    );
end Behavioral;