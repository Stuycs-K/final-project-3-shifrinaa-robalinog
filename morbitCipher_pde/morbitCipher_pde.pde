import java.util.*;

StringDict morseDict; 

void setup() {
  String[] keys = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
  String[] values = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",
".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."}; 
 

  morseDict = new StringDict(keys, values); 
  print(morseDict); 
}

void loop() {
  
}

StringDict() encoder(String text) {
  
}
