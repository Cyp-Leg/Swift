//
//  AjoutRdvViewController.swift
//  PkCHU
//
//  Created by cyp on 14/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class AjoutRdvViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UNUserNotificationCenterDelegate {
    
    
    @IBOutlet weak var proPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var libelleTextField: UITextField!
    
    var rdv: RdvModel?
    
    var professionnels: [Professionnel] = []
    var professionnel: Professionnel?
    var selectedDate : String = ""
    var hourSelected : Int = 0
    var minuteSelected : Int = 0
    var daySelected : Int = 0
    var monthSelected : Int = 0
    var yearSelected : Int = 0
    var dateRdv: Date!
    
    @IBOutlet weak var preparation: UITextField!
    
    
    @IBAction func addRdv(_ sender: Any) {
        //ajout dao
        if (libelleTextField.text != nil && preparation.text != nil ) {
            let prepTime = Int16(preparation.text!)
            rdv = RdvModel(date: dateRdv! as NSDate, libelle: libelleTextField.text!, preparation: prepTime!, professionnel: professionnel!)
            performSegue(withIdentifier: "validRdv", sender: self)
        }
        else {
            print(self.preparation)
        }
        
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
    
    //programme l'alarme
    private func scheduleLocalNotification() {
        // Create le contenu de la notif
        let notificationContent = UNMutableNotificationContent()
        var dateComponents = DateComponents()
        // Configure le contenu de la notif
        
        notificationContent.title = "Vous avez un rendez-vous dans une heure !"
        notificationContent.subtitle = self.selectedDate
        notificationContent.body = "Avec Dr. " + (professionnel?.nom)! + " au " + (professionnel?.adresseCabinet)!
        notificationContent.sound = UNNotificationSound.default()
        
        
        print("Selected value \(selectedDate)")
        print("Selected value \(hourSelected)")
        print("Selected value \(minuteSelected)")
        print("Selected value \(yearSelected)")
        print("Selected value \(monthSelected)")
        print("Selected value \(daySelected)")
        
        
        // Ajoute le trigger
        dateComponents.day = self.daySelected
        dateComponents.month = self.monthSelected
        dateComponents.year = 2018
        let nbheures = Int(self.preparation.text!)!/60
        print("Nb heures : \(nbheures)")
        let nbmin = Int(self.preparation.text!)!%60
        print("Nb min : \(nbmin)")
        
        dateComponents.hour = self.hourSelected - nbheures
        
        if( self.minuteSelected - nbmin < 0 )
        {
            self.minuteSelected = 60 + (self.minuteSelected - nbmin)
            dateComponents.hour = dateComponents.hour! - 1
        }
        else {
            self.minuteSelected = (self.minuteSelected - nbmin)
        }
        if(dateComponents.hour! < 0)
        {
            dateComponents.hour = 24 + dateComponents.hour!
        }
        dateComponents.minute = self.minuteSelected
        
        print("New hour : \(dateComponents.hour!)")
        print("New minute : \(dateComponents.minute!)")
        
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        /*let notificationTrigger = UNCalendarNotificationTrigger(dateMatching:  Calendar.current.dateComponents([.month, .year, .day, .minute, .hour], from: self.datePicker.date), repeats: false)*/
        
        // Creer la requete de notification
        
        let notificationRequest = UNNotificationRequest(identifier: "Alerte_Pro" + self.selectedDate, content: notificationContent, trigger: notificationTrigger)
        
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
        let dayFormatter: DateFormatter = DateFormatter()
        let monthFormatter: DateFormatter = DateFormatter()
        let yearFormatter: DateFormatter = DateFormatter()
        
        // Set date format
        dateFormatter.dateFormat = "dd/MM/YYYY hh:mm a"
        dateFormatter.timeZone = NSTimeZone(name: "UTC+1") as TimeZone!
        
        hourFormatter.dateFormat = "hh"
        hourFormatter.timeZone = NSTimeZone(name: "UTC+1") as TimeZone!
        
        minuteFormatter.dateFormat = "mm"
        minuteFormatter.timeZone = NSTimeZone(name: "UTC+1") as TimeZone!
        
        dayFormatter.dateFormat = "dd"
        dayFormatter.timeZone = NSTimeZone(name: "UTC+1") as TimeZone!
        
        monthFormatter.dateFormat = "MM"
        monthFormatter.timeZone = NSTimeZone(name: "UTC+1") as TimeZone!
        
        yearFormatter.dateFormat = "YYYY"
        yearFormatter.timeZone = NSTimeZone(name: "UTC+1") as TimeZone!
        
        // Apply date format
        selectedDate = dateFormatter.string(from: sender.date)
        hourSelected = Int(hourFormatter.string(from: sender.date))!
        minuteSelected = Int(minuteFormatter.string(from: sender.date))!
        
        daySelected = Int(dayFormatter.string(from: sender.date))!
        monthSelected = Int(monthFormatter.string(from: sender.date))!
        yearSelected = Int(yearFormatter.string(from: sender.date))!
        
        print("Selected value \(selectedDate)")
        print("Selected value \(hourSelected)")
        print("Selected value \(minuteSelected)")
        print("Selected value \(yearSelected)")
        print("Selected value \(monthSelected)")
        print("Selected value \(daySelected)")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure le User Notification Center
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        proPicker.delegate = self
        proPicker.dataSource = self
        
        
        // Add an event to call onDidChangeDate function when value is changed.
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
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
        
        if(professionnels.count>0){
            professionnel=professionnels[0]
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler(.alert)
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
    
    @IBAction func rdvDatePicker(_ sender: Any) {
        dateRdv = datePicker.date
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
