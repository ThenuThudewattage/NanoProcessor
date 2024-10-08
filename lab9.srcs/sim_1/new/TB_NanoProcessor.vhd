----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 12:30:19 PM
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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
entity TB_NanoProcessor is
-- Port ( );
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is

COMPONENT NanoProcessor
     Port ( CLK : in STD_LOGIC;
     Reset : in STD_LOGIC:='0';
     Over_f : out STD_LOGIC;
     R7_led : out STD_LOGIC_VECTOR (3 downto 0);
     R7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
     ZeroF : out STD_LOGIC;
     Anode:out std_logic_vector(3 downto 0):="0111");
END COMPONENT;

SIGNAL clk:std_logic:='0';
signal Reset,Over_f,ZeroF:std_logic;
signal R7_led:std_logic_vector(3 downto 0);
signal R7_7Seg:std_logic_vector(6 downto 0);
signal Anode:std_logic_vector(3 downto 0);

begin
UUT:NanoProcessor
     PORT MAP(
     CLK=>clk,
     Reset=>Reset,
     Over_f=>Over_f,
     R7_led=>R7_led,
     R7_7Seg=>R7_7Seg,
     ZeroF=>ZeroF,
     Anode=>Anode);
 
process 
     begin
     Clk <= not(Clk);
     wait for 2ns;
     
 end process;
 
process
     begin
     Reset<='1';
     wait for 50ns;
     Reset<='0';
     wait for 600ns;
     
     Reset <= '1';
     wait;
     end process;
end Behavioral;
