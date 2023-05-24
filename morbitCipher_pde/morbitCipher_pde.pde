import java.util.*;

StringDict morseDict; 
StringDict morseDictRev; 


void setup() {
  String[] keys = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
  String[] values = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",
".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."}; 
 

  morseDict = new StringDict(keys, values); 
  morseDictRev = new StringDict(values, keys); 
  
  String[] combos = {". ", "- ", "--", "..", ".-", "-.", "  ", " .", " -"};

  ArrayList<String> num = new ArrayList<>(Arrays.asList("1", "2", "3", "4", "5", "6", "7", "8", "9"));
  print(num.toArray()); 
  Collections.shuffle(num);
  print(num.toArray()); 
  String[] nums = num.toArray(new String[num.size()]); 
  StringDict map = new StringDict(combos, nums);
  StringDict mapRev = new StringDict(nums, combos);
  
  println(encoder("hi", map)); 
  
  String d = encoder("hi", map);
  println(decoder(d, mapRev));
}

String decoder(String encoded, StringDict map){
  String symbols = "";
  String decoded = "";
  for(int i = 0; i < encoded.length(); i++){
    symbols += (map.get("" + encoded.charAt(i)));
  }
  String ch = "";
  for(int i = 0; i < symbols.length(); i++){
    if(symbols.charAt(i) != ' '){
      ch += symbols.charAt(i);
    }
    else{
      decoded += morseDictRev.get(ch);
      ch = "";
    }
  }
  return decoded;
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
