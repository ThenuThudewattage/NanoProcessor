----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 09:57:04 AM
-- Design Name: 
-- Module Name: RCA_3_Sim - Behavioral
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

entity RCA_3_Sim is
--  Port ( );
end RCA_3_Sim;

architecture Behavioral of RCA_3_Sim is

component RCA_3
    Port (I : in std_logic_vector(2 downto 0);
          S_OUT : out std_logic_vector(2 downto 0));

end component;

signal I : std_logic_vector(2 downto 0);
signal S_out : std_logic_vector(2 downto 0):= "000";

begin
UUT: RCA_3 
port map(
    I => I,
    S_out => S_out
    );

process begin 
 
 I<="000";
 wait for 20ns;
 
 I<="001";
 wait for 20ns;
 
 I<="010";
 wait for 20ns;
 
 I<="011";
 wait for 20ns;
 
 I<="100";
 wait for 20ns;

 I<="101";
 wait for 20ns;
 
 I<="110";
 wait for 20ns;
 
 I<="111";
 wait for 20ns;
 
 end process;

end Behavioral;
