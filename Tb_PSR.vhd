--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:58:53 10/12/2017
-- Design Name:   
-- Module Name:   C:/Users/joanc/Desktop/Procesador_1/Procesador_1/Tb_PSR.vhd
-- Project Name:  Procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR
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
 
ENTITY Tb_PSR IS
END Tb_PSR;
 
ARCHITECTURE behavior OF Tb_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         PSR_In : IN  std_logic_vector(3 downto 0);
         Reset : IN  std_logic;
         PSR_Out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PSR_In : std_logic_vector(3 downto 0) := (others => '0');
   signal Reset : std_logic := '0';

 	--Outputs
   signal PSR_Out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          PSR_In => PSR_In,
          Reset => Reset,
          PSR_Out => PSR_Out
        );


   -- Stimulus process
   stim_proc: process
   begin		
      Reset <= '1';
      wait for 100 ns;	
		Reset <= '0';
		PSR_In <= "1001";

      wait;
   end process;

END;
