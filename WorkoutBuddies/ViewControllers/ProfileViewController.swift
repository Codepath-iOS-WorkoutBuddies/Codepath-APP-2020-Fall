//
//  ProfileViewController.swift
//  WorkoutBuddies
//
//  Created by Tiffany Lee on 12/5/20.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var userCreatedWorkouts: [PFObject]!
    var currentUser: PFUser!
       
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentUser = PFUser.current()
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width/2
           
        collectionView.delegate = self
        collectionView.dataSource = self
           
        nameLabel.text = currentUser["name"] as? String
        levelLabel.text = currentUser["workoutLevel"] as? String
        usernameLabel.text = currentUser.username
           
        getUserCreatedWorkouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        currentUser = PFUser.current()
        
        if currentUser["profileImage"] != nil {
            let imageFile = currentUser["profileImage"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            
            profileImage.af.setImage(withURL: url)
        }
    }
    
    func getUserCreatedWorkouts() {
        let currDate = Date()
        let query = PFQuery(className: "workoutPlan")
        query.limit = 10
        query.whereKey("author", equalTo: currentUser!)
        query.addDescendingOrder("scheduledDate")
        query.whereKey("scheduledDate", greaterThan: currDate)
        query.findObjectsInBackground { (routines: [PFObject]?, error: Error?) in
            if let routines = routines {
                print("Successfully queried and obtained the routines")
                self.userCreatedWorkouts = routines
                self.collectionView.reloadData()
            }
            else if let error = error {
                print("failed to query user created workouts")
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let routine = userCreatedWorkouts[indexPath.row]
        
        let detailWorkout = segue.destination as! DetailWorkoutViewController
        detailWorkout.routine = routine    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let createdWorkouts = userCreatedWorkouts {
            return createdWorkouts.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if userCreatedWorkouts == nil {
            return UICollectionViewCell();
        }
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingWorkoutsProfileCell", for: indexPath) as! UpcomingWorkoutsProfileCell
        let workout = userCreatedWorkouts[indexPath.row]
        let exercises = workout["exercises"] as? [[String]]
        let date = workout["scheduledDate"] as? Date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let formattedDate = dateFormatter.string(from: date!)
        
        cell.backgroundColor = UIColor.yellow
        cell.nameLabel.text = workout["workoutName"] as? String
        cell.exercisesCountLabel.text = "Exercises: \(exercises!.count )"
        cell.dateLabel.text = formattedDate
        
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 180
        let cellHeight = 128
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
