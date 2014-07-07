//
//  JSQAudioPlayerView.m
//  JSQMessages
//
//  Created by Vincent Sit on 14-7-6.
//  Copyright (c) 2014年 Hexed Bits. All rights reserved.
//

#import "JSQAudioPlayerView.h"

#import <AVFoundation/AVFoundation.h>
#import "JSQMessage.h"

@interface JSQAudioPlayerView ()

@property (strong, nonatomic) UILabel *durationLabel;
@property (strong, nonatomic) UIImageView *animationContainer;
@property (strong, nonatomic) NSArray *animationImages;
@property (assign, nonatomic) BOOL isAnimation;

@end

@implementation JSQAudioPlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _incomingMessage = YES;
        
        _durationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _durationLabel.textAlignment = NSTextAlignmentCenter;
        _durationLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_durationLabel];
        
        _animationContainer = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"demo_audio_normal"] highlightedImage:[UIImage imageNamed:@"demo_audio_press"]];
        _animationContainer.frame = CGRectZero;
        _animationContainer.userInteractionEnabled = YES;
        [self addSubview:_animationContainer];
        
        _isAnimation = YES;
        
        _animationImages = @[[UIImage imageNamed:@"demo_audio_play_1"],
                             [UIImage imageNamed:@"demo_audio_play_2"],
                             [UIImage imageNamed:@"demo_audio_normal"]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.incomingMessage) {
        self.durationLabel.frame = CGRectMake(30, (CGRectGetHeight(self.bounds) - CGRectGetHeight(self.durationLabel.bounds)) / 2, CGRectGetWidth(self.durationLabel.bounds), CGRectGetHeight(self.durationLabel.bounds));
        self.animationContainer.frame = CGRectMake(CGRectGetMaxX(self.durationLabel.frame), CGRectGetMinY(self.durationLabel.frame) - 10, 34, 34);
    }
    else {
        self.animationContainer.frame = CGRectMake(10, (CGRectGetHeight(self.bounds) - 34) / 2, 34, 34);
        self.durationLabel.frame = CGRectMake(CGRectGetMaxX(self.animationContainer.frame), (CGRectGetHeight(self.bounds) - CGRectGetHeight(self.durationLabel.bounds)) / 2, CGRectGetWidth(self.durationLabel.bounds), CGRectGetHeight(self.durationLabel.bounds));
    }
}

- (void)setMessage:(JSQMessage *)message
{
    if (_message != message) {
        
//        CGFloat duration = [self durationFromAudioFileURL:message.sourceURL];
        self.durationLabel.text = [NSString stringWithFormat:@"%d\"", (NSUInteger)ceil(111)];
        [self.durationLabel sizeToFit];
        
        _message = message;
    }
}

- (void)setIncomingMessage:(BOOL)incomingMessage
{
    if (_incomingMessage != incomingMessage) {
        
        self.animationContainer.transform = incomingMessage ? CGAffineTransformIdentity : CGAffineTransformMakeRotation(M_PI);
        
        _incomingMessage = incomingMessage;
    }
}


- (CGFloat)durationFromAudioFileURL:(NSURL *)url
{
    NSParameterAssert(url != nil);
    
    AVURLAsset* audioAsset = [AVURLAsset URLAssetWithURL:url options:nil];
    CMTime audioDuration = audioAsset.duration;
    return CMTimeGetSeconds(audioDuration);
}

- (void)startAnimation
{
    static int i = 0;
    self.animationContainer.image = self.animationImages[i];
    i ++;
    i = i > 2 ? 0 : i;
    
    if (self.isAnimation) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startAnimation];
        });
    }
    self.isAnimation = YES;
}

- (void)stopAnimation
{
    self.isAnimation = NO;
}


@end
