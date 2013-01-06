//
//  ViewController.m
//  Unbeatable
//
//  Created by DJ Chung on 12/24/12.
//  Copyright (c) 2012 Bluekey LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *opponentMoves;
@property (nonatomic, strong) NSMutableArray *machineMoves;
@property (nonatomic, strong) NSMutableArray *allMoves;
@property (nonatomic, strong) NSArray *possibleMoves;
@property (nonatomic, strong) NSArray *cornerMoves;
@property (nonatomic, strong) NSArray *topRow;
@property (nonatomic, strong) NSArray *midRow;
@property (nonatomic, strong) NSArray *bottomRow;
@property (nonatomic, strong) NSArray *leftColumn;
@property (nonatomic, strong) NSArray *midColumn;
@property (nonatomic, strong) NSArray *rightColumn;
@property (nonatomic, strong) NSArray *downDiagonal;
@property (nonatomic, strong) NSArray *upDiagonal;
@property (nonatomic, strong) NSArray *winningCombos;
@property (nonatomic, strong) NSArray *elbowCombos;

@property (assign, nonatomic) BOOL isFirstMove;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.section1.tag = 1;
    self.section2.tag = 2;
    self.section3.tag = 3;
    self.section4.tag = 4;
    self.section5.tag = 5;
    self.section6.tag = 6;
    self.section7.tag = 7;
    self.section8.tag = 8;
    self.section9.tag = 9;
    
    self.view1.tag = 11;
    self.view2.tag = 12;
    self.view3.tag = 13;
    self.view4.tag = 14;
    self.view5.tag = 15;
    self.view6.tag = 16;
    self.view7.tag = 17;
    self.view8.tag = 18;
    self.view9.tag = 19;
    
    self.topRow = [[NSArray alloc]initWithObjects:@
    "1",@"2",@"3", nil];
    self.midRow = [[NSArray alloc]initWithObjects:@"4", @"5", @"6", nil];
    self.bottomRow = [[NSArray alloc]initWithObjects:@"7", @"8", @"9", nil];
    self.leftColumn = [[NSArray alloc]initWithObjects:@"1", @"4", @"7", nil];
    self.midColumn = [[NSArray alloc]initWithObjects:@"2", @"5", @"8", nil];
    self.rightColumn = [[NSArray alloc]initWithObjects:@"3", @"6", @"9", nil];
    self.downDiagonal = [[NSArray alloc]initWithObjects:@"1", @"5", @"9", nil];
    self.upDiagonal = [[NSArray alloc]initWithObjects:@"7", @"5", @"3", nil];
    
    self.winningCombos = [[NSArray alloc]initWithObjects:self.topRow, self.midRow, self.bottomRow, self.leftColumn, self.leftColumn, self.midColumn, self.rightColumn, self.downDiagonal, self.upDiagonal, nil];
    
    NSArray *topLeftElbow = [[NSArray alloc]initWithObjects:@"1", @"2", @"4", nil];
    NSArray *topRightElbow = [[NSArray alloc]initWithObjects:@"2", @"3", @"6", nil];
    NSArray *bottowLeftElbow = [[NSArray alloc]initWithObjects:@"4", @"7", @"8", nil];
    NSArray *bottowRightElbow = [[NSArray alloc]initWithObjects:@"6", @"8", @"9", nil];
    
    self.elbowCombos = [[NSArray alloc]initWithObjects:topLeftElbow, topRightElbow, bottowLeftElbow, bottowRightElbow, nil];
    
    self.opponentMoves = [[NSMutableArray alloc]init];
    self.machineMoves = [[NSMutableArray alloc]init];
    self.allMoves = [[NSMutableArray alloc]init];
    self.possibleMoves = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
    self.cornerMoves = [[NSArray alloc]initWithObjects:@"1", @"3", @"7", @"9", nil];
    self.isFirstMove = YES;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)section1Pressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    int buttonTag = button.tag;
   
    [self buttonTouchedWithTag:buttonTag];
    [self flowOfPlayWithTag:buttonTag];

}
- (IBAction)section2Pressed:(id)sender {
    //keep track of moves
    UIButton *button = (UIButton *)sender;
    int buttonTag = button.tag;
    
    [self buttonTouchedWithTag:buttonTag];
    [self flowOfPlayWithTag:buttonTag];
    
}
- (IBAction)section3Pressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    int buttonTag = button.tag;
    [self buttonTouchedWithTag:buttonTag];
    [self flowOfPlayWithTag:buttonTag];
    
}
- (IBAction)section4Pressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    int buttonTag = button.tag;
    [self buttonTouchedWithTag:buttonTag];
    [self flowOfPlayWithTag:buttonTag];
   
}
- (IBAction)section5Pressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    int buttonTag = button.tag;
    [self buttonTouchedWithTag:buttonTag];
    [self flowOfPlayWithTag:buttonTag];
}
- (IBAction)section6Pressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    int buttonTag = button.tag;
    NSLog(@"buttonTag: %d", buttonTag);
    [self buttonTouchedWithTag:buttonTag];
    [self flowOfPlayWithTag:buttonTag];
    
}
- (IBAction)section7Pressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    int buttonTag = button.tag;
    [self buttonTouchedWithTag:buttonTag];
    [self flowOfPlayWithTag:buttonTag];
}
- (IBAction)section8Pressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    int buttonTag = button.tag;
    [self buttonTouchedWithTag:buttonTag];
    [self flowOfPlayWithTag:buttonTag];
}
- (IBAction)section9Pressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    int buttonTag = button.tag;
    [self buttonTouchedWithTag:buttonTag];
    [self flowOfPlayWithTag:buttonTag];
}

