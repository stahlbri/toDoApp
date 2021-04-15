//
//  ViewController.swift
//  notesApp
//
//  Created by Brittnay Stahl on 4/12/21.
//

import UIKit
import SnapKit

protocol NoteDelegate: AnyObject {
    func didCreateNote(note: Note)
}

class ViewController: UIViewController {
   
    var notes: [Note] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: NotesTableViewCell.reUse)
        tableView.rowHeight = 60
        tableView.separatorColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        title = "Notes"
        view.backgroundColor = .white
        
        tableView.snp.makeConstraints { (make) in
        make.edges.equalToSuperview()
    }

    }
    
    func goToAddNoteVC(note: Note, index: Int?) {
        let vc = AddNoteViewController()
        vc.notes = notes
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addTapped() {
        goToAddNoteVC()
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: <#T##IndexPath#>, animated: true)
        goToAddNoteVC()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.reUse) as! NotesTableViewCell
        cell.titleLabel.text = notes[indexPath.row].title
        cell.subTitleLabel.text = notes[indexPath.row].subTitle
        return cell
    
    }
}

extension ViewController: NoteDelegate {
    func didCreateNote(note: Note) {
        notes.append(note)
        tableView.reloadData()
    }
}
