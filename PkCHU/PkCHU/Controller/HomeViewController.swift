//
//  HomeViewController.swift
//  PkCHU
//
//  Created by MACHA on 07/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHome(sender: UIStoryboardSegue){
        if let controller = sender.source as? SymptomesViewController{
            if let _ = controller.symptome{
                Symptome.save()
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
