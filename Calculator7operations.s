 @Wyctor Fogos da Rocha - IEE6 - 2019/2

.equ Clear_Display, 0x206
.equ Print_value_in_Display, 0x205
.equ Print_a_string_in_Display, 0x204
.equ Check_blue_buttons, 0x203
.equ Check_blacks_buttons, 0x202
.equ Swi_Print, 0x6b
.equ Print_Char_Display,0x207
.equ Open_a_file, 0x66            @ Abre um arquivo
.equ Write_string_file, 0x69      @ Escreve uma string no arquivo
.equ Write_a_value_file,0x6b      @ Escreve uma string no arquivo
.equ Close_a_file, 0x68           @ Fecha o arquivo
.equ b1, 0b1                      @ Botao 1
.equ b2, 0b10                     @ Botao 2
.equ b3, 0b100                    @ Botao 3
.equ b4, 0b1000                   @ Botao 4
.equ b5, 0b10000                  @ Botao 5
.equ b6, 0b100000                 @ Botao 6
.equ b7, 0b1000000                @ Botao 7
.equ b8, 0b10000000               @ Botao 8
.equ b9, 0b100000000              @ Botao 9
.equ b10, 0b100000000             @ Botao 10
.equ b11, 0b1000000000            @ Botao 11
.equ b12, 0b10000000000           @ Botao 12
.equ b13, 0b100000000000          @ Botao 13
.equ b14, 0b1000000000000         @ Botao 14
.equ b15, 0b10000000000000        @ Botao 15
.equ b16, 0b100000000000000       @ Botao 16

_start:
swi Clear_Display
mov r5,#10
mov r0,#4
mov r1,#1
ldr r2,=mensagem_inicial_1
swi Print_a_string_in_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#2
ldr r2,=mensagem_inicial_2
swi Print_a_string_in_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#3
ldr r2,=mensagem_inicial_3
swi Print_a_string_in_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#4
ldr r2,=mensagem_inicial_4
swi Print_a_string_in_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=mensagem_inicial_5
swi Print_a_string_in_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#6
ldr r2,=mensagem_inicial_6
swi Print_a_string_in_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#7
ldr r2,=mensagem_inicial_7
swi Print_a_string_in_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#8
ldr r2,=mensagem_inicial_8
swi Print_a_string_in_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#9
ldr r2,=string_operacao
swi Print_a_string_in_Display

digitarosvalores:
swi Check_blue_buttons
cmp r0,#b1 @Botao 0
beq Recebe0
cmp r0,#b2 @Botao 1
beq Recebe1
cmp r0,#b3 @Botao 2
beq Recebe2 
cmp r0,#b4 @Botao 3
beq Recebe3
cmp r0,#b5 @Botao 4
beq Recebe4
cmp r0,#b6 @Botao 5
beq Recebe5
cmp r0,#b7 @Botao 6
beq Recebe6
cmp r0,#b8 @Botao 7
beq Recebe7
cmp r0,#b9 @Botao 8
beq Recebe8
cmp r0,#b10 @Botao 9
beq Recebe9
bal digitarosvalores

number:
mov r8,r0
cmp r9,#1  
beq operacao_soma
cmp r9,#2
beq operacao_subtracao
cmp r9,#3
beq operacao_multiplicacao
cmp r9,#4
beq operacao_divisao
cmp r9,#5
beq operacao_potenciacao
cmp r9,#6
beq operacao_quadrado_da_diferenca
cmp r9,#7
beq operacao_fatorial

operation:
swi Check_blue_buttons @Verifica se a opcao selecionada
cmp r0,#b1 @Botao 
beq soma
cmp r0,#b2 @Botao 
beq subtracao
cmp r0,#b3   @Botao 
beq multiplicacao
cmp r0,#b4@Botao 
beq divisao
cmp r0,#b5 @Botao 
beq potenciacao
cmp r0,#b6 @Botao
beq quadrado_da_diferenca 
cmp r0,#b7
beq fatorial
bal operation

