//
//  MTAlbumView.m
//  Mentio
//
//  Created by Martin Hartl on 05/10/13.
//  Copyright (c) 2013 Martin Hartl. All rights reserved.
//

#import "MHAlbumView.h"

@interface MHAlbumView ()

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRec;

@end

@implementation MHAlbumView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGRect setupFrame = CGRectMake(0.0, 0.0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        [self setupWithFrame:setupFrame];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupWithConstraints];
    }
    return self;
}

- (void)setupWithFrame:(CGRect)frame {
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:frame];
    [self addSubview:self.activityIndicatorView];
    [self commonInit];
}

- (void)setupWithConstraints {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] init];
    self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.activityIndicatorView];
    [self addFullViewConstrainsForView:self.activityIndicatorView];
    [self commonInit];
}

- (void)commonInit {
    [self addObserver:self forKeyPath:@"image" options:0 context:nil];
    self.activityIndicatorView.color = [self indicatorColor];
    [self.activityIndicatorView startAnimating];
    self.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"image"];
}


#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        if (self.image) {
            [self.activityIndicatorView stopAnimating];
            [self.activityIndicatorView setHidden:YES];
        } else {
            [self.activityIndicatorView startAnimating];
            [self.activityIndicatorView setHidden:NO];
        }
    }
}

#pragma mark - TapInside-Action


- (void)setTapInsideActionBlock:(void (^)(UIImage *, UITapGestureRecognizer *))tapInsideActionBlock {
    _tapInsideActionBlock = tapInsideActionBlock;
    if (tapInsideActionBlock) {
        self.userInteractionEnabled = YES;
        self.tapGestureRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fireBlock)];
        [self addGestureRecognizer:self.tapGestureRec];
        _tapInsideActionBlock = tapInsideActionBlock;
    }
}

- (void)fireBlock {
    self.tapInsideActionBlock(self.image, self.tapGestureRec);
}

#pragma mark - AutoLayout

- (void)addFullViewConstrainsForView:(UIView *)view {
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    [self addConstraints:@[leadingConstraint, trailingConstraint, topConstraint, bottomConstraint]];
}

#pragma mark - UIAppearance

- (void)setIndicatorColor:(UIColor *)indicatorColor {
    self.activityIndicatorView.color = indicatorColor;
}


@end
