private Item[] store = 
{
  new Item(184, 14), 
  new Item(196, 60), 
  new Item(206, 31), 
  new Item(2370, 65), 
  new Item(7282, 73), 
  new Item(8303, 90), 
  new Item(12328, 63), 
  new Item(12705, 14), 
  new Item(13066, 8), 
  new Item(14088, 92), 
  new Item(15320, 82), 
  new Item(15814, 60), 
  new Item(15917, 51), 
  new Item(17911, 96), 
  new Item(18061, 3), 
  new Item(18410, 56), 
  new Item(18465, 27), 
  new Item(18618, 64), 
  new Item(18871, 69), 
  new Item(19967, 45)
};                             
public int linearSearch(int catNumToFind)
{
  for( int i=0; i < store.length; i++){
    if (store[i].getCatNum() == catNumToFind){
      return store[i].getInventory();
    }
  }
  return -1;
}
public int recursiveLinearSearch(int catNumToFind, int startIndex)
{
  
  if (startIndex == store.length){
  return -1;}
  if (store[startIndex].getCatNum() == catNumToFind) 
    {return store[startIndex].getInventory();}
  return recursiveLinearSearch (catNumToFind, startIndex+1);
}
public int binarySearch(int catNumToFind)
{//set min and max bound
   int i = store.length/2;
   int min = 0;
   int max = store.length;
   int overflow = 0;
  while (true) {
    if (overflow >= 5) {break;}
  if (store[i].getCatNum() == catNumToFind) {
    return store[i].getInventory();}
  if (store[i].getCatNum() > catNumToFind) {
    max = (max+min)/2;
    i = (int)(i = (max+min)/2); 
    overflow ++;
  }
  if (store[i].getCatNum() < catNumToFind) {
    
    min = (min+max)/2;
    i = (int)(i = (max+min)/2); 
    overflow++;
  }

  
}  
  return -1;
}
int overflowb = 0;
public int recursiveBinarySearch(int catNumToFind, int nLow, int nHigh)
{
   int i = (nLow+nHigh)/2;
   if (nLow > nHigh) {return -1;}
   if (store[i].getCatNum() < catNumToFind) {
      return recursiveBinarySearch(catNumToFind, i+1, nHigh);
   }
   else if (store[i].getCatNum() > catNumToFind) {
      return recursiveBinarySearch(catNumToFind, nLow, i-1);
   }
   else return store[i].getInventory();
}
public void setup()
{
  int[] tests = {0, 183, 184, 2370, 15320, 19967, 196,206,2370,7282,8303,12328,12705,13066,14088,15320,15814};
  System.out.println();
  System.out.println("Testing Non-Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (linearSearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+linearSearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (recursiveLinearSearch(tests[i],0) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveLinearSearch(tests[i],0) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Non-Recursive Binary Search");
  System.out.println("===================================");
  for (int i = 0; i < tests.length; i++)
  {
    
    if (binarySearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Binary Search");
  System.out.println("===============================");
  for (int i = 0; i < tests.length; i++)
  {
    overflowb = 0;
    if (recursiveBinarySearch(tests[i], 0, store.length - 1) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveBinarySearch(tests[i], 0, store.length - 1) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
}

public void draw()
{
  //empty!
}
