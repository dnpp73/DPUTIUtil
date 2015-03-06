//
//  See also http://cocoadays.blogspot.jp/2010/08/mime-type.html
//  and https://github.com/xcatsan/iOS-Sample-Code/tree/2010-08-10/UUTypeSample
//


#import "DPUTIUtil.h"
#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
#import <MobileCoreServices/MobileCoreServices.h>
#elif TARGET_OS_MAC
#import <CoreServices/CoreServices.h>
#endif


@implementation DPUTIUtil

#pragma mark - MIME Type <=> Filename Extension

+ (NSString*)pathExtensionFromMIMEType:(NSString*)MIMEType
{
    CFStringRef utiRef = (__bridge_retained CFStringRef)[self UTIFromMIMEType:MIMEType];
    CFStringRef pathExtensionRef = UTTypeCopyPreferredTagWithClass(utiRef, kUTTagClassFilenameExtension);
    CFRelease(utiRef);
    return CFBridgingRelease(pathExtensionRef);
}

+ (NSString*)MIMETypeFromPath:(NSString*)path
{
    return [self MIMETypeFromPathExtension:[path pathExtension]];
}

+ (NSString*)MIMETypeFromPathExtension:(NSString*)pathExtension
{
    CFStringRef utiRef = (__bridge_retained CFStringRef)[self UTIFromPathExtension:pathExtension];
    CFStringRef MIMETypeRef = UTTypeCopyPreferredTagWithClass(utiRef, kUTTagClassMIMEType);
    CFRelease(utiRef);
    return CFBridgingRelease(MIMETypeRef);
}

#pragma mark - UTI utilities

+ (NSString*)UTIFromMIMEType:(NSString*)MIMEType
{
    CFStringRef MIMETypeRef = (__bridge_retained CFStringRef)MIMEType;
    CFStringRef utiRef = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, MIMETypeRef, NULL);
    CFRelease(MIMETypeRef);
    return CFBridgingRelease(utiRef);
}

+ (NSString*)UTIFromPath:(NSString*)path
{
    return [self UTIFromPathExtension:[path pathExtension]];
}

+ (NSString*)UTIFromPathExtension:(NSString*)pathExtension
{
    CFStringRef pathExtensionRef = (__bridge_retained CFStringRef)pathExtension;
    CFStringRef utiRef = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtensionRef, NULL);
    CFRelease(pathExtensionRef);
    return CFBridgingRelease(utiRef);
}

@end
