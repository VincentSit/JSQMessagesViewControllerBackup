//
//  JSQMessagesCollectionViewCellOutgoingAudio.h
//  JSQMessages
//
//  Created by Vincent Sit on 14-7-1.
//  Copyright (c) 2014年 Hexed Bits. All rights reserved.
//

#import "JSQMessagesCollectionViewCell.h"

@protocol JSQMessagesActivityIndicator;

/**
 *  A `JSQMessagesCollectionViewCellOutgoingAudio` object is a concrete instance of `JSQMessagesCollectionViewCell`
 *  that represents an outgoing audio message item.
 */
@interface JSQMessagesCollectionViewCellOutgoingAudio : JSQMessagesCollectionViewCell

@property (weak, nonatomic) UIView *playerView;

@property (weak, nonatomic) UIView <JSQMessagesActivityIndicator> *activityIndicatorView;


@end
