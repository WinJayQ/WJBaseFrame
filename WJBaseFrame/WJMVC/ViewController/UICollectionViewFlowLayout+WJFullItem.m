//
//  UICollectionViewFlowLayout+XWFullItem.m
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/18.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import "UICollectionViewFlowLayout+WJFullItem.h"
#import <objc/runtime.h>

@implementation UICollectionViewFlowLayout (WJFullItem)

- (void)setFullItem:(BOOL)fullItem{
    objc_setAssociatedObject(self, "fullItem", @(fullItem), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)fullItem{
    return [objc_getAssociatedObject(self, "fullItem") intValue];
}

- (void)prepareLayout{
    if (self.fullItem) {
        self.itemSize = self.collectionView.bounds.size;
    }
    [super prepareLayout];
}

@end
