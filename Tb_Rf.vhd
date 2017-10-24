--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:17:59 10/02/2017
-- Design Name:   
-- Module Name:   C:/Users/joanc/Desktop/Procesador_1/Procesador_1/Tb_Rf.vhd
-- Project Name:  Procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Rf
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
 
ENTITY Tb_Rf IS
END Tb_Rf;
 
ARCHITECTURE behavior OF Tb_Rf IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Rf
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Reset : IN  std_logic;
         Crd_Alu : IN  std_logic_vector(31 downto 0);
         Crs1 : OUT  std_logic_vector(31 downto 0);
         Crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Crd_Alu : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Crs1 : std_logic_vector(31 downto 0);
   signal Crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Rf PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Reset => Reset,
          Crd_Alu => Crd_Alu,
          Crs1 => Crs1,
          Crs2 => Crs2
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      Reset <= '1';
      wait for 20 ns;
			Reset <='0';
			Rs1 <= "10000";
			Rs2 <= "10001";
			Rd <= "10010";
			Crd_Alu <= x"00000001";

      wait;
   end process;

END;
