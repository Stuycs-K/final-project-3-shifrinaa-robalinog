import java.util.*;

StringDict morseDict; 
StringDict morseDictRev; 
StringDict map; 
StringDict mapRev; 

String message; 
String d;


void setup() {
  size(800, 600);
  background(255);
  String[] keys = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " "};
  String[] values = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",
".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--..","xx"}; 
 
  morseDict = new StringDict(keys, values); 
  morseDictRev = new StringDict(values, keys); 

  String[] combos = {".x", "-x", "--", "..", ".-", "-.", "xx", "x.", "x-"};

  ArrayList<String> num = new ArrayList<>(Arrays.asList("1", "2", "3", "4", "5", "6", "7", "8", "9"));
  Collections.shuffle(num);
  String[] nums = num.toArray(new String[num.size()]); 
  
  map = new StringDict(combos, nums);
  mapRev = new StringDict(nums, combos);
  
  message = "hi my name is sasha"; 
  
  println(encoder(message, map)); 
  
  d = encoder("hi my name is sashas", map);
  println(decoder(d, mapRev));
  
}

void draw() {
  stroke(0);
  fill(0); 
  textSize(30); 
  text("Plain Text", 280, 100); 
  noFill(); 
  rect(200, 125, 300, 80, 30); 
  text(message, 220, 170); 
  delay(1000); 
  line(350, 220, 350, 240);
  line(350, 240, 335, 230); 
  line(350, 240, 365, 230);
  text("Cipher Text", 270, 285); 
  rect(200, 310, 300, 80, 30); 
  text(d, 220, 360);
}

String encoder(String text, StringDict map) {
  //convert text to morse 
  String morse = "";  
  String cipher = ""; 
  
  for (int i = 0; i < text.length(); i++) {
    String temp = "" + Character.toUpperCase(text.charAt(i)); 
    morse += morseDict.get(temp);
    if (i+1 < text.length() && text.charAt(i+1) == ' ') {
      morse += "xx"; 
      i += 1; 
    }
    else if (i+1 < text.length() && text.charAt(i+1) != ' ') {
      morse += "x";   
    }
  }
  for (int i = 0; i < morse.length()-1; i+=2) {
    String temp = morse.substring(i, i+2); 
    cipher += map.get(temp); 
  }
  
  return cipher;
}

String decoder(String encoded, StringDict map){
  String symbols = "";
  String decoded = "";
  for(int i = 0; i < encoded.length(); i++){
    symbols += (map.get("" + encoded.charAt(i)));
  }
  String ch = "";
  for(int i = 0; i < symbols.length(); i++){
    if(symbols.charAt(i) != 'x'){
      ch += symbols.charAt(i);
    }
    else{ 
      decoded += morseDictRev.get(ch); 
      ch = ""; 
      if(i+1 < symbols.length() && symbols.charAt(i+1) == 'x'){
        decoded += " ";
        i += 1; 
      }
    }
  }
  if (ch.length() > 0) {
    decoded += morseDictRev.get(ch); 
  }
  return decoded;
}
