//
//  AjoutProfessionnelViewController.swift
//  PkCHU
//
//  Created by cyp on 23/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData

class AjoutProfessionnelViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nomLabel: UITextField!
    @IBOutlet weak var prenomLabel: UITextField!
    @IBOutlet weak var adresseLabel: UITextField!
    
    @IBOutlet weak var spePicker: UIPickerView!
    
    var specialites: [Specialite] = []
    
    var professionnel: ProfessionnelModel?
    var specialite: Specialite?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spePicker.delegate = self
        spePicker.dataSource = self
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            /*            self.alertError(errorMsg: "Could not load data", UserInfo: "Unknown reason")
             */    return
            
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Specialite> = Specialite.fetchRequest()
        let sort = NSSortDescriptor(key: "libelle", ascending: true)
        request.sortDescriptors = [sort]
        do{
            try self.specialites = context.fetch(request)
        }
        catch let error as NSError{
            fatalError("cannot reach data: "+error.description)
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addProfessionnel(_ sender: Any) {
        if (nomLabel.text != nil && prenomLabel.text != nil && adresseLabel != nil) {
            professionnel = ProfessionnelModel(nom: nomLabel.text!, prenom: prenomLabel.text!, adresseCabinet: adresseLabel.text!, specialite: self.specialite!)
            performSegue(withIdentifier: "validProf", sender: self)
        }
        else {
            print("échec")
        }
    }
    
    // MARK: - Picker view data source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.specialites.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let speObj = self.specialites[row] as Specialite
        return speObj.libelle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        specialite = specialites[row]
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
