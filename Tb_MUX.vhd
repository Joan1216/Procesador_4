--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:40:46 10/07/2017
-- Design Name:   
-- Module Name:   C:/Users/joanc/Desktop/Procesador_1/Procesador_1/Tb_MUX.vhd
-- Project Name:  Procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX
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
 
ENTITY Tb_MUX IS
END Tb_MUX;
 
ARCHITECTURE behavior OF Tb_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         RF_In : IN  std_logic_vector(31 downto 0);
         SEU_In : IN  std_logic_vector(31 downto 0);
         Inm_Bit : IN  std_logic;
         MUX_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
 
   --Inputs
   signal RF_In : std_logic_vector(31 downto 0) := (others => '0');
   signal SEU_In : std_logic_vector(31 downto 0) := (others => '0');
   signal Inm_Bit : std_logic := '0';

 	--Outputs
   signal MUX_Out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          RF_In => RF_In,
          SEU_In => SEU_In,
          Inm_Bit => Inm_Bit,
          MUX_Out => MUX_Out
        ); 
 
   -- Stimulus process
   stim_proc: process
   begin	
		Inm_Bit <= '0';
		RF_In <=  "00000000000000000000000000000000";
		SEU_In <= "00000000000000000000000000000001";
		wait;
      
   end process;

END;
