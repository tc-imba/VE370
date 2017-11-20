int countArray(int A[], int numElements, int cntType);
int Pass(int x);
int Fail(int x);

int main() {
    int size = 2;  //determine the size of the array here
    int PassCnt, FailCnt;							
    int testArray[2] = { 55, 83 };				
    PassCnt = countArray(testArray, size, 1);						
    FailCnt = countArray(testArray, size, -1);						
}		
								
int countArray(int A[], int numElements, int cntType) {					
/**********************************************************************
* Count specific elements in the integer array A[] whose size is     *
* numElements and return the following:                              *
*                                                                    *
* When cntType = 1, count the elements greater than or equal to 60;  *
* When cntType = -1, count the elements less than 60;                *
**********************************************************************/
    int i, cnt = 0;									
    for(i=numElements-1; i>-1; i--) {						
        switch (cntType) {								
            case 1: cnt += Pass(A[i]); break;			
            default: cnt += Fail(A[i]); 			
        }								
    }							
    return cnt;							
}							
							
int Pass(int x) {							
    if(x>=60) return 1;						
    else return 0;						
}							
							
int Fail(int x) {							
    if (x<60) return 1;						
    else return 0;						
} 
