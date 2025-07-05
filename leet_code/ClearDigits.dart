// You are given a string s.

// Your task is to remove all digits by doing this operation repeatedly:
// Delete the first digit and the closest non-digit character to its left.
// Return the resulting string after removing all digits.
// Note that the operation cannot be performed on a digit that does not have any non-digit character to its left.

// Example 1:
// Input: s = "abc"
// Output: "abc"

// Explanation:
// There is no digit in the string.

// Example 2:
// Input: s = "cb34"
// Output: ""

// Explanation:
// First, we apply the operation on s[2], and s becomes "c4".
// Then we apply the operation on s[1], and s becomes "".

class ClearDigits {
  String clearDigits(String s) {
    List<String> resultChars = [];
    for (var i = 0; i < s.length; i++) {
      if (num.tryParse(s[i]) != null) {
        if (resultChars.isNotEmpty) {
          resultChars.removeLast();
        }
      } else {
        resultChars.add(s[i]);
      }
    }

    return resultChars.join('');
  }
}

void main() {
  ClearDigits clearDigits = new ClearDigits();
  //Example  1
  print('Input :s = "abc"');
  print('Output : ${clearDigits.clearDigits("abc")}');

  //Example  2
  print('Input :s =  "cb34"');
  print('Output : ${clearDigits.clearDigits("cb34")}');
}
