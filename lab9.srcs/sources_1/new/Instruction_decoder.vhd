----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 03:49:47 PM
-- Design Name: 
-- Module Name: Instruction_decoder - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_decoder is
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
end Instruction_decoder;

architecture Behavioral of Instruction_decoder is
begin
process (Ins, Reg) begin
 JumpAdress <= "000";
 
 if (Ins(11) = '1') and (Ins(10) = '0') then --move signal
     Reg_Enable <= (Ins(9), Ins(8), Ins(7));
     ImVal <= (Ins(3), Ins(2), Ins(1), Ins(0));
     LoadSelect <= '0'; -- immediate value is selected if load select is set to 0
     Jump <= '0'; --since this is not a jump instruction
 
 elsif (Ins(11) = '0') and (Ins(10) = '0') then --add signal
     Reg_Enable <= (Ins(9), Ins(8), Ins(7));
     RegA <= (Ins(9), Ins(8), Ins(7));
     RegB <= (Ins(6), Ins(5), Ins(4));
     sub <= '0';
     LoadSelect <= '1'; -- add sbtract unit is selected if load select is set to 1
     Jump <= '0'; 
 
 elsif (Ins(11) = '0') and (Ins(10) = '1') then --neg signal
     Reg_Enable <= (Ins(9), Ins(8), Ins(7));
     RegA <= "000";
     RegB <= (Ins(9), Ins(8), Ins(7));
     Sub <= '1'; 
     LoadSelect <= '1'; 
     Jump <= '0';
 
 elsif (Ins(11) = '1') and (Ins(10) = '1') then --jump 
     LoadSelect <= '0';
     RegA <= (Ins(9), Ins(8), Ins(7));
     Reg_Enable <= "000";
     
     if (to_integer(unsigned(Reg)) = 0) then
         Jump <= '1';
         JumpAdress <= (Ins(2), Ins(1), Ins(0));
     else
        Jump <= '0';
     end if;
     
 end if; 
 
end process;
end Behavioral;
