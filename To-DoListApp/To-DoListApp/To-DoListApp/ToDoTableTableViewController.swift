//
//  ToDoTableTableViewController.swift
//  To-DoListApp
//
//  Created by Ioana Nedelcu on 2/8/21.
//

import UIKit

class ToDoTableTableViewController: UITableViewController {

    var listOfToDo : [ToDoCD] = []

    func getToDos(){
        if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            if let dataFromCoreData = try? accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoCD]{
                
                listOfToDo = dataFromCoreData
                tableView.reloadData()
            }
        }
        
    }
    
   /* func createToDo() -> [ToDoClass] {

         let swiftToDo = ToDoClass()
         swiftToDo.description = "Learn Swift"
         swiftToDo.important = true

         let dogToDo = ToDoClass()
         dogToDo.description = "Walk the Dog"
         // important is set to false by default

         return [swiftToDo, dogToDo]
     
    }

    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
//          listOfToDo = createToDo()

    }

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfToDo.count
        // #warning Incomplete implementation, return the number of rows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let eachToDo = listOfToDo[indexPath.row]
        if let thereIsDescription = eachToDo.descriptionInCD {
            if eachToDo.importantInCD {
                cell.textLabel?.text = "❗️" + thereIsDescription
            } else {
              cell.textLabel?.text = eachToDo.descriptionInCD
            }
        }
            

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eachToDo = listOfToDo[indexPath.row]
        performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let nextAddToDoVC = segue.destination as?
            AddToDoViewController{
            nextAddToDoVC.previousToDoTVC = self
        }
        
        if let nextCompletedToDoVC = segue.destination as?
            CompletedToDoViewController{
            if let choosenToDo = sender as? ToDoCD {
                nextCompletedToDoVC.selectedTodo = choosenToDo
                nextCompletedToDoVC.previousToDoTVC = self
            }
        }
    }
    

}