- (void)flowOfPlayWithTag:(int)buttonTag {
    if (self.isFirstMove) {
        if (buttonTag == 5) {
            //play corner move?

            [self machinePlayCornerConsiderTag:buttonTag];
        }else if (buttonTag !=5){
            [self machinePlayOppositeSectionOfTag:buttonTag];
//            [self machinePlayMiddle];
        }
        self.isFirstMove = NO;
    }else if (!self.isFirstMove){
        if (![self machinePlayAppropriateMoveToWin:YES]) {
            if (![self machinePlayAppropriateMoveToWin:NO]) {
                if (buttonTag == 5) {
                    if(![self machinePlayCornerConsiderTag:buttonTag]){
                        [self machinePlayAnyAvailable];
//                        [self checkIfTie];
                    }
                }else if (buttonTag !=5 && buttonTag % 2 !=0){
                    if (![self machinePlayOppositeSectionOfTag:buttonTag]) {
                        if (![self machinePlayCorner]) {
                            [self machinePlayAnyAvailable];
                        }
                        
//                        [self checkIfTie];
                    }
                }else if (buttonTag !=5 && buttonTag % 2 == 0){
                    if (![self machinePlayCornerConsiderTag:buttonTag]) {
                        if (![self machinePlayOppositeSectionOfTag:buttonTag]) {
                            [self machinePlayAnyAvailable];
                            //                        [self checkIfTie];
                        }
                    }
                }
                
                [self checkIfTie];
                
            }
        }
    }
}

- (void)buttonTouchedWithTag:(int)tag {
    int viewReference = tag + 10;
    NSString *opponentMove = [NSString stringWithFormat:@"%d", tag];
    [self.view viewWithTag:tag].userInteractionEnabled = NO;
    [self.view viewWithTag:viewReference].backgroundColor = [UIColor blueColor];
    [self.opponentMoves addObject:opponentMove];
    [self.allMoves addObject:opponentMove];
}

- (BOOL)machinePlayCorner {
    for (NSString *move in self.cornerMoves){
        if (![self.allMoves containsObject:move]) {
            int sectionReference = [move intValue];
            int viewReference = sectionReference + 10;
            [self.view viewWithTag:viewReference].backgroundColor = [UIColor redColor];
            [self.view viewWithTag:sectionReference].userInteractionEnabled = NO;
            [self.machineMoves addObject:move];
            [self.allMoves addObject:move];
            return YES;
        }
        
    }
    return NO;
    
}
- (BOOL)machinePlayCornerConsiderTag:(int)tag {
   
    NSString *opponentMove = [NSString stringWithFormat:@"%d", tag];
    if (tag!=5) {
        for (NSArray *elbowCombo in self.elbowCombos){
            for (NSString *previousOppMove in self.opponentMoves){
                if (![previousOppMove isEqualToString:opponentMove]) {
                    if ([elbowCombo containsObject:opponentMove] && [elbowCombo containsObject:previousOppMove]) {
                        int opponentMoveIndex = [elbowCombo indexOfObject:opponentMove];
                        int previousOppMoveIndex = [elbowCombo indexOfObject:previousOppMove];
                        int cornerMoveIndex = 3 - (opponentMoveIndex + previousOppMoveIndex);
                        
                        NSString *cornerMove = [elbowCombo objectAtIndex:cornerMoveIndex];
                        if (![self.allMoves containsObject:cornerMove]) {
                            int sectionReference = [cornerMove intValue];
                            int viewReference = sectionReference + 10;
                            [self.view viewWithTag:viewReference].backgroundColor = [UIColor redColor];
                            [self.view viewWithTag:sectionReference].userInteractionEnabled = NO;
                            [self.machineMoves addObject:cornerMove];
                            [self.allMoves addObject:cornerMove];
                            return YES;
                        }
                    }
                }
                
            }
            
        }
    }else if (tag == 5){
        for (NSString *move in self.cornerMoves){
            if (![self.allMoves containsObject:move]) {
                int sectionReference = [move intValue];
                int viewReference = sectionReference + 10;
                [self.view viewWithTag:viewReference].backgroundColor = [UIColor redColor];
                [self.view viewWithTag:sectionReference].userInteractionEnabled = NO;
                [self.machineMoves addObject:move];
                [self.allMoves addObject:move];
                return YES;
            }
        }
    }
    
    
    return NO;
}
- (void)machinePlayMiddle {
    self.view5.backgroundColor = [UIColor redColor];
    self.section5.userInteractionEnabled = NO;
    [self.machineMoves addObject:@"5"];
    [self.allMoves addObject:@"5"];
}
- (void)machinePlayAnyAvailable {
    for (NSString *move in self.possibleMoves){
        if (![self.allMoves containsObject:move]) {
            int sectionReference = [move intValue];
            int viewReference = sectionReference + 10;
            [self.view viewWithTag:viewReference].backgroundColor = [UIColor redColor];
            [self.view viewWithTag:sectionReference].userInteractionEnabled = NO;
            [self.machineMoves addObject:move];
            [self.allMoves addObject:move];
            return;
        }
    }
}
- (BOOL)machinePlayOppositeSectionOfTag:(int)tag {
    int sectionReference = 10 - tag;
    int viewReference = sectionReference + 10;
    NSString *machineMove = [NSString stringWithFormat:@"%d", sectionReference];
    
    if (![self.allMoves containsObject:machineMove]) {
        [self.view viewWithTag:viewReference].backgroundColor = [UIColor redColor];
        [self.view viewWithTag:sectionReference].userInteractionEnabled = NO;
        [self.machineMoves addObject:machineMove];
        [self.allMoves addObject:machineMove];
        return YES;
    }
    return NO;
    
}

