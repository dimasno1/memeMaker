//
//  TableViewController.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 12.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UIViewControllerPreviewingDelegate  {
    
    var vc: PreviewViewController?
    var barItem: UIBarButtonItem!
    
    var numberOfRows: Int?{
        didSet{
            self.tableView.rowHeight = self.view.frame.height / 4
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForPreviewing(with: self, sourceView: tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.numberOfRows = MemedPhoto.memeArray.count
        barItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(tableView(_:didSelectRowAt:)))
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = barItem
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
    
    @objc override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    
    }
    
    
    //3D touch controller
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = tableView.indexPathForRow(at: location) {
            //This will show the cell clearly and blur the rest of the screen for our peek.
            previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
            vc = PreviewViewController()
            let meme = MemedPhoto.memeArray[indexPath.row]
            if let image = meme.memedImage{
                self.vc!.imageView.image = image
                return vc!}
        }
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        present(vc!, animated: true, completion: nil)
    }
    
    
}
