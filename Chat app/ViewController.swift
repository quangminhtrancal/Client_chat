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
    @IBOutlet weak var table: UITableViewCell!
    @IBOutlet weak var txtreceive: UITextField!
    
   
    
    @IBOutlet weak var txtinput: UITextField!
    @IBOutlet weak var tbllist: UITableView!
    var dataArray: [String] = ["hh"]
    let socket = SocketIOClient(socketURL: URL(string: "http://10.13.32.120:2016")!, config: [.log(true), .compress])
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        socket.connect()
        tbllist.delegate=self
        tbllist.dataSource=self
        socket.on("Data") { (data, ack) in
            print(data)
            let s: String = data[0] as! String
            print("This is s: \(s)")
            
            let a: Int = self.dataArray.count
            print(self.dataArray,a)
            //self.dataArray[a]=s
            //self.dataArray.append(s)
            self.tbllist.reloadData()
            
        }
    }

    @IBAction func Send(_ sender: Any) {
        socket.emit("Name", with: [txtinput.text!])
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.textLabel?.text = ("hihi")
        //indexPath.row]
        //self.txtreceive.text=self.dataArray[indexPath.row]
        return cell
    }
    
    
    
}

