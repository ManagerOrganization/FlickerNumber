//
//  DetailViewController.m
//  FlickerNumber
//
//  Created by Diaoshu on 15-2-1.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "DetailViewController.h"
#import "UILabel+FlickerNumber.h"

@interface DetailViewController (){
}


@property (nonatomic, weak) IBOutlet UILabel *lblFlicker;
@property (nonatomic, weak) IBOutlet UISwitch *switchOn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self valueChanged:self.switchOn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)valueChanged:(id)sender{
    if([(UISwitch *)sender isOn]){
        if([self.title isEqualToString:@"Flicker An Integer Number"]){
            [self.lblFlicker dd_setNumber:@(1234567) formatter:nil];
        }else if([self.title isEqualToString:@"Flicker A Float Number"]){
            [self.lblFlicker dd_setNumber:@(12345.789) formatter:nil];
        }else if([self.title isEqualToString:@"Flicker A Format Number"]){
            [self.lblFlicker dd_setNumber:@(5) format:@"￥%@" formatter:nil];
        }else if([self.title isEqualToString:@"Flicker An Attribute Number"]){
            id attributes = [NSDictionary dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                         andRange:NSMakeRange(0, 1)];
            [self.lblFlicker dd_setNumber:@(1888.88) formatter:nil attributes:attributes];
        }else{
            id attributes = @[[NSDictionary dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                           andRange:NSMakeRange(0, 1)],
                              [NSDictionary dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                           andRange:NSMakeRange(1, 3)]];
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            formatter.formatterBehavior = NSNumberFormatterBehavior10_4;
            formatter.numberStyle = NSNumberFormatterDecimalStyle;
            [self.lblFlicker dd_setNumber:@(1234.567) duration:1.0f format:@"￥%@" numberFormatter:formatter attributes:attributes];
        }
    }else{
        if([self.title isEqualToString:@"Flicker An Integer Number"]){
            [self.lblFlicker dd_setNumber:@(1234567)];
        }else if([self.title isEqualToString:@"Flicker A Float Number"]){
            [self.lblFlicker dd_setNumber:@(12345.789)];
        }else if([self.title isEqualToString:@"Flicker A Format Number"]){
            [self.lblFlicker dd_setNumber:@(5) format:@"￥%.2f"];
        }else if([self.title isEqualToString:@"Flicker An Attribute Number"]){
            id attributes = [NSDictionary dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                         andRange:NSMakeRange(0, 1)];
            [self.lblFlicker dd_setNumber:@(1888.88) attributes:attributes];
        }else{
            id attributes = @[[NSDictionary dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                           andRange:NSMakeRange(0, 1)],
                              [NSDictionary dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                           andRange:NSMakeRange(1, 3)]];
            [self.lblFlicker dd_setNumber:@(1234.567) duration:1.0f format:@"￥%.2f" attributes:attributes];
        }
    }
}

@end
