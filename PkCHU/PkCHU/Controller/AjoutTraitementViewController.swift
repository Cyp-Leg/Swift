//
//  AjoutTraitementViewController.swift
//  PkCHU
//
//  Created by cyp on 18/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData

class AjoutTraitementViewController: UIViewController, UNUserNotificationCenterDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    @IBOutlet weak var medPK: UIPickerView!
    
    @IBOutlet weak var hourPK: UIDatePicker!
    
    var medicaments: [Medicament] = []
    var medicamentSelected: Medicament?
    var selectedDate : String = ""
    var hourSelected : Int = 0
    var minuteSelected : Int = 0
    var prise: PriseModel?
    
    
    @IBAction func addTraitement(_ sender: Any) {
        // ajout DAO
        prise = PriseModel(heure : self.selectedDate, medicament: self.medicamentSelected!)
        
        
        
        
        // Verifie les autorisations de notification
        UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization(completionHandler: { (success) in
                    guard success else { return }
                    
                    // Programme la notification
                    self.scheduleLocalNotification()
                })
            case .authorized:
                // Programme la notification
                self.scheduleLocalNotification()
            case .denied:
                print("Application Not Allowed to Display Notifications")
            }
        }
        performSegue(withIdentifier:"validPrise", sender: self)

    }
    
    
    // Demande autorisation et renvoie la reponse
    private func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
        // Demande autorisation de notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            if let error = error {
                print("Request Authorization Failed (\(error), \(error.localizedDescription))")
            }
            
            completionHandler(success)
        }
    }
    
    func afficheNotification()
    {
        let center = UNUserNotificationCenter.current()
        
        center.getPendingNotificationRequests(completionHandler: { requests in
            for request in requests {
                print(request.identifier)
            }
        })
    }
    //programme l'alarme
    private func scheduleLocalNotification() {
        // Create le contenu de la notif
        let notificationContent = UNMutableNotificationContent()
        
        // Configure le contenu de la notif
      
        notificationContent.title = "C'est l'heure de votre médicament"
        notificationContent.subtitle = self.selectedDate
        notificationContent.body = " Medicament : " + (self.medicamentSelected?.nom)!
        notificationContent.sound = UNNotificationSound.default()
        // Ajoute le trigger
        
    
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching:  Calendar.current.dateComponents([.minute, .hour], from: self.hourPK.date), repeats: false)
        
        // Creer la requete de notification
        
        let notificationRequest = UNNotificationRequest(identifier: "Rappel_Med" + self.selectedDate, content: notificationContent, trigger: notificationTrigger)
        
        // Ajout de la requete dans le User Notification Center
        
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
            }
            UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
                
                print("Requests: \(notificationRequest.identifier)")
            }
        }
    }
    
    func datePickerValueChanged(_ sender: UIDatePicker){
        
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        let hourFormatter: DateFormatter = DateFormatter()
        let minuteFormatter: DateFormatter = DateFormatter()
        
        // Set date format
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = NSTimeZone(name: "UTC+1") as TimeZone!
        
        hourFormatter.dateFormat = "hh"
        hourFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        
        minuteFormatter.dateFormat = "mm"
        minuteFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
    
        
        // Apply date format
        selectedDate = dateFormatter.string(from: sender.date)
        hourSelected = Int(hourFormatter.string(from: sender.date))!
        minuteSelected = Int(minuteFormatter.string(from: sender.date))!
        
        print("Selected value \(selectedDate)")
        print("Selected value \(hourSelected)")
        print("Selected value \(minuteSelected)")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Configure le User Notification Center
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        // Connect data:
        self.medPK.delegate = self
        self.medPK.dataSource = self
        
       // medicamentSelected = medPK[0]
        
        // Add an event to call onDidChangeDate function when value is changed.
        hourPK.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            /*            self.alertError(errorMsg: "Could not load data", UserInfo: "Unknown reason")
             */    return
            
        }
        
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Medicament> = Medicament.fetchRequest()
        
        do{
            try self.medicaments = context.fetch(request)
        }
        catch let error as NSError{
            fatalError("cannot reach data: "+error.description)
            
        }
        if(medicaments.count>0)
        {
            medicamentSelected=medicaments[0]
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler(.alert)
    }
    
    
    // Catpure the picker view selection
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of columns of data

    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return medicaments.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let medObj = self.medicaments[row] as Medicament
        return medObj.nom
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    medicamentSelected = medicaments[row]
    }
}

