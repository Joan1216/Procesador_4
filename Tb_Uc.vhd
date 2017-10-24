--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:06:21 30/09/2017
-- Design Name:   
-- Module Name:   C:/Users/joanc/Desktop/Procesador_1/Procesador_1/Tb_Uc.vhd
-- Project Name:  Procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Uc
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
 
ENTITY Tb_Uc IS
END Tb_Uc;
 
ARCHITECTURE behavior OF Tb_Uc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Uc
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         Salida_Uc : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Salida_Uc : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Uc PORT MAP (
          Op => Op,
          Op3 => Op3,
          Salida_Uc => Salida_Uc
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      Op <= "10";
		Op3 <= "000000";

      wait;
   end process;

END;
