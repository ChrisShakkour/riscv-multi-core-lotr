//---------------------------------------------------------
// MEMORY
//    INSTRRAM     : ORIGIN =       , LENGTH =       ,  #words= 
//    DATARAM      : ORIGIN =       , LENGTH =       ,  #words= 
//    STACK        : ORIGIN =       , LENGTH =       ,  #words= 
//    MMIO_GENERAL : ORIGIN =       , LENGTH =       ,  #words= 
//    MMIO_CSR     : ORIGIN =       , LENGTH =       ,  #words= 
//    MMIO_ER      : ORIGIN =       , LENGTH =       ,  #words= 
//    MMIO_DRCT_IN : ORIGIN =       , LENGTH =       ,  #words= 
//    MMIO_DRCT_OUT: ORIGIN =       , LENGTH =       ,  #words= 
//----------------------------------------------------------
#define MMIO_GENERAL  (*(volatile int (*)[1])(0x00400F00))//

int main() {
	int arr[3];
  arr[0]=1;
  arr[1]=5;
  arr[2]=7;
  int num_to_search = 1;
  int low = 0;
  int high = 2;
  int found = 0;
  MMIO_GENERAL[0]=0;
  while (low <= high && !found) {
    int mid = low + (high - low) / 2;
    if (arr[mid] == num_to_search){
      found = 1;
      MMIO_GENERAL[0]=1;
    }
    if (arr[mid] < num_to_search)
      low = mid + 1;
    else
        high = mid - 1;
  }
}// main