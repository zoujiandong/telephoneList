//
//  DetailTableViewController.swift
//  TableViewDemo
//
//  Created by 邹建东 on 2016/11/21.
//  Copyright © 2016年 zjd. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var titleLabel: UITextField!
    
    var person: Person?
    var modifyCallback: (() -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = person
        {
            nameLabel.text = p.name!
            phoneLabel.text = p.phone!
            titleLabel.text = p.title!
        }
    }
    @IBAction func saveClick(_ sender: Any)
    {
        if person == nil
        {
            person = Person()
        }
        person?.name = nameLabel.text
        person?.phone = phoneLabel.text
        person?.title = titleLabel.text
        
        if let callback = modifyCallback
        {
            callback()
        }
        let _ = navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
