//
//  ViewController.m
//  2009odai1
//
//  Created by ビザンコムマック０７ on 2014/10/04.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self koishi:3 hito:3];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//小石のゲームを行うメソッド
//引数pは最初にお椀の中に入っている小石の数
//引数nは候補者の人数
-(void)koishi:(int)p hito:(int)n{
    //3<=n<=50かつ2<=p<=50の条件を満たすn,pであるか
    if ((n >= 3) && (n <= 50) && (p >= 2) && (p <= 50)) {
        NSLog(@"最初にお椀に入っている石の数:%d",p);
        //候補者の小石を持っている数を表す配列
        NSMutableArray *array = [NSMutableArray array];
        //配列の初期化
        for (int i = 0; i < n; i++) {
            [array addObject:@"0"];
        }
        //countは、ゲームのときに使う変数
        int count = p;
        //お椀を持っている人の番号を表す変数
        int index = 0;
        //ステップの数をカウントする変数
        int step = 0;
        
        while (1) {
            //stepをインクリメント
            step++;
            NSLog(@"%dステップ目",step);
            //今の番号の人が持っている石の数を表す変数
            int koishihave = [[array objectAtIndex:index] intValue];
            //お椀の中に入っている石の数が0であるか
            if (count == 0) {
                    //持っている石をお椀に戻す
                NSLog(@"%d番目の持っている人の小石%d個をお椀に戻す",index,koishihave);
                    count = koishihave;
                    koishihave = 0;
            } else{
                NSLog(@"%d番目の人が小石を1つとる",index);
                //お椀の中にある石の数を1つ減らす
                count--;
                //持っている石を1つ増やす
                koishihave++;
                //持っている石の数が最初のお椀の中に入っている石の数と一緒であるか
                if (koishihave == p) {
                    NSLog(@"%d番目の人の勝利",index);
                    break;
                }
            }
            //arrayのindex番目の要素にkoishihaveを文字列にしたもの(index番目の人が持っている石の数)を格納
            [array replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%d",koishihave]];
            NSLog(@"%d番目の人は石を%@個持っている",index,[array objectAtIndex:index]);
            NSLog(@"お椀にある石の数:%d",count);
            //今、お椀を持っている人の番号がn-1であるか
            if (index == n-1) {
                //indexを0とする(番号n-1の右の隣の人の番号が0であるから)
                index = 0;
            } else{
                //indexをインクリメント(それ以外の人の右の隣の人の番号は今の番号+1であるから)
                index++;
            }
        }
    }
}

@end
