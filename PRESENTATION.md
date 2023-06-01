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
1. Acquire keyword
2. Turn keyword into number mapping system
3. Use mapping system to convert numbers into Morse code
4. Convert Morse code into plain text

## Visualization



## Homework



[Try it out yourself](https://toebes.com/codebusters/MorbitEncrypt.html)
