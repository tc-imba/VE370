import random

size = 50

arr = [55, 83]
for i in range(2, size):
    arr.append(random.randint(0, 100))
print(arr)

fid = open('testArray.s', 'w')
for i in range(size):
    fid.write('        addi $t0, $0, %2d    # $t0 = %d\n' % (arr[i], arr[i]))
    fid.write('        sw $t0, %3d($s4)    # testArray[%d] = $t0\n' % (i * 4, i))
