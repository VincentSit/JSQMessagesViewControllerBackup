//
//  JSQMessagesCollectionViewCellIncomingPhoto.m
//  JSQMessages
//
//  Created by Vincent Sit on 14-7-1.
//  Copyright (c) 2014年 Hexed Bits. All rights reserved.
//

#import "JSQMessagesCollectionViewCellIncomingPhoto.h"

#import "UIView+JSQMessages.h"

@interface JSQMessagesCollectionViewCellIncomingPhoto ()

@property (weak ,nonatomic, readwrite) IBOutlet UIImageView *mediaImageView;
@property (strong, nonatomic, readwrite) UITapGestureRecognizer *mediaImageViewTapGestureRecognizer;


- (void)jsq_handleMediaImageViewTapped:(UITapGestureRecognizer *)tapGesture;

@end

@implementation JSQMessagesCollectionViewCellIncomingPhoto
@synthesize messageBubbleImageView = _messageBubbleImageView;

- (void)dealloc {
    _mediaImageView = nil;
    _mediaImageViewTapGestureRecognizer = nil;
}


#pragma mark - Overrides

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass([self class])
                          bundle:[NSBundle mainBundle]];
}

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.longPressGestureRecognizer.enabled = NO;
    
    self.mediaImageView.userInteractionEnabled = YES;

    self.mediaImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.mediaImageView.clipsToBounds = YES;
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jsq_handleMediaImageViewTapped:)];
    [self.mediaImageView addGestureRecognizer:tap];
    self.mediaImageViewTapGestureRecognizer = tap;
}

- (void)setMessageBubbleImageView:(UIImageView *)messageBubbleImageView
{
    if (_messageBubbleImageView) {
        [_messageBubbleImageView removeFromSuperview];
    }
    
    if (!messageBubbleImageView) {
        _messageBubbleImageView = nil;
        return;
    }
    
    messageBubbleImageView.frame = CGRectMake(0.0f,
                                              0.0f,
                                              CGRectGetWidth(self.messageBubbleContainerView.bounds),
                                              CGRectGetHeight(self.messageBubbleContainerView.bounds));
    
    [messageBubbleImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.messageBubbleContainerView insertSubview:messageBubbleImageView belowSubview:self.mediaImageView];
    [self.messageBubbleContainerView jsq_pinAllEdgesOfSubview:messageBubbleImageView];
    [self setNeedsUpdateConstraints];
    
    _messageBubbleImageView = messageBubbleImageView;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    
    if (!self.mediaImageView.layer.mask) {
        CALayer *layer = self.messageBubbleImageView.layer;
        layer.bounds = self.mediaImageView.frame;
        self.mediaImageView.layer.mask = layer;
    }
}


#pragma mark -

- (void)jsq_handleMediaImageViewTapped:(UITapGestureRecognizer *)tapGesture
{
    [self.delegate messagesCollectionViewCellDidTapMediaPhoto:self];
}


@end
