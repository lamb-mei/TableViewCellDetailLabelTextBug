TableView Cell DetailLabelTextBug
=========

更新 Table View Cell DetailLabel 文字欄位的時候
給予 `@""`  或  `nil` 下次 relaodData 更新Cell 資料時會出問題
#####已知存在問題 OS
 - 8.3
 - 8.2
 - 8.1
 - 8.0

解決方式
-----------
塞入資料前先檢查資料
```objective-c
if([infoItem valueForKey:@"value"] == nil || [[infoItem valueForKey:@"value"] isEqual @""]){
cell.detailTextLabel.text  = @" ";
}else{
cell.detailTextLabel.text  = [infoItem valueForKey:@"value"];
}


```

