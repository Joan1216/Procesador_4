----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:44:06 10/12/2017 
-- Design Name: 
-- Module Name:    PSRM - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSRM is
    Port ( Iu_In : in  STD_LOGIC_VECTOR (5 downto 0);
			  Reset : in STD_LOGIC;
           Alu_In : in  STD_LOGIC_VECTOR (31 downto 0);
           MUX_In : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_In : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRM;

architecture Behavioral of PSRM is

begin

	process(Iu_In, Alu_In, RF_In, MUX_In,Reset)
	begin
		if (Reset = '1') then
			nzvc <= (others=>'0');
		else
			-- ANDcc or ANDNcc or ORcc or ORNcc or XORcc or XNORcc
			if (Iu_In="010001" OR Iu_In="010101" OR Iu_In="010010" OR Iu_In="010110" OR Iu_In="010011" OR Iu_In="010111") then
				nzvc(3) <= Alu_In(31);--el signo que traiga
				if (conv_integer(Alu_In)=0) then
					nzvc(2) <= '1';--porque el resultado da cero
				else
					nzvc(2) <= '0';
				end if;
				nzvc(1) <= '0';--los operadores logicos no generan overflow ni carry
				nzvc(0) <= '0';
			end if;
			
			-- ADDcc or ADDxcc
			if (Iu_In="010011" or Iu_In="010010") then
				nzvc(3) <= Alu_In(31);
				if (conv_integer(Alu_In)=0) then
					nzvc(2) <= '1';
				else
					nzvc(2) <= '0';
				end if;
				nzvc(1) <= (RF_In(31) and MUX_In(31) and (not Alu_In(31))) or ((not RF_In(31)) and (not MUX_In(31)) and Alu_In(31));
				nzvc(0) <= (RF_In(31) and MUX_In(31)) or ((not Alu_In(31)) and (RF_In(31) or MUX_In(31)) );
			end if;
			
			--SUBcc or SUBxcc
			if (Iu_In="001000" or Iu_In="001010") then
				nzvc(3) <= Alu_In(31);
				if (conv_integer(Alu_In)=0) then
					nzvc(2) <= '1';
				else
					nzvc(2) <= '0';
				end if;
				nzvc(1) <= (RF_In(31) and (not MUX_In(31)) and (not Alu_In(31))) or ((not RF_In(31)) and MUX_In(31) and Alu_In(31));
				nzvc(0) <= ((not RF_In(31)) and MUX_In(31)) or (Alu_In(31) and ((not RF_In(31)) or MUX_In(31)));
			end if;
		end if;
		
	end process;
	
end Behavioral;

