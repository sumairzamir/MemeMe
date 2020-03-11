//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Sumair Zamir on 06/03/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import UIKit

// Define the re-use identified for the CollectionView

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var newMemeButton: UIBarButtonItem!
    
    // Reference to the Flow Layout from storyboard
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: - Define properties (AppDelegate)
    
    // Reference to the MemeInfo struct which sits in the AppDelegate
    
    var memes: [MemeInfo]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
        
    }
    
    // MARK: IBActions
    
    // Method called when the newMemeButton is pressed
    
    @IBAction func newMeme() {
        
        // Define view controller
        let newMemeController = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        
        // Present the view controller modally
        newMemeController.modalPresentationStyle = .currentContext
        newMemeController.view.backgroundColor = UIColor.black
        present(newMemeController, animated: true, completion: nil)
        
        
        // Hide the tab bar. This conforms to Apple's design standards
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Reload the data in the view controller
        self.collectionView!.reloadData()
        
        // Ensure the tab bar is shown in the view controller
        self.tabBarController!.tabBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Flow Layout definitions
        
        let space:CGFloat = 5
        let width = (view.frame.size.width - (2 * space))/3
        let height = (view.frame.size.height - (2 * space))/5
        
        // Spacing between items
        self.flowLayout.minimumInteritemSpacing = space
        
        // Spacing between rows
        self.flowLayout.minimumLineSpacing = space
        
        // Size for each cell/item
        self.flowLayout.itemSize = CGSize(width: width, height: height)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Defines the number of items in the collectionView
        return self.memes.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Define a cell/row for each element of the collection. Properties as defined in the CollectionViewCell class
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        // Refer to each meme item within the struct as a separate cell/row
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Define the image reference of the meme item
        cell.memeCellImage?.image = meme.memedImage
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // On selection, open a detailed view of the meme item
        let memeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Pass through of the meme item to the detailed view (MemeViewController)
        memeController.memedImage = meme.memedImage
        
        // Push the detailed view
        self.navigationController!.pushViewController(memeController, animated: true)
        
    }
    
}
