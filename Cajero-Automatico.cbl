      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAJERO-AUTOMATICO.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  SALDO PIC 999V99 VALUE ZERO.
       01  DEPOCITO PIC 999V99 VALUE ZERO.
       01  RETIRO PIC 999V99.
       01  OPCION PIC 9.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           PERFORM MENU UNTIL OPCION = 4.
           STOP RUN.

           MENU.

                DISPLAY "Bienvenido al Simulador de Cajero Automático"
                DISPLAY "1. Consulta de Saldo"
                DISPLAY "2. Depósito"
                DISPLAY "3. Retiro"
                DISPLAY "4. Salir"
                ACCEPT OPCION

                PERFORM OPCIONES-CAJERO.

           OPCIONES-CAJERO.
           EVALUATE OPCION
               WHEN 1
                PERFORM CONSULTAR-SALDO
               WHEN 2
                PERFORM REALIZAR-DEPOSITO
               WHEN 3
                PERFORM REALIZAR-RETIRO
               WHEN 4
                DISPLAY "Gracias por usar el Simulador de Cajero "
               WHEN OTHER
                DISPLAY "Opción no válida. Intente nuevamente"
                PERFORM MENU.

           CONSULTAR-SALDO.
               DISPLAY "Saldo actual: $" SALDO.

           REALIZAR-DEPOSITO.
               DISPLAY "Ingrese la cantidad a depositar: "
               ACCEPT DEPOCITO
               ADD DEPOCITO TO SALDO.

           REALIZAR-RETIRO.
               DISPLAY "Ingrese la cantidad a retirar: "
               ACCEPT RETIRO
                   IF RETIRO > SALDO
                       DISPLAY "Fondos insuficientes."
                   ELSE
                       SUBTRACT RETIRO FROM SALDO
                       DISPLAY "Retiro exitoso. Saldo actual: $" SALDO.


       END PROGRAM CAJERO-AUTOMATICO.
