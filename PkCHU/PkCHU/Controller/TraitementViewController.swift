//
//  TraitementViewController.swift
//  PkCHU
//
//  Created by cyp on 18/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData

class TraitementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var traitement : [Prise] = []
    
   
    @IBOutlet weak var tableTraitement: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            /*            self.alertError(errorMsg: "Could not load data", UserInfo: "Unknown reason")
             */    return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Prise> = Prise.fetchRequest()
        //let current = (Calendar.current as NSCalendar).date(byAdding: .day, value: -5, to: Date(), options: [])! as NSDate
        // request.predicate = NSPredicate(format: "date > %@", current)
        //request.sortDescriptors = [NSSortDescriptor(key: ("date"), ascending: true)]
        do{
            try self.traitement = context.fetch(request)
        }
        catch let error as NSError{
            fatalError("cannot reach data: "+error.description)
            
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.traitement.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.tableTraitement.dequeueReusableCell(withIdentifier: "priseCell", for: indexPath) as! TraitementTableViewCell
        
        cell.heurePrise.text = self.traitement[indexPath.row].heure
        cell.medicament.text = self.traitement[indexPath.row].comprendre?.nom
        return cell
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
  
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }

    
    // Override to support editing the table view.
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        
     if (editingStyle == .delete) {
     // Delete the row from the data source
    // traitement.delete(priseToDelete: (traitement?.get(i: indexPath.row)!)!)
        
        tableTraitement.beginUpdates()
        Prise.delete(object: self.traitement[indexPath.row])
        Prise.save()
        tableTraitement.deleteRows(at: [indexPath], with: .fade)
        self.traitement.remove(at: indexPath.row)
        tableTraitement.endUpdates()
    
        self.tableTraitement.reloadData();
        
       /* self.tableTraitement.beginUpdates()
        self.tableTraitement.deleteRows(at: [indexPath], with: .automatic)
        self.tableTraitement.endUpdates()*/
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
    
        
     }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

