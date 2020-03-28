//
//  Children.h
//  LFProxy
//
//  Created by Feng Luo on 2020/3/28.
//  Copyright © 2020 Feng Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Man.h"
#import "Women.h"

NS_ASSUME_NONNULL_BEGIN

@interface Children : NSProxy<ManProtocol,WomenProtocol>

+(instancetype)shareProxy;

@end

NS_ASSUME_NONNULL_END
