###### 6/2/2023

# Morbit cipher
Morbit encryption is an form of Morse code encryption that incorporates polygramic substitution through fractionation.It by first converting the text into Morse code which is written as a series of dots **(●)**, dashes **(–)**, and spaces.  To make it more convenient to solve, we typically represent the spaces as an **(×)**. A single space is used at the end of a Morse code letter and a pair of spaces is used at the end of a word.

### What we're covering:
1. Encoding
2. Decoding
3. Visualization

## Encoding

To encrypt a message using the Morbit cipher, follow these steps:

1. Start with the plaintext message that you want to encrypt.

2. Convert the plaintext message into Morse code. Use the standard Morse code chart to replace each letter with its corresponding Morse code representation. Leave a space between each Morse code letter and a slash (/) between each word.

3. Once you have the message in Morse code, apply polygramic substitution through fractionation. This involves substituting groups of Morse code letters with different Morse code sequences. The specific substitution rules used in Morbit are based on polygramic fractionation techniques.

| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
|---|---|---|---|---|---|---|---|---|
|.. |.- |./ |-. |-- |-/ |/. |/- |// |

4. After applying the polygramic fractionation, you will have a new set of Morse code sequences representing the encrypted message.

5. Convert the encrypted Morse code back into a ciphertext message by reversing the substitution. Replace each Morse code sequence with its corresponding letter.

The resulting ciphertext is your encrypted message.

**Polygramic Fractionation** : Polygramic fractionation is a cryptographic technique that involves dividing plaintext into groups of multiple characters, called polygrams, and applying substitution or reorganization to create ciphertext. By breaking up the plaintext and introducing complex substitutions at the polygram level, polygramic fractionation enhances the security of a cipher by increasing confusion and diffusion, making it more resistant to cryptanalysis methods like frequency analysis. It adds an additional layer of complexity to the encryption process, making it harder for unauthorized individuals to decipher the encrypted message without knowledge of the specific substitution rules.

Our encoder method takes your text that you want to encrypt and a dictionary containing the morse code mapping system as inputs.
As the method loops through the text, it adds the next morse block and checks if the next character is a space or not. If it is, then that means we're starting a new word and we need to skip a character and add a *xx*. If it isn't, then we are starting a new character and we only need to add a single *x*.
Once the text has been looped through, the method loops through our new morse code and converts it to numbers through a loop. That's our encrypted text.

```java
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
```

* Randomized mapping system implementation

## Decoding

To decrypt a message encrypted with the Morbit cipher, follow these steps:

1. Start with the ciphertext message that you want to decrypt.

2. Convert the ciphertext message into Morse code. If the message is already in Morse code, proceed to the next step.

3. Reverse the polygramic fractionation process that was applied during encryption. This involves substituting or rearranging the Morse code sequences back to their original values based on the specific substitution rules used in the Morbit cipher.

4. Once you have the Morse code sequences in their original form, convert them back into plaintext by replacing each Morse code letter with its corresponding letter according to the standard Morse code chart.

The resulting plaintext is your decrypted message.

It's crucial to note that the decryption process relies on having knowledge of the specific substitution rules and the polygramic fractionation method used during encryption. Without this information, decrypting a Morbit cipher becomes significantly more challenging or even impossible. That's why we didn't try creating a brute force decoder and instead opted for a visualizer.

Our decoder method also takes a string, your encoded message, and a dictionary, your morse code map to numbers.
The method loops through the string and converts the text into morse code. Next, the method loops through the morse code and adds the morse symbols onto a string until it encounters an *x*.
If it does encounter an *x*, it converts the string of symbols into readable text using a dictionary and adds it to the final string. Then, the string we are using to store the the symbols is set to `**` so we can start reading in a new symbols.
These *x*'s represent the end and start of new characters. The method must also check if there is a second *x* directly after the first because that would mean we reached the end of a word. If there is, we skip the second *x* and add a space to the final message.
Once the method finishes the loop, the final decrypted message is returned.
```java
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
```

## Visualization



## Homework



[Try it out yourself](https://toebes.com/codebusters/MorbitEncrypt.html)