soma:
mov r9,#1
mov r4,r8
cmp r5,#10
bne operacao_soma
mov r5,#11
bal digitarosvalores

subtracao:
mov r9,#2
mov r4,r8
cmp r5,#10
bne operacao_subtracao
mov r5,#11
bal digitarosvalores

multiplicacao:
mov r9,#3
mov r4,r8
cmp r5,#10
bne operacao_multiplicacao
mov r5,#11
bal digitarosvalores

divisao:
mov r9,#4
mov r4,r8
cmp r5,#10
bne operacao_divisao
mov r5,#11
bal digitarosvalores

potenciacao:
mov r9,#5
mov r4,r8
cmp r5,#10
bne operacao_potenciacao
mov r5,#11
bal digitarosvalores

quadrado_da_diferenca:
mov r9,#6
mov r4,r8
cmp r5,#10
bne operacao_quadrado_da_diferenca
mov r5,#11
bal digitarosvalores

fatorial:
mov r9,#7
mov r4,r8
cmp r5,#10
bne operacao_fatorial
mov r5,#11

operacao_fatorial:              @ Calcula o fatorial do numero escolhido
swi Clear_Display               @ Limpa o display 
mov r0,#4                       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#4
ldr r2,=mensagem_inicial_8      @ Imprime a mensagem na tela
swi Print_a_string_in_Display
mov r3,r4                       @ Salva o valor a ser calculado o fatorial. O registrador r3 será um auxiliar 
mov r5,r4
mov r2,r4                       @ Salva o valor do fatorial que o usuario deseja. O registrador r5 será um auxiliar
mov r0,#4                       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5                       
swi Print_value_in_Display
mov r0,#5                       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_fatorial
swi Print_a_string_in_Display
mov r0,#6                       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_igual
swi Print_a_string_in_Display      
cmp r4,#0                       @ O valor digitado será comparado a 0.
beq desvio_1_fatorial
cmp r4,#1                       @ O valor digitado será comparado a 1.
beq desvio_1_fatorial           
fatorial1:
    sub r3,r3,#1                
    mul r4,r3,r4
    cmp r3,#1
bgt fatorial1
mov r2,r5                       @ Salva o resultado final
mov r1,r4                       @ O resultado é printado na tela 
mov r7,r4                       @ O resultado é salvo novamente pois o r1 será setado 
mov r0,#1
swi Swi_Print                   @ Print do resultado na tela
mov r0,#7                       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r7      
swi Print_value_in_Display
bal fimdoprograma

operacao_quadrado_da_diferenca:
swi Clear_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#4
ldr r2,=mensagem_inicial_7     
swi Print_a_string_in_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_parenteses_1
swi Print_a_string_in_Display
mov r0,#5       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r4      
swi Print_value_in_Display       @Imprime o valor 1 no display
mov r0,#6       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_sub
swi Print_a_string_in_Display
mov r0,#7       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r8      
swi Print_value_in_Display       @Imprime o valor 1 no display
mov r0,#8       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_parenteses_2
swi Print_a_string_in_Display
mov r0,#9          @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_quadrado
swi Print_a_string_in_Display
mov r0,#11       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_igual
swi Print_a_string_in_Display
sub r8,r4,r8    @ subtrai os dois valores
mov r6,r8       @ salva o resultado para outro registrator
mul r8,r6,r8           @ a diferenca e elevada ao quadrado
mov r0,#12       @ Coluna
mov r1,#5       @ Linha 
mov r2,r8
swi Print_value_in_Display
bal fimdoprograma

