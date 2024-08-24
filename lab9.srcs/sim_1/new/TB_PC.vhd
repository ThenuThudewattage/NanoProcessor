----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 02:45:55 PM
-- Design Name: 
-- Module Name: TB_PC - Behavioral
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

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is
component PC
Port (     Mux_in : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Memory_select : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal clr : STD_LOGIC;
signal clk : STD_LOGIC := '0';
signal D : STD_LOGIC_VECTOR (2 downto 0);
signal Q : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT : PC
PORT MAP( Clk => clk,
            Res => clr,
            Mux_in => D,
            Memory_select => Q
);

process
    begin
      clk <= '1';
      wait for 10 ns;
      clk <= '0';
      wait for 10 ns;
end process;

process 
begin
  clr <='1';
  D <="000";
  wait for 50ns;
  
  D <="001";
  wait for 50ns;
  
  D <="010";
  wait for 50ns;
  
  D <="011";
  wait for 50ns;
  
  clr <= '0';
  D <="100";
  wait for 50ns;
  
  D <="101";
  wait for 50ns;
    
  D <="110";
  wait for 50ns;
  
  D <="111";
  wait for 50ns;
end process;
end Behavioral;
