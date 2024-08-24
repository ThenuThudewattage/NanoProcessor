----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 02:39:37 PM
-- Design Name: 
-- Module Name: TB_RCA_S - Behavioral
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

entity TB_RCA_S is
--  Port ( );
end TB_RCA_S;

architecture Behavioral of TB_RCA_S is
component RCA_S
      Port (   A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Option : in STD_LOGIC;
               S_out : out STD_LOGIC_VECTOR (3 downto 0);
               Carry : out STD_LOGIC;
               Zero : out STD_LOGIC);
end component;

signal S_1:std_logic_vector(3 downto 0);
signal S_2:std_logic_vector(3 downto 0);
signal Op_sel:std_logic;
signal zero:std_logic;
signal overflow:std_logic;
signal S_out:std_logic_vector(3 downto 0);

begin
  uut:RCA_S
  port map(
   A=>S_1,
   B=>S_2,
   Option=>Op_sel,
   S_out=>S_out,
   Zero=>zero,
   Carry=>overflow 
   
   );
   
   process begin 
   
   --addition, when Op_sel=0
   --index no 210652L - 11 0011 0110 1101 1100
   --index no 210326R - 11 0011 0101 1001 0110
    S_1<="0000"; --0
    S_2<="0000"; --0
    OP_sel<='0';
    wait for 100ns;
    
    S_1<="1100"; --12
    S_2<="0110"; --6
    wait for 100ns;
    
    S_1<="0110"; --6
    S_2<="0101"; --5
    wait for 100ns;
    
    S_1<="0011"; --3
    S_2<="0011"; --3
    wait for 100ns;
    
    --subtraction, when Op_sel=1
   --index no 210652L - 11 0011 0110 1101 1100
   --index no 210326R - 11 0011 0101 1001 0110
    S_1<="0000"; 
    S_2<="0000";
    OP_sel<='1';
    wait for 100ns;
    
    S_1<="1100"; --12
    S_2<="0110"; --6
    wait for 100ns;
    
    S_1<="0110"; --6
    S_2<="0101"; --5
    wait for 100ns;
    
    S_1<="0011"; --3
    S_2<="0011"; --3
    wait;
    end process;


end Behavioral;