operacao_potenciacao:
swi Clear_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#4
ldr r2,=mensagem_inicial_6     
swi Print_a_string_in_Display 
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r4      
swi Print_value_in_Display       @Imprime o valor 1 no display
mov r0,#5       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_potenciacao
swi Print_a_string_in_Display
mov r0,#6       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r8      
swi Print_value_in_Display       @Imprime o valor 1 no dispaly
mov r0,#7       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_igual
swi Print_a_string_in_Display
mov r5,#1
mov r3,r4
cmp r8,#0
beq desvio_1_potenciacao
cmp r8,#1
beq desvio_2_potenciacao
potenciacao1:
    mul r1,r4,r3
    add r5,r5,#1
    mov r3,r1
    cmp r5,r8
    bne potenciacao1    
mov r7,r1       @ Salva o resultado final
mov r0,#1
swi Swi_Print
mov r0,#8       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r7      
swi Print_value_in_Display
bal fimdoprograma

operacao_divisao:
swi Clear_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#4
ldr r2,=mensagem_inicial_5     
swi Print_a_string_in_Display 
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r4      
swi Print_value_in_Display       @Imprime o valor 1 no dispaly
mov r0,#5       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_div
swi Print_a_string_in_Display
mov r0,#6       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r8      
swi Print_value_in_Display       @Imprime o valor 1 no dispaly
mov r0,#7       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_igual
swi Print_a_string_in_Display
mov r3,#0
cmp r4,r8 	
blt desviodivisao 
divisao1:
    add r3,r3,#1 @ Adicona um ao quociente
    sub r4,r4,r8 
    mov r5,r4
    cmp r4,r8
    bge divisao1
mov r7,r3       @ Salva o resultado final
mov r0,#1
swi Swi_Print
mov r0,#8       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r7      
swi Print_value_in_Display
bal fimdoprograma

operacao_multiplicacao:
swi Clear_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#4
ldr r2,=mensagem_inicial_4     
swi Print_a_string_in_Display 
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r4      
swi Print_value_in_Display       @Imprime o valor 1 no dispaly
mov r0,#5       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_mult
swi Print_a_string_in_Display
mov r0,#6       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r8      
swi Print_value_in_Display       @Imprime o valor 1 no dispaly
mov r0,#7       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_igual
swi Print_a_string_in_Display
mov r5,#0
cmp r8,#0
bal desvio_resultado_zero
multiplicacao1:
add r3,r4,r3
add r5,r5,#1
cmp r5,r8
blt multiplicacao1  
mov r1,r3       @ Transfere o valor final da multiplicacao para R1 e seja visto na saída
mov r7,r1       @ Salva o resultado final
mov r0,#1
swi Swi_Print
mov r0,#8       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r7      
swi Print_value_in_Display
bal fimdoprograma

operacao_subtracao:
swi Clear_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#4
ldr r2,=mensagem_inicial_3     
swi Print_a_string_in_Display 
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r4      
swi Print_value_in_Display       @Imprime o valor 1 no dispaly
mov r0,#5       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_sub
swi Print_a_string_in_Display
mov r0,#6       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r8      
swi Print_value_in_Display       @Imprime o valor 1 no dispaly
mov r0,#7       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_igual
swi Print_a_string_in_Display
mov r5,r8
cmp r4,r5
blt Erro_resultado_negativo
sub r1,r4,r5
mov r7,r1       @ Salva o resultado final
mov r0,#1
swi Swi_Print
mov r0,#8       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r7      
swi Print_value_in_Display
bal fimdoprograma

operacao_soma:
swi Clear_Display
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#4
ldr r2,=mensagem_inicial_2     
swi Print_a_string_in_Display 
mov r0,#4       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r4      
swi Print_value_in_Display       @Imprime o valor 1 no dispaly
mov r0,#5       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_soma
swi Print_a_string_in_Display
mov r0,#6       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r8      
swi Print_value_in_Display       @Imprime o valor 1 no dispaly
mov r0,#7       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
ldr r2,=simbolo_igual
swi Print_a_string_in_Display
mov r5,r8
add r1,r4,r5
mov r7,r1       @ Salva o resultado final
mov r0,#1
swi Swi_Print
mov r0,#8       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r7      
swi Print_value_in_Display
bal fimdoprograma

