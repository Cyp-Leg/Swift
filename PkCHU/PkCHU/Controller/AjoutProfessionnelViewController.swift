//
//  AjoutProfessionnelViewController.swift
//  PkCHU
//
//  Created by cyp on 23/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit

class AjoutProfessionnelViewController: UIViewController {

    @IBOutlet weak var nomLabel: UITextField!
    @IBOutlet weak var prenomLabel: UITextField!
    @IBOutlet weak var adresseLabel: UITextField!
    
    var professionnel: ProfessionnelModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addProfessionnel(_ sender: Any) {
        if (nomLabel.text != nil && prenomLabel.text != nil && adresseLabel != nil) {
            professionnel = ProfessionnelModel(nom: nomLabel.text!, prenom: prenomLabel.text!, adresseCabinet: adresseLabel.text!)
            performSegue(withIdentifier: "validProf", sender: self)
        }
        else {
            print("échec")
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
