--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:54:02 30/09/2017
-- Design Name:   
-- Module Name:   C:/Users/joanc/Desktop/Procesador_1/Procesador_1/Tb_Sumador.vhd
-- Project Name:  Procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sumador
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_Sumador IS
END Tb_Sumador;
 
ARCHITECTURE behavior OF Tb_Sumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador
    PORT(
         Entrada_1 : IN  std_logic_vector(31 downto 0);
         Entrada_2 : IN  std_logic_vector(31 downto 0);
         Salida_Sum : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Entrada_2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Salida_Sum : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          Entrada_1 => Entrada_1,
          Entrada_2 => Entrada_2,
          Salida_Sum => Salida_Sum
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      
		Entrada_1 <= x"0000000e";
		Entrada_2 <= x"00000001";

      wait;
   end process;

END;
