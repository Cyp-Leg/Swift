//
//  AjoutEventViewController.swift
//  PkCHU
//
//  Created by cyp on 20/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit

class AjoutEventViewController: UIViewController {

    @IBOutlet weak var somnoBtn: UIButton!
    @IBOutlet weak var chuteBtn: UIButton!
    @IBOutlet weak var halluBtn: UIButton!
    @IBOutlet weak var dispersBtn: UIButton!
    @IBOutlet weak var bolusBtn: UIButton!
    
    var dateEvent: NSDate = NSDate()
    var event: EvenementModel?
    
    @IBAction func selectEventAction(_ sender: Any) {
        if sender as? UIButton == self.somnoBtn {
            event = EvenementModel(type: "Somnolence", date: dateEvent)
        } else if sender as? UIButton == self.chuteBtn {
            event = EvenementModel(type: "Chute", date: dateEvent)
        } else if sender as? UIButton == self.halluBtn {
            event = EvenementModel(type: "Hallucination", date: dateEvent)
        }  else if sender as? UIButton == self.dispersBtn {
            event = EvenementModel(type: "Prise de dispersibles", date: dateEvent)
        }else {
            event = EvenementModel(type: "Bolus d'Apollon", date: dateEvent)
        }
        performSegue(withIdentifier: "validEvent", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
