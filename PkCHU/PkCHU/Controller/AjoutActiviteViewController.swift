//
//  AjoutActiviteViewController.swift
//  PkCHU
//
//  Created by cyp on 17/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit

class AjoutActiviteViewController: UIViewController {
//libelle description recurrence heureDebut
    
    @IBOutlet weak var libelleLabel: UITextField!
    @IBOutlet weak var descripLabel: UITextField!
    
    @IBOutlet weak var heureLabel: UITextField!
    @IBOutlet weak var minLabel: UITextField!
    
    var activite: ActiviteModel?
    
    @IBAction func addActivite(_ sender: Any) {
        if (heureLabel.text != nil && minLabel.text != nil && libelleLabel != nil && descripLabel != nil) {
            let heure = heureLabel.text! + "h" + minLabel.text!
            activite = ActiviteModel(libelle: libelleLabel.text!, descript: descripLabel.text!, recurrence: "Tous les jours", heureDebut: heure)
            performSegue(withIdentifier: "validAjoutAct", sender: self)
        }
        else {
            print("échec")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
