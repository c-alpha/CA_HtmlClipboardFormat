//
//  CA_HtmlClipboardFormat.h
//  ComposeIT
//
//  Created by Alexander Adolf on 2012-08-28.
//  Copyright 2012 Condition-ALPHA. All rights reserved.
//
//  CF_HTML clipboard format needed to paste stuff using WebView's
//  -(void)replaceSelectionWithMarkupString:(NSString *)markupString
//
//  http://msdn.microsoft.com/en-us/library/aa767917.aspx
//  http://msdn.microsoft.com/en-us/library/windows/desktop/ms649015(v=vs.85).aspx
//  http://support.microsoft.com/kb/274308
//

#import <Foundation/Foundation.h>

@interface CA_HtmlClipboardFormat : NSObject
{
   NSMutableString   *buf;
}
- (void)copyHtml:(NSString*)html;
- (void)copyHtml:(NSString*)html withSelection:(NSRange)selection;
- (NSString*)clipboardFormat;
@end
