----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:12:18 10/02/2017 
-- Design Name: 
-- Module Name:    Rf - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rf is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           Reset : in  STD_LOGIC;
           Crd_Alu : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Rf;

architecture Behavioral of RF is
type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registros : ram_type :=(others => x"00000000");

begin
process(Rs1,Rs2,Rd,Reset,Crd_Alu)
begin
	if(Reset = '1')then
				Crs1 <= (others=>'0');
				Crs2 <= (others=>'0');			
				registros <= (others => x"00000000");
			else
				Crs1 <= registros(conv_integer(Rs1));
				Crs2 <= registros(conv_integer(Rs2));
				
				
			if(Rd  /= "000000")then
					registros(conv_integer(Rd)) <= Crd_Alu;
				end if;
			end if;
	
end process; 

end Behavioral;

