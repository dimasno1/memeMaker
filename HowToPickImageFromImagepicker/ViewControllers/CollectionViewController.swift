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

        self.collectionView?.backgroundColor = .gray
        collectionView?.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.numberOfSections = MemedPhoto.memeArray.count
    }
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfSections!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = .white
        
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
    
}
