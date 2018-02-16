//
//  CollectionViewController.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 2/15/18.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "Cell"
    
    var numberOfSections: Int? {
        didSet{
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
        collectionView?.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Uncomment the following line to preserve selection between presentations
        // Register cell classes
        // Do any additional setup after loading the view.
        let button: UIButton = {
            let button = UIButton(frame: CGRect(x: 10, y: 10, width: 75, height: 50))
            button.setTitle("button", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(showViewController), for: .touchUpInside)
            return button
        }()
        self.view.addSubview(button)
    }
    
    @objc func showViewController(){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newViewController")
        present(vc, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.numberOfSections = MemedPhoto.memeArray.count
    }
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return numberOfSections!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = .blue
        
        if MemedPhoto.memeArray.isEmpty{
            print("nothing")
        }else{
            let meme = MemedPhoto.memeArray[indexPath.row]
            let image = meme.memedImage
            cell.imageView.image = image
        }
            // Configure the cell
            
            return cell
        }
        
        
        // MARK: UICollectionViewDelegate
        
        /*
         // Uncomment this method to specify if the specified item should be highlighted during tracking
         override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
         return true
         }
         */
        
        /*
         // Uncomment this method to specify if the specified item should be selected
         override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
         return true
         }
         */
        
        /*
         // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
         override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
         return false
         }
         
         override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
         return false
         }
         
         override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
         
         }
         */
        
}
