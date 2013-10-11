//
//  PDFExportViewController.m
//  PDFExport
//
//  Created by Retso Huang on 13/9/10.
//  Copyright (c) 2013年 Retso Huang. All rights reserved.
//

#import "PDFExportViewController.h"
#import <QuartzCore/CALayer.h>

@interface PDFExportViewController ()

@end

@implementation PDFExportViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self exportPDF];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)exportPDF {
  NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingPathExtension:@"pdf"];
  NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
  CGRect pdfFrame = CGRectMake(0, 0, 2480.0f, 3508.0f);
  
  UIGraphicsBeginPDFContextToFile(path, pdfFrame, nil);
  
  UIGraphicsBeginPDFPage();
  
  UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:pdfFrame];
  [backgroundImageView setImage:[UIImage imageNamed:@"ContractAgreement1"]];
  [backgroundImageView drawRect:pdfFrame];
  
  UIGraphicsBeginPDFPage();
  UIImageView *backgroundImageView2 = [[UIImageView alloc] initWithFrame:pdfFrame];
  [backgroundImageView2 setImage:[UIImage imageNamed:@"InteriorPartsCheck"]];
  [backgroundImageView2 drawRect:pdfFrame];
  
  UIGraphicsEndPDFContext();
  
  NSLog(@"PDF File Path:%@", path);
}

@end
