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

@interface NSAttributedString (JSQMessages)


/**
 *  Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
 *
 *  @param set A character set containing the characters to remove from the receiver. set must not be nil.
 *
 *  @return A copy of the receiver with all leading and trailing whitespace removed.
 */
- (NSAttributedString *)jsq_attributedStringByTrimming:(NSCharacterSet *)set;

/**
 *  @return A copy of the receiver with all leading and trailing whitespace removed.
 */
- (NSAttributedString *)jsq_attributedStringByTrimingWhitespace;

@end
