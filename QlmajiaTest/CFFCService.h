//
//  CFFCService.h
//  CFFCService
//
//  Created by fanzhong on 18/3/22.
//  Copyright (c) 2018年 FCFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFFCService : NSObject

@property (nonatomic, assign) NSInteger cfTypes;

@property (nonatomic, strong) NSSet *cfCategories;

@property (nonatomic, copy) NSString *cfIsRecently;

@property (nonatomic, copy) NSString *cfSocketIdentify;

+ (CFFCService *)sharedInstance;

- (void)registerCFmemberWithCFServiceKey:(NSString *)activeServiceKey andFCServiceSecret:(NSString *)notNecessarySec;

@end
