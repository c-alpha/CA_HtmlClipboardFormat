//
//  CA_HtmlClipboardFormat.h
//  Generate HTML Clipboard Format CF_HTML
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

#import <Foundation/Foundation.h>

@interface CA_HtmlClipboardFormat : NSObject
{
   NSMutableString   *buf;
}
- (void)copyHtml:(NSString*)html;
- (void)copyHtml:(NSString*)html withSelection:(NSRange)selection;
- (NSString*)clipboardFormat;
@end
