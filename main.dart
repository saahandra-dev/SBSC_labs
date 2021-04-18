void main() {
  
  // Lab 1
  
  bool isPrime = true;
  int num = 17;
  
  /*  this condition calculates the modulus of the initialized num by iterating through 
  numbers less than the intialized num to ascertain if it is a prime number.
  */
  for(int i = 2; i < num; i++) {
    if(num % i == 0) {
      isPrime = false;
    }
  }
  if(isPrime) {
    print('prime number');
  } else {
    print('not prime number');
  }
  
  
  
  //Lab 2 
  
  bool addNum(int a, int b) {
    if(a + b < 100) {
      return true;
    } else {
      return false;
    }
  }
  addNum(55, 28);
}