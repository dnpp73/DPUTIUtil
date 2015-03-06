//
//  See also http://cocoadays.blogspot.jp/2010/08/mime-type.html
//  and https://github.com/xcatsan/iOS-Sample-Code/tree/2010-08-10/UUTypeSample
//


#import <Foundation/Foundation.h>


@interface DPUTIUtil : NSObject

+ (NSString*)pathExtensionFromMIMEType:(NSString*)MIMEType;
+ (NSString*)MIMETypeFromPath:(NSString*)path;
+ (NSString*)MIMETypeFromPathExtension:(NSString*)pathExtension;

+ (NSString*)UTIFromMIMEType:(NSString*)MIMEType;
+ (NSString*)UTIFromPath:(NSString*)path;
+ (NSString*)UTIFromPathExtension:(NSString*)pathExtension;

@end
