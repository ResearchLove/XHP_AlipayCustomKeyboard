//
//  DecimalKeyboard.m
//  XHC_AlipayCustomKeyboard
//
//  Created by xiaohaiping on 16/7/26.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "DecimalKeyboard.h"

static CGRect dk_get_frame()
{
    CGFloat width = MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    CGFloat height = ((NSInteger)(width * .32)) * 2;
    return CGRectMake(0, 0, width, height);
}


static UIImage *dk_image(UIColor *color, CGSize size)
{
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

/**
 *  用赛贝尔曲线绘制键盘上的删除键
 *
 *  @return
 */
static UIImage *dk_delete_icon()
{
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize size = CGSizeMake(27 * scale, 20 * scale);
    const CGFloat lineWidth = 1.f * scale;
    UIGraphicsBeginImageContext(size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] setStroke];
    
    CGContextBeginPath(ctx);
    
    //Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(8.5 * scale, 19.5 * scale)];
    [bezierPath addCurveToPoint: CGPointMake(23.15 * scale, 19.5 * scale) controlPoint1: CGPointMake(11.02 * scale, 19.5 * scale) controlPoint2: CGPointMake(20.63 * scale, 19.5 * scale)];
    [bezierPath addCurveToPoint: CGPointMake(26.5 * scale, 15.5 * scale) controlPoint1: CGPointMake(25.66 * scale, 19.5 * scale) controlPoint2: CGPointMake(26.5 * scale, 17.5 * scale)];
    [bezierPath addCurveToPoint: CGPointMake(26.5 * scale, 4.5 * scale) controlPoint1: CGPointMake(26.5 * scale, 13.5 * scale) controlPoint2: CGPointMake(26.5 * scale, 7.5 * scale)];
    [bezierPath addCurveToPoint: CGPointMake(23.15 * scale, 0.5 * scale) controlPoint1: CGPointMake(26.5 * scale, 1.5 * scale) controlPoint2: CGPointMake(24.82 * scale, 0.5 * scale)];
    [bezierPath addCurveToPoint: CGPointMake(8.5 * scale, 0.5 * scale) controlPoint1: CGPointMake(21.47 * scale, 0.5 * scale) controlPoint2: CGPointMake(11.02 * scale, 0.5 * scale)];
    [bezierPath addCurveToPoint: CGPointMake(0.5 * scale, 9.5 * scale) controlPoint1: CGPointMake(5.98 * scale, 0.5 * scale) controlPoint2: CGPointMake(0.5 * scale, 9.5 * scale)];
    [bezierPath addCurveToPoint: CGPointMake(8.5 * scale, 19.5 * scale) controlPoint1: CGPointMake(0.5 * scale, 9.5 * scale) controlPoint2: CGPointMake(5.98 * scale, 19.5 * scale)];
    [bezierPath closePath];
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = lineWidth;
    [bezierPath stroke];
    
    //Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(19.5 * scale, 6.5 * scale)];
    [bezier2Path addLineToPoint: CGPointMake(12.5 * scale, 13.5 * scale)];
    bezier2Path.lineCapStyle = kCGLineCapRound;
    bezier2Path.lineJoinStyle = kCGLineJoinRound;
    [UIColor.blackColor setStroke];
    bezier2Path.lineWidth = lineWidth;
    [bezier2Path stroke];
    
    //Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(19.5 * scale, 13.5 * scale)];
    [bezier3Path addLineToPoint: CGPointMake(12.5 * scale, 6.5 * scale)];
    bezier3Path.lineCapStyle = kCGLineCapRound;
    [UIColor.blackColor setStroke];
    bezier3Path.lineWidth = lineWidth;
    [bezier3Path stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:image.CGImage
                               scale:scale
                         orientation:UIImageOrientationUp];
}

/**
 *  用赛贝尔曲线绘制键盘上的数字按键
 *
 *  @return
 */
