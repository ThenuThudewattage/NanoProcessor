----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 05:12:38 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NanoProcessor is
     Port ( CLK : in STD_LOGIC;
     Reset : in STD_LOGIC; -- change here
     Over_f : out STD_LOGIC;
     R7_led : out STD_LOGIC_VECTOR (3 downto 0);
     R7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
     ZeroF : out STD_LOGIC;
     Anode:out std_logic_vector(3 downto 0):="0111");
end NanoProcessor;

architecture Behavioral of NanoProcessor is

 component Instruction_Decoder 
      Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Reg : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSelect : out STD_LOGIC;
           ImVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegA : out STD_LOGIC_VECTOR (2 downto 0);
           RegB : out STD_LOGIC_VECTOR (2 downto 0);
           Sub : out STD_LOGIC;
           Jump : out STD_LOGIC;
           JumpAdress : out STD_LOGIC_VECTOR (2 downto 0));
 end component; 
 
 component Register_bank 
     Port ( Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
     Clk : in STD_LOGIC;
     reset : in STD_LOGIC;
     Q0 : out STD_LOGIC_VECTOR (3 downto 0);
     Q1 : out STD_LOGIC_VECTOR (3 downto 0);
     Q2 : out STD_LOGIC_VECTOR (3 downto 0);
     Q3 : out STD_LOGIC_VECTOR (3 downto 0);
     Q4 : out STD_LOGIC_VECTOR (3 downto 0);
     Q5 : out STD_LOGIC_VECTOR (3 downto 0);
     Q6 : out STD_LOGIC_VECTOR (3 downto 0);
     Q7 : out STD_LOGIC_VECTOR (3 downto 0);
     D : in STD_LOGIC_VECTOR (3 downto 0));
 end component; 
 
 component Program_rom
    Port ( Memory_select : in STD_LOGIC_VECTOR (2 downto 0);
            Ins : out STD_LOGIC_VECTOR (11 downto 0));
 end component; 
 
 component PC
    Port ( Mux_in : in STD_LOGIC_VECTOR (2 downto 0):= "000";
            Res : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Memory_select : out STD_LOGIC_VECTOR (2 downto 0) := "000");
 end component; 
 
 component RCA_S
     Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         Option : in STD_LOGIC;
         S_out : out STD_LOGIC_VECTOR (3 downto 0);
         Carry : out STD_LOGIC;
         Zero :out std_logic);
 end component; 
 
 component RCA_3
     Port ( I : in STD_LOGIC_VECTOR (2 downto 0):="000";
         S_out : out STD_LOGIC_VECTOR (2 downto 0):="000");
 end component; 
 
 component Mux_8_way_4_bit
     Port (   Reg_0 : in STD_LOGIC_VECTOR (3 downto 0);
              Reg_1 : in STD_LOGIC_VECTOR (3 downto 0);
              Reg_2 : in STD_LOGIC_VECTOR (3 downto 0);
              Reg_3 : in STD_LOGIC_VECTOR (3 downto 0);
              Reg_4 : in STD_LOGIC_VECTOR (3 downto 0);
              Reg_5 : in STD_LOGIC_VECTOR (3 downto 0);
              Reg_6 : in STD_LOGIC_VECTOR (3 downto 0);
              Reg_7 : in STD_LOGIC_VECTOR (3 downto 0);
              Reg_select : in STD_LOGIC_VECTOR (2 downto 0);
              Y : out STD_LOGIC_VECTOR (3 downto 0));
 end component; 
 
 component Mux_2_to_1_3bit
     Port (   pc_in : in STD_LOGIC_VECTOR (2 downto 0):= "000";
              Address_to_jmp : in STD_LOGIC_VECTOR (2 downto 0):="000";
              Jmp_flag : in STD_LOGIC;
              Mux_out : out STD_LOGIC_VECTOR (2 downto 0):="000" );
 end component; 
 
 component Mux_2_way_4bit
     Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
         D1 : in STD_LOGIC_VECTOR (3 downto 0);
         S : in STD_LOGIC;
         Y : out STD_LOGIC_VECTOR (3 downto 0));
 end component; 
 
 component LUT_16_7
     Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
        data : out STD_LOGIC_VECTOR (6 downto 0));
 end component;
 
 component Slow_Clk
     Port ( Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC);
 end component; 
 
