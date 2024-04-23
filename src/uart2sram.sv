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

module uart2sram #(
  parameter int DATA_WIDTH = 8,
  parameter int ADDR_WIDTH = 8,
  parameter int BAUD_WIDTH = 16
) (
  // Clock/Reset Signals
  input  logic clk_in,
  input  logic rst_low_in,

  // UART Interface
  input  logic uart_rx,
  output logic uart_tx,

  // SRAM Interface
  output logic sram_wr_clk,
  output logic sram_wr_en,
  output logic [ADDR_WIDTH-1:0] sram_wr_addr,
  output logic [DATA_WIDTH-1:0] sram_wr_data,

  output logic sram_rd_clk,
  output logic sram_rd_en,
  output logic [ADDR_WIDTH-1:0] sram_rd_addr,
  input  logic [DATA_WIDTH-1:0] sram_rd_data,

  // Control Signals
  input  logic [BAUD_WIDTH-1:0] baud_rate_cycles
);

endmodule