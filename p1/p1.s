        .data
endline:.asciiz "\n"        # declare endline
passStr:.asciiz "Pass: "    # declare passStr
failStr:.asciiz "Fail: "    # declare failStr

        .text
        .globl main

main:
        addi $sp, $sp, -80  # adjust stack for 20 item

        li $s0, 50          # int size = 50
        move $s1, $0        # int PassCnt = 0
        move $s2, $0        # int FailCnt = 0
        move $s3, $sp       # int testArray[size]

        li $t0, 55          # $t0 = 55
        sw $t0,  0($s3)     # testArray[0] = $t0
        li $t0, 83          # $t0 = 83
        sw $t0,  4($s3)     # testArray[1] = $t0
        li $t0, 12          # $t0 = 12
        sw $t0,  8($s3)     # testArray[2] = $t0
        li $t0, 66          # $t0 = 66
        sw $t0, 12($s3)     # testArray[3] = $t0
        li $t0, 33          # $t0 = 33
        sw $t0, 16($s3)     # testArray[4] = $t0
        li $t0,  2          # $t0 = 2
        sw $t0, 20($s3)     # testArray[5] = $t0
        li $t0,  7          # $t0 = 7
        sw $t0, 24($s3)     # testArray[6] = $t0
        li $t0,  2          # $t0 = 2
        sw $t0, 28($s3)     # testArray[7] = $t0
        li $t0, 27          # $t0 = 27
        sw $t0, 32($s3)     # testArray[8] = $t0
        li $t0, 32          # $t0 = 32
        sw $t0, 36($s3)     # testArray[9] = $t0
        li $t0, 69          # $t0 = 69
        sw $t0, 40($s3)     # testArray[10] = $t0
        li $t0, 78          # $t0 = 78
        sw $t0, 44($s3)     # testArray[11] = $t0
        li $t0, 66          # $t0 = 66
        sw $t0, 48($s3)     # testArray[12] = $t0
        li $t0, 91          # $t0 = 91
        sw $t0, 52($s3)     # testArray[13] = $t0
        li $t0, 73          # $t0 = 73
        sw $t0, 56($s3)     # testArray[14] = $t0
        li $t0, 38          # $t0 = 38
        sw $t0, 60($s3)     # testArray[15] = $t0
        li $t0, 41          # $t0 = 41
        sw $t0, 64($s3)     # testArray[16] = $t0
        li $t0, 54          # $t0 = 54
        sw $t0, 68($s3)     # testArray[17] = $t0
        li $t0, 19          # $t0 = 19
        sw $t0, 72($s3)     # testArray[18] = $t0
        li $t0, 70          # $t0 = 70
        sw $t0, 76($s3)     # testArray[19] = $t0
        li $t0, 63          # $t0 = 63
        sw $t0, 80($s3)     # testArray[20] = $t0
        li $t0, 98          # $t0 = 98
        sw $t0, 84($s3)     # testArray[21] = $t0
        li $t0, 18          # $t0 = 18
        sw $t0, 88($s3)     # testArray[22] = $t0
        li $t0,  2          # $t0 = 2
        sw $t0, 92($s3)     # testArray[23] = $t0
        li $t0, 60          # $t0 = 60
        sw $t0, 96($s3)     # testArray[24] = $t0
        li $t0, 43          # $t0 = 43
        sw $t0, 100($s3)     # testArray[25] = $t0
        li $t0,  9          # $t0 = 9
        sw $t0, 104($s3)     # testArray[26] = $t0
        li $t0, 75          # $t0 = 75
        sw $t0, 108($s3)     # testArray[27] = $t0
        li $t0, 68          # $t0 = 68
        sw $t0, 112($s3)     # testArray[28] = $t0
        li $t0, 60          # $t0 = 60
        sw $t0, 116($s3)     # testArray[29] = $t0
        li $t0,  4          # $t0 = 4
        sw $t0, 120($s3)     # testArray[30] = $t0
        li $t0,  0          # $t0 = 0
        sw $t0, 124($s3)     # testArray[31] = $t0
        li $t0,  2          # $t0 = 2
        sw $t0, 128($s3)     # testArray[32] = $t0
        li $t0, 91          # $t0 = 91
        sw $t0, 132($s3)     # testArray[33] = $t0
        li $t0, 94          # $t0 = 94
        sw $t0, 136($s3)     # testArray[34] = $t0
        li $t0, 86          # $t0 = 86
        sw $t0, 140($s3)     # testArray[35] = $t0
        li $t0, 90          # $t0 = 90
        sw $t0, 144($s3)     # testArray[36] = $t0
        li $t0,  1          # $t0 = 1
        sw $t0, 148($s3)     # testArray[37] = $t0
        li $t0, 77          # $t0 = 77
        sw $t0, 152($s3)     # testArray[38] = $t0
        li $t0, 24          # $t0 = 24
        sw $t0, 156($s3)     # testArray[39] = $t0
        li $t0, 41          # $t0 = 41
        sw $t0, 160($s3)     # testArray[40] = $t0
        li $t0, 36          # $t0 = 36
        sw $t0, 164($s3)     # testArray[41] = $t0
        li $t0, 28          # $t0 = 28
        sw $t0, 168($s3)     # testArray[42] = $t0
        li $t0,  2          # $t0 = 2
        sw $t0, 172($s3)     # testArray[43] = $t0
        li $t0, 87          # $t0 = 87
        sw $t0, 176($s3)     # testArray[44] = $t0
        li $t0, 43          # $t0 = 43
        sw $t0, 180($s3)     # testArray[45] = $t0
        li $t0, 95          # $t0 = 95
        sw $t0, 184($s3)     # testArray[46] = $t0
        li $t0, 55          # $t0 = 55
        sw $t0, 188($s3)     # testArray[47] = $t0
        li $t0, 23          # $t0 = 23
        sw $t0, 192($s3)     # testArray[48] = $t0
        li $t0, 69          # $t0 = 69
        sw $t0, 196($s3)     # testArray[49] = $t0


        move $a0, $s3       # $a0 = testArray
        move $a1, $s0       # $a1 = size
        li $a2, 1           # $a2 = 1
        jal countArray      # $v0 = countArray(testArray, size, 1)
        move $s4, $v0       # save the result into $s4

        la $a0, passStr     # $a0 = passStr
        li $v0, 4           # prepare to string output (system call 4)
        syscall             # string output
        move $a0, $s4       # $a0 = $v0
        li $v0, 1           # prepare to string output (system call 1)
        syscall             # int output
        la $a0, endline     # $a0 = endline
        li $v0, 4           # prepare to string output (system call 4)
        syscall             # string output

        move $a0, $s3       # $a0 = testArray
        move $a1, $s0       # $a1 = size
        li $a2, -1          # $a2 = -1
        jal countArray      # $v0 = countArray(testArray, size, -1)
        move $s4, $v0       # save the result into $s4

        la $a0, failStr     # $a0 = failStr
        li $v0, 4           # prepare to string output (system call 4)
        syscall             # string output
        move $a0, $s4       # $a0 = $v0
        li $v0, 1           # prepare to string output (system call 1)
        syscall             # int output
        la $a0, endline     # $a0 = endline
        li $v0, 4           # prepare to string output (system call 4)
        syscall             # string output

        li $v0, 10          # prepare to exit (system call 10)
        syscall             # exit

