//
//  MemeViewController.swift
//  MemeMe
//
//  Created by Sumair Zamir on 06/03/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController {

    var memes: MemeInfo!
//    {
//        let object = UIApplication.shared.delegate
//        let appDelegate = object as! AppDelegate
//        return appDelegate.memes
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memeImage!.image = memes.memedImage
    }
    
    @IBOutlet weak var memeImage: UIImageView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
