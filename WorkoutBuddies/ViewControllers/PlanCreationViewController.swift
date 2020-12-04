//
//  PlanCreationViewController.swift
//  WorkoutBuddies
//
//  Created by Stephen Tan on 12/3/20.
//

import UIKit
import Parse
import DropDown

protocol ExerciseDelegate {
    func addExercise(exercise: String)
}

class PlanCreationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExerciseDelegate  {

    @IBOutlet weak var workoutName: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scheduleDatePicker: UIDatePicker!
    
    var exercises = [[String]]()
    var workoutLevel = ""
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func chooseWorkoutLevel(_ sender: UIButton) {
        dropDown.dataSource = ["Beginner", "Intermediate", "Advanced"]
            dropDown.anchorView = sender
            dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
            dropDown.show()
            dropDown.selectionAction = { [weak self] (index: Int, item: String) in
                guard let _ = self else {return}
                self!.workoutLevel = item
            sender.setTitle(item, for: .normal)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if exercises.count == 0 || indexPath.row == exercises.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddExerciseCell")!

            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExerciseCell
                
            cell.exerciseNameLabel.text = exercises[indexPath.row][0]
            exercises[indexPath.row][1] = cell.chooseSetsBtn.currentTitle ?? "1"
            exercises[indexPath.row][2] = cell.chooseRepsBtn.currentTitle ?? "1"
                
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            exercises.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func addExercise(exercise: String) {
        exercises.append([exercise, "1", "1"])
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondView = segue.destination as! ExerciseSelectionViewController
        secondView.delegate = self
    }
    
    @IBAction func onCreatePlan(_ sender: Any) {
        tableView.reloadData()
        let author = PFUser.current()
        
        let routine = PFObject(className: "workoutPlan")
        routine["author"] = author
        routine["workoutName"] = workoutName.text
        routine["workoutLevel"] = workoutLevel
        routine["scheduledDate"] = scheduleDatePicker.date
        tableView.reloadData()
        routine["exercises"] = exercises
        
        routine.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
            else if let error = error {
                print("error saving workout plan")
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}

