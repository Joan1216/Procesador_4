----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:40:18 10/07/2017 
-- Design Name: 
-- Module Name:    SEU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU is
    Port ( Inmediato_In : in  STD_LOGIC_VECTOR (12 downto 0);
           Inmediato_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture Behavioral of SEU is

begin
	process(Inmediato_In)
		begin
			if(Inmediato_In(12) = '1')then
				Inmediato_Out(12 downto 0) <= Inmediato_In;
				Inmediato_Out(31 downto 13) <= (others=>'1');			
			else
				Inmediato_Out(12 downto 0) <= Inmediato_In;
				Inmediato_Out(31 downto 13) <= (others=>'0');
			end if;	
	end process;

end Behavioral;

