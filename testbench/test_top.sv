/**************************************************************************
 * UART2Register Implementation converting to SRAM interface
 * Copyright (C) 2024, RISCY-Lib Contributors
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.
 * If not, see <https://www.gnu.org/licenses/>.
 **************************************************************************/

module test_top();

  // Imports
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import test_lib_pkg::*;

  // Agents
  clk_rst_if clk_rst();
  clk_rst_driver_bfm clk_rst_drv_bfm(clk_rst);

  uart_if uart();

  sram_if #(
    .DATA_WIDTH(8),
    .ADDR_WIDTH(8)
  ) sram (
    .rst_n(clk_rst.rst_n[0])
  );

  // DUT Instantiation
  uart2sram dut (
    .clk_in(clk_rst.clk[0]),
    .rst_low_in(clk_rst.rst_n[0]),

    .uart_rx(uart.rx),
    .uart_tx(uart.tx),

    .sram_wr_clk(sram.wr_clk),
    .sram_wr_en(sram.wr_en),
    .sram_wr_addr(sram.wr_addr),
    .sram_wr_data(sram.wr_data),

    .sram_rd_clk(sram.rd_clk),
    .sram_rd_en(sram.rd_en),
    .sram_rd_addr(sram.rd_addr),
    .sram_rd_data(sram.rd_data),

    .baud_rate_cycles(16'h1000)
  );

  // Testbench Initialization
  initial begin
    run_test();
  end
endmodule