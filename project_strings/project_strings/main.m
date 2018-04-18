//
//  main.m
//  project_strings
//
//  Created by Landry Achia Ndong on 2018-04-17.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import <Foundation/Foundation.h>
int appMenu(void);
void toUpperCase(void);
void toLowerCase(void);
void numberize(void);
void canadianize(void);
void respond(void);
void deSpaceIt(void);
void doWordCount(void);
void removePunctuation(void);

//user input up to 255 characters
char inputChars[255];
NSString *inputString;

//mutable string
NSMutableString *myMutableString;

/*app menu*/
int appMenu(){
    char menu_option;
    do {
        printf("\nApp Menu\n");
        printf("\nType: 1 to convert to Uppercase: ");
        printf("\nType: 2 to convert to Lowercase: ");
        printf("\nType: 3 to Numberize: ");
        printf("\nType: 4 to Canadianize: ");
        printf("\nType: 5 to Respond: ");
        printf("\nType: 6 to De-space-it: ");
        printf("\nType: 7 to do Word Count:");
        printf("\nType: 8 to Remove ponctuations: ");
        printf("\nType: 9 to Exit: ");
        printf("\nType an option Here: ");
        scanf("%c", &menu_option);
        
        switch (menu_option) {
            case '1':
                toUpperCase();
                break;
            case '2':
                toLowerCase();
                break;
            case '3':
                numberize();
                break;
            case '4':
                canadianize();
                break;
            case '5':
                respond();
                break;
            case '6':
                deSpaceIt();
                break;
            case '7':
                doWordCount();
                break;
            case '8':
                removePunctuation();
                break;
            case '9':
                return 0;
            default:
                break;
        }
    } while (menu_option != '9');
    return 1;
}

/*function to print to upper case*/
void toUpperCase(){
    NSString *upperStr = [inputString uppercaseStringWithLocale:[NSLocale currentLocale]];
    NSLog(@"Upper Case: %@", upperStr);
}

/*function to print to lower case*/
void toLowerCase(){
    NSString *lowCaseStr = [inputString lowercaseStringWithLocale:[NSLocale currentLocale]];
    NSLog(@"Lower Case: %@", lowCaseStr);
}

/*function to numberize*/
void numberize(){
    int value = [inputString intValue];
    if (value > 0) {
        NSLog(@"Number in Integer is: %i", value);
    }else{
        NSLog(@"Not an Number..sorry :( ");
    }

}

/*function to Canadianize a sentence*/
void canadianize(){
    NSString *heyText = @" eh?";
    NSString *inputText = [inputString substringToIndex:[inputString length]-1];
    NSString *complete = [NSString stringWithFormat:@"%@%@", inputText,
                          heyText];
     NSLog(@"Your Text Input was: %@", complete);
    
}

/*This function gives response to question asked or an exclamative statement*/
void respond(){
    
    NSString *lastChar = [inputString substringFromIndex:[inputString length]-2];
    if ([lastChar  containsString: @"?"]) {
        NSLog(@"I don't Know");
    }else if ([lastChar containsString:@"!"]){
        NSLog(@"Whoa, calm down!");
    }
    
    
    
}

/*This function removes all white spaces*/
void deSpaceIt(){
    NSString* noSpaces =
    [[inputString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]
     componentsJoinedByString:@""];
    NSLog(@"\n%@", noSpaces);
}

/*This function counts the number of words*/
void doWordCount(){
    int words = 0;
    
    NSScanner *scanner = [NSScanner scannerWithString: inputString];
    
    // Look for spaces, tabs and newlines
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    while ([scanner scanUpToCharactersFromSet:whiteSpace  intoString:nil])
        words++;
    NSLog(@"Total Words number is: %i", words);
}

/*This function removes all punctuation signs*/
void removePunctuation(){
    NSString *temptextOne = [inputString stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSString *temptextTwo = [temptextOne stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSString *temptexThree = [temptextTwo stringByReplacingOccurrencesOfString:@";" withString:@""];
    NSString *temptextFour = [temptexThree stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSString *temptextFive = [temptextFour stringByReplacingOccurrencesOfString:@"?" withString:@""];
    NSString *temptextSix = [temptextFive stringByReplacingOccurrencesOfString:@"!" withString:@""];
    
    NSLog(@"%@", temptextSix);
}

int main(int argc, const char * argv[]) {
    
    printf("Please input a string\n");
    
    //get user input with fgets for buffer reasons instead of scanf
    fgets(inputChars, 255, stdin);
    
    // converting user input char array to an NSString object
    inputString = [NSString stringWithUTF8String:inputChars];
    
    // print NSString object
    NSLog(@"Your Text Input was: %@", inputString);
    
    //using NSMutable here
    myMutableString = [inputString mutableCopy];
    
    appMenu();
    
    return 0;
}
