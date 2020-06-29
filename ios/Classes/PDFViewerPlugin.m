#import "PDFViewerPlugin.h"
#if __has_include(<PDFViewer/PDFViewer-Swift.h>)
#import <PDFViewer/PDFViewer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "PDFViewer-Swift.h"
#endif

@implementation PDFViewerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPDFViewerPlugin registerWithRegistrar:registrar];
}
@end
