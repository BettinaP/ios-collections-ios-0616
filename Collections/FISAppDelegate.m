//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/**
 
 * Define your methods here.
 
 */



-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    NSSortDescriptor *sortByNilAsc =[NSSortDescriptor sortDescriptorWithKey:nil
                                                                  ascending:YES];
    
    NSArray *ascendingArray = [array sortedArrayUsingDescriptors:@[sortByNilAsc]];
    
    //NSLog(@"\n\n\n\n\n\n %@",ascendingArray); can use sortByNilAsc to order numbers or strings because they're basic objects, nil is used as keyPath
    
    return ascendingArray;
    
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
    
    NSSortDescriptor *sortByNilDesc =[NSSortDescriptor sortDescriptorWithKey:nil
                                                                   ascending:NO];
    NSArray *descendingArray =[array sortedArrayUsingDescriptors:@[sortByNilDesc]];
    
    //NSLog(@"%@", descendingArray); to check method does descend numbers in order
    
    return descendingArray;
    
}


-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    NSMutableArray *firstAndLast = [array mutableCopy];
    
//    [firstAndLast exchangeObjectAtIndex:0 withObjectAtIndex:array.count - 1];
    
    NSUInteger lastIndex =[firstAndLast count] - 1;
    for(NSUInteger i = 0; i< [array count]; i++){
        
        if (i == 0) {
            
            [firstAndLast insertObject:array[0] atIndex:lastIndex];
            [firstAndLast removeObjectAtIndex:0];
            
                        //[firstAndLast exchangeObjectAtIndex:0 withObjectAtIndex:lastIndex];            NSLog(@"\n\n\n\n\n\n %@",firstAndLast);
        }
        
    
        if ( i == lastIndex ){
            [firstAndLast insertObject:array[lastIndex] atIndex:0];
            [firstAndLast removeLastObject];
            //NSLog(@"\n\n\n\n\n\n\n\n\n %@",firstAndLast);
        }
    }
    
    return firstAndLast;
    
}


-(NSArray *)arrayByReversingArray:(NSArray *)array {
    NSMutableArray *reversedArray =[[NSMutableArray alloc]init];
    
    for(NSUInteger i = [array count]; i > 0; i--){
        
        [reversedArray addObject:array[i-1]];
        
    }
    
    //NSLog(@"\n \n\n\n\n\n\n %@", reversedArray);
    return reversedArray;
    
    /*for(NSUInteger i = 0; i < [array count]; i ++){
        //NSUInteger first = i;
        //NSUInteger end = [array count]-i + 1 ;
        
        //[reversedArray exchangeObjectAtIndex:first withObjectAtIndex:end];
        
    
    }
    NSLog(@"\n \n\n\n\n\n\n %@", reversedArray);
    return reversedArray;
*/
    
}


-(NSString *)stringInBasicLeetFromString:(NSString *)string {
    
    NSDictionary *characterSwitch = @{@"a" : @"4",
                                      @"s" : @"5",
                                      @"i" : @"1",
                                      @"l" : @"1" ,
                                      @"e" : @"3",
                                      @"t" : @"7"
                                      };
    
    for (NSString *key in characterSwitch){
            string = [string stringByReplacingOccurrencesOfString:key withString:characterSwitch[key]];
        
    }
    
    NSLog(@"\n\n\n\n\n\n\n\n %@", string);
    return string;
    //make sure to review
    
}


-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray*)array {
    NSMutableArray *negativeArray =[[NSMutableArray alloc] init];
    NSMutableArray *nonNegativeArray =[[NSMutableArray alloc] init];
    //NSMutableArray *separatedArray =[[NSMutableArray alloc] init];
    
    
    for (NSUInteger i = 0; i < [array count]; i++){
        NSNumber *number = array[i];
        NSInteger integer = [number integerValue];
        
        if (integer >= 0){
            [nonNegativeArray addObject:number];
        //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n %@", nonNegativeArray);to check if this part of code is doing what I'd like it to do
        }
        
        else {
            [negativeArray addObject:number];
           // NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n %@", negativeArray);
        }
       
    }
    
    //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n %@", @[negativeArray, nonNegativeArray]);
    return @[negativeArray, nonNegativeArray];
}


-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)fellowshipOfTheRing{
    NSMutableArray *hobbitNames= [[NSMutableArray alloc]init];
    
    for (NSString *key in [fellowshipOfTheRing allKeys]){
        if([fellowshipOfTheRing[key] isEqualToString:@"hobbit"]){
            [hobbitNames addObject:key];
        }
    }
    //NSLog(@" \n\n\n\n\n\n\n\n\n\n %@", hobbitNames);
    return hobbitNames;
}


-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    NSMutableArray *beginsWithA = [[NSMutableArray alloc]init];
    
    for (NSUInteger i =0; i <[array count]; i++){
        NSString *lowercase =[array[i] lowercaseString];
        
       //if (array[i] hasPrefix:@"A"||array[i] hasPrefix:@"a")
        
        if ([lowercase hasPrefix:@"a"]){
            [beginsWithA addObject:array[i]];
            NSLog(@"\n\n\n\n\n\n\n %@", beginsWithA);
        }
        
    }
    return beginsWithA;
    
}


