//
//  PilulierViewController.swift
//  PkCHU
//
//  Created by cyp on 12/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData

class PilulierViewController: UIViewController {

    @IBOutlet weak var nomMedLabel: UILabel!
    
    @IBOutlet weak var doseMedLabel: UILabel!
    
    @IBOutlet weak var heureLabel: UILabel!
    
    
    
    var prises : [Prise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            /*            self.alertError(errorMsg: "Could not load data", UserInfo: "Unknown reason")
             */    return
            
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Prise> = Prise.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: ("heure"), ascending: true)]
        do{
            try self.prises = context.fetch(request)
        }
        catch let error as NSError{
            fatalError("cannot reach data: "+error.description)
        }
        
        if(prises.count > 0)
        {
            self.nomMedLabel.text = prises[0].comprendre?.nom!
            self.doseMedLabel.text = " \(prises[0].comprendre!.dose)"
            self.heureLabel.text = prises[0].heure
        }
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
