----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:10:29 30/09/2017 
-- Design Name: 
-- Module Name:    Alu - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
    Port ( Entrada_Uc : in  STD_LOGIC_VECTOR (5 downto 0);
			  Entrada_PSR: in  STD_LOGIC;
           Entrada_Rf1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Entrada_Rf2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Salida_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is
 
 begin
process(Entrada_Rf1, Entrada_Rf2, Entrada_Uc)
begin
 case (Entrada_Uc) is 
			when "000000" => -- add
				Salida_Alu <= Entrada_Rf1 + Entrada_Rf2;
         when "000100" => -- sub
				Salida_Alu <= Entrada_Rf1 - Entrada_Rf2;				
         when "000001" => -- and
				Salida_Alu <= Entrada_Rf1 and Entrada_Rf2;
			when "000101" => -- nand
				Salida_Alu <= Entrada_Rf1 nand Entrada_Rf2;
         when "000010" => --or
				Salida_Alu <= Entrada_Rf1 or Entrada_Rf2;
	      when "000110" => --nor
				Salida_Alu <= Entrada_Rf1 nor Entrada_Rf2;	     
			when "000011" => -- xor
				Salida_Alu <= Entrada_Rf1 xor Entrada_Rf2;
			when "000111" => -- xnor
				Salida_Alu <= Entrada_Rf1 xnor Entrada_Rf2;				
			when "010001" => -- ANDcc
				Salida_Alu <= Entrada_Rf1 and Entrada_Rf2;
			when "010101" => -- ANDNcc
				Salida_Alu <= Entrada_Rf1 nand Entrada_Rf2;
			when "010010" => -- ORcc
				Salida_Alu <= Entrada_Rf1 or Entrada_Rf2;
			when "010110" => -- ORNcc
				Salida_Alu <= Entrada_Rf1 nor Entrada_Rf2;
			when "010011" => -- XORcc
				Salida_Alu <= Entrada_Rf1 xor Entrada_Rf2;	
         when "010111" => -- XNORcc
				Salida_Alu <= Entrada_Rf1 xnor Entrada_Rf2;
         when "010000" => -- ADDcc
				Salida_Alu <= Entrada_Rf1 + Entrada_Rf2;	
         when "011000" => -- ADDxcc
				Salida_Alu <= Entrada_Rf1 + Entrada_Rf2;				
         when "010100" => -- SUBcc
				Salida_Alu <= Entrada_Rf1 - Entrada_Rf2;	
         when "011100" => -- SUBxcc
				Salida_Alu <= Entrada_Rf1 - Entrada_Rf2;
			when "111100" => -- Save
				Salida_Alu <= Entrada_Rf1 - Entrada_Rf2;
			when "111101" => -- Restore
				Salida_Alu <= Entrada_Rf1 + Entrada_Rf2;
				
				
			when others => --otras instrucciones
				Salida_Alu <= (others=>'0');
		end case;
	end process; 

end Behavioral;