-(NSInteger)sumOfIntegersInArray:(NSArray *)array {
    NSInteger sum = 0;
    
    for(NSNumber *number in array){
        sum += [number integerValue];
    }
    return sum;
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{
    NSMutableArray *plurals = [array mutableCopy];
    //NSMutableArray *plurals= [[NSMutableArray alloc]init];
    //NSString *plural = @"";
    
    //and create an NSString (singular)
    //or [array mutableCopy] and plurals[i] acts as string
    
    
    for (NSUInteger i = 0; i <[array count]; i++){
        if([plurals[i] containsString:@"oo"]){
            plurals[i] = [plurals[i] stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
            NSLog(@"\n\n\n\n\n\n\n\n\n\n\n %@",plurals);
        }
        else if([plurals[i] hasSuffix:@"us"]){
                plurals[i] = [plurals[i] stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
                NSLog(@"\n\n\n\n\n\n\n\n\n\n\n %@",plurals[i]);
        }
        else if([plurals[i] hasSuffix:@"um"]){
                plurals[i] = [plurals[i] stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
                    NSLog(@"\n\n\n\n\n\n\n\n\n\n\n %@",plurals[i]);
        }
        else if([plurals[i] containsString:@"ox"]){
             if ([plurals[i] hasPrefix:@"b"]){
                 plurals[i] = [plurals[i] stringByAppendingString:@"es"];
             } else{
              plurals[i] = [plurals[i] stringByAppendingString:@"en"];
             }
        }
            else {
                plurals[i] = [plurals[i] stringByAppendingString:@"s"];
                NSLog(@"\n\n\n\n\n\n\n\n\n\n\n %@",plurals);
            }

        
//       //for (NSString *singular in array)
//        if([singular containsString:@"oo"]){
//            plural = [singular stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
//            //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n %@",plurals);
//        }
//        else if([singular hasSuffix:@"us"]){
//            plural = [singular stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
//            //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n %@",plurals[i]);
//        }
//        else if([singular hasSuffix:@"um"]){
//             plural = [singular stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
//             //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n %@",plurals[i]);
//        }
//        else if([singular containsString:@"ox"]){
//            if ([singular hasPrefix:@"b"]){
//                plural= [singular stringByAppendingString:@"es"];
//            } else{
//                plural= [singular stringByAppendingString:@"en"];
//            }
//        }
//        else {
//            plural = [singular stringByAppendingString:@"s"];
//           // NSLog(@"\n\n\n\n\n\n\n\n\n\n\n %@",plurals);
//        }
//    
     
        //[plurals addObject:plural];
    }
    
    return plurals;
    
    //return [NSArray arrayWithArray:plurals];
    
}


-(NSDictionary *)countsOfWordsInString:(NSString *)string {
    NSMutableDictionary *wordsCounted = [[NSMutableDictionary alloc]init];
    NSArray *punctuations =@[@".", @",", @"-", @";"];
    NSString *withoutPunctuation = [string copy];
    
    for (NSUInteger i = 0; i < [punctuations count]; i++){
        NSString *punctuation = punctuations[i];
        withoutPunctuation = [withoutPunctuation stringByReplacingOccurrencesOfString:punctuation withString:@""];
       // NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n %@", withoutPunctuation);
    }
    
    NSString *withoutCaps = [withoutPunctuation lowercaseString];
    NSArray *stringSplit = [withoutCaps componentsSeparatedByString:@" "];
        //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n %@", stringSplit);
    
    
    for (NSString *string in stringSplit){
    
        if ([wordsCounted[string] integerValue] > 0){
            NSUInteger counter = [wordsCounted[string] integerValue] + 1;
            wordsCounted[string] = @(counter);
        } else {
            wordsCounted[string] =@1;
        }
        
    }
    
    
    NSLog(@"this is the dictionary: \n\n\n\n\n\n\n\n\n\n %@", wordsCounted);
    
   // for (NSUInteger i = 0; i < [stringSplit count]; i++){
       
        
        
        
        
//        NSUInteger counter = 0;
//        //NSString *stringSplitWord = stringSplit[i];
//        
//        //if ([stringSplit :stringSplit[i]]){
//            
//            counter++;
//            
//            wordsCounted[stringSplit[i]] = @(counter);
//        }
//        
//        //NSPredicate *wordFilterPredicate = [NSPredicate predicateWithFormat:@"self MATCHES %@",stringSplitWord];
//        //NSArray *wordFilter =[stringSplit filteredArrayUsingPredicate:wordFilterPredicate];
    
        
    return wordsCounted;
    }
    
    //NSLog(@"\n\n\n\n\n\n\n\n\n\n %@", wordsCounted);

    //return wordsCounted;
//}



-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
    
    NSMutableDictionary *artistCatalogue = [[NSMutableDictionary alloc]init];
    
    
    for( NSString *string in array){
    
        NSArray *songListSplit = [string componentsSeparatedByString:@" - "];
       // NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n %@", songListSplit);
        NSString *artist = songListSplit[0];
        NSString *song = songListSplit[1];
        

        if (![[artistCatalogue allKeys] containsObject:artist]){
            artistCatalogue[artist]= [@[song] mutableCopy];
        } else{
            [artistCatalogue[artist] addObject:song];
        }
        
    }
        
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                          ascending:YES];
        
    for (NSDictionary *artist in [artistCatalogue allKeys]) {
            
            NSArray *songsUnsorted =[artistCatalogue objectForKey:artist];
            
            NSArray *songsSorted =[songsUnsorted sortedArrayUsingDescriptors:@[sortByNilAsc]];

            artistCatalogue[artist] = songsSorted;
              NSLog(@"These are all the sorted songs:\n\n\n\n\n\n\n\n\n\n\n\n\n %@ ", artistCatalogue);
        }
    
    
    
    return artistCatalogue;
    
}



@end
