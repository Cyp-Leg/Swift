//
//  AgendaViewController.swift
//  PkCHU
//
//  Created by cyp on 14/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData

class AgendaViewController: UIViewController {

    @IBOutlet weak var speLabel: UILabel!
    @IBOutlet weak var drLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var rdv : [Rdv] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            /*            self.alertError(errorMsg: "Could not load data", UserInfo: "Unknown reason")
             */    return
            
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Rdv> = Rdv.fetchRequest()
        let current = (Calendar.current as NSCalendar).date(byAdding: .day, value: 0, to: Date(), options: [])! as NSDate
        request.predicate = NSPredicate(format: "date > %@", current)
        request.sortDescriptors = [NSSortDescriptor(key: ("date"), ascending: true)]
        do{
            try self.rdv = context.fetch(request)
        }
        catch let error as NSError{
            fatalError("cannot reach data: "+error.description)
        }

        if(rdv.count > 0)
        {
            self.drLabel.text = rdv[0].concerner!.prenom! + "  " + rdv[0].concerner!.nom!
            self.speLabel.text = rdv[0].concerner?.posseder?.libelle
            self.dateLabel.text = (rdv[0].date! as Date).format()
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
