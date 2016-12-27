//
//  FirstViewController.swift
//  nfl-mock-draft
//
//  Created by Christopher Bartling on 12/25/16.
//  Copyright © 2016 Pintail Consulting LLC. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var rootRef: FIRDatabaseReference!
    private var Array: NSMutableArray = []
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootRef = FIRDatabase.database().reference()
        rootRef.child("mock-drafts").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSArray
            for mockDraft in value as! [NSDictionary] {
                let mockDraftName = mockDraft["name"] as? String ?? ""
//                print("===> Mock draft: \(mockDraftName)\n")
                self.Array.add(mockDraftName)
            }
            DispatchQueue.main.async{
                self.myTableView.reloadData()
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(Array[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(Array[indexPath.row])"
        return cell
    }
}
