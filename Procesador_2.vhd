----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:25:13 10/08/2017 
-- Design Name: 
-- Module Name:    Procesador_2 - Behavioral 
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

entity Procesador_2 is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Salida_Procesador_2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador_2;

architecture Behavioral of Procesador_2 is

COMPONENT Sumador
	PORT(
		Entrada_1 : IN std_logic_vector(31 downto 0);
		Entrada_2 : IN std_logic_vector(31 downto 0);          
		Salida_Sum : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Pc
	PORT(
		Clk : IN std_logic;
		Reset : IN std_logic;
		Senal : IN std_logic_vector(31 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT instructionMemory
	PORT(
		clk : IN std_logic;
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Uc
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		Salida_Uc : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
COMPONENT Rf
	PORT(
		Rs1 : IN std_logic_vector(5 downto 0);
		Rs2 : IN std_logic_vector(5 downto 0);
		Rd : IN std_logic_vector(5 downto 0);
		Reset : IN std_logic;
		Crd_Alu : IN std_logic_vector(31 downto 0);          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT MUX
	PORT(
		RF_In : IN std_logic_vector(31 downto 0);
		SEU_In : IN std_logic_vector(31 downto 0);
		Inm_Bit : IN std_logic;          
		MUX_Out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT SEU
	PORT(
		Inmediato_In : IN std_logic_vector(12 downto 0);          
		Inmediato_Out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Alu
	PORT(
		Entrada_Uc : IN std_logic_vector(5 downto 0);
		Entrada_PSR : IN std_logic;
		Entrada_Rf1 : IN std_logic_vector(31 downto 0);
		Entrada_Rf2 : IN std_logic_vector(31 downto 0);          
		Salida_Alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT PSRM
	PORT(
		Iu_In : IN std_logic_vector(5 downto 0);
		Reset : IN std_logic;
		Alu_In : IN std_logic_vector(31 downto 0);
		MUX_In : IN std_logic_vector(31 downto 0);
		RF_In : IN std_logic_vector(31 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT PSR
	PORT(
		PSR_In : IN std_logic_vector(3 downto 0);
		NCWP : IN std_logic;
		Reset : IN std_logic;          
		CWP : OUT std_logic;
		PSR_Out : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT WindowsManager
	PORT(
		Rs1 : IN std_logic_vector(4 downto 0);
		Rs2 : IN std_logic_vector(4 downto 0);
		Rd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		CWP : IN std_logic;          
		NuevoRs1 : OUT std_logic_vector(5 downto 0);
		NuevoRs2 : OUT std_logic_vector(5 downto 0);
		NuevoRd : OUT std_logic_vector(5 downto 0);
		NuevoCWP : OUT std_logic
		);
	END COMPONENT;

signal SumadoToNpc, NpcToPc, PcToIm, ImToMURS, AluToRes, RFToAlu, RFToMUX, SEUToMUX, MUXToAlu: STD_LOGIC_VECTOR (31 downto 0);
signal UcToAlu, Nrs1, Nrs2, Nrd: STD_LOGIC_VECTOR(5 downto 0);
signal PSRMToPSR: STD_LOGIC_VECTOR(3 downto 0);
signal PSRToAlu, Scwp, Sncwp: STD_LOGIC;

begin

Inst_Sumador: Sumador PORT MAP(
		Entrada_1 => X"00000001",
		Entrada_2 => NpcToPc,
		Salida_Sum => SumadoToNpc
	);
	
Inst_Pc: Pc PORT MAP( 
		Clk => Clk,
		Reset => Reset,
		Senal => SumadoToNpc,
		Salida => NpcToPc
	);
	
Inst_Npc: Pc PORT MAP(
		Clk => Clk,
		Reset => Reset,
		Senal => NpcToPc,
		Salida => PcToIm
	);
	
Inst_instructionMemory: instructionMemory PORT MAP(
		clk => clk,
		address => PcToIm,
		reset => reset,
		outInstruction => ImToMURS
	);

Inst_Uc: Uc PORT MAP(
		Op => ImToMURS (31 downto 30),
		Op3 => ImToMURS (24 downto 19),
		Salida_Uc => UcToAlu
		);
		
Inst_Rf: Rf PORT MAP(
		Rs1 => Nrs1,
		Rs2 => Nrs2,
		Rd => Nrd,
		Reset => Reset,
		Crd_Alu => AluToRes,
		Crs1 => RFToAlu,
		Crs2 => RFToMUX
	);

Inst_MUX: MUX PORT MAP(
		RF_In => RFToMUX,
		SEU_In => SEUToMUX,
		Inm_Bit => ImToMURS (13),
		MUX_Out => MUXToAlu
	);
	
Inst_SEU: SEU PORT MAP(
		Inmediato_In => ImToMURS (12 downto 0),
		Inmediato_Out => SEUToMUX
	);
	
Inst_Alu: Alu PORT MAP(
		Entrada_Uc => UcToAlu,
		Entrada_PSR => PSRToAlu,
		Entrada_Rf1 => RFToAlu,
		Entrada_Rf2 => MUXToAlu,
		Salida_Alu => AluToRes
	);
	
Inst_PSRM: PSRM PORT MAP(
		Iu_In => UcToAlu,
		Reset => Reset,
		Alu_In => AluToRes,
		MUX_In => MUXToAlu,
		RF_In => RFToAlu,
		nzvc => PSRMToPSR
	);
	
Inst_PSR: PSR PORT MAP(
		PSR_In => PSRMToPSR,
		CWP => Scwp,
		NCWP => Sncwp,
		Reset => Reset,
		PSR_Out => PSRToAlu 
	);
	
Inst_WindowsManager: WindowsManager PORT MAP(
		Rs1 => ImToMURS (18 downto 14),
		Rs2 => ImToMURS (4 downto 0),
		Rd => ImToMURS (29 downto 25),
		op => ImToMURS (31 downto 30),
		op3 => ImToMURS (24 downto 19),
		CWP => Scwp,
		NuevoRs1 => Nrs1,
		NuevoRs2 => Nrs2,
		NuevoRd => Nrd,
		NuevoCWP => Sncwp 
	);
	
	Salida_Procesador_2 <= AluToRes;
	
end Behavioral;

