library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity mw01 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of mw01 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"F3",X"31",X"7C",X"02",X"C3",X"36",X"02",X"C7",X"F5",X"AF",X"32",X"05",X"20",X"C3",X"49",X"00",
		X"F5",X"3E",X"80",X"C3",X"0A",X"00",X"C7",X"C7",X"F3",X"E5",X"D5",X"C5",X"F5",X"C3",X"2B",X"01",
		X"F3",X"CD",X"0F",X"02",X"47",X"C3",X"D4",X"01",X"F3",X"CD",X"0F",X"02",X"47",X"C3",X"F3",X"01",
		X"F3",X"CD",X"0F",X"02",X"2F",X"C3",X"FB",X"01",X"F3",X"CD",X"0F",X"02",X"79",X"C3",X"04",X"02",
		X"AF",X"77",X"23",X"05",X"C2",X"41",X"00",X"C9",X"C7",X"AF",X"32",X"0B",X"20",X"22",X"26",X"20",
		X"21",X"00",X"00",X"39",X"22",X"28",X"20",X"F1",X"2A",X"26",X"20",X"E5",X"2A",X"0C",X"20",X"F9",
		X"2A",X"28",X"20",X"E5",X"D5",X"C5",X"F5",X"3A",X"06",X"20",X"F5",X"21",X"00",X"00",X"39",X"22",
		X"0C",X"20",X"EB",X"2A",X"9E",X"02",X"EB",X"7A",X"2F",X"57",X"7B",X"2F",X"5F",X"19",X"D2",X"BA",
		X"00",X"3A",X"0B",X"20",X"A7",X"C2",X"7B",X"01",X"CD",X"B6",X"02",X"21",X"07",X"20",X"7E",X"23",
		X"A6",X"CA",X"05",X"01",X"47",X"23",X"4E",X"21",X"1E",X"20",X"16",X"80",X"7A",X"A0",X"CA",X"AC",
		X"00",X"35",X"C2",X"AC",X"00",X"A1",X"C2",X"BA",X"00",X"7A",X"B1",X"4F",X"23",X"7A",X"2F",X"A0",
		X"47",X"CA",X"BE",X"00",X"7A",X"1F",X"57",X"C3",X"9D",X"00",X"2A",X"A2",X"02",X"E9",X"21",X"09",
		X"20",X"71",X"7E",X"2F",X"2B",X"A6",X"77",X"2A",X"0C",X"20",X"F9",X"0E",X"80",X"3A",X"09",X"20",
		X"47",X"3A",X"0A",X"20",X"2F",X"A0",X"5F",X"3A",X"07",X"20",X"A3",X"CA",X"05",X"01",X"11",X"0E",
		X"20",X"78",X"A1",X"C2",X"EE",X"00",X"79",X"1F",X"4F",X"13",X"13",X"C3",X"E1",X"00",X"2F",X"A0",
		X"32",X"09",X"20",X"79",X"32",X"06",X"20",X"1A",X"6F",X"13",X"1A",X"67",X"F9",X"F1",X"C1",X"D1",
		X"E1",X"D3",X"06",X"FB",X"C9",X"F3",X"2A",X"0C",X"20",X"F9",X"01",X"0A",X"00",X"09",X"22",X"0C",
		X"20",X"F1",X"A7",X"CA",X"1E",X"01",X"47",X"3A",X"07",X"20",X"A0",X"CA",X"05",X"01",X"32",X"06",
		X"20",X"F1",X"C1",X"D1",X"E1",X"F9",X"E1",X"D3",X"06",X"FB",X"C9",X"21",X"06",X"20",X"7E",X"47",
		X"23",X"A6",X"CA",X"05",X"01",X"23",X"B6",X"77",X"21",X"1E",X"20",X"11",X"0E",X"20",X"78",X"17",
		X"DA",X"49",X"01",X"23",X"13",X"13",X"C3",X"3F",X"01",X"44",X"4D",X"21",X"00",X"00",X"39",X"7D",
		X"12",X"13",X"7C",X"12",X"11",X"08",X"00",X"19",X"F9",X"E3",X"7E",X"23",X"E3",X"02",X"C3",X"C7",
		X"00",X"F3",X"A7",X"CA",X"70",X"01",X"C5",X"47",X"3A",X"07",X"20",X"A0",X"CA",X"72",X"01",X"C1",
		X"FB",X"C9",X"78",X"C1",X"F5",X"32",X"0B",X"20",X"C3",X"4D",X"00",X"47",X"21",X"06",X"20",X"77",
		X"23",X"B6",X"77",X"31",X"7C",X"02",X"78",X"33",X"33",X"33",X"33",X"17",X"D2",X"87",X"01",X"D1",
		X"E1",X"F9",X"EB",X"FB",X"E9",X"F3",X"F5",X"A7",X"C4",X"9E",X"01",X"F1",X"FB",X"C9",X"C5",X"E5",
		X"2F",X"47",X"0E",X"03",X"21",X"07",X"20",X"7E",X"A0",X"77",X"23",X"0D",X"C2",X"A7",X"01",X"36",
		X"00",X"21",X"2A",X"20",X"78",X"2F",X"23",X"17",X"D2",X"B6",X"01",X"36",X"00",X"E1",X"C1",X"C9",
		X"F3",X"3A",X"06",X"20",X"CD",X"9E",X"01",X"C3",X"C7",X"00",X"F1",X"C1",X"D1",X"E1",X"3A",X"00",
		X"20",X"FB",X"A7",X"C9",X"CD",X"27",X"02",X"70",X"3E",X"D3",X"32",X"01",X"20",X"EB",X"3E",X"C9",
		X"32",X"03",X"20",X"21",X"CC",X"4F",X"CD",X"2A",X"02",X"32",X"02",X"20",X"1A",X"CD",X"01",X"20",
		X"C3",X"CA",X"01",X"CD",X"27",X"02",X"B0",X"77",X"C3",X"D8",X"01",X"47",X"CD",X"27",X"02",X"A0",
		X"77",X"C3",X"D8",X"01",X"2F",X"4F",X"CD",X"27",X"02",X"B0",X"A1",X"77",X"C3",X"D8",X"01",X"32",
		X"00",X"20",X"E3",X"33",X"33",X"EB",X"E3",X"7E",X"23",X"E3",X"3B",X"3B",X"E5",X"C5",X"32",X"04",
		X"20",X"3A",X"00",X"20",X"F5",X"D5",X"C9",X"21",X"2A",X"20",X"3A",X"04",X"20",X"85",X"6F",X"7C",
		X"CE",X"00",X"67",X"7E",X"A7",X"C9",X"D1",X"E1",X"F9",X"EB",X"CD",X"3E",X"02",X"E9",X"F3",X"F5",
		X"C5",X"E5",X"AF",X"06",X"2D",X"21",X"06",X"20",X"CD",X"41",X"00",X"21",X"00",X"24",X"22",X"0C",
		X"20",X"E1",X"C1",X"F1",X"D3",X"06",X"FB",X"C9",X"F3",X"F5",X"C5",X"E5",X"21",X"00",X"00",X"06",
		X"00",X"7E",X"80",X"47",X"23",X"7C",X"FE",X"20",X"C2",X"61",X"02",X"78",X"C6",X"1B",X"C2",X"78",
		X"02",X"E1",X"C1",X"F1",X"D3",X"06",X"FB",X"C9",X"2A",X"A0",X"02",X"E9",X"EE",X"02",X"8D",X"21",
		X"8E",X"07",X"AD",X"21",X"A3",X"0A",X"C3",X"21",X"30",X"0D",X"DF",X"21",X"B1",X"11",X"F7",X"21",
		X"5B",X"13",X"0D",X"22",X"C3",X"13",X"23",X"22",X"A4",X"02",X"24",X"22",X"A7",X"02",X"25",X"22",
		X"AE",X"02",X"B2",X"02",X"C3",X"AA",X"02",X"C3",X"AA",X"02",X"F3",X"C3",X"AA",X"02",X"F3",X"C3",
		X"AE",X"02",X"F3",X"C3",X"B2",X"02",X"2A",X"59",X"20",X"2B",X"22",X"59",X"20",X"DB",X"01",X"0F",
		X"DA",X"C8",X"02",X"AF",X"32",X"47",X"20",X"C9",X"3A",X"46",X"20",X"FE",X"09",X"D0",X"3A",X"47",
		X"20",X"A7",X"C0",X"3E",X"01",X"32",X"47",X"20",X"DB",X"02",X"07",X"3A",X"46",X"20",X"D2",X"E3",
		X"02",X"C6",X"01",X"C6",X"01",X"27",X"E6",X"0F",X"32",X"46",X"20",X"D3",X"06",X"C9",X"CD",X"A4",
		X"04",X"CD",X"16",X"07",X"21",X"26",X"22",X"11",X"B6",X"23",X"CD",X"24",X"07",X"21",X"39",X"20",
		X"11",X"6E",X"21",X"CD",X"24",X"07",X"CD",X"16",X"07",X"3E",X"01",X"32",X"58",X"20",X"CD",X"A4",
		X"04",X"CD",X"6F",X"03",X"3E",X"04",X"CD",X"61",X"01",X"CD",X"0A",X"06",X"3A",X"46",X"20",X"A7",
		X"C2",X"78",X"03",X"3A",X"58",X"20",X"0F",X"DA",X"1C",X"03",X"CD",X"6F",X"03",X"CD",X"EC",X"06",
		X"CD",X"0A",X"06",X"3E",X"01",X"32",X"30",X"20",X"3A",X"30",X"20",X"A7",X"C2",X"38",X"03",X"3E",
		X"20",X"CD",X"61",X"01",X"3A",X"46",X"20",X"A7",X"C2",X"78",X"03",X"CD",X"0A",X"06",X"3A",X"2E",
		X"20",X"A7",X"CA",X"5F",X"03",X"3E",X"80",X"CD",X"95",X"01",X"3E",X"80",X"CD",X"61",X"01",X"3A",
		X"58",X"20",X"0F",X"D2",X"44",X"03",X"CD",X"3E",X"02",X"CD",X"16",X"07",X"C3",X"11",X"03",X"CD",
		X"B2",X"05",X"CD",X"1E",X"05",X"C3",X"DC",X"05",X"CD",X"3E",X"02",X"CD",X"16",X"07",X"AF",X"32",
		X"58",X"20",X"32",X"48",X"20",X"CD",X"A4",X"04",X"3E",X"04",X"CD",X"61",X"01",X"CD",X"DC",X"05",
		X"CD",X"0A",X"06",X"DB",X"01",X"E6",X"06",X"CA",X"90",X"03",X"EE",X"04",X"CA",X"AE",X"04",X"EE",
		X"06",X"C2",X"90",X"03",X"3A",X"46",X"20",X"3D",X"CA",X"90",X"03",X"3D",X"32",X"46",X"20",X"3E",
		X"81",X"32",X"48",X"20",X"CD",X"A4",X"05",X"CD",X"1E",X"05",X"AF",X"32",X"40",X"20",X"CD",X"75",
		X"07",X"CD",X"EC",X"06",X"3E",X"20",X"CD",X"61",X"01",X"3E",X"08",X"32",X"40",X"20",X"CD",X"0A",
		X"06",X"3A",X"2E",X"20",X"A7",X"CA",X"E9",X"03",X"3E",X"80",X"CD",X"95",X"01",X"3E",X"80",X"CD",
		X"61",X"01",X"3A",X"2E",X"20",X"A7",X"C2",X"E2",X"03",X"3A",X"2A",X"20",X"0F",X"D2",X"CE",X"03",
		X"0F",X"DA",X"48",X"04",X"CD",X"EE",X"1F",X"CD",X"3E",X"02",X"3A",X"48",X"20",X"3C",X"E6",X"81",
		X"32",X"48",X"20",X"3A",X"57",X"20",X"A7",X"3E",X"01",X"32",X"57",X"20",X"CA",X"B7",X"03",X"CD",
		X"1E",X"05",X"3A",X"3C",X"20",X"A7",X"FA",X"F7",X"03",X"3A",X"29",X"22",X"47",X"3A",X"31",X"22",
		X"B0",X"F4",X"75",X"07",X"3E",X"08",X"CD",X"61",X"01",X"CD",X"DC",X"05",X"3E",X"40",X"CD",X"61",
		X"01",X"3E",X"01",X"32",X"2D",X"20",X"3E",X"20",X"CD",X"61",X"01",X"3E",X"80",X"CD",X"61",X"01",
		X"3E",X"10",X"CD",X"61",X"01",X"C3",X"CE",X"03",X"3A",X"2A",X"20",X"A7",X"F5",X"CD",X"3E",X"02",
		X"AF",X"E7",X"09",X"E7",X"0A",X"E7",X"0B",X"3E",X"1F",X"F7",X"0C",X"CD",X"4A",X"07",X"CD",X"0A",
		X"06",X"F1",X"F2",X"6B",X"04",X"21",X"DA",X"4F",X"CD",X"F4",X"14",X"21",X"E2",X"1C",X"3A",X"48",
		X"20",X"0F",X"DA",X"78",X"04",X"21",X"F9",X"1C",X"CD",X"F4",X"14",X"CD",X"01",X"07",X"3A",X"48",
		X"20",X"A7",X"F2",X"93",X"04",X"3A",X"29",X"22",X"A7",X"F2",X"FA",X"03",X"3A",X"31",X"22",X"A7",
		X"F2",X"FA",X"03",X"AF",X"32",X"48",X"20",X"CD",X"F6",X"04",X"3A",X"46",X"20",X"A7",X"CA",X"06",
		X"03",X"C3",X"78",X"03",X"AF",X"E7",X"09",X"E7",X"0A",X"E7",X"0B",X"E7",X"0C",X"C9",X"3E",X"01",
		X"32",X"48",X"20",X"21",X"46",X"20",X"35",X"CD",X"A4",X"05",X"CD",X"1E",X"05",X"AF",X"32",X"40",
		X"20",X"CD",X"75",X"07",X"CD",X"EC",X"06",X"3E",X"20",X"CD",X"61",X"01",X"3E",X"08",X"32",X"40",
		X"20",X"CD",X"0A",X"06",X"3A",X"2E",X"20",X"A7",X"CA",X"EC",X"04",X"3E",X"80",X"CD",X"95",X"01",
		X"3E",X"80",X"CD",X"61",X"01",X"3A",X"2E",X"20",X"A7",X"C2",X"E5",X"04",X"3A",X"2A",X"20",X"0F",
		X"D2",X"D1",X"04",X"C3",X"48",X"04",X"2A",X"26",X"22",X"EB",X"2A",X"2E",X"22",X"7C",X"BA",X"DA",
		X"0B",X"05",X"C2",X"0A",X"05",X"7D",X"BB",X"DA",X"0B",X"05",X"EB",X"2A",X"43",X"20",X"7A",X"BC",
		X"D8",X"C2",X"17",X"05",X"7B",X"BD",X"D8",X"EB",X"22",X"43",X"20",X"C3",X"0A",X"06",X"3A",X"48",
		X"20",X"0F",X"21",X"39",X"20",X"11",X"26",X"22",X"06",X"08",X"DA",X"30",X"05",X"11",X"2E",X"22",
		X"CD",X"34",X"16",X"21",X"68",X"20",X"11",X"36",X"22",X"06",X"D8",X"3A",X"48",X"20",X"0F",X"DA",
		X"45",X"05",X"11",X"F6",X"22",X"CD",X"34",X"16",X"CD",X"16",X"07",X"3A",X"48",X"20",X"A7",X"C8",
		X"3E",X"20",X"E7",X"0A",X"3A",X"48",X"20",X"0F",X"3E",X"20",X"D2",X"5E",X"05",X"AF",X"E7",X"0C",
		X"06",X"10",X"CD",X"D3",X"07",X"7E",X"FE",X"38",X"C2",X"70",X"05",X"3E",X"01",X"EF",X"0A",X"C9",
		X"7E",X"FE",X"33",X"C2",X"7B",X"05",X"3E",X"01",X"C3",X"DA",X"07",X"7E",X"FE",X"70",X"C2",X"86",
		X"05",X"3E",X"10",X"EF",X"0C",X"C9",X"7E",X"FE",X"50",X"C2",X"95",X"05",X"3E",X"01",X"EF",X"0A",
		X"3E",X"1F",X"C3",X"DA",X"07",X"7E",X"FE",X"3F",X"CA",X"90",X"05",X"23",X"23",X"23",X"23",X"05",
		X"C2",X"65",X"05",X"C9",X"3E",X"04",X"CD",X"95",X"01",X"21",X"26",X"22",X"11",X"B6",X"23",X"CD",
		X"24",X"07",X"DB",X"02",X"E6",X"03",X"87",X"21",X"D4",X"05",X"CD",X"2D",X"02",X"5F",X"23",X"56",
		X"EB",X"22",X"28",X"22",X"22",X"30",X"22",X"3E",X"01",X"32",X"2D",X"22",X"32",X"35",X"22",X"AF",
		X"32",X"57",X"20",X"C9",X"DC",X"05",X"D0",X"07",X"C4",X"09",X"AC",X"0D",X"21",X"34",X"1D",X"CD",
		X"F4",X"14",X"21",X"5D",X"1D",X"CD",X"F4",X"14",X"21",X"68",X"1D",X"CD",X"F4",X"14",X"2A",X"43",
		X"20",X"11",X"1D",X"30",X"CD",X"BE",X"06",X"2A",X"26",X"22",X"11",X"1D",X"27",X"CD",X"BE",X"06",
		X"2A",X"2E",X"22",X"11",X"1D",X"39",X"CD",X"BE",X"06",X"C9",X"3A",X"46",X"20",X"21",X"01",X"3D",
		X"CD",X"D9",X"06",X"CD",X"7B",X"06",X"60",X"69",X"11",X"01",X"2C",X"CD",X"BE",X"06",X"3A",X"59",
		X"20",X"A7",X"CA",X"70",X"06",X"F3",X"2A",X"41",X"20",X"7C",X"B5",X"CA",X"59",X"06",X"EB",X"21",
		X"00",X"00",X"22",X"41",X"20",X"2A",X"39",X"20",X"FB",X"7D",X"83",X"27",X"6F",X"7C",X"8A",X"27",
		X"67",X"22",X"39",X"20",X"7B",X"21",X"1C",X"33",X"CD",X"D0",X"06",X"CD",X"C9",X"06",X"3E",X"40",
		X"32",X"59",X"20",X"21",X"53",X"1D",X"CD",X"F4",X"14",X"FB",X"3A",X"48",X"20",X"A7",X"C8",X"2A",
		X"39",X"20",X"0F",X"11",X"1D",X"27",X"DA",X"6C",X"06",X"11",X"1D",X"39",X"CD",X"BE",X"06",X"C9",
		X"2A",X"53",X"1D",X"06",X"48",X"CD",X"E1",X"06",X"C3",X"59",X"06",X"2A",X"3B",X"20",X"11",X"A2",
		X"06",X"01",X"00",X"00",X"7C",X"A7",X"F8",X"29",X"29",X"29",X"DA",X"95",X"06",X"7C",X"B5",X"C8",
		X"13",X"13",X"C3",X"89",X"06",X"1A",X"81",X"27",X"4F",X"13",X"1A",X"88",X"27",X"47",X"13",X"C3",
		X"89",X"06",X"92",X"81",X"96",X"40",X"48",X"20",X"24",X"10",X"12",X"05",X"56",X"02",X"28",X"01",
		X"64",X"00",X"32",X"00",X"16",X"00",X"08",X"00",X"04",X"00",X"02",X"00",X"01",X"00",X"EB",X"D5",
		X"7A",X"CD",X"D0",X"06",X"D1",X"7B",X"CD",X"D0",X"06",X"06",X"00",X"0E",X"08",X"C3",X"3D",X"16",
		X"F5",X"0F",X"0F",X"0F",X"0F",X"CD",X"D9",X"06",X"F1",X"E6",X"0F",X"47",X"0E",X"08",X"C3",X"3D",
		X"16",X"AF",X"11",X"20",X"00",X"77",X"19",X"05",X"C2",X"E5",X"06",X"C9",X"3E",X"80",X"CD",X"61",
		X"01",X"3E",X"40",X"CD",X"61",X"01",X"3E",X"10",X"CD",X"61",X"01",X"3E",X"08",X"CD",X"61",X"01",
		X"C9",X"21",X"F4",X"01",X"22",X"59",X"20",X"CD",X"DF",X"07",X"A7",X"F2",X"07",X"07",X"CD",X"E7",
		X"07",X"06",X"68",X"C3",X"E1",X"06",X"21",X"00",X"24",X"06",X"00",X"70",X"23",X"7C",X"FE",X"40",
		X"DA",X"19",X"07",X"C9",X"06",X"00",X"70",X"23",X"7C",X"BA",X"C2",X"26",X"07",X"7D",X"BB",X"C2",
		X"26",X"07",X"C9",X"21",X"62",X"09",X"06",X"1A",X"36",X"00",X"23",X"05",X"C2",X"38",X"07",X"01",
		X"06",X"00",X"09",X"7C",X"FE",X"40",X"DA",X"36",X"07",X"C9",X"3A",X"48",X"20",X"0F",X"11",X"39",
		X"20",X"21",X"26",X"22",X"06",X"08",X"DA",X"5C",X"07",X"21",X"2E",X"22",X"CD",X"34",X"16",X"21",
		X"36",X"22",X"11",X"68",X"20",X"06",X"C0",X"3A",X"48",X"20",X"0F",X"DA",X"71",X"07",X"21",X"F6",
		X"22",X"CD",X"34",X"16",X"C9",X"CD",X"DC",X"05",X"CD",X"0A",X"06",X"3A",X"48",X"20",X"0F",X"21",
		X"10",X"1D",X"DA",X"88",X"07",X"21",X"22",X"1D",X"CD",X"F4",X"14",X"C3",X"01",X"07",X"3A",X"2E",
		X"20",X"E6",X"01",X"C2",X"89",X"09",X"21",X"18",X"8A",X"22",X"49",X"20",X"AF",X"32",X"4F",X"20",
		X"21",X"8F",X"1B",X"22",X"4D",X"20",X"21",X"02",X"0F",X"22",X"4B",X"20",X"CD",X"1C",X"0A",X"DF",
		X"01",X"2A",X"49",X"20",X"7C",X"C6",X"F8",X"67",X"3A",X"05",X"20",X"AC",X"47",X"3A",X"48",X"20",
		X"FE",X"80",X"78",X"07",X"CA",X"CD",X"07",X"D2",X"AF",X"07",X"C3",X"D0",X"07",X"DA",X"AF",X"07",
		X"C3",X"EF",X"07",X"CD",X"4F",X"0D",X"21",X"E8",X"20",X"C9",X"E7",X"0B",X"F7",X"0A",X"C9",X"3E",
		X"00",X"D3",X"03",X"3A",X"5A",X"20",X"C9",X"3E",X"20",X"EF",X"0A",X"2A",X"10",X"1D",X"C9",X"21",
		X"3D",X"20",X"34",X"CD",X"50",X"0A",X"3A",X"3C",X"20",X"A7",X"FA",X"84",X"09",X"3A",X"51",X"20");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
