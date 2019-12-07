library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top_module is
	port(
		--x : in std_logic_vector (15 downto 0);
		clk, clr : in std_logic;
		dp : out std_logic;
		outputs : out std_logic_vector (6 downto 0);
		an : out std_logic_vector (3 downto 0)
	);
end top_module;

architecture Behavioral of top_module is

---------------------------------------------------------------------------------------------------------

component array_shift is
	port(
		clk : in std_logic;
		clr : in std_logic;
		x : out std_logic_vector (15 downto 0)
	);

end component;

-----------------------------------

component hex7seg is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
          seg7 : out  STD_LOGIC_VECTOR (6 downto 0)
             );
end component;

-----------------------------------

component clockdiv is
	port(
		clkin : in std_logic;
		clkout : out std_logic_vector(1 downto 0)
	);
end component;

-----------------------------------


component counter is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

-----------------------------------

component mux41 is
	port (
		a,b,c,d : in std_logic_vector (3 downto 0);
		s : in std_logic_vector (1 downto 0);
		output : out std_logic_vector (3 downto 0)
	);
end component;

signal clocks : std_logic_vector (1 downto 0);

signal x_mux : std_logic_vector ( 15 downto 0);

signal switching_order : std_logic_vector (1 downto 0);

signal msg_to_seg : std_logic_vector (3 downto 0);

begin

	u0 : clockdiv port map (clk, clocks);
	u1 : array_shift port map (clocks(0), clr, x_mux);
	u2 : counter port map (clocks(1), clr, switching_order);
	u3 : mux41 port map (x_mux(15 downto 12), x_mux(11 downto 8), x_mux(7 downto 4), x_mux(3 downto 0),
								switching_order, msg_to_seg);
	u4 : hex7seg port map (msg_to_seg, outputs);
	
	dp <= '1';
	
	process(switching_order)
	 begin
		
		if switching_order = "00" then
			an <= "0111";
			--msg_to_seg <= msg1;
		elsif switching_order = "01" then
			an <= "1011";
			--msg_to_seg <= msg2;
		elsif switching_order = "10" then
			an <= "1101";
		--	msg_to_seg <= msg3;
		elsif switching_order = "11" then
			an <= "1110";
			--msg_to_seg <= msg4;
		else
			an <= "1111";
		end if;
	
	end process;


end Behavioral;