countArray:
        addi $sp, $sp, -24  # adjust stack for 6 items
        sw $ra, 20($sp)     # save $ra on stack
        sw $s4, 16($sp)     # save $s4 on stack
        sw $s3, 12($sp)     # save $s3 on stack
        sw $s2, 8($sp)      # save $s2 on stack
        sw $s1, 4($sp)      # save $s1 on stack
        sw $s0, 0($sp)      # save $s0 on stack

        move $s0, $a0       # save $a0(int A[]) into $s0
        move $s1, $a1       # save $a1(int numElements) into $s1
        move $s2, $a2       # save $a2(int cntType) into $s2

        addi $s3, $s1, -1   # $s3(i) = numElements - 1
        li $s4, 0           # $s4(cnt) = 0
countArrayFor:
        blt $s3, $0, countArrayEndFor
                            # if (i < 0) goto countArrayEndFor
        sll $t0, $s3 ,2     # $t0 = i * 4
        add $t0, $s0, $t0   # $t0 = A + $t0
        lw $a0, 0($t0)      # $a0 = A[i]
        li $t1, 1           # $t1 = 1
        bne $s2, $t1, countArrayElse
                            # if (cntType != 1) goto countArrayElse
        jal Pass            # $v0 = Pass(A[i])
        j countArrayEndIf
countArrayElse:
        jal Fail            # $v0 = Fail(A[i])
countArrayEndIf:
        add $s4, $s4, $v0   # cnt += $v0
        addi $s3, $s3, -1   # i--
        j countArrayFor
countArrayEndFor:
        move $v0, $s4       # $v0 = cnt
        lw $s0, 0($sp)      # restore $s0 from stack
        lw $s1, 4($sp)      # restore $s1 from stack
        lw $s2, 8($sp)      # restore $s2 from stack
        lw $s3, 12($sp)     # restore $s3 from stack
        lw $s4, 16($sp)     # restore $s4 from stack
        lw $ra, 20($sp)     # restore $ra from stack
        addi $sp, $sp, 24   # recover the stack
        jr $ra              # return
Pass:
        li $t0, 60
        bge $a0, $t0, PassIf
                            # if ($a0(x) >= 60) goto PassIf
        li $v0, 0           # $v0 = 0
        jr $ra              # return
PassIf:
        li $v0, 1           # $v0 = 1
        jr $ra              # return
Fail:
        li $t0, 60
        blt $a0, $t0, FailIf
                            # if ($a0(x) < 60) goto FailIf
        li $v0, 0           # $v0 = 0
        jr $ra              # return
FailIf:
        li $v0, 1           # $v0 = 1
        jr $ra              # return