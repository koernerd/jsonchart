//
//  DKViewController.m
//  MtGotx Reader
//
//  Created by David on 11/17/13.
//  Copyright (c) 2013 David Koerner. All rights reserved.
//
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kLatestBitcoinChartDataURL [NSURL URLWithString:@"http://api.bitcoincharts.com/v1/markets.json"] //2


#import "DKViewController.h"



@implementation DKViewController {
    NSMutableArray *jsonResults;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        kLatestBitcoinChartDataURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSArray *tArray = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    NSDictionary *dict0 = [tArray objectAtIndex:147];

    
//    NSArray *volume = [dict0 objectForKey:@"volume"];
//    NSArray *latest_trade = [dict0 objectForKey:@"ask"];
//    NSArray *symbol = [dict0 objectForKey:@"symbol"];
//    NSNumber* latestTrade = [dict0 objectForKey:@"bid"];
    NSNumber* bid = [dict0 objectForKey:@"bid"];
    NSNumber* low = [dict0 objectForKey:@"low"];
    NSNumber* high = [dict0 objectForKey:@"high"];
    NSNumber* ask = [dict0 objectForKey:@"ask"];
    NSString* symbol = [dict0 objectForKey:@"symbol"];
    
    
//    float traded = [latestTrade floatValue];
    float askNow = [ask floatValue];
    float highNow = [high floatValue];
    float lowNow = [low floatValue];
    float bidNow = [bid floatValue];
    
    
 //   NSLog(@"volume: %@", volume);
 //   NSLog(@"latest_trade: %@", latestTrade);
 //   NSLog(@"symbol: %@", symbol);
 //   NSLog(@"trade: %@", latestTrade);
    
//    lastTrade.text = [NSString stringWithFormat:@"$%.2f",traded];
    lastAsk.text = [NSString stringWithFormat:@"$%.2f",askNow];
   todayHigh.text = [NSString stringWithFormat:@"$%.2f",highNow];
    symbolHere.text = [NSString stringWithFormat:@"%@",symbol];
    lastBid.text = [NSString stringWithFormat:@"$%.2f",bidNow];
    todayLow.text = [NSString stringWithFormat:@"$%.2f",lowNow];
    

 //   NSString *volume = array[0];
 //   NSString *latest_trade = array[1];
 //   NSString *bid = array[2];
 //   NSString *high = array[3];
 //   NSString *currency = array[4];
 //   NSString *currency_volume = array[5];
 //   NSString *ask = array[6];
 //   NSString *close = array[7];
 //   NSString *avg = array[8];
 //   NSString *symbol = array[9];
 //   NSString *low = array[10];
    
    

}


@end
