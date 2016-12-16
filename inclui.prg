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
TELAIN=SAVESCREEN(,,,)
WHILE .T.
@06,02 CLEAR TO 22,78
RESTSCREEN(,,,,TELAIN)
XTELEFONE=SPACE(9)
@06,02 SAY"DIGITE O NUMERO DO TELEFONE:" GET XTELEFONE PICT"####-####" VALID "EMPTY(XTELEFONE) COLOR "R/W"
READ
	IF LASTKEY()=27
		RETURN
		ALERT("INCLUSAO ABANDONADA")
	ENDIF
IF !DBSEEK(XTELEFONE)
	XPP=SPACE(4)
	XPS=SPACE(4)
	XBLOCO=SPACE(2)
	XAPTO=SPACE(2)
	XNOME=SPACE(40)
	XEMPRESA=SPACE(20)
	XDATA=SPACE(10)
	XOBS=SPACE(40)
	@08,02 SAY"PAR PRIMARIO..:" GET XPP PICT "####"
	@10,02 SAY"PAR SECUNDARIO:" GET XPS PICT "9999"
	@12,02 SAY"BLOCO.........:" GET XBLOCO PICT "@!"
	@12,26 SAY"APTO..........:" GET XAPTO PICT "99"
	@14,02 SAY"NOME DO FUNC..:" GET XNOME PICT "@!"
	@16,02 SAY"EMPRESA.......:" GET XEMPRESA PICT "@!"
	@18,02 SAY"DATA..........:" GET XDATA PICT ("99/99/####")
	@20,02 SAY"OBSERVACAO....:" GET XOBS
	READ
	IF LASTKEY()=27
		RETURN
		ALERT("INCLUSAO ABANDONADA")
	ENDIF
	DBAPPEND()
	REPL TELEFONE WITH XTELEFONE, PP WITH XPP
	REPL PS WITH XPS, BLOCO WITH XBLOCO
	REPL APTO WITH XAPTO, NOME WITH XNOME
	REPL EMPRESA WITH XEMPRESA, DATA WITH XDATA
	REPL OBS WITH XOBS
	ALERT("REGISTRO INCLUIDO!")
ELSE
	ALERT("REGISTRO JA CADASTRADO!")
ENDIF
ENDDO
