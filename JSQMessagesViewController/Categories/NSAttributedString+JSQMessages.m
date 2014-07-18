//
//  Created by Vincent Sit
//  http://xuexuefeng.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "NSAttributedString+JSQMessages.h"

@implementation NSAttributedString (JSQMessages)

/**
 *  Taken from: http://www.cocoabuilder.com/archive/cocoa/168226-nsattributedstring-attributedstringbytrimming.html
 */
- (NSAttributedString *)jsq_attributedStringByTrimming:(NSCharacterSet *)set {
    NSParameterAssert(set);
    
    NSCharacterSet *invertedSet = set.invertedSet;
    NSString *string = self.string;
    unsigned int loc, len;
    
    NSRange range = [string rangeOfCharacterFromSet:invertedSet];
    loc = (range.length > 0) ? (int)range.location : 0;
    
    range = [string rangeOfCharacterFromSet:invertedSet options:NSBackwardsSearch];
    len = (range.length > 0) ? (int)NSMaxRange(range) - loc : (int)string.length - loc;
    
    return [self attributedSubstringFromRange:NSMakeRange(loc, len)];
}

- (NSAttributedString *)jsq_attributedStringByTrimingWhitespace
{
    return [self jsq_attributedStringByTrimming:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