signal Ins : STD_LOGIC_VECTOR (11 downto 0);
signal ImVal,A,D_reg,A1,A2,R0,R1,R2,R3,R4,R5,R6,R7 : STD_LOGIC_VECTOR (3 downto 0):="0000";
signal RegEN,RegSel1,Jmadd,RegSel2,MemSel,ThAd_out: STD_LOGIC_VECTOR (2 downto 0):="000";
signal S_outPC:STD_LOGIC_VECTOR (2 downto 0):="000";
signal LSel,AdSel,JMPF,ThAd_ov,RCAEN:std_logic;
signal Clk_slow:std_logic;


begin
Slow_Clk_0:Slow_Clk
 port map(
 Clk_in=>CLK,
 Clk_out=>Clk_slow); 
 
Instruction_Decoder_0:Instruction_Decoder
     port map(Ins=>Ins,
     Reg => A1,
     ImVal=>ImVal,
     Reg_enable => RegEN,
     RegA => RegSel1,
     JumpAdress => Jmadd,
     RegB =>RegSel2,
     LoadSelect =>LSel,
     Sub =>AdSel,
     Jump =>JMPF); 
     
MUX_2_to_1_4bit_0: Mux_2_way_4bit
     PORT MAP(
         D0 => A,
         D1 => ImVal,
         S => LSel,
         Y => D_reg); 
 
RCA_4_0:RCA_S
     port map(
         A => A1,
         B => A2,
         Option => AdSel,
         S_out => A,
         Carry => Over_f,
         Zero => ZeroF); 
 
MUX_8_to_1_0: Mux_8_way_4_bit
     PORT MAP(
         Reg_0=>R0,
         Reg_1=>R1,
         Reg_2=>R2,
         Reg_3=>R3,
         Reg_4=>R4,
         Reg_5=>R5,
         Reg_6=>R6,
         Reg_7=>R7,
         Reg_select =>RegSel1,
         Y=>A1); 
 
MUX_8_to_1_1: Mux_8_way_4_bit
     PORT MAP(
         Reg_0=>R0,
              Reg_1=>R1,
              Reg_2=>R2,
              Reg_3=>R3,
              Reg_4=>R4,
              Reg_5=>R5,
              Reg_6=>R6,
              Reg_7=>R7,
              Reg_select =>RegSel2,
              Y=>A2); 
 
Adder_3bit: RCA_3
     port map(
         I =>MemSel,
         S_out =>ThAd_out); 
 
MUX_2_to_1_3bit_0: Mux_2_to_1_3bit 
     port map(
         pc_in=> ThAd_out,
         Address_to_jmp => Jmadd,
         Jmp_flag => JMPF,
         Mux_out => S_outPC); 
 
Program_Counter_0:PC
     PORT MAP(
         Mux_in=>S_outPC,
         Memory_select=>MemSel,
         Res=>Reset,
         Clk=>Clk_slow); 
 
Program_ROM_0:Program_rom
     port map(
     Memory_select => MemSel,
     Ins => Ins); 
 
Register_bank_0:Register_bank
     port map(
     Reg_en=>RegEN,
     Clk=>Clk_slow,
     reset=>Reset,
     Q0=>R0,
     Q1=>R1,
     Q2=>R2,
     Q3=>R3,
     Q4=>R4,
     Q5=>R5,
     Q6=>R6,
     Q7=>R7,
     D=>D_reg); 
 
LUT_16_7_0:LUT_16_7
     PORT MAP(
         address=>R7,
         data=>R7_7Seg); 
        R7_led<=R7; 
 
 
end Behavioral;

