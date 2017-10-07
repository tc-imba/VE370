        .text
        .globl __start
__start:
        addi $sp, $sp, -20 # adjust stack for 50 item

        addi $s0, $0, 5          # int size = 50
        addu $s1, $0, $0        # int PassCnt = 0
        addu $s2, $0, $0        # int FailCnt = 0
        addu $s3, $0, $sp       # int testArray[size]

        addi $t0, $0, 55     # $t0 = 55
        sw $t0,   0($s3)    # testArray[0] = $t0
        addi $t0, $0, 83     # $t0 = 83
        sw $t0,   4($s3)    # testArray[1] = $t0
        addi $t0, $0, 67     # $t0 = 67
        sw $t0,   8($s3)    # testArray[2] = $t0
        addi $t0, $0,  4     # $t0 = 4
        sw $t0,  12($s3)    # testArray[3] = $t0
        addi $t0, $0, 59     # $t0 = 59
        sw $t0,  16($s3)    # testArray[4] = $t0

        addu $a0, $0, $s3       # $a0 = testArray
        addu $a1, $0, $s0       # $a1 = size
        addi $a2, $0, -1          # $a2 = -1
        jal countArray      # $v0 = countArray(testArray, size, -1)
        addu $s4, $0, $v0       # save the result into $s4


        #lw $t1, 4($s3)
        #lw $t2, 8($s3)
        #lw $t3, 12($s3)
        #lw $t4, 16($s3)

        addi $v0, $0, 10          # prepare to exit (system call 10)
        syscall             # exit
countArray:
        lw $t0, 0($s3)
        addi $t1, $0, 0
        addi $t1, $0, 0
        jr $ra
