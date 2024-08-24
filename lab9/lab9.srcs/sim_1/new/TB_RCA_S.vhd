----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:03:02 AM
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

signal this_S_1:std_logic_vector(3 downto 0);
signal this_S_2:std_logic_vector(3 downto 0);
signal this_Op_sel:std_logic;
signal this_Zero:std_logic;
signal this_Overflow:std_logic;
signal S_out:std_logic_vector(3 downto 0);

begin
  uut:RCA_S
  port map(
   A=>this_S_1,
   B=>this_S_2,
   Option=>this_Op_sel,
   S_out=>S_out,
   Zero=>this_Zero,
   Carry=>this_Overflow 
   
   );
   
   process begin 
   
   --subtraction, when Op_sel=1
   this_S_1<="0000";
   this_S_2<="0000";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0001";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0010";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0011";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0100";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0101";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0110";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0111";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1000";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1001";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1010";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1011";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1100";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1101";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1110";
   this_OP_sel<='1';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1111";
   this_OP_sel<='1';
   wait for 20ns;
   
   
   
   --addition , when Op_sel=0
   this_S_1<="0000";
   this_S_2<="0000";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0001";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0010";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0011";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0100";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0101";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0110";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="0111";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1000";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1001";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1010";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1011";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1100";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1101";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1110";
   this_OP_sel<='0';
   wait for 20ns;
   
   this_S_1<="0000";
   this_S_2<="1111";
   this_OP_sel<='0';
   wait for 20ns;
   end process;


end Behavioral;
