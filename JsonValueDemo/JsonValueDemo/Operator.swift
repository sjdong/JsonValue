//
//  Operator.swift
//  JsonValueDemo
//
//  Created by sjdong on 16/3/8.
//  MIT
//

/**
* 重定义运算符
* >  输出json中的字段
* >> 循环遍历json中的数组
* example:
*     let json = [
*        "school": "HANGZHOU",
*        "grades": [
*           "1": [
*               "classes": 2,
*               "students": 200
*            ],
*           "2": [
*               "classes": 3,
*               "students": 300
*            ]
*        ]
*     ]
*  print(json > "school")    //输出 HANGZHOU
*  (json > "grades") >> { row in
*       if let r = row {
*           print(r > "classes")
*       }
*  }
*  //循环输出 2, 3
*/


infix operator > {associativity left}
infix operator >> {}

public func > (left: AnyObject?, right: String) -> AnyObject? {
    if let sureLeft = left {
        return (sureLeft as! Dictionary<String, AnyObject>) > right
    }
    return nil
}

public func > (left: Dictionary<String, AnyObject>?, right: String) -> AnyObject? {
    if let sureLeft = left {
        return sureLeft[right]
    }
    return nil
}

public func >> (left: AnyObject?, right: ((AnyObject?) -> Void)) {
    guard let sureObj = left else {
        return right(nil)
    }
    let mir = String(Mirror(reflecting: sureObj).subjectType)
    if mir == "__NSCFArray" || mir == "__NSArrayI" {
        let arr = sureObj as! Array<AnyObject>
        for o in arr {
            right(o)
        }
    } else {
        right(nil)
    }
}
