//
//  AjoutRdvViewController.swift
//  PkCHU
//
//  Created by cyp on 14/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData

class AjoutRdvViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
   
    @IBOutlet weak var proPicker: UIPickerView!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var libelleTextField: UITextField!
    
    var preparation: String?
    var rdv: RdvModel?
    
    var professionnels: [Professionnel] = []
    var professionnel: Professionnel?
    var dateRdv: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proPicker.delegate = self
        proPicker.dataSource = self
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            /*            self.alertError(errorMsg: "Could not load data", UserInfo: "Unknown reason")
             */    return
            
        }
        
        self.dateRdv = datePicker.date

        
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Professionnel> = Professionnel.fetchRequest()
        
        do{
            try self.professionnels = context.fetch(request)
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
    
    @IBAction func addRdv(_ sender: Any) {
        let alert = UIAlertController(title: "Temps de préparation", message: "Entrez le temps de préparation nécessaire (en min)",preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Valider", style: .default)
        {
            [unowned self] action in
            guard let textField = alert.textFields?.first, let preparationField = textField.text else {
                return
            }
            self.preparation = preparationField
                self.rdv = RdvModel(date: self.dateRdv! as NSDate, libelle: self.libelleTextField.text!, preparation: self.preparation!, professionnel: self.professionnel!)
                self.performSegue(withIdentifier: "validRdv", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Annuler", style: .default)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    
    @IBAction func unwindToAddRdv(sender: UIStoryboardSegue){
        }
    
    // MARK: - Picker view data source

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.professionnels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let profObj = self.professionnels[row] as Professionnel
        return profObj.nom
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(professionnels.count>0){
            professionnel = professionnels[row]
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
