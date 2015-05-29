TableView Cell DetailLabelTextBug
=========

更新 Table View Cell DetailLabel 文字欄位的時候
給予 `@""`  或  `nil` 下次 relaodData 更新Cell 資料時會出問題
查詢狀態，它其實沒有被加入 view hierarchy

[參考連結](http://stackoverflow.com/questions/25793074/subtitles-of-uitableviewcell-wont-update)

#####已知存在問題 OS
 - 8.3
 - 8.2
 - 8.1
 - 8.0

解決方式
-----------
-方式一：塞入資料前先檢查資料
```objective-c
if([infoItem valueForKey:@"value"] == nil || [[infoItem valueForKey:@"value"] isEqual: @""]){
cell.detailTextLabel.text  = @" ";
}else{
cell.detailTextLabel.text  = [infoItem valueForKey:@"value"];
}


```

-方式二：使用 stringWithFormat
注意: `@"%@ "` 後面其實有跟了一個空白，若直接串接 @"%@" 還是無效的
```objective-c
cell.detailTextLabel.text  = [NSString stringWithFormat:@"%@ ",[infoItem valueForKey:@"value"]];
```


-方式三：強制add view hierarchy
```objective-c
cell.detailTextLabel.text = [infoItem valueForKey:@"value"];
[cell.contentView addSubview:cell.detailTextLabel];
```