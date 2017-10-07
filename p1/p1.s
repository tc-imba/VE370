        .text
        .globl __start
__start:
        addi $sp, $sp, -212     # adjust stack for 50*4+12 item

        addi $s0, $0, 50        # int size = 50
        addu $s1, $0, $0        # int PassCnt = 0
        addu $s2, $0, $0        # int FailCnt = 0
        addu $s3, $0, $sp       # char buffer[10]
        addiu $s4, $s3, 12      # int testArray[size]

        addi $t0, $0, 55        # $t0 = 55
        sw $t0,   0($s4)        # testArray[0] = $t0
        addi $t0, $0, 83        # $t0 = 83
        sw $t0,   4($s4)        # testArray[1] = $t0
        addi $t0, $0, 21        # $t0 = 21
        sw $t0,   8($s4)        # testArray[2] = $t0
        addi $t0, $0, 20        # $t0 = 20
        sw $t0,  12($s4)        # testArray[3] = $t0
        addi $t0, $0, 40        # $t0 = 40
        sw $t0,  16($s4)        # testArray[4] = $t0
        addi $t0, $0, 49        # $t0 = 49
        sw $t0,  20($s4)        # testArray[5] = $t0
        addi $t0, $0, 42        # $t0 = 42
        sw $t0,  24($s4)        # testArray[6] = $t0
        addi $t0, $0, 35        # $t0 = 35
        sw $t0,  28($s4)        # testArray[7] = $t0
        addi $t0, $0, 92        # $t0 = 92
        sw $t0,  32($s4)        # testArray[8] = $t0
        addi $t0, $0,  8        # $t0 = 8
        sw $t0,  36($s4)        # testArray[9] = $t0
        addi $t0, $0, 65        # $t0 = 65
        sw $t0,  40($s4)        # testArray[10] = $t0
        addi $t0, $0, 88        # $t0 = 88
        sw $t0,  44($s4)        # testArray[11] = $t0
        addi $t0, $0, 25        # $t0 = 25
        sw $t0,  48($s4)        # testArray[12] = $t0
        addi $t0, $0, 100       # $t0 = 100
        sw $t0,  52($s4)        # testArray[13] = $t0
        addi $t0, $0, 43        # $t0 = 43
        sw $t0,  56($s4)        # testArray[14] = $t0
        addi $t0, $0,  9        # $t0 = 9
        sw $t0,  60($s4)        # testArray[15] = $t0
        addi $t0, $0, 98        # $t0 = 98
        sw $t0,  64($s4)        # testArray[16] = $t0
        addi $t0, $0, 10        # $t0 = 10
        sw $t0,  68($s4)        # testArray[17] = $t0
        addi $t0, $0, 81        # $t0 = 81
        sw $t0,  72($s4)        # testArray[18] = $t0
        addi $t0, $0, 63        # $t0 = 63
        sw $t0,  76($s4)        # testArray[19] = $t0
        addi $t0, $0, 83        # $t0 = 83
        sw $t0,  80($s4)        # testArray[20] = $t0
        addi $t0, $0, 27        # $t0 = 27
        sw $t0,  84($s4)        # testArray[21] = $t0
        addi $t0, $0, 42        # $t0 = 42
        sw $t0,  88($s4)        # testArray[22] = $t0
        addi $t0, $0, 81        # $t0 = 81
        sw $t0,  92($s4)        # testArray[23] = $t0
        addi $t0, $0, 94        # $t0 = 94
        sw $t0,  96($s4)        # testArray[24] = $t0
        addi $t0, $0,  2        # $t0 = 2
        sw $t0, 100($s4)        # testArray[25] = $t0
        addi $t0, $0, 40        # $t0 = 40
        sw $t0, 104($s4)        # testArray[26] = $t0
        addi $t0, $0, 49        # $t0 = 49
        sw $t0, 108($s4)        # testArray[27] = $t0
        addi $t0, $0, 75        # $t0 = 75
        sw $t0, 112($s4)        # testArray[28] = $t0
        addi $t0, $0, 46        # $t0 = 46
        sw $t0, 116($s4)        # testArray[29] = $t0
        addi $t0, $0, 67        # $t0 = 67
        sw $t0, 120($s4)        # testArray[30] = $t0
        addi $t0, $0, 46        # $t0 = 46
        sw $t0, 124($s4)        # testArray[31] = $t0
        addi $t0, $0, 89        # $t0 = 89
        sw $t0, 128($s4)        # testArray[32] = $t0
        addi $t0, $0, 27        # $t0 = 27
        sw $t0, 132($s4)        # testArray[33] = $t0
        addi $t0, $0, 39        # $t0 = 39
        sw $t0, 136($s4)        # testArray[34] = $t0
        addi $t0, $0, 12        # $t0 = 12
        sw $t0, 140($s4)        # testArray[35] = $t0
        addi $t0, $0, 19        # $t0 = 19
        sw $t0, 144($s4)        # testArray[36] = $t0
        addi $t0, $0, 41        # $t0 = 41
        sw $t0, 148($s4)        # testArray[37] = $t0
        addi $t0, $0, 86        # $t0 = 86
        sw $t0, 152($s4)        # testArray[38] = $t0
        addi $t0, $0,  3        # $t0 = 3
        sw $t0, 156($s4)        # testArray[39] = $t0
        addi $t0, $0, 14        # $t0 = 14
        sw $t0, 160($s4)        # testArray[40] = $t0
        addi $t0, $0, 64        # $t0 = 64
        sw $t0, 164($s4)        # testArray[41] = $t0
        addi $t0, $0, 22        # $t0 = 22
        sw $t0, 168($s4)        # testArray[42] = $t0
        addi $t0, $0, 64        # $t0 = 64
        sw $t0, 172($s4)        # testArray[43] = $t0
        addi $t0, $0,  8        # $t0 = 8
        sw $t0, 176($s4)        # testArray[44] = $t0
        addi $t0, $0, 38        # $t0 = 38
        sw $t0, 180($s4)        # testArray[45] = $t0
        addi $t0, $0, 32        # $t0 = 32
        sw $t0, 184($s4)        # testArray[46] = $t0
        addi $t0, $0, 26        # $t0 = 26
        sw $t0, 188($s4)        # testArray[47] = $t0
        addi $t0, $0, 64        # $t0 = 64
        sw $t0, 192($s4)        # testArray[48] = $t0
        addi $t0, $0,  5        # $t0 = 5
        sw $t0, 196($s4)        # testArray[49] = $t0

        addu $a0, $0, $s4       # $a0 = testArray
        addu $a1, $0, $s0       # $a1 = size
        addi $a2, $0, 1         # $a2 = 1
        jal countArray          # $v0 = countArray(testArray, size, 1)
        addi $t1, $0, 1         # wait for delay
        addu $s5, $0, $v0       # save the result into $s4

        addi $t0, $0, 80        # Init the string "Pass: "
        sb $t0, 0($s3)
        addi $t0, $0, 97
        sb $t0, 1($s3)
        addi $t0, $0, 115
        sb $t0, 2($s3)
        sb $t0, 3($s3)
        addi $t0, $0, 58
        sb $t0, 4($s3)
        addi $t0, $0, 32
        sb $t0, 5($s3)
        addi $t0, $0, 0
        sb $t0, 6($s3)
        addiu $a0, $s3, 0       # $a0 = $s3 ("Pass: ")
        addi $v0, $0, 4         # prepare to string output (system call 4)
        syscall                 # string output

        addu $a0, $0, $s5       # $a0 = $s4
        addi $v0, $0, 1         # prepare to int output (system call 1)
        syscall                 # int output

        addi $t0, $0, 10        # Init the string "\n"
        sb $t0, 0($s3)
        addi $t0, $0, 0
        sb $t0, 1($s3)
        addiu $a0, $s3, 0       # $a0 = $s3 ("\n")
        addi $v0, $0, 4         # prepare to string output (system call 4)
        syscall                 # string output

        addu $a0, $0, $s4       # $a0 = testArray
        addu $a1, $0, $s0       # $a1 = size
        addi $a2, $0, -1        # $a2 = -1
        jal countArray          # $v0 = countArray(testArray, size, -1)
        addi $t1, $0, 1         # wait for delay
        addu $s5, $0, $v0       # save the result into $s4

        addi $t0, $0, 70        # Init the string "Fail: "
        sb $t0, 0($s3)
        addi $t0, $0, 97
        sb $t0, 1($s3)
        addi $t0, $0, 105
        sb $t0, 2($s3)
        addi $t0, $0, 108
        sb $t0, 3($s3)
        addi $t0, $0, 58
        sb $t0, 4($s3)
        addi $t0, $0, 32
        sb $t0, 5($s3)
        addi $t0, $0, 0
        sb $t0, 6($s3)
        addiu $a0, $s3, 0       # $a0 = $s3 ("Fail: ")
        addi $v0, $0, 4         # prepare to string output (system call 4)
        syscall                 # string output
        addu $a0, $0, $s5       # $a0 = $v0
        addi $v0, $0, 1         # prepare to int output (system call 1)
        syscall                 # int output

        addi $t0, $0, 10        # Init the string "\n"
        sb $t0, 0($s3)
        addi $t0, $0, 0
        sb $t0, 1($s3)
        addiu $a0, $s3, 0       # $a0 = $s3 ("\n")
        addi $v0, $0, 4         # prepare to string output (system call 4)
        syscall                 # string output

        jal exit
        addi $t0, $0, 0
