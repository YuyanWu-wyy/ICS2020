    .align    2
    .globl    main
    .type    main, @function
main:
    andi a0,a0,0
    andi a1,a1,0 #serve as a counter
    addi a2,a0,0
    andi a3,a3,0#serve as a flag
    andi ra,ra,0#store the result
    addi a0,a0,-25#the number to be rotated  L6
    addi a1,a1,2#the number of the process of rotating  L7
    addi a3,a3,0
    blt a3, a1,loop
    loop: addi a2,a0,0
    add a0,a0,a0
    blt a2,a3,add1
    addi a2,a0,0
    addi a1,a1,-1
    blt a3,a1,loop
    addi ra,a0,0
    ret
    add1: addi a0,a0,1
    addi a2,a0,0
    addi a1,a1,-1
    blt a3,a1,loop
    addi ra,a0,0
    ret
