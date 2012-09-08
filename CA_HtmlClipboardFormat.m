//
//  CA_HtmlClipboardFormat.m
//  Generate HTML Clipboard Format CF_HTML
//
//  Created by Alexander Adolf on 2012-08-28.
//  Copyright 2012 Condition-ALPHA. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as
//  published by the Free Software Foundation, either version 3 of the
//  Licence, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import "CA_HtmlClipboardFormat.h"

@interface CA_HtmlClipboardFormat ()
- (void)generateHeaderWithHtml:(NSRange)html fragment:(NSRange)fragment andSelection:(NSRange)selection;
- (void)appendTrailer;
@end

@implementation CA_HtmlClipboardFormat
- (id)init
{
   self = [super init];
   if (self) {
      buf = [NSMutableString string];
   }
   return self;
}

- (void)generateHeaderWithHtml:(NSRange)html fragment:(NSRange)fragment andSelection:(NSRange)selection {
   const NSInteger   htmlOffset     = 138;
   const NSInteger   prefixLength   = 35;
   const NSInteger   fragmentOffset = htmlOffset + prefixLength;
   const NSInteger   postfixLength  = 34;
   [buf setString:@""]; // empty the buffer
   [buf appendString:@"Version:0.9\n"];
#ifdef __LP64__
   [buf appendFormat:@"StartHTML:%08ld\n",       htmlOffset];
   [buf appendFormat:@"EndHTML:%08ld\n",         fragmentOffset + html.length + postfixLength];
   [buf appendFormat:@"StartFragment:%08ld\n",   fragmentOffset + fragment.location];
   [buf appendFormat:@"EndFragment:%08ld\n",     fragmentOffset + fragment.location + fragment.length];
   [buf appendFormat:@"StartSelection:%08ld\n",  fragmentOffset + selection.location];
   [buf appendFormat:@"EndSelection:%08ld\n",    fragmentOffset + selection.location + selection.length];
#else
   [buf appendFormat:@"StartHTML:%08d\n",       htmlOffset];
   [buf appendFormat:@"EndHTML:%08d\n",         fragmentOffset + html.length + postfixLength];
   [buf appendFormat:@"StartFragment:%08d\n",   fragmentOffset + fragment.location];
   [buf appendFormat:@"EndFragment:%08d\n",     fragmentOffset + fragment.location + fragment.length];
   [buf appendFormat:@"StartSelection:%08d\n",  fragmentOffset + selection.location];
   [buf appendFormat:@"EndSelection:%08d\n",    fragmentOffset + selection.location + selection.length];
#endif
   [buf appendString:@"<html><body>\n"];
   [buf appendString:@"<!--StartFragment -->\n"];
}

- (void)appendTrailer {
   [buf appendString:@"<!--EndFragment-->\n"];
   [buf appendString:@"</body></html>\n"];
}

- (void)copyHtml:(NSString*)html {
   NSRange     htmlRange = NSMakeRange(0, html.length);
   [self generateHeaderWithHtml:htmlRange fragment:htmlRange andSelection:htmlRange];
   [buf appendFormat:@"%@\n", html];
   [self appendTrailer];
}

- (void)copyHtml:(NSString*)html withSelection:(NSRange)selection {
   NSRange     htmlRange = NSMakeRange(0, html.length);
   [self generateHeaderWithHtml:htmlRange fragment:htmlRange andSelection:selection];
   [buf appendFormat:@"%@\n", html];
   [self appendTrailer];
}

- (NSString*)clipboardFormat {
   return buf;
}
@end
