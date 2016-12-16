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

USE FONE
INDEX ON TELEFONE TO IFONE
SET WRAP ON
SET CONF ON
SET MESS TO 24 CENTER
@02,25 SAY "****MODELO - PROGRAMA TESTE" COLOR "G"
@03,32 SAY CMONT(DATE())
@03,43 SAY ","
@03,45 SAY DAY(DATE())
@03,49 SAY "of"
@03,51 SAY YEAR(DATE())
@05,01 TO 23,79 COLOR "B"
@20,02 TO 22,78 COLOR "R"
@06,02 CLEAR TO 22,78
TELARE=SAVESCREEN(,,,)
WHILE .T.
@06,02 CLEAR TO 22,78
RESTSCREEN(,,,,TELARE)
XTELEFONE=SPACE(9)
OPR=ALERT("RELATORIO POR FONE OU POR BLOCO?, {"FONE","BLOCO","RETORNA"})
	DO CASE
	 CASE OPR=1
	 	DO RELATO_1
	 CASE OPR=2
		DO RELATO_2
	 CASE OPR=3	
		RETURN
	ENDCASE
