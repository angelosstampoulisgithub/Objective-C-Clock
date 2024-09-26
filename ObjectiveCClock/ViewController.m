//
//  ViewController.m
//  ObjectiveCClock
//
//  Created by Angelos Staboulis on 24/9/24.
//

#import "ViewController.h"
#define degreesToRadians(radians) ((radians) * (180.0 / M_PI))
@interface ViewController ()

@end

@implementation ViewController

- (void)initClockHands{
    CGPoint center = [self.mainView center];
    [_handHour setCenter:CGPointMake(center.x-15, center.y-180)];
    [_handMinute setCenter:CGPointMake(center.x-15, center.y-180)];
    [_handSecond setCenter:CGPointMake(center.x-15, center.y-180)];
}
-(NSString*) createHour:(long) hour{
    _returnStringHour = [[NSString alloc] init];
    if (hour>=0 && hour<=9){
        _returnStringHour = [NSString stringWithFormat:@"0%ld",hour];
    }else{
        _returnStringHour =  [NSString stringWithFormat:@"%ld",hour];
    }
    return _returnStringHour;
}
-(NSString*) createMinute:(long) minute{
    _returnStringMinutes = [[NSString alloc] init];
    if (minute>=0 && minute<=9){
        _returnStringMinutes = [NSString stringWithFormat:@"0%ld",minute];
    }else{
        _returnStringMinutes =  [NSString stringWithFormat:@"%ld",minute];
    }
    return _returnStringMinutes;
}
-(NSString*) createSeconds:(long) seconds{
    _returnStringSeconds = [[NSString alloc] init];
    if (seconds>=0 && seconds<=9){
        _returnStringSeconds = [NSString stringWithFormat:@"0%ld",seconds];
    }else{
        _returnStringSeconds =  [NSString stringWithFormat:@"%ld",seconds];
    }
    return _returnStringSeconds;
}
- (void (^)(NSInteger *,NSInteger *,NSInteger *))createTime{
    return ^(NSInteger *hour,NSInteger *minute,NSInteger *second){
        NSDate *now = [NSDate date];
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        NSDateComponents *component = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:now];
        
        long getHour = [component hour];
        
        long getMinute = [component minute];
        
        long getSecond = [component second];
        
        *hour = getHour;
        
        *minute = getMinute;
        
        *second = getSecond;
    };
}
- (void)updateUI{
    
    void(^tuple)(NSInteger *,NSInteger *,NSInteger *) = [self createTime];
    
    NSInteger hour,minute,second;
    
    tuple(&hour,&minute,&second);
    
    double hourHandAngle = (hour/12.0)*(2*M_PI);
    double minuteHandAngle = ((minute/60.0)*(2*M_PI))+0.0025;
    double secondHandAngle = (second/60.0)*(2*M_PI);
    
    
    self.handHour.transform = CGAffineTransformRotate(self.view.transform, [_mathematics radiansDegreesWithAngle:hourHandAngle]);
    self.handMinute.transform = CGAffineTransformRotate(self.view.transform, [_mathematics radiansDegreesWithAngle:minuteHandAngle]);
    self.handSecond.transform = CGAffineTransformRotate(self.view.transform, [_mathematics radiansDegreesWithAngle:secondHandAngle]);
    NSString *time = [NSString stringWithFormat:@"%@:%@:%@",[self createHour:hour],[self createMinute:minute],[self createSeconds:second]];
    [_lblTime setText:time];
}
-(void) fireTimer{
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:TRUE block:^(NSTimer * _Nonnull timer) {
        [self updateUI];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _mathematics = [[Mathematics alloc] init];
    [self initClockHands];
    [self fireTimer];
}


@end
