//
//  CompletedToDoViewController.swift
//  To-DoListApp
//
//  Created by Ioana Nedelcu on 2/8/21.
//

import UIKit

class CompletedToDoViewController: UIViewController {

    @IBOutlet weak var toDoDisplay: UILabel!
    
    var previousToDoTVC = ToDoTableTableViewController()
    var selectedTodo = ToDoClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoDisplay.text = selectedTodo.description
        // Do any additional setup after loading the view.
    }
    

    @IBAction func completeTapped(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
