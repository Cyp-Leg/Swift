//
//  CoachViewController.swift
//  PkCHU
//
//  Created by cyp on 14/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData

class CoachViewController: UIViewController {

    @IBAction func validateActivite(_ sender: Any) {
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var heureLabel: UILabel!
    @IBOutlet weak var nomActLabel: UILabel!
    
    var activites: [Activite] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            /*            self.alertError(errorMsg: "Could not load data", UserInfo: "Unknown reason")
             */    return
            
        }
        let context = appDelegate.persistentContainer.viewContext
        
        dateLabel.text = Date().format()
        let request : NSFetchRequest<Activite> = Activite.fetchRequest()
        /*let current = (Calendar.current as NSCalendar).date(byAdding: .day, value: 0, to: Date(), options: [])! as NSDate
        request.predicate = NSPredicate(format: "date > %@", current)*/
        let sort = NSSortDescriptor(key: "heureDebut", ascending: true)
        request.sortDescriptors = [sort]
        do{
            try self.activites = context.fetch(request)
        }
        catch let error as NSError{
            fatalError("cannot reach data: "+error.description)
        }
        if (activites.count > 0) {
            heureLabel.text = activites[0].heureDebut
            nomActLabel.text = activites[0].libelle
        }
        else {
            heureLabel.text = "Aucune"
            nomActLabel.text = "activité prévue !"
        }
        /*let predicate: NSPredicate
        if (let heureDebut = Activite.heureDebut){
            
        }*/
        //if (date > NSDate() as Date){
        
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
