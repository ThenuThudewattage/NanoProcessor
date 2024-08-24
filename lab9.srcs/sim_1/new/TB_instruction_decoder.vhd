----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 03:53:02 PM
-- Design Name: 
-- Module Name: TB_instruction_decoder - Behavioral
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

entity TB_instruction_decoder is
--  Port ( );
end TB_instruction_decoder;

architecture Behavioral of TB_instruction_decoder is

component Instruction_decoder
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
 
 signal ins : STD_LOGIC_VECTOR (11 downto 0);
 signal reg, imVal : STD_LOGIC_VECTOR (3 downto 0);
 signal reg_en, reg1, reg2, jmpAdd : STD_LOGIC_VECTOR (2 downto 0);
 signal l_select, sub, jmpFlag : STD_LOGIC;
 
begin
UUT : Instruction_decoder
     PORT MAP(
         Ins => ins,
         Reg => reg,
         Reg_Enable => reg_en,
         LoadSelect => l_select,
         ImVal => imVal,
         RegA => reg1,
         RegB => reg2,
         Sub => sub,
         Jump => jmpFlag,
         JumpAdress => jmpAdd
 );
 
 process
 begin
 wait for 100ns;
 ins <= "100010000011"; --move R1 3
 reg <= "0001"; 
 
wait for 100ns;
ins <= "100100000010"; --move R2 2
reg <= "0001"; 

wait for 100ns;
ins <= "000010100000"; --add R1 R2
reg <= "0001"; 
   
 wait for 100ns;
 ins <= "010100000000"; --neg R2
 reg <= "0001";
 
 wait;
 
 end process;
end Behavioral;