- (BOOL)machinePlayAppropriateMoveToWin:(BOOL)isWinMove{
    NSArray *array;
    NSString *machineWinMessage = @"I'm sorry, you lost.";
    if (isWinMove) {
        array = [[NSArray alloc]initWithArray:self.machineMoves];
    }else if (!isWinMove){
        array = [[NSArray alloc]initWithArray:self.opponentMoves];
    }
    ;
    for (NSString *move in array){
        int arrayIndex = [array indexOfObject:move];
        while (arrayIndex < array.count -1) {
            arrayIndex += 1;
            NSString *pairedMove = [array objectAtIndex:arrayIndex];
            for (NSArray *combo in self.winningCombos){
                if ([combo containsObject:move] && [combo containsObject:pairedMove]) {
                    
                    int moveIndex = [combo indexOfObject:move];
                
                    int pairedIndex = [combo indexOfObject:pairedMove];
                    int index = 3 - (moveIndex + pairedIndex);
                    NSString *sectionToPlay = [combo objectAtIndex:index];
                    if (![self.allMoves containsObject:sectionToPlay]){
                        int sectionInt = [sectionToPlay intValue];
                        int viewInt = sectionInt + 10;
                        [self.view viewWithTag:sectionInt].userInteractionEnabled = NO;
                        [self.view viewWithTag:viewInt].backgroundColor = [UIColor redColor];
                        
                        [self.machineMoves addObject:sectionToPlay];
                        [self.allMoves addObject:sectionToPlay];
                        if (isWinMove) {
                            UIAlertView *machineWinAlert = [[UIAlertView alloc]initWithTitle:@"Machine Wins" message:machineWinMessage delegate:self cancelButtonTitle:@"Yes, I did lose" otherButtonTitles: nil];
                            [machineWinAlert show];
                            //set delegate method to clear all moves and start over.
                        }
                        return YES;
                    }
                    
                }
            }
        }
    }
    
    return NO;
}

- (void)checkIfTie {
    if (self.allMoves.count == 9) {
        UIAlertView *tieAlert = [[UIAlertView alloc]initWithTitle:@"Tie Game" message:@"There is no winner, game is a draw" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [tieAlert show];
        return;
//        set delegate method to clear all moves and start over
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    //userinteractionenabled for all buttons
    //clear out opponent, machine and allmoves arrays
    //set all background colors to white
    //reset isFirstMove
    for (NSString *referenceString in self.possibleMoves){
        int sectionReference = [referenceString intValue];
        int viewReference = sectionReference + 10;
        [self.view viewWithTag:sectionReference].userInteractionEnabled = YES;
        [self.view viewWithTag:viewReference].backgroundColor = [UIColor whiteColor];
    }
    self.isFirstMove = YES;
    [self.opponentMoves removeAllObjects];
    [self.machineMoves removeAllObjects];
    [self.allMoves removeAllObjects];
}

- (void)viewDidUnload {
    [self setView1:nil];
    [self setView2:nil];
    [self setView3:nil];
    [self setView4:nil];
    [self setView5:nil];
    [self setView6:nil];
    [self setView7:nil];
    [self setView8:nil];
    [self setView9:nil];
    [self setSection1:nil];
    [self setSection2:nil];
    [self setSection3:nil];
    [self setSection4:nil];
    [self setSection5:nil];
    [self setSection6:nil];
    [self setSection7:nil];
    [self setSection8:nil];
    [self setSection9:nil];
    [super viewDidUnload];
}
@end
