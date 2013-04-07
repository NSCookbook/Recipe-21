//
//  ViewController.m
//  ImageFilterApp
//
//  Created by NSCookbook on 4/7/13.
//  Copyright (c) 2013 NSCookbook. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pickImage:(id)sender {
    
    UIImagePickerController *imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:^{
        

    }];
    
    
}

- (IBAction)captureImage:(id)sender {
    
    UIImagePickerController *imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:^{
        
    }];
}

- (IBAction)filterImage:(id)sender {
    
    CIImage *rawImageData;
    rawImageData =[[CIImage alloc] initWithImage:self.imageView.image];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIDotScreen"];
    [filter setDefaults];
    
    [filter setValue:rawImageData forKey:@"inputImage"];
    
    [filter setValue:[NSNumber numberWithFloat:15.00]
              forKey:@"inputWidth"];
    
    [filter setValue:[NSNumber numberWithFloat:0.00]
              forKey:@"inputAngle"];
    
    [filter setValue:[NSNumber numberWithFloat:0.70]
              forKey:@"inputSharpness"];
    
 
    
    CIImage *filteredImageData = [filter valueForKey:@"outputImage"];
    
    UIImage *filteredImage = [UIImage imageWithCIImage:filteredImageData];
    self.imageView.image = filteredImage;

    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
}

@end
