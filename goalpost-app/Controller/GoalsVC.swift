//
//  GoalsVC.swift
//  goalpost-app
//
//  Created by Nikita Koniukh on 25/04/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController  {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var undoView: UIView!
    
    var goals = [Goal]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = false
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchCoreData()
        tableView.reloadData()
    }
    
    func fetchCoreData(){
        self.fetch { (complete) in
            if complete{
                if goals.count >= 1{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
            }
        }
    }
    
    @IBAction func addGoalButtonWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)
    }
    
    @IBAction func undoButtonWasPressed(_ sender: Any) {
        //    self.fetchCoreData()
        //    self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
    

    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else { return UITableViewCell() }
        
        let goal = goals[indexPath.row]
        
        cell.configureCell(goal: goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreData()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
           // self.undoView.isHidden = false
            
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.setProgress(atIndexPath: indexPath)
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.662745098, blue: 0.2666666667, alpha: 1)
        return [deleteAction, addAction]
    }
    

    
    
}

extension GoalsVC{
    
    func setProgress (atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
            }else{
                return
        }
        do{
            try managedContext.save()
        }catch{
            debugPrint("Could not set progress\(error.localizedDescription)")
        }
    }
    func fetch(completion:(_ complete: Bool)->()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            goals = try managedContext.fetch(fetchRequest)
            print("Sucssesfuly fetched data!!!")
            completion(true)
        }catch{
            debugPrint("Fetching error\(error.localizedDescription)")
            completion(false)
        }
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath){
        guard let managedContect = appDelegate?.persistentContainer.viewContext else {return}
        
        managedContect.delete(goals[indexPath.row])
        
        do{
            try managedContect.save()
            print("Goal removed!!!")
        }catch{
            debugPrint("Could't remove: \(error.localizedDescription)")
        }
    }
    
//    func undoSelected(atIndexPath indexPath: IndexPath){
//        guard let managedContect = appDelegate?.persistentContainer.viewContext else {return}
//
//        managedContect.undo()
//        do{
//            try managedContect.save()
//            print("Undo!!!!!!!!!!!!!!!!!!!!!!!!!!!")
//        }catch{
//            debugPrint("cant undo\(error.localizedDescription)")
//        }
//    }
}

