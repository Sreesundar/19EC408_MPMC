; LED Motion Engine
; Eight-LED Sequential Lighting System
; Controller : AT89C51
; Assembler  : Keil A51
; Clock      : 11.0592 MHz
;
; LED outputs : P2.0 to P2.7 (active-HIGH assumed)
; Mode inputs : P1.0 and P1.1 (active-LOW switches)
;
; Switches are connected between P1.0/P1.1 and GND.
; The 8051 port's internal pull-ups keep released switches HIGH.
;
; P1.1 P1.0
;   1    1   Forward
;   1    0   Reverse
;   0    1   Bounce
;   0    0   Reserved (LEDs OFF)

            ORG 0000H
            LJMP START

START:
            MOV SP, #5FH
            MOV P1, #0FFH
            MOV P2, #00H

MAIN:
            JB  P1.1, CHECK_P10
            JB  P1.0, BOUNCE_MODE
            SJMP IDLE_MODE

CHECK_P10:
            JB  P1.0, FORWARD_MODE
            SJMP REVERSE_MODE

FORWARD_MODE:
            MOV A, #01H
            MOV R5, #08H

FORWARD_LOOP:
            MOV P2, A
            ACALL DELAY
            RL  A
            DJNZ R5, FORWARD_LOOP
            SJMP MAIN

REVERSE_MODE:
            MOV A, #80H
            MOV R5, #08H

REVERSE_LOOP:
            MOV P2, A
            ACALL DELAY
            RR  A
            DJNZ R5, REVERSE_LOOP
            SJMP MAIN

BOUNCE_MODE:
            MOV DPTR, #BOUNCE_TABLE
            MOV R0, #00H
            MOV R5, #0EH

BOUNCE_LOOP:
            MOV A, R0
            MOVC A, @A+DPTR
            MOV P2, A
            ACALL DELAY
            INC R0
            DJNZ R5, BOUNCE_LOOP
            SJMP MAIN

IDLE_MODE:
            MOV P2, #00H
            SJMP MAIN

; Approximate software delay.
; Exact duration depends on clock, instruction cycles and simulator.
DELAY:
            MOV R6, #0FFH
DELAY_OUTER:
            MOV R7, #0FFH
DELAY_INNER:
            DJNZ R7, DELAY_INNER
            DJNZ R6, DELAY_OUTER
            RET

; Bounce sequence:
; LED1 -> LED2 -> ... -> LED8 -> LED7 -> ... -> LED2
; The next repetition starts at LED1.
BOUNCE_TABLE:
            DB 01H, 02H, 04H, 08H, 10H, 20H, 40H, 80H
            DB 40H, 20H, 10H, 08H, 04H, 02H

            END
