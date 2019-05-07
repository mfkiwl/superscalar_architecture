library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_code is 
  port (clk : in std_logic;  
        we  : in std_logic;   
        a   : in std_logic_vector(15 downto 0);   
        di  : in std_logic_vector(15 downto 0);   
        do  : out std_logic_vector(31 downto 0));   
end memory_code;

   
architecture syn of memory_code is   
  type ram_type is array (1023 downto 0)   
        of std_logic_vector (15 downto 0);   
  

  
	function init_ram
		return ram_type is 
		variable tmp : ram_type := (others => (others => '0'));
	begin 
		--for addr_pos in 0 to 500 loop 
		--	-- Initialize each address with the address itself
		--	tmp(addr_pos) := (to_std_logic_vector(addr_pos, 16));
		--end loop;

		tmp(0)	:= "0001001001000111";
		tmp(1) 	:= "0001010011001001";
		tmp(2)	:= "0001011101001100";
		tmp(3)  := "0001100101001001";
		tmp(4) 	:= "0000001010011000";
		tmp(5) 	:= "0010011100111000";
		tmp(6)	:= "0000000000000000";
		tmp(7) 	:= "0000111111111000";
		tmp(8)	:= "0000000000000000";
		tmp(9) 	:= "0000111111111000";
		tmp(10)	:= "0000000000000000";
		tmp(11) := "0000111111111000";
		tmp(12) := "0000000000000000";
		tmp(13)	:= "0000111111111000";
		tmp(14)	:= "0000000000000000";
		tmp(15)	:= "0000111111111000";
		tmp(16) := "0000000000000000";
		tmp(17)	:= "0000111111111000";
		tmp(18)	:= "0000000000000000";
		tmp(19)	:= "0000111111111000";
		tmp(20) := "0000000000000000";
		tmp(21) := "0000111111111000";
		tmp(22) := "0000000000000000";
		tmp(23) := "0000111111111000";
		tmp(24)	:= "0000000000000000";
		tmp(25) := "0000111111111000";
		tmp(26)	:= "0000000000000000";
		tmp(27) := "0000111111111000";
		tmp(28) := "0000000000000000";
		tmp(29) := "0000111111111000";
		tmp(30)	:= "0000000000000000";
		tmp(31)	:= "0000111111111000";
		tmp(32) := "0000000000000000";

		--tmp(39)	:= "0001000001010000";
		--tmp(40)	:= "0001100101010000";
		--tmp(41) := "1001001000000000";
		--tmp(42) := "0110011000011100";

		--tmp(48) := "0100111001001001";
		--tmp(49) := "0100110100000000";
		--tmp(50) := "0001110110000001";

		--tmp(53) := "1100111110000000";
		--tmp(54) := "0000111001000000";
		--tmp(55) := "0100101000000000";

		--tmp(90)	:= "0000000000000000";
		--tmp(91) := "0011000000000001";
		--tmp(92) := "0100001000000001";
		--tmp(93) := "0000010000001000";
		--tmp(94)	:= "0100111000000000";

		--- Without R7 logic Verifier -----------
		--tmp(0)  := "0000010001000000";
		--tmp(1)  := "0001000001011111";
		--tmp(2)  := "0001001001011111";
		--tmp(3)  := "0001010010000111";
		--tmp(4)  := "0011101101001110";
		--tmp(5)  := "0001011011000001";
		--tmp(6)  := "0000100000000001";
		--tmp(7)  := "0100110010000101";
		--tmp(8)  := "0101111001000001";
		--tmp(9)  := "0100001001000001";
		--tmp(10)  := "0110111001010100";
		--tmp(11)  := "0110111000000111";

		--tmp(0)  := "0001000001011111";
		--tmp(1)  := "0001010001011111";
		--tmp(2)  := "0001011001011111";
		--tmp(3)  := "0001100001011111";
		--tmp(4)  := "0011111000000000";
		--tmp(5)  := "0001010001011111";
		--tmp(6)  := "0001011001011111";
		--tmp(7)  := "0001100001011111";

		--tmp(0)  := "0001010001000001";
		--tmp(1)  := "0001100001000001";
		--tmp(2)  := "0001100001000001";
		--tmp(3)  := "0001100001000001";
		--tmp(4)  := "1100111111000111";
		--tmp(5)  := "0000000000000000";
		--tmp(6)  := "0000000000000000";
		--tmp(7)  := "0000000000000000";
		--tmp(8) 	:= "0110111010001101";
		--tmp(9) 	:= "0100111111000000";

		--tmp(0)  := "0001001001000101";
		--tmp(1)  := "0001010010000010";
		--tmp(2)	:= "0000010010010010";
		--tmp(3)  := "0000001010011000";

		-- Final testing Phase I

		--tmp(0) := "0001001001000001";
		--tmp(1) := "0001011101000010"; 
		--tmp(2) := "0000001001001001";
		--tmp(3) := "0011101000000001";
		--tmp(4) := "0001110110000101";
		--tmp(5) := "0000110010010001";
		--tmp(6) := "0001001001000000";
		----tmp(4) := "1001101000000000";
		--tmp(7) := "0110110001100000";

		--tmp(0) := "0101111000000000";
		--tmp(1) := "0100110000000000";
		--tmp(2) := "0110101000101000";
		--tmp(3) := "0111101010101000";
		--tmp(4) := "0110101010100000";
		--tmp(5) := "0110110001100000";
		--tmp(6) := "0000001101001001";
		--tmp(7) := "0110100000001010";
		--tmp(3) := "0110011000101001";
		--tmp(6) := "0000001101001001";
		--tmp(4)  := "0000111101110000";
		--tmp(4)  := "1100111111000111";
		--tmp(5)  := "0000000000000000";
		--tmp(6)  := "0000000000000000";
		--tmp(7)  := "0000000000000000";
		--tmp(8) 	:= "0110111010001101";
		--tmp(9) 	:= "0100111111000000";

		--tmp(2)  := "0001001001000111";
		--tmp(3)  := "0000111111111000";
		--tmp(4)  := "0010011100111000";
		--tmp(5)  := "0001011011000001";
		--tmp(6)  := "0000100000000001";
		--tmp(7)  := "0100110010000101";
		--tmp(8)  := "0101010001000001";
		--tmp(9)  := "0100001001000001";
		--tmp(10)  := "0110000001010100";
		--tmp(11)  := "0110100000000011";

		--tmp(11) := "0100100010001001";
		--tmp(12) := "0100100010001010";
		--tmp(13) := "0000101100011000";
		--tmp(14) := "0000110100011010";
		--tmp(15) := "0011110000000000";
		--tmp(16) := "0000110110110000";
		--tmp(17) := "0000110000001001";
		--tmp(18) := "0000110100011000";
		--tmp(19) := "0010110011100010";
		--tmp(20) := "0011110000000000";
		--tmp(21) := "0000110110110000";
		--tmp(22) := "0010110011100001";
		--tmp(23) := "0010101100011000";
		--tmp(24) := "0101100010001011";
		--tmp(25) := "0100101010001011";
		--tmp(26) := "0001010010001100";
		--tmp(27) := "0110010001010001";
		--tmp(28) := "0001010010000011";
		--tmp(29) := "0111010000110100";
		--tmp(30) := "0100000010000000";
		--tmp(31) := "0100000010000001";
		--tmp(32) := "0100000010000010";
		--tmp(33) := "1100000001000010";
		--tmp(34) := "0001000001000000";
		--tmp(35) := "1100000001000010";
		--tmp(36) := "0010001100110001";
		--tmp(37) := "1000011000000100";
		--tmp(38) := "0101101001100110";
		--tmp(39) := "0011100101010001";
		--tmp(40) := "0000010100101000";
		--tmp(41) := "0001011011010100";
		--tmp(42) := "1001001011000000";

		--tmp(101) := "1000100010001000";
		--tmp(102) := "0000000000000000";
		--tmp(103) := "1010101010101010";
		--tmp(104) := "1010101010101010";
		--tmp(105) := "0000000000000001";
		--tmp(106) := "0000000000000010";
		--tmp(107) := "0000000000000011";
		--tmp(108) := "0000000001101100";
		--tmp(109) := "0000000000000010";
		--tmp(110) := "1010101010101010";
		

		-- With R7 memory_code data instruction verifier-------------
		--tmp(0) := "0001111000000101";
		--tmp(5) := "0001000000000010";
		--tmp(6) := "0000111000111000";
		--tmp(8) := "0011010110001010";
		--tmp(9) := "0000101010010000";
		--tmp(10) := "0000111000111010";
		--tmp(12) := "0000000000000000";
		--tmp(13) := "0000011011011000";
		--tmp(14) := "0000111000111001";
		--tmp(18) := "0011001111111111";
		--tmp(19) := "0001000011011001";
		--tmp(20) := "0010111001001000";
		--tmp(25) := "0001010001000001";
		--tmp(26) := "0001000011011111";
		--tmp(27) := "0000011011011000";
		--tmp(28) := "0010111010010001";
		--tmp(31) := "0001001010000001";
		--tmp(32) := "0001000011010011";
		--tmp(33) := "0001000000010011";
		--tmp(34) := "0000101101101000";
		--tmp(35) := "0010111001001010";
		--tmp(38) := "0100111000011110";
		--tmp(40) := "0000000000000000";
		--tmp(41) := "0110000010000000";
		--tmp(68) := "0000000000101000";
		--tmp(76) := "0000000000101101";
		--tmp(125) := "1001110000000000";
		--tmp(126) := "1001110000000000";
		--tmp(127) := "1001110000000000";
		
		   --tmp(10):=to_std_logic_vector(1,16);
		return tmp;
	end init_ram;

  signal RAM : ram_type:=init_ram;	

	begin   
  process (clk)   
  begin   
    if (clk'event and clk = '1') then   
      if (we = '1') then   
        RAM(to_integer(unsigned(a))) <= di;   
      end if;   
    end if;
  end process;
do <= RAM(to_integer(unsigned(a))) & RAM(to_integer(unsigned(a)+1));   
end syn;
