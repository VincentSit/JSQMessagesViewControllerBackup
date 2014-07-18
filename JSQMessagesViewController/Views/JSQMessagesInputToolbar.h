//
//  Created by Jesse Squires
//  http://www.hexedbits.com
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

#import <UIKit/UIKit.h>

@class JSQMessagesInputToolbar;
@class JSQMessagesToolbarContentView;

/**
 *  A constant the specifies the default height for a `JSQMessagesInputToolbar`.
 */
FOUNDATION_EXPORT const CGFloat kJSQMessagesInputToolbarHeightDefault;

/**
 *  The `JSQMessagesInputToolbarDelegate` protocol defines methods for interacting with
 *  a `JSQMessagesInputToolbar` object.
 */
@protocol JSQMessagesInputToolbarDelegate <UIToolbarDelegate>

@required

/**
 *  Tells the delegate that the toolbar's `rightBarButtonItem` has been pressed.
 *
 *  @param toolbar The object representing the toolbar sending this information.
 *  @param sender  The button that received the touch event.
 */
- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
      didPressRightBarButton:(UIButton *)sender;

- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
     didPressRightBarButton2:(UIButton *)sender;

/**
 *  Tells the delegate that the toolbar's `leftBarButtonItem` has been pressed.
 *
 *  @param toolbar The object representing the toolbar sending this information.
 *  @param sender  The button that received the touch event.
 */
- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
       didPressLeftBarButton:(UIButton *)sender;


- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
  recorderButtonDidTouchDown:(UIButton *)sender;

- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
  recorderButtonDidTouchUpInside:(UIButton *)sender;

- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
  recorderButtonDidTouchUpOutside:(UIButton *)sender;

- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
  recorderButtonDidTouchDragExit:(UIButton *)sender;

- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
  recorderButtonDidTouchDragEnter:(UIButton *)sender;

@end


/**
 *  An instance of `JSQMessagesInputToolbar` defines the input toolbar for
 *  composing a new message. It is displayed above and follow the movement of 
 *  the system keyboard.
 */
@interface JSQMessagesInputToolbar : UIToolbar

/**
 *  The object that acts as the delegate of the toolbar.
 */
@property (weak, nonatomic) id<JSQMessagesInputToolbarDelegate> delegate;

/**
 *  Returns the content view of the toolbar. This view contains all subviews of the toolbar.
 */
@property (weak, nonatomic, readonly) JSQMessagesToolbarContentView *contentView;

@property (assign, nonatomic, readonly) BOOL recorderButtonHidden;

- (void)toggleRecorderButtonHidden;

@end
