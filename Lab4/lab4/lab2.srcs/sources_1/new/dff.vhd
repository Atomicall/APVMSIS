LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dff IS
PORT(
	D:             IN STD_LOGIC;
	Clock:		   IN STD_LOGIC;
	Set_N:         IN STD_LOGIC;
	Reset_N:	   IN STD_LOGIC;
	Q:	           OUT STD_LOGIC
);
END dff;

ARCHITECTURE dataflow OF dff IS
BEGIN

	PROCESS(Clock, Set_N, Reset_N)
	BEGIN
    IF (Reset_N = '0') THEN
            Q <= '0';
    ELSIF (Set_N = '0') THEN
            Q <= '1';
    ELSIF (Clock'EVENT AND Clock = '1') then
            Q <= D;
    END IF;


	END PROCESS;	

END dataflow;