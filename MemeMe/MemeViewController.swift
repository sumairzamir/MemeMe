//
//  MemeViewController.swift
//  MemeMe
//
//  Created by Sumair Zamir on 06/03/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var memeImage: UIImageView!
    
    // MARK: - Define properties
    
    // Define a property of the image which is passed through from Table/Collection View Controllers
    var memedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Present the image selected
        self.memeImage.image = memedImage
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the tab bar. While the MemeViewController is pushed, for the purposes of this app, hiding the tab bar is appropriate.
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        // Show the tab bar.
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
}
