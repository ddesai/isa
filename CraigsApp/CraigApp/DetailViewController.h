//
//  DetailViewController.h
//  ISA
//
//  Created by Hayley Wu on 11/25/12.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    UIWebView *detailListing;

}



@property IBOutlet UIWebView *detailListing;
@property (nonatomic, weak) NSString *listingUrl;

- (id)initWithString:(NSString *)urlString;


@end

