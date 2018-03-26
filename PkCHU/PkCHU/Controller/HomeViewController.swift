//
//  HomeViewController.swift
//  PkCHU
//
//  Created by MACHA on 07/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
       /* SpecialiteModel(libelle: "Kinésithérapeute")
        Specialite.save()
        SpecialiteModel(libelle: "Orthophoniste")
        Specialite.save()
        SpecialiteModel(libelle: "Infirmier")
        Specialite.save()
        SpecialiteModel(libelle: "Psychologue clinicien")
        Specialite.save()
        SpecialiteModel(libelle: "Neuropsychologue")
        Specialite.save()
        SpecialiteModel(libelle: "Ergothérapeute")
        Specialite.save()
        SpecialiteModel(libelle: "Psychomotricien")
        Specialite.save()
        SpecialiteModel(libelle: "Pédicure-podologue")
        Specialite.save()
        SpecialiteModel(libelle: "Diététicien(ne)")
        Specialite.save()
        SpecialiteModel(libelle: "Autre")
        Specialite.save()
        SpecialiteModel(libelle: "Neurologue")
        Specialite.save()
        SpecialiteModel(libelle: "Médecin généraliste")
        Specialite.save()
        SpecialiteModel(libelle: "Psychiatre")
        Specialite.save()
        SpecialiteModel(libelle: "Neurochirurgien")
        Specialite.save()
        SpecialiteModel(libelle: "Médecin de structure antidouleur")
        Specialite.save()
        SpecialiteModel(libelle: "Gériatre")
        Specialite.save()
        SpecialiteModel(libelle: "Médecin spécialiste en médecine")
        Specialite.save()
        SpecialiteModel(libelle: "Orthoptiste")
         Specialite.save()*/

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHome(sender: UIStoryboardSegue){
        if let controller = sender.source as? SymptomesViewController{
            if controller.symptome != nil{
                Symptome.save()
            }
        }
        else if let controller = sender.source as? AjoutEventViewController{
            if controller.event != nil{
                Evenement.save()
            }
        }
        else if let controller = sender.source as? AjoutActiviteViewController{
            if controller.activite != nil{
                Activite.save()
            }
        }
       /* else if let controller = sender.source as? ActivitiesViewController{
            //cas suppression
        }*/
        else if let controller = sender.source as? AjoutProfessionnelViewController{
            if controller.professionnel != nil{
                Professionnel.save()
            }
        }
        else if let controller = sender.source as? AjoutRdvViewController{
            if controller.rdv != nil{
                Rdv.save()
            }
        }
        else if let controller = sender.source as? AjoutMedicamentViewController{
            if controller.medicament != nil{
                Medicament.save()
            }
        }
        else if let controller = sender.source as? AjoutTraitementViewController{
            if controller.prise != nil{
                Prise.save()
            }
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
