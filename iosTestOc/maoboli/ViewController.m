//
//  ViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-20.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "ViewController.h"
#import <Accelerate/Accelerate.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    bgImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    bgImgView.image = [self blurryImage:[UIImage imageNamed:@"bg1.jpg"] withBlurLevel:0.9];
    bgImgView.image = [UIImage imageNamed:@"bg1.jpg"];
    bgImgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:bgImgView];
    
//    blurView = [[UIView alloc] initWithFrame:self.view.bounds];
//    blurView.backgroundColor = [UIColor whiteColor];
//    blurView.alpha = 1;
//    [self.view addSubview:blurView];
    
    slider = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 70, 320 - 20, 50)];
    slider.minimumValue = 0;
    slider.maximumValue = 1;
    slider.value = 0;
    lastSliderValue = slider.value;
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
}

-(void) sliderValueChanged:(id) sender
{
    @synchronized(self)
    {
        float newSliderValue = slider.value;
        
        if (ABS(newSliderValue - lastSliderValue) > 0.1)
        {
            NSLog(@"%f",slider.value);
            
            bgImgView.image = [self blurryImage:[UIImage imageNamed:@"bg1.jpg"] withBlurLevel:slider.value];
            lastSliderValue = newSliderValue;
        }
    }
//    bgImgView.alpha = slider.value;
    
//    blurView.alpha = MAX(0.0, MIN(bgImgView.alpha - 0.2, 0.2));
}

- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    if ((blur < 0.0f) || (blur > 1.0f)) {
        blur = 0.5f;
    }
    
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL,
                                       0, 0, boxSize, boxSize, NULL,
                                       kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
