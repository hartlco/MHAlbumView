//
//  MTAlbumView.h
//  Mentio
//
//  Created by Martin Hartl on 05/10/13.
//  Copyright (c) 2013 Martin Hartl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHAlbumView : UIImageView

@property (nonatomic, copy) void(^tapInsideActionBlock)(UIImage *image, UITapGestureRecognizer *tapGestureRecognizer);

@property (nonatomic, strong) UIColor *indicatorColor UI_APPEARANCE_SELECTOR;

@end
