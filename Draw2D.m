//
//  Draw2D.m
//  drawing
//
//  Created by Joseph Anderson on 11/2/14.
//  Copyright (c) 2014 ifd. All rights reserved.
//

#import "Draw2D.h"

@interface Draw2D ()

@property UIBezierPath *path;
@property NSMutableArray *arrayOfPaths;

@end

@implementation Draw2D


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // Initialize a new path for the user gesture
    self.path = [UIBezierPath bezierPath];
    self.path.lineWidth = 4.0f;
    UITouch *touch = [touches anyObject];
    [self.path moveToPoint:[touch locationInView:self]];
    if (self.arrayOfPaths == nil) {
        self.arrayOfPaths = [NSMutableArray array];
    }
    [self.arrayOfPaths addObject:self.path];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [self.path addLineToPoint:[touch locationInView:self]];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [self.path addLineToPoint:[touch locationInView:self]];
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    for (UIBezierPath *path in self.arrayOfPaths) {
        [path stroke];
    }
}


@end
