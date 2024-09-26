//
//  ViewController.h
//  ObjectiveCClock
//
//  Created by Angelos Staboulis on 24/9/24.
//

#import <UIKit/UIKit.h>
#import "ObjectiveCClock-Swift.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *handHour;
@property (weak, nonatomic) IBOutlet UIImageView *handMinute;
@property (weak, nonatomic) IBOutlet UIImageView *handSecond;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property NSString* returnStringHour;
@property NSString* returnStringMinutes;
@property NSString* returnStringSeconds;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property Mathematics *mathematics;
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIImageView *face;

-(void) initClockHands;
-(void) updateUI;
@end

