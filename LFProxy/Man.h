//
//  Man.h
//  LFProxy
//
//  Created by Feng Luo on 2020/3/28.
//  Copyright © 2020 Feng Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ManProtocol <NSObject>

- (void)playGame:(NSString *)str;

@end

@interface Man : NSObject

@end

NS_ASSUME_NONNULL_END
