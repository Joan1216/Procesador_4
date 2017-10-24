----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:00:11 30/09/2017 
-- Design Name: 
-- Module Name:    Uc - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Uc is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Salida_Uc : out  STD_LOGIC_VECTOR (5 downto 0));
end Uc;

architecture Behavioral of Uc is

begin
    process(Op,Op3)
  begin
if (Op="10")then
			       
					 case Op3 is 
				
							when "000000" => -- add
								Salida_Uc  <= "000000";

							when "000100" => -- sub
								 Salida_Uc <= "000100";							
								 
							when "000001" => -- and
								Salida_Uc <= "000001";
								 
							when "000101" => -- nand
								Salida_Uc <= "000101";							
								 
							when "000010" => -- or
								Salida_Uc <= "000010";
								
							when "000110" => -- nor
								Salida_Uc <= "000110";
								 
							when "000011" => -- xor
								Salida_Uc  <= "000011"; 
								
							when "010001" => -- ANDcc
								Salida_Uc <= "010001";
								
							when "010101" => -- ANDNcc
								Salida_Uc <= "010101";
								
							when "010010" => -- ORcc
								Salida_Uc <= "010010";
								
							when "010110" => -- ORNcc
								Salida_Uc <= "010110";
								
							when "010011" => -- XORcc
								Salida_Uc <= "010011";
								
							when "010111" => -- XNORcc
								Salida_Uc <= "010111";
							
							when "010000" => -- ADDcc
								Salida_Uc <= "010000";
								
							when "011000" => -- ADDxcc
								Salida_Uc <= "011000";
								
							when "010100" => -- SUBcc
								Salida_Uc <= "010100";
								
							when "011100" => -- SUBxcc
								Salida_Uc <= "011100";
								
							when "111100" => -- Save
								Salida_Uc <= "111100";
								
							when "111101" => -- Restore
								Salida_Uc <= "111101";
								

							when others => --otras instrucciones
								Salida_Uc <= "100111"; 
								
				end case;			 
		end if; 
end process; 
end Behavioral;

