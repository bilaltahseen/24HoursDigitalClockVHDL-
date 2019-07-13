library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCDTOSEGM is
   port (
      data_inpins:in signed(3 downto 0);
      data_outpins:out signed(6 downto 0)
      

   );
end entity BCDTOSEGM;

architecture working of BCDTOSEGM is
begin
   process(data_inpins)
   begin
   case data_inpins is   
      when "0000" =>
      data_outpins <= "1111110";
      when "0001" =>
      data_outpins <= "0110000";
      when "0010" =>
      data_outpins <= "1101101";
      when "0011" =>
      data_outpins <= "1111001";
      when "0100" =>
      data_outpins <= "0110011";
      when "0101" =>
      data_outpins <= "1011011";
      when "0110" =>
      data_outpins <= "1011111";
      when "0111" =>
      data_outpins <= "1110000";
      when "1000" =>
      data_outpins <= "1111111";
      when "1001" =>
      data_outpins <= "1111011";
      when others =>
      data_outpins <= "1111110";
   end case;
   end process;
end architecture working;