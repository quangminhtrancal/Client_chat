//
//  ViewController.swift
//  Chat app
//
//  Created by Minh on 2017-10-12.
//  Copyright © 2017 Minh. All rights reserved.
//

import UIKit
import SocketIO


class ViewController: UIViewController {
    let socket = SocketIOClient(socketURL: URL(string: "http://localhost:2016")!, config: [.log(true), .compress])
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        socket.connect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

