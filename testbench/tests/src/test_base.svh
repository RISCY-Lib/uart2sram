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

class test_base extends uvm_test;
  `uvm_component_utils(test_base)

  function new(string name = "test_base", uvm_component parent = null);
    super.new(name, parent);
  endfunction

endclass