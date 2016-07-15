//
//  NSObject+DicToModel.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/7/9.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "NSObject+DicToModel.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (DicToModel)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self) {
        for (NSString *key in dictionary.allKeys) {
            id value = [dictionary objectForKey:key];
//            if ([key isEqualToString:@"testModel"]) {
//                
//            }
            SEL setter = [self propertySetterWithKey:key];
            if (setter) {
                ((void (*)(id, SEL, id))objc_msgSend)(self, setter, value);
            }
        }
    }
    return self;
}

- (NSDictionary *)toDictionary {
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    if (outCount) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:outCount];
        for (unsigned int i = 0; i < outCount; ++i) {
            objc_property_t property = properties[i];
            const void *propertyName = property_getName(property);
            NSString *key = [NSString stringWithUTF8String:propertyName];
            SEL getter = [self propertyGetterWithKey:key];
            if (getter) {
                NSMethodSignature *signature = [self methodSignatureForSelector:getter];
                NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
                [invocation setTarget:self];
                [invocation setSelector:getter];
                [invocation invoke];
                __unsafe_unretained NSObject *propertyValue = nil;
                [invocation getReturnValue:&propertyValue];
//                propertyValue = ((id (*)(id, SEL))objc_msgSend)(self, getter);
                
//                if (!propertyValue) {
//                    if ([self respondsToSelector:@selector(defaultValueForEmptyProperty)]) {
//                        NSDictionary *defaultValueDict = [self defaultValueForEmptyProperty];
//                        
//                        id defaultValue = [defaultValueDict objectForKey:key];
//                        propertyValue = defaultValue;
//                    }
//                }
                
                if (propertyValue) {
                    [dic setObject:propertyValue forKey:key];
                }
            }
        }
        free(properties);
        return dic;
    }
    free(properties);
    return nil;
}

- (SEL)propertySetterWithKey:(NSString *)key {
    NSString *propertySetter = key.capitalizedString;
    propertySetter = [NSString stringWithFormat:@"set%@:",propertySetter];
    SEL setter = NSSelectorFromString(propertySetter);
    if ([self respondsToSelector:setter]) {
        return setter;
    }
    return nil;
}

- (SEL)propertyGetterWithKey:(NSString *)key {
    if (key) {
        SEL getter = NSSelectorFromString(key);
        if ([self respondsToSelector:getter]) {
            return getter;
        }
    }
    return nil;
}

@end
