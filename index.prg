/*<I wrote this software about 15 years ago (around 1999); it's a simple program to register phone cable numers installations on a building. I decided to share it just as an example of a unusual language - at that time, Clipper was largelly used to write bank program routines.I think it would be a nice source do study a 'dead' program language as Clipper. Have fun!>
    Copyright (C) <2013>  <Thiago Carreira Alves Nascimento>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.*/

IF !FILE("FONE.DBF")
	DADOS:={{"TELEFONE","C",9,0},{"PP","C",4,0},}{"PS","C",4,0},{"BLOCO","C",2,0},{"APTO","C",2,0},{"NONE","C",40,0},{"EMPRESA","C",20,0},{"DATA","C",20,0},{"OBS","C",40,0}}
	DBCREATE("FONE",DADOS)
ENDIF
CLS
SET WRAP ON
SET MESSAGE TO 24 CENTER
@01,01 TO 04,79 DOUBLE COLOR "R"
@02,25 SAY "****MODELO - PROGRAMA TESTE" COLOR "G"
@03,32 SAY CMONT(DATE())
@03,43 SAY ","
@03,45 SAY DAY(DATE())
@03,49 SAY "of"
@03,51 SAY YEAR(DATE())
@05,01 TO 23,79 COLOR "B"
@20,02 TO 22,78 COLOR "R"
@08,21 SAY" [[[[[[[[	[[[[[[[[[	[[[[[[[[[[	" COLOR "G"
@09,21 SAY" [		[	[	[		" COLOR "G"
@10,21 SAY" [		[	[	[		" COLOR "G"
@11,21 SAY" [		[  [[[[[[	[[[[[[		" COLOR "G"
@12,21 SAY" [		[		[		" COLOR "G"
@13,21 SAY" [		[		[		" COLOR "G"
@14,21 SAY" [[[[[[[[	[		[[[[[[[[[[	" COLOR "G"
WHILE .T.
@21,08 PROMPT"INCLUSAO"MESS"INCLUSAO DE REGISTRO"
@21,21 PROMPT"PESQUISA"MESS"PESQUISA DE REGISTRO"
@21,32 PROMPT"ALTERACAO"MESS"ALTERACAO DE REGISTRO"
@21,45 PROMPT"RELATORIO"MESS"EMITE RELATORIOS"
@21,57 PROMPT"EXLCUSAO"MESS"EXCLUSAO DE REGISTRO"
@21,68 PROMPT"SAIR"MESS"FINALIZA O SISTEMA"
MENU TO OP
TELAI=SAVESCREEN(,,,)
	DO CASE
		CASE OP=1
			DO INCLUI
		CASE OP=2
			DO PESQUI
		CASE OP=3
			DO ALTERA
		CASE OP=4
			DO RELATO
		CASE OP=5
			DO EXLCUI
		CASE OP=6
			OPZ=ALERT("DESEJA REALMENTE SAIR?", {"SIM", "NÃO"})
				IF OPZ=1
					//@01,01 CLEAR TO 24,29//
					CLS
					EXIT
				ELSE
					LOOP
				ENDIF
		ENDCASE
RESTSCREEN(,,,,TELAI)
	ENDDO

