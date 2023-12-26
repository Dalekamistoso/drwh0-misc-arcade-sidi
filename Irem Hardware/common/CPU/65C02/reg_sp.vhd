-- VHDL Entity r65c02_tc.reg_sp.symbol
--
-- Created:
--          by - eda.UNKNOWN (ENTW-7HPZ200)
--          at - 12:04:08 06.09.2018
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity reg_sp is
   port( 
      adr_low_i   : in     std_logic_vector (7 downto 0);
      clk_clk_i   : in     std_logic;
      ld_low_i    : in     std_logic;
      ld_sp_i     : in     std_logic;
      rst_rst_n_i : in     std_logic;
      sel_sp_as_i : in     std_logic;
      sel_sp_in_i : in     std_logic;
      ce          : in     std_logic;
      adr_sp_o    : out    std_logic_vector (15 downto 0)
   );

-- Declarations

end reg_sp ;

-- (C) 2008 - 2018 Jens Gutschmidt
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 1.7  2013/07/21 11:11:00  jens
-- - Changing the title block and internal revision history
-- 
-- Revision 1.6  2009/01/04 10:20:47  eda
-- Changes for cosmetic issues only
-- 
-- Revision 1.5  2009/01/04 09:23:10  eda
-- - Delete unused nets and blocks (same as R6502_TC)
-- - Rename blocks
-- 
-- Revision 1.4  2009/01/03 16:53:02  eda
-- - Unused nets and blocks deleted
-- - Renamed blocks
-- 
-- Revision 1.3  2009/01/03 16:42:02  eda
-- - Unused nets and blocks deleted
-- - Renamed blocks
-- 
-- Revision 1.2  2008/12/31 19:31:24  eda
-- Production Release
--  
-- 
--
-- VHDL Architecture r65c02_tc.reg_sp.struct
--
-- Created:
--          by - eda.UNKNOWN (ENTW-7HPZ200)
--          at - 12:04:08 06.09.2018
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2016.2 (Build 5)
--
-- COPYRIGHT (C) 2008 - 2018 by Jens Gutschmidt
-- 
-- This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
-- 
-- This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


architecture struct of reg_sp is

   -- Architecture declarations

   -- Internal signal declarations
   signal adr_sp_low_o_i  : std_logic_vector(7 downto 0);
   signal load_o_i        : std_logic;
   signal result_low1_o_i : std_logic_vector(7 downto 0);
   signal result_low_o_i  : std_logic_vector(7 downto 0);
   signal sp_as_n_o_i     : std_logic;
   signal val_one         : std_logic_vector(7 downto 0);

   -- Implicit buffer signal declarations
   signal adr_sp_o_internal : std_logic_vector (15 downto 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_0' of 'adff'
   signal mw_U_0reg_cval : std_logic_vector(7 downto 0);


begin

   -- ModuleWare code(v1.12) for instance 'U_11' of 'addsub'
   u_11combo_proc: process (adr_sp_low_o_i, val_one, sp_as_n_o_i)
   variable temp_din0 : std_logic_vector(8 downto 0);
   variable temp_din1 : std_logic_vector(8 downto 0);
   variable temp_sum : unsigned(8 downto 0);
   variable temp_carry : std_logic;
   begin
      temp_din0 := '0' & adr_sp_low_o_i;
      temp_din1 := '0' & val_one;
      temp_carry := '0';
      if (sp_as_n_o_i = '1') then
         temp_sum := unsigned(temp_din0) + unsigned(temp_din1) + temp_carry;
      else
         temp_sum := unsigned(temp_din0) - unsigned(temp_din1) - temp_carry;
      end if;
      result_low_o_i <= conv_std_logic_vector(temp_sum(7 downto 0),8);
   end process u_11combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_0' of 'adff'
   adr_sp_o_internal(7 DOWNTO 0) <= mw_U_0reg_cval;
   u_0seq_proc: process (clk_clk_i, ce, rst_rst_n_i)
   begin
      if (rst_rst_n_i = '0') then
         mw_U_0reg_cval <= "00000000";
      elsif (clk_clk_i'event and clk_clk_i='1' and ce = '1') then
         if (load_o_i = '1') then
            mw_U_0reg_cval <= result_low1_o_i;
         end if;
      end if;
   end process u_0seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'and'
   load_o_i <= ld_sp_i and ld_low_i;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'buff'
   adr_sp_o_internal(15 DOWNTO 8) <= val_one;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'constval'
   val_one <= "00000001";

   -- ModuleWare code(v1.12) for instance 'U_2' of 'inv'
   sp_as_n_o_i <= not(sel_sp_as_i);

   -- ModuleWare code(v1.12) for instance 'U_8' of 'mux'
   u_8combo_proc: process(result_low_o_i, adr_low_i, sel_sp_in_i)
   begin
      case sel_sp_in_i is
      when '0' => result_low1_o_i <= result_low_o_i;
      when '1' => result_low1_o_i <= adr_low_i;
      when others => result_low1_o_i <= (others => 'X');
      end case;
   end process u_8combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_10' of 'tap'
   adr_sp_low_o_i <= adr_sp_o_internal(7 downto 0);

   -- Instance port mappings.

   -- Implicit buffered output assignments
   adr_sp_o <= adr_sp_o_internal;

end struct;
