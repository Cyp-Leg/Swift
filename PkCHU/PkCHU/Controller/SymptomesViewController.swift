//
//  SymptomesViewController.swift
//  PkCHU
//
//  Created by cyp on 14/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit

class SymptomesViewController: UIViewController {

    @IBOutlet weak var onBtn: UIButton!
    @IBOutlet weak var offBtn: UIButton!
    @IBOutlet weak var dyskBtn: UIButton!
    
    var dateSympt: NSDate = NSDate()
    var symptome: SymptomeModel?
    
    @IBAction func selectSymptomeAction(_ sender: Any) {
        if sender as? UIButton == self.onBtn {
            symptome = SymptomeModel(type: "ON", date: dateSympt)
        } else if sender as? UIButton == self.offBtn {
            symptome = SymptomeModel(type: "OFF", date: dateSympt)
        } else {
            symptome = SymptomeModel(type: "DYSKINESIES", date: dateSympt)
        }
        performSegue(withIdentifier: "validSympt", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
