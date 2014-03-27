Feature: See entries
  Un extracto bancario es un documento en formato papel o electrónico que recoge los movimientos (entries) de una cuenta
  corriente desde una fecha de inicio hasta una fecha final. Incluye como mínimo la fecha del movimiento y la fecha de
  valor, también el concepto bancario (un texto que define la entidad bancario para el movimiento), el importe, el
  saldo posterior, la oficina y un concepto definido por el usuario.

  La siguiente tabla es un ejemplo de un posible extracto bancario (realmente es una modificación de un extracto de
  Bankia):

  """
  Movimientos desde 07/01/2013 hasta 10/01/2013 de su Cuenta Corriente 2038-7257-51-6000121204
  |Fecha movimiento|Fecha de valor|Concepto bancario        |Importe   |Saldo después|Oficina|Concepto cliente     |
  |07/01/2013      |07/01/2013    |TRANSFERENCIA A SU FAVOR |    33,60€|5.396,00€    |8067   |CDAD QUEVEDO PISO 1º |
  |07/01/2013      |07/01/2013    |TRANSFERENCIA A SU FAVOR |    50,00€|5.446,00€    |8067   |DERRAMA 1ºIZDA -PINO |
  |07/01/2013      |07/01/2013    |TRANSFERENCIA A SU FAVOR |    36,81€|5.482,81€    |8067   |BAJO IZQUIERDO CARMEN|
  |08/01/2013      |08/01/2013    |PAGO CHEQUE COMPENSADO   |-1.440,00€|4.042,81€    |8067   |62754366             |
  |10/01/2013      |10/01/2013    |TRANSFERENCIA A SU FAVOR |    35,92€|4.078,73€    |8067   |AMALIA PEÑA ORTEGA.1D|
  |10/01/2013      |10/01/2013    |SU ORDEN DE TRANSFERENCIA|  -269,88€|3.808,85€    |8067   |CDAD PIO XII-75 MANCU|
  |10/01/2013      |10/01/2013    |ABONO POR VENTANILLA     |    35,70€|3.844,55€    |8067   |CDAD BAJO DCHA.TOMASA|
  |10/01/2013      |10/01/2013    |ABONO POR VENTANILLA     |    50,00€|3.894,55€    |8067   |DERRAMA BAJO DCHA.TOM|
  """

  Background:
    Un día cualquiera hay ingresos bancarios asociados a propietarios y otros sin asociar
    Given the home owners have the IDs:
      |USER ID|Nombre     |
      |      1|Amalia     |
      |      2|Tomasa     |
      |      3|I.N.V.I.E.D|
    And the bank statement which contains the entries:
      |ENTRY ID|USER ID|Fecha movimiento|Fecha valor|Concepto bancario       |Importe   |Oficina|Concepto cliente    |
      |       1|       |08/01/2013      |08/01/2013 |PAGO CHEQUE COMPENSADO  |-1.440,00€|8067   |62754366            |
      |       2|      1|10/01/2013      |10/01/2013 |TRANSFERENCIA A SU FAVOR|    35,92€|8067   |AMALIA PEÑA ORTEGA.1|
      |       3|      2|10/01/2013      |10/01/2013 |ABONO POR VENTANILLA    |    35,70€|8067   |CDAD BAJO DCHA.TOMAS|
      |       4|       |10/01/2013      |10/01/2013 |ABONO POR VENTANILLA    |    50,00€|8067   |DERRAMA BAJO DCHA.TO|
      |       5|       |15/01/2013      |16/01/2013 |TRANSFER I.N.V.I.E.D.   | 1.303,30€|0618   |FACT. ENE-OCT-2013.R|

  @passed
  Scenario: See banking movements
    When the Entries page  is visited
    Then the Entries page should content:
      |ENTRY ID|Nombre|Fecha movimiento|Fecha valor|Concepto bancario       |Importe   |Oficina|Concepto cliente    |
      |       1|      |08/01/2013      |08/01/2013 |PAGO CHEQUE COMPENSADO  |-1.440,00€|8067   |62754366            |
      |       2|Amalia|10/01/2013      |10/01/2013 |TRANSFERENCIA A SU FAVOR|    35,92€|8067   |AMALIA PEÑA ORTEGA.1|
      |       3|Tomasa|10/01/2013      |10/01/2013 |ABONO POR VENTANILLA    |    35,70€|8067   |CDAD BAJO DCHA.TOMAS|
      |       4|      |10/01/2013      |10/01/2013 |ABONO POR VENTANILLA    |    50,00€|8067   |DERRAMA BAJO DCHA.TO|
      |       5|      |15/01/2013      |16/01/2013 |TRANSFER I.N.V.I.E.D.   | 1.303,30€|0618   |FACT. ENE-OCT-2013.R|

  @working
  Scenario: Post a unaccounted entry to user
    Los ingresos en una cuenta corriente principalmente corresponden a pagos que los comuneros realizan de uno o más
    recibos pendientes. Estos ingresos inicialmente no están asignados a nadie y han de contabilizarse al comunero
    correspondiente



    When zzz
      |Action |Data               |
      |Visit  |entries            |
      |Click  |Edit Link "ENTRY04"|
      |Select |User USER02        |
      |Submit |                   |
    Then the entries page should content:
      |ENTRY ID|Nombre                 |
      |       1|                       |
      |       2|Amalia Peña Ortega     |
      |       3|Tomasa Hernández Torres|
      |       4|Tomasa Hernández Torres|
      |       5|                       |
