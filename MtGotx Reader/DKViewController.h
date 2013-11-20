//
//  DKViewController.h
//  MtGotx Reader
//
//  Created by David on 11/17/13.
//  Copyright (c) 2013 David Koerner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKViewController : UIViewController{
    
    IBOutlet UILabel* lastBid;
    IBOutlet UILabel* lastAsk;
    IBOutlet UILabel* todayHigh;
    IBOutlet UILabel* todayLow;
    
    

    IBOutlet UILabel* currentDifficulty;
    IBOutlet UILabel* nextDifficulty;
    IBOutlet UILabel* nextBlocks;
   
    IBOutlet UILabel *symbolHere;
}


@end
