//
//  UIColor+CC.m
//  bench_ios
//
//  Created by ml on 2019/9/10.
//

#import "UIColor+CCUI.h"
#import "ccs.h"

@implementation UIColor (CC)


+ (UIColor *)lightRed {
    return COLOR_LIGHT_RED;
}

+ (UIColor *)lightBlue {
    return COLOR_LIGHT_BLUE;
}

+ (UIColor *)tinyLightGrayColor {
    return RGB(242, 242, 242);
}

+ (UIColor *)cc_hexA:(NSString *)hex alpha:(float)alpha {
    hex = [hex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    hex = [hex stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[hex substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hex substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hex substringWithRange:range]] scanHexInt:&blue];
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (UIColor *)cc_rgbA:(float)red green:(float)green blue:(float)blue alpha:(float)alpha {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end