countArray:
        addi $sp, $sp, -24      # adjust stack for 6 items
        sw $ra, 20($sp)         # save $ra on stack
        sw $s4, 16($sp)         # save $s4 on stack
        sw $s3, 12($sp)         # save $s3 on stack
        sw $s2, 8($sp)          # save $s2 on stack
        sw $s1, 4($sp)          # save $s1 on stack
        sw $s0, 0($sp)          # save $s0 on stack

        addu $s0, $0, $a0       # save $a0(int A[]) into $s0
        addu $s1, $0, $a1       # save $a1(int numElements) into $s1
        addu $s2, $0, $a2       # save $a2(int cntType) into $s2

        addi $s3, $s1, -1       # $s3(i) = numElements - 1
        addi $s4, $0, 0         # $s4(cnt) = 0
countArrayFor:
        addi $t0, $0, 0         # wait for delay
        slt $t0, $s3, $0        # $t0 = i < 0
        bne $t0, $0, countArrayEndFor
                                # if ($t0 != 0) goto countArrayEndFor
        sll $t0, $s3 ,2         # $t0 = i * 4
        add $t0, $s0, $t0       # $t0 = A + $t0
        lw $a0, 0($t0)          # $a0 = A[i]
        addi $t1, $0, 1         # $t1 = 1
        addi $t1, $0, 1         # wait for delay
        bne $s2, $t1, countArrayElse
                                # if (cntType != 1) goto countArrayElse
        jal Pass                # $v0 = Pass(A[i])
        addi $t1, $0, 1         # wait for delay
        j countArrayEndIf       # jump to endif
        addi $t0, $0, 0         # wait for delay
