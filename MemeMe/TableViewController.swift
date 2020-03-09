//
//  TableViewController.swift
//  MemeMe
//
//  Created by Sumair Zamir on 06/03/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // Reference to the MemeInfo struct
    
    var memes: [MemeInfo]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    @IBOutlet weak var newMemeButton: UIBarButtonItem!
    
    
    @IBAction func newMeme() {
        let newMemeController = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
//        show(newMemeController, sender: self)
        newMemeController.modalPresentationStyle = .currentContext
        present(newMemeController, animated: true, completion: nil)
        //Hide the tabBar!
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView!.reloadData()
        self.tabBarController!.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.tabBarController?.tabBar.isHidden = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.memeTableImage?.image = meme.memedImage
        cell.memeTableLabel?.text = "\(meme.topText) \(meme.bottomText)"
//
//        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        // Set name and image for each row
//
//        cell.textLabel?.text = "\(meme.topText) \(meme.bottomText)"
//        cell.imageView?.image = meme.memedImage

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        let meme = self.memes[(indexPath as NSIndexPath).row]
        memeController.memedImage = meme.memedImage
        self.navigationController!.pushViewController(memeController, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowsAt indexPath: IndexPath) {
        
        
   
//    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
