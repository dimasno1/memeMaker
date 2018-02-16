//
//  TableViewController.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 12.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var numberOfRows: Int?{
        didSet{
            self.tableView.rowHeight = self.view.frame.height / 4
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.numberOfRows = MemedPhoto.memeArray.count
        
       self.tableView.backgroundColor = .gray
    }

    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.register(NewTableViewCell.self, forCellReuseIdentifier: "memeCell")
        return numberOfRows!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell", for: indexPath) as! NewTableViewCell
        cell.selectionStyle = .gray
        let meme = MemedPhoto.memeArray[indexPath.row]
        let image = meme.memedImage
        cell.imageView?.image = image
        cell.detailTextLabel?.text = meme.bottomText
        cell.textLabel?.text = meme.topText
        return cell
    }
    
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
}