countArrayElse:
        addi $t0, $0, 0         # wait for delay
        jal Fail                # $v0 = Fail(A[i])
        addi $t1, $0, 1         # wait for delay
countArrayEndIf:
        addi $t0, $0, 0         # wait for delay
        addu $s4, $s4, $v0      # cnt += $v0
        addi $s3, $s3, -1       # i--
        j countArrayFor         # jump to for begin
        addi $t0, $0, 0         # wait for delay
countArrayEndFor:
        addi $t0, $0, 0         # wait for delay
        addu $v0, $0, $s4       # $v0 = cnt
        lw $s0, 0($sp)          # restore $s0 from stack
        lw $s1, 4($sp)          # restore $s1 from stack
        lw $s2, 8($sp)          # restore $s2 from stack
        lw $s3, 12($sp)         # restore $s3 from stack
        lw $s4, 16($sp)         # restore $s4 from stack
        lw $ra, 20($sp)         # restore $ra from stack
        addi $sp, $sp, 24       # recover the stack
        addi $t1, $0, 0         # wait for delay
        jr $ra                  # return
        addi $t0, $0, 0         # wait for delay
Pass:
        addi $t0, $0, 60        # $t0 = 60
        slt $t1, $a0, $t0       # $t1 = x < 60
        beq $t1, $0, PassIf     # if ($t1 == 1) goto PassIf
        addi $v0, $0, 0         # $v0 = 0
        jr $ra                  # return
        addi $t0, $0, 0         # wait for delay
PassIf:
        addi $t0, $0, 0         # wait for delay
        addi $v0, $0, 1         # $v0 = 1
        jr $ra                  # return
        addi $t0, $0, 0         # wait for delay
Fail:
        addi $t0, $0, 60        # $t0 = 60
        slt $t1, $a0, $t0       # $t1 = x < 60
        bne $t1, $0,  FailIf    # if ($t1 != 1) goto PassIf
        addi $v0, $0, 0         # $v0 = 0
        jr $ra                  # return
        addi $t0, $0, 0         # wait for delay
FailIf:
        addi $t0, $0, 0         # wait for delay
        addi $v0, $0, 1         # $v0 = 1
        jr $ra                  # return
        addi $t0, $0, 0         # wait for delay
exit:
        addi $v0, $0, 10        # prepare to exit (system call 10)
        syscall                 # exit