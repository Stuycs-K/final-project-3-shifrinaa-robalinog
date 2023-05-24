import java.util.*;

StringDict morseDict; 

void setup() {
  String[] keys = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
  String[] values = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",
".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."}; 
 

  morseDict = new StringDict(keys, values); 
  //print(morseDict); 
  
  String[] combos = {". ", "- ", "--", "..", ".-", "-.", "  ", " .", " -"};

  ArrayList<String> num = new ArrayList<>(Arrays.asList("1", "2", "3", "4", "5", "6", "7", "8", "9");
  print(num.toArray()); 
  Collections.shuffle(num);
  print(num.toArray()); 
  String[] nums = num.toArray(new String[num.size()]); 
  StringDict map = new StringDict(combos, nums);
  
  print(encoder("hi", map)); 
}

void loop() {
  
}

String encoder(String text, StringDict map) {
  //convert text to morse 
  String morse = "";  
  String cipher = ""; 
  
  for (int i = 0; i < text.length(); i++) {
    String temp = "" + Character.toUpperCase(text.charAt(i)); 
    morse += morseDict.get(temp) + " ";  
  }
  
  for (int i = 0; i < morse.length(); i+=2) {
    String temp = morse.substring(i, i+2); 
    cipher += map.get(temp); 
  }
  
  return cipher;
}
