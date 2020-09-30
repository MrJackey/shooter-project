//Shooter project 08
//Helpers

public boolean contains(int[] arr, int check) {
  for (int i = 0; i < arr.length; ++i) {
    if (arr[i] == check) {
      return true;
    }
  }
  return false;
}