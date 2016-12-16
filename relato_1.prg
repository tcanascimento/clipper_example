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
SET MESS TO 24 CENTER
	ALERT("PREPARE A IMPRESSORA!")
	WHILE !ISPRINTER()
		ALERT("IMPRESSORA NAO ESTA PRONTA, VERIFIQUE")
		IF LASTKEY()=27
		 RETURN
		ENDIF
	ENDDO
SET PRINTER ON
SET DEVICE TO PRINTER
GO TOP
L=64
	WHILE .NOT. EOF()
	 IF L=64
	  @01,26 SAY "RELATORIO DE TELEFONES"
	  @02,25 SAY CMONT (DATE())
	  @02,34 SAY " , "
	  @02,36 SAY DAY(DATE())
	  @02,42 SAY "of"
	  @02,44 SAY YEAR (DATE())
	  @03,01 SAY REPL("*",77)
	  @04,01 SAY "TELEFONE"
	  @04,11 SAY "BLOCO"
	  @04,17 SAY "APTO"
	  @04,22 SAY "P. P."
	  @04,28 SAY "P. S."
	  @04,34 SAY "OBS.:"
	  @05,01 SAY REPL("*",77)
	  L=7
	 ENDIF
	  @L,01 SAY TELEFONE
	  @L,11 SAY BLOCO
	  @L,17 SAY APTO
	  @L,22 SAY PP
	  @L,28 SAY PS
	  @L,34 SAY OBS
	  L=L+1
	  SKIP+1
	ENDDO
EJECT
SET PRINTER OFF
SET DEVICE TO SCREEN
USE
RETURN
	

