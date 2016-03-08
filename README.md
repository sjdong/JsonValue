# JsonValue
简化输出JSON数据，省略感叹号和对象转义

在数据处理中，本地Directory对象也好，网络请求的JSON对象也好，都需要面临从对象中根据Key去取值，所以会面对很多的变量定义以及感叹号，尤其当数据中包含数组对象更加麻烦。

当然，你可以将数据通过Json2Model的方式转换成对象来操作，这是一种比较好的数据处理方式，因为他可以指定变量的别名，从而在版本升级时，你可以尽可能少的关注数据字段的变化。

但是，我个人不是很喜欢到处定义对象。所以在痛苦的学习过程中，尝试寻找一种语法糖去简化这种操作方式。幸好swift提供了操作符重载和闭包回调，让我可以把处理函数封装的比较美观一点

示例代码：<br />
```swift
  //将demo中的 operator.swift 文件加入到项目中
  //使用 >  符号 来代替 [] 输出json中的字段值
  //使用 >> 符号来进行遍历并回调
  let json = [
      "school": "HANGZHOU",
      "grades": [
          [
              "classes": 2,
              "students": 200
          ],
          [
              "classes": 3,
              "students": 300
          ]
      ]
  ]
  
  print(json > "school")
  // 输出 HANGZHOU
  
  (json > "grades") >> { row in
      if let r = row {
          print(r > "classes")
      }
  }
  //循环输出 2, 3
```
从网络请求获得的数据处理也是一致

刚学swift 2周 如果有更好的方法，欢迎指正
