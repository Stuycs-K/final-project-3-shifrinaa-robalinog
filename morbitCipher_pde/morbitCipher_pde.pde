import java.util.*;

StringDict morseDict; 

void setup() {
  String[] keys = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
  String[] values = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",
".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."}; 
 

  morseDict = new StringDict(keys, values); 
  morseDictRev = new StringDict(values, keys); 
}

void loop() {
  
}

//StringDict encoder(String text) {
//  return StringDict;
//}


String decoder(String encoded, StringDict map){
  String decoded = "";
  for(int i = 0; i < encoded.length(); i++){
    decoded += morseDictRev.get(map.get(encoded[i]))
  }
  return decoded;
}