static UIImage *dk_keyboard_icon()
{
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize size = CGSizeMake(38 * scale, 28 * scale);
    const CGFloat lineWidth = 2.f * scale;
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] setStroke];
    CGContextBeginPath(ctx);
    
    // Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(1 * scale, 1 * scale, 36 * scale, 21 * scale)];
    [UIColor.blackColor setStroke];
    rectanglePath.lineWidth = lineWidth;
    [rectanglePath stroke];
    
    // Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(21.71 * scale, 25 * scale)];
    [bezierPath addLineToPoint: CGPointMake(24 * scale, 25 * scale)];
    [bezierPath addLineToPoint: CGPointMake(20 * scale, 28 * scale)];
    [bezierPath addLineToPoint: CGPointMake(16 * scale, 25 * scale)];
    [bezierPath addLineToPoint: CGPointMake(21.71 * scale, 25 * scale)];
    [bezierPath closePath];
    [UIColor.blackColor setFill];
    [bezierPath fill];
    
    // Rectangle 2 Drawing
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(5 * scale, 5 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle2Path fill];
    
    // Rectangle 3 Drawing
    UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(10 * scale, 5 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle3Path fill];
    
    // Rectangle 4 Drawing
    UIBezierPath* rectangle4Path = [UIBezierPath bezierPathWithRect: CGRectMake(15 * scale, 5 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle4Path fill];
    
    // Rectangle 5 Drawing
    UIBezierPath* rectangle5Path = [UIBezierPath bezierPathWithRect: CGRectMake(20 * scale, 5 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle5Path fill];
    
    // Rectangle 6 Drawing
    UIBezierPath* rectangle6Path = [UIBezierPath bezierPathWithRect: CGRectMake(25 * scale, 5 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle6Path fill];
    
    // Rectangle 7 Drawing
    UIBezierPath* rectangle7Path = [UIBezierPath bezierPathWithRect: CGRectMake(30 * scale, 5 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle7Path fill];
    
    // Rectangle 8 Drawing
    UIBezierPath* rectangle8Path = [UIBezierPath bezierPathWithRect: CGRectMake(7 * scale, 10 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle8Path fill];
    
    // Rectangle 9 Drawing
    UIBezierPath* rectangle9Path = [UIBezierPath bezierPathWithRect: CGRectMake(12 * scale, 10 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle9Path fill];
    
    // Rectangle 10 Drawing
    UIBezierPath* rectangle10Path = [UIBezierPath bezierPathWithRect: CGRectMake(17 * scale, 10 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle10Path fill];
    
    // Rectangle 11 Drawing
    UIBezierPath* rectangle11Path = [UIBezierPath bezierPathWithRect: CGRectMake(22 * scale, 10 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle11Path fill];
    
    // Rectangle 12 Drawing
    UIBezierPath* rectangle12Path = [UIBezierPath bezierPathWithRect: CGRectMake(27 * scale, 10 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle12Path fill];
    
    // Rectangle 13 Drawing
    UIBezierPath* rectangle13Path = [UIBezierPath bezierPathWithRect: CGRectMake(6 * scale, 15 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle13Path fill];
    
    // Rectangle 14 Drawing
    UIBezierPath* rectangle14Path = [UIBezierPath bezierPathWithRect: CGRectMake(29 * scale, 15 * scale, 3 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle14Path fill];
    
    // Rectangle 15 Drawing
    UIBezierPath* rectangle15Path = [UIBezierPath bezierPathWithRect: CGRectMake(11 * scale, 15 * scale, 16 * scale, 3 * scale)];
    [UIColor.blackColor setFill];
    [rectangle15Path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:image.CGImage
                               scale:scale
                         orientation:UIImageOrientationUp];
}



@implementation UIView (FindFirstResponder)

+ (UIView *)dk_firstResponder
{
    return [[[UIApplication sharedApplication] keyWindow] dk_findFirstResponder];
}

- (UIView *)dk_findFirstResponder
{
    if ([self isFirstResponder]) return self;
    
    for (UIView *view in self.subviews) {
        UIView *responder = [view dk_findFirstResponder];
        if (responder) return responder;
    }
    return nil;
}

@end



@implementation DecimalKeyboardItem

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [self setBackgroundImage:dk_image(backgroundColor, CGSizeMake(1, 1))
                    forState:state];
}

@end

@implementation DecimalKeyboard

-(instancetype)initWithFrame:(CGRect)frame
{
    CGRect rect = dk_get_frame();
    if (self = [super initWithFrame:rect]) {
        [self initUI];
    }
    return self;
}

-(instancetype)initWithTintColor:(UIColor *)tintColor
{
    CGRect rect = dk_get_frame();
    if (self = [super initWithFrame:rect]) {
        _tintColor = tintColor;
        [self initUI];
    }
    return self;
}


-(void)layoutSubviews
{

    [super layoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.bounds) / 4.f - .5f;
    CGFloat height = CGRectGetHeight(self.bounds) / 4.f - .5f;
    
    [self viewWithTag:NUMBER_TAG + 1].frame = CGRectMake(0, .5, width, height);
    [self viewWithTag:NUMBER_TAG + 2].frame = CGRectMake(width + .5f, .5f, width, height);
    [self viewWithTag:NUMBER_TAG + 3].frame = CGRectMake((width + .5f) * 2, .5f, width, height);
    [self viewWithTag:NUMBER_TAG + 4].frame = CGRectMake(0, height + 1.f, width, height);
    [self viewWithTag:NUMBER_TAG + 5].frame = CGRectMake(width + .5f, height + 1.f, width, height);
    [self viewWithTag:NUMBER_TAG + 6].frame = CGRectMake((width + .5f) * 2, height + 1.f, width, height);
    [self viewWithTag:NUMBER_TAG + 7].frame = CGRectMake(0, .5f + (height + .5f) * 2, width, height);
    [self viewWithTag:NUMBER_TAG + 8].frame = CGRectMake(width + .5f, .5f + (height + .5f) * 2, width, height);
    [self viewWithTag:NUMBER_TAG + 9].frame = CGRectMake((width + .5f) * 2, .5f + (height + .5f) * 2, width, height);
    [self viewWithTag:NUMBER_TAG].frame = CGRectMake(width + .5f, .5f + (height + .5f) * 3, width, height);
    [self viewWithTag:POINT_TAG].frame = CGRectMake(0, .5f + (height + .5f) * 3, width, height);
    [self viewWithTag:DISMISS_TAG].frame = CGRectMake((width + .5f) * 2, .5f + (height + .5f) * 3, width, height);
    [self viewWithTag:DELETE_TAG].frame = CGRectMake((width + .5f) * 3, .5f, width, height * 2 + .5f);
    [self viewWithTag:DETERMINE_TAG].frame = CGRectMake((width + .5f) * 3, 1.f + height * 2, width, height * 2 + 1.f);

}

/**
 *  初始化键盘的UI
 */
-(void)initUI
{
    self.backgroundColor = BACKGROUNDCOLOR;
    self.tintColor = self.tintColor ? : TINTCOLOR;
    for (int i = 0; i < 14; ++i) {
        DecimalKeyboardItem *item = [DecimalKeyboardItem buttonWithType:UIButtonTypeCustom];
        if (i == 10) {
            item.tag = POINT_TAG;
            [item setTitle:@"." forState:UIControlStateNormal];
        }else if(i == 11){
            item.tag = DELETE_TAG;
            [item setImage:dk_delete_icon() forState:UIControlStateNormal];
            UILongPressGestureRecognizer *g = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(deleteItemLongPress:)];
            [item addGestureRecognizer:g];
        }else if(i == 12){
            item.tag = DISMISS_TAG;
            [item setImage:dk_keyboard_icon() forState:UIControlStateNormal];
        }else if (i == 13) {
            item.tag = DETERMINE_TAG;
            item.enabled = NO;
            [item setTitle:@"确定" forState:UIControlStateNormal];
        }else{
            item.tag = NUMBER_TAG  + i;
            [item setTitle:[NSString stringWithFormat:@"%d", i]
                  forState:UIControlStateNormal];
        }
        
        if (item.tag != DETERMINE_TAG) {
            [item setBackgroundColor:ITEM_BACKROUNDCOLOR_NORMAL forState:UIControlStateNormal];
            [item setBackgroundColor:ITEM_BACKROUNDCOLOR_HIGHLIGHTED forState:UIControlStateHighlighted];
            [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [item.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:25]];
        }else{
            CGFloat h[1], s[1], b[1], a[1];
            [self.tintColor getHue:h saturation:s brightness:b alpha:a];
            UIColor *highlightColor = [UIColor colorWithHue:h[0] saturation:s[0] brightness:b[0] - .1f alpha:a[0]];
            [item setBackgroundColor:self.tintColor forState:UIControlStateNormal];
            [item setBackgroundColor:highlightColor forState:UIControlStateHighlighted];
            [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [item addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:item];
    }
}

- (void)deleteItemLongPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ((UIButton *)[self viewWithTag:DELETE_TAG]).highlighted = YES;
        });
        deleteTimer = [NSTimer scheduledTimerWithTimeInterval:.1
                                                       target:self
                                                     selector:@selector(repeatLongPressDelete)
                                                     userInfo:nil
                                                      repeats:YES];
    }else if (longPress.state == UIGestureRecognizerStateEnded
              || longPress.state == UIGestureRecognizerStateCancelled
              || longPress.state == UIGestureRecognizerStateFailed) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ((UIButton *)[self viewWithTag:DELETE_TAG]).highlighted = NO;
        });
        [self cleanTimer];
    }
}

- (void)repeatLongPressDelete
{
    [(UIControl *)[self viewWithTag:DELETE_TAG] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonTouchUpInside:(DecimalKeyboardItem *)sender
{
    if (!self.firstResponder || ![self.firstResponder isFirstResponder]) {
        self.firstResponder = (UIView<UIKeyInput>*)[UIView dk_firstResponder];
        if (!self.firstResponder) return;
        if (![self.firstResponder conformsToProtocol:@protocol(UIKeyInput)]) return;
    }
    
    [self playClickAudio];
    [self handleInputWithKeyboardItemTag:sender.tag];
}

/**
 *  点击键盘发出系统自定义声音
 */
-(void)playClickAudio
{
    [[UIDevice currentDevice] playInputClick];

}

- (void)handleInputWithKeyboardItemTag:(NSUInteger)tag
{
    switch (tag) {
        case POINT_TAG:
            [self clickedDot];
            break;
            
        case DELETE_TAG:
            [self clickedDelete];
            break;
            
        case DISMISS_TAG:
            [self clickedDismiss];
            break;
            
        case DETERMINE_TAG:
            [self clickedSure];
            break;
            
        case NUMBER_TAG :
        case NUMBER_TAG + 1:
        case NUMBER_TAG + 2:
        case NUMBER_TAG + 3:
        case NUMBER_TAG + 4:
        case NUMBER_TAG + 5:
        case NUMBER_TAG + 6:
        case NUMBER_TAG + 7:
        case NUMBER_TAG + 8:
        case NUMBER_TAG + 9:
            [self clickedDecimal:(int)tag - NUMBER_TAG];
            break;
        default:
            break;
    }
}

/**
 *  点击“.”事件
 */
- (void)clickedDot
{
    [self insert:@"."];
}


/**
 *  点击删除事件
 */
- (void)clickedDelete
{
    if ([self.firstResponder hasText]) {
        [self.firstResponder deleteBackward];
    }
}

/**
 *  点击键盘驳回事件
 */
- (void)clickedDismiss
{
    [self.firstResponder resignFirstResponder];
}

/**
 *  点击确定事件
 */
- (void)clickedSure
{
    [self.firstResponder resignFirstResponder];
    !self.done ?: self.done();
}

/**
 *  点击相应的数字
 *
 *  @param decimal
 */
- (void)clickedDecimal:(int)decimal
{
    [self insert:[NSString stringWithFormat:@"%d", decimal]];
}

- (void)insert:(NSString *)text
{
    if ([self.firstResponder isKindOfClass:[UITextField class]]) {
        id<UITextFieldDelegate> delegate = [(UITextField *)self.firstResponder delegate];
        if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
            NSRange range = [self selectedRangeInInputView:(id<UITextInput>)self.firstResponder];
            if ([delegate textField:(UITextField *)self.firstResponder shouldChangeCharactersInRange:range replacementString:text]) {
                [self.firstResponder insertText:text];
            }
        }
    }else if ([self.firstResponder isKindOfClass:[UITextView class]]) {
        id<UITextViewDelegate> delegate = [(UITextView *)self.firstResponder delegate];
        if ([delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
            NSRange range = [self selectedRangeInInputView:(id<UITextInput>)self.firstResponder];
            if ([delegate textView:(UITextView *)self.firstResponder shouldChangeTextInRange:range replacementText:text]) {
                [self.firstResponder insertText:text];
            }
        }
    }else {
        [self.firstResponder insertText:text];
    }
}

- (NSRange)selectedRangeInInputView:(id<UITextInput>)inputView
{
    UITextPosition* beginning = inputView.beginningOfDocument;
    
    UITextRange* selectedRange = inputView.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    const NSInteger location = [inputView offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [inputView offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

/**
 *  销毁定时器
 */
- (void)cleanTimer
{
    [deleteTimer invalidate];
    deleteTimer = nil;
}

/**
 *   UIInputViewAudioFeedback
 *
 *  @return
 */
- (BOOL)enableInputClicksWhenVisible
{
    return YES;
}

-(void)dealloc
{
    [self cleanTimer];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
