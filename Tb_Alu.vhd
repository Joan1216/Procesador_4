--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:17:02 30/09/2017
-- Design Name:   
-- Module Name:   C:/Users/joanc/Desktop/Procesador_1/Procesador_1/Tb_Alu.vhd
-- Project Name:  Procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_Alu IS
END Tb_Alu;
 
ARCHITECTURE behavior OF Tb_Alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         Entrada_Uc : IN  std_logic_vector(5 downto 0);
         Entrada_Rf1 : IN  std_logic_vector(31 downto 0);
         Entrada_Rf2 : IN  std_logic_vector(31 downto 0);
         Salida_Alu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada_Uc : std_logic_vector(5 downto 0) := (others => '0');
   signal Entrada_Rf1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Entrada_Rf2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Salida_Alu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          Entrada_Uc => Entrada_Uc,
          Entrada_Rf1 => Entrada_Rf1,
          Entrada_Rf2 => Entrada_Rf2,
          Salida_Alu => Salida_Alu
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      Entrada_Rf1 <= x"00000004";
		Entrada_Rf2 <= x"00000005";
		Entrada_Uc <= "000001";
		

      wait;
   end process;

END;