desviodivisao:
mov r0,#6   
mov r1,#5 
ldr r2,=mensagem_erro_divisao
swi Print_value_in_Display  ;escrever no display um valor inteiro

desvio_resultado_zero:     @ Se o resultado da operacao for zero, sera printado o zero no Display e no Stdout
mov r1,#0       @ Salva o resultado final
mov r0,#1
swi Swi_Print
mov r0,#8       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,#0      
swi Print_value_in_Display
bal fimdoprograma

desvio_1_potenciacao:
mov r1,#1       @ Salva o resultado final
mov r0,#1
swi Swi_Print
mov r0,#8       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,#1      
swi Print_value_in_Display
bal fimdoprograma

desvio_2_potenciacao:
mov r1,r8
mov r7,r1       @ Salva o resultado final
mov r0,#1
swi Swi_Print
mov r0,#8       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r7      
swi Print_value_in_Display
bal fimdoprograma

desvio_1_fatorial:              @ Resultado do fatorial de 0 e 1                     
mov r0,#7                       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,#1                       @ O resultado é salvo como '1'
swi Print_value_in_Display
bal fimdoprograma

Erro_resultado_negativo:
mov r0,#8           @ Coluna
mov r1,#5          @ Linha 
ldr r2,=simbolo_sub
swi Print_a_string_in_Display
sub r1,r5,r4
mov r7,r1       @ Salva o resultado final
mov r0,#9       @ Seta a posicao do display onde a mensagem vai ser lida
mov r1,#5
mov r2,r7      
swi Print_value_in_Display
bal fimdoprograma

Recebe0:
mov r0,#0
bal number

Recebe1:
mov r0,#1
bal number

Recebe2:
mov r0,#2
bal number

Recebe3:
mov r0,#3
bal number

Recebe4:
mov r0,#4
bal number

Recebe5:
mov r0,#5
bal number

Recebe6:
mov r0,#6
bal number

Recebe7:
mov r0,#7
bal number

Recebe8:
mov r0,#8
bal number

Recebe9:
mov r0,#9
bal number

fimdoprograma:
@swi Clear_Display
mov r0,#6
mov r1,#7
ldr r2,=fim     
swi Print_a_string_in_Display
swi 0x11 @ encerra o programa

.data
mensagem_inicial_1: .asciz "Calculadora de 7 operacoes - IFES"
mensagem_inicial_2: .asciz "0 - Soma"
mensagem_inicial_3: .asciz "1 - Subtracao"
mensagem_inicial_4: .asciz "2 - Multiplicacao"
mensagem_inicial_5: .asciz "3 - Divisao"
mensagem_inicial_6: .asciz "4 - Potenciacao" 
mensagem_inicial_7: .asciz "5 - Quadrado da diferenca"
mensagem_inicial_8: .asciz "6 - Fatorial"
mensagem_erro_divisao: .asciz "Erro: Divisao nao inteira"
simbolo_soma: .asciz "+"
simbolo_sub: .asciz "-"
simbolo_mult: .asciz "*"
simbolo_div: .asciz "/"
simbolo_fatorial: .asciz "!"
simbolo_parenteses_1: .asciz "("
simbolo_parenteses_2: .asciz ")"
simbolo_potenciacao: .asciz "^"
simbolo_quadrado: .asciz "^2"
simbolo_igual: .asciz "="
string_operacao: .asciz "Digite o valor e a operacao desejada:"
novalinha: .asciz " \n"
resultado: .asciz "Resultado da operacao: "
fim: .asciz "Fim da operacao"
@n: .word 10 @ valor n-esimo termo do somatorio
i: .word 0 @ indice da operacao
sinal_negativo: .asciz "-"
mensagem_errosize: .asciz "Primeiro valor menor do que o primeiro \n"
.end