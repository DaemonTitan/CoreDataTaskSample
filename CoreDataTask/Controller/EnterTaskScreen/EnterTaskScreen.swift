//
//  EnterTaskScreen.swift
//  CoreDataTask
//
//  Created by Tony Chen on 8/5/2023.
//

import UIKit

protocol enterTaskDelegate {
    func addTask(taskTitle: String)
}

class EnterTaskScreen: UIViewController, UITextFieldDelegate {
    
    var delegate: enterTaskDelegate?
    
    lazy var taskTitleTextField: UITextField = {
        var taskTitleTextField = UITextField()
        taskTitleTextField.placeholder = "Enter text"
        taskTitleTextField.backgroundColor = .white
        //taskTitleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        taskTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        return taskTitleTextField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(taskTitleTextField)
        title = "New Task"
        view.backgroundColor = .systemGray6
        taskTitleTextField.delegate = self
        taskTitleTextField.becomeFirstResponder()
        fieldsLayout()
        navigationBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func fieldsLayout() {
        NSLayoutConstraint.activate([
            taskTitleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskTitleTextField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -320),
            taskTitleTextField.heightAnchor.constraint(equalToConstant: 30),
            taskTitleTextField.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    private func navigationBarButton() {
        // Cancel Button
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(cancel))
        // Save Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(saveTask))
    }
    
    @objc func saveTask() {
        guard let titleText = taskTitleTextField.text, !titleText.isEmpty else {
            return
        }
        delegate?.addTask(taskTitle: titleText)
        //navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    
}
