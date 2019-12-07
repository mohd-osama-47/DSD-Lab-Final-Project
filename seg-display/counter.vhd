library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all ;


entity counter is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (1 downto 0));
end counter;


architecture Behavioral of counter is

SIGNAL Count : STD_LOGIC_VECTOR (1 DOWNTO 0) ;

BEGIN

     PROCESS ( Clock, Reset )
      BEGIN
		IF Reset = '1' THEN
			Count <= "00" ;
			ELSIF (rising_edge(Clock) THEN
				Count <= Count + 1 ;
			END IF ;
	  END PROCESS ;
	  
	 q <= Count ;

end Behavioral;