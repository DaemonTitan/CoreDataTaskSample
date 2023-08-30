//
//  TaskListScreen.swift
//  CoreDataTask
//
//  Created by Tony Chen on 8/5/2023.
//

import Foundation
import UIKit

var tasks = [Task]()

class TaskListScreen: UIViewController {
    
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
//    lazy var addTaskButton: UIButton = {
//        var addTaskButton = UIButton()
//        addTaskButton.layer.cornerRadius = 0.5
//        addTaskButton.setImage(UIImage(systemName: "plus"), for: .normal)
//        addTaskButton.setTitle("New task", for: .normal)
//        addTaskButton.backgroundColor = .blue
//        addTaskButton.clipsToBounds = true
//        addTaskButton.translatesAutoresizingMaskIntoConstraints = false
//        return addTaskButton
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Tasks"
        navigationItem.backButtonTitle = ""
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(saveTask))
        tasks = DataManager.shared.fetchTasks()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func saveTask() {
        let rootEnterTaskScreen = EnterTaskScreen()
        rootEnterTaskScreen.delegate = self
        let enterTaskScreen = UINavigationController(rootViewController: rootEnterTaskScreen)
        //navigationController?.pushViewController(EnterTaskScreen, animated: true)
        present(enterTaskScreen, animated: true)
    }
}

extension TaskListScreen: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let rootTaskDetailsScreen = TaskDetailScreen()
        let taskDetailScreen = UINavigationController(rootViewController: rootTaskDetailsScreen)
        present(taskDetailScreen, animated: true)
        
    }
}

extension TaskListScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
}

extension TaskListScreen: enterTaskDelegate {
    func addTask(taskTitle: String) {
        let task = DataManager.shared.task(title: taskTitle)
        tasks.append(task)
        DataManager.shared.saveContext()
        tableView.reloadData()
    }
}

