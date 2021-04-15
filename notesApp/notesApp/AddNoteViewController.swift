//
//  AddNoteViewController.swift
//  notesApp
//
//  Created by Brittnay Stahl on 4/14/21.
//

import UIKit
import SnapKit

class AddNoteViewController: UIViewController {
    
    var notes: [Note]?
    let index: Int?

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        return textView
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Note", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(editNoteTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField, textView, enterButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    
    func setUpView() {
        view.addSubview(stackView)
        view.backgroundColor = .white
        title = "Edit Note"
        
        stackView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(-16)
        }
        
        textField.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            
        }
        
        enterButton.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            
        }
        
    }

    @objc func editNoteTapped() {
        if !textField.hasText || !textView.hasText {
            
        }
        let title = textField.text ?? ""
        let subtitle = textView.text ?? ""
        
        let note = Note(title: title, subTitle: subtitle)
        notes?.append(note)
        
        navigationController?.popViewController(animated: true)
    }

}
