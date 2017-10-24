----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:38:56 10/12/2017 
-- Design Name: 
-- Module Name:    PSR - Behavioral 
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

entity PSR is
    Port ( PSR_In : in  STD_LOGIC_VECTOR (3 downto 0);
	        CWP : out STD_LOGIC;
			  NCWP : in STD_LOGIC;
			  Reset : in STD_LOGIC;
           PSR_Out : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin
	process(PSR_In,Reset,NCWP)
	 begin
		if (Reset = '1') then
			PSR_Out <= '0';
			CWP <= '0'; 
		else 
			PSR_Out <= PSR_In(0);
			CWP <= NCWP; 
		end if;
	end process;
end Behavioral;

