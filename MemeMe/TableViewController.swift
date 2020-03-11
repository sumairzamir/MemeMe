//
//  TableViewController.swift
//  MemeMe
//
//  Created by Sumair Zamir on 06/03/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var newMemeButton: UIBarButtonItem!
    
    // MARK: - Define properties (AppDelegate)
    
    // Reference to the MemeInfo struct which sits in the AppDelegate
    
    var memes: [MemeInfo]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
        
    }
    
    // MARK: - IBActions
    
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
        self.tableView!.reloadData()
        
        // Ensure the tab bar is shown in the view controller
        self.tabBarController!.tabBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Defines the number of items in the tableView
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Define a cell/row for each element of the table. Properties as defined in the TableViewCell class
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        // Refer to each meme item within the struct as a separate cell/row
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Define the image and the label references of the meme item
        cell.memeTableImage?.image = meme.memedImage
        cell.memeTableLabel?.text = "\(meme.topText) \(meme.bottomText)"
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // On selection, open a detailed view of the meme item
        let memeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Pass through of the meme item to the detailed view (MemeViewController)
        memeController.memedImage = meme.memedImage
        
        // Push the detailed view
        self.navigationController!.pushViewController(memeController, animated: true)
        
    }
    
}
