//
//  RdvViewController.swift
//  PkCHU
//
//  Created by cyp on 14/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData

class RdvViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var rdvTab: UITableView!
    @IBAction func deleteRdv(_ sender: Any) {
    }
    
    var rdv: [Rdv] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            /*            self.alertError(errorMsg: "Could not load data", UserInfo: "Unknown reason")
             */    return
            
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Rdv> = Rdv.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: ("date"), ascending: true)]
        do{
            try self.rdv = context.fetch(request)
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
    
    @IBAction func unwindToRdv(sender: UIStoryboardSegue){
        }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.rdv.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.rdvTab.dequeueReusableCell(withIdentifier: "rdvCell", for: indexPath) as! RdvTableViewCell
        let date = self.rdv[indexPath.row].date! as Date
        cell.dateLabel.text = date.format()
        cell.nomLabel.text = self.rdv[indexPath.row].concerner!.nom
    //    cell.motifLabel.text = self.rdv[indexPath.row].preparation
        return cell
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
