import java.util.*;

StringDict morseDict; 
StringDict morseDictRev; 
StringDict map; 
StringDict mapRev; 

String message; 
String d;
int currentCharIndex = 0;


void setup() {
  size(1000, 600);
  background(255);
  textSize(20);
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
  
  d = encoder("hi my name is sasha", map);
  println(decoder(d, mapRev));
  
}

void draw() {
  background(255);

  // Animate the encoding process
  if (frameCount % 10 == 0 && currentCharIndex < message.length()) {
    currentCharIndex++;
  }

  // Display plaintext
  String currentText = message.substring(0, currentCharIndex);
  drawBox(400, 100, currentText, color(255, 200, 200));

  // Display morse code
  String morseCode = convertToMorseCode(currentText);
  drawBox(400, 200, morseCode, color(200, 200, 255));

  // Display cipher text
  String cipherText = encoder(currentText, map);
  drawBox(400, 300, cipherText, color(200, 255, 200));

  // Display combos and numbers
  displayCombosAndNumbers(map, 100, 400);
}

void drawBox(float centerX, float centerY, String label, color boxColor) {
  float boxWidth = 600;
  float boxHeight = 50;

  rectMode(CENTER);

  stroke(0);
  fill(boxColor);
  rect(centerX, centerY, boxWidth, boxHeight, 10);

  fill(0);
  textAlign(CENTER, CENTER);
  text(label, centerX, centerY);
}

void displayCombosAndNumbers(StringDict dict, float x, float y) {
  String[] combos = dict.keyArray();
  String[] numbers = dict.valueArray();
  
  for (int i = 0; i < combos.length; i++) {
    float textX = x + (i % 3) * 200;
    float textY = y + floor(i / 3) * 50;
    String combo = combos[i];
    String number = numbers[i];
    text(combo + ": " + number, textX, textY);
  }
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

String convertToMorseCode(String text) {
  // Define the Morse code representations for each letter
  String[] morseCodeLetters = {
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
  };
  
  String morseCode = "";
  for (char c : text.toUpperCase().toCharArray()) {
    if (Character.isLetter(c)) {
      int index = c - 'A';
      morseCode += morseCodeLetters[index] + " ";
    } else if (c == ' ') {
      morseCode += " ";
    }
  }
  
  return morseCode.trim();
}
