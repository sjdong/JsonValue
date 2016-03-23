//
//  ViewController.swift
//  JsonValueDemo
//
//  Created by sjdong on 16/3/8.
//  Copyright © 2016年 sjdong@live.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        localTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     * 本地模拟数据，同理可以使用网络请求返回的JSON格式数据
     */
    func localTest() {
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
        
        print(json >~ "school")
        
        json >~ "grades" >>~ { row in
            if let r = row {
                print(r >~ "classes")
            }
        }

    }
}

