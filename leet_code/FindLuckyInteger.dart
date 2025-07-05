// Given an array of integers arr, a lucky integer is an integer that has a frequency in the array equal to its value.
// Return the largest lucky integer in the array. If there is no lucky integer return -1.

// Example 1:
// Input: arr = [2,2,3,4]
// Output: 2
// Explanation: The only lucky number in the array is 2 because frequency[2] == 2.

// Example 2:
// Input: arr = [1,2,2,3,3,3]
// Output: 3
// Explanation: 1, 2 and 3 are all lucky numbers, return the largest of them.

// Example 3:
// Input: arr = [2,2,2,3,3]
// Output: -1
// Explanation: There are no lucky numbers in the array.

import 'dart:math';

class FindLuckyInteger {
  int findLucky(List<int> arr) {
    Map<int, int> luckyNumber = {};
    for (int number in arr) {
      luckyNumber[number] = (luckyNumber[number] ?? 0) + 1;
    }

    int maxLuckyInteger = -1;
    luckyNumber.forEach((value, frequency) {
      if (value == frequency) {
        // This 'value' is a lucky integer
        maxLuckyInteger = max(maxLuckyInteger, value);
      }
    });

    return maxLuckyInteger;
  }
}

void main() {
  FindLuckyInteger findLucky = FindLuckyInteger();

  //example1
  List<int> arr1 = [2, 2, 3, 4];
  print('input: $arr1');
  print('Output: ${findLucky.findLucky(arr1)}');

  //example2
  List<int> arr2 = [1, 2, 2, 3, 3, 3];
  print('input: $arr2');
  print('Output: ${findLucky.findLucky(arr2)}');

  //example2
  List<int> arr3 = [2, 2, 2, 3, 3];
  print('input: $arr3');
  print('Output: ${findLucky.findLucky(arr3)}');
}
