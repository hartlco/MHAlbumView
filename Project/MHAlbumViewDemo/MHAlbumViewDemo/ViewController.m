//
//  ViewController.m
//  MHAlbumViewDemo
//
//  Created by Martin Hartl on 20/02/14.
//  Copyright (c) 2014 Martin Hartl. All rights reserved.
//

#import "ViewController.h"
#import "MHAlbumView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MHAlbumView *albumView1;
@property (weak, nonatomic) IBOutlet MHAlbumView *albumView2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.albumView1 setTapInsideActionBlock:^(UIImage *image, UITapGestureRecognizer *tapGestureRecognizer) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@":)" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }];
    
}

- (IBAction)setFirstImage:(id)sender {
    self.albumView1.image = [UIImage imageNamed:@"image.jpg"];
}

- (IBAction)setSecondImage:(id)sender {
    self.albumView2.image = [UIImage imageNamed:@"image2.jpg"];
}

@end
