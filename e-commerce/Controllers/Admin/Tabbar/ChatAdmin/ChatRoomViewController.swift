//
//  ChatRoomViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/02/2024.
//

import UIKit

class ChatRoomViewController: UIViewController {
    // MARK: - Outlets:-
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageView: UIView!
    // MARK: - Variables:-
    static let identifier = String(describing: ChatRoomViewController.self)
    var user: CostumerModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        setUpLogic()
        setUpDesign()
        messageTextField.delegate = self
    }
    // MARK: - LifeCycle:-
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    // MARK: - Functions:-
    func setUpDesign(){
        userView.layer.cornerRadius = 15
        messageView.backgroundColor = .white
        userImage.layer.cornerRadius = userImage.frame.height/2
    }
    func setUpLogic(){
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(UserChatRoomTableViewCell.uiNib(), forCellReuseIdentifier: UserChatRoomTableViewCell.identifier)
        messageTableView.separatorStyle = .none
        messageTableView.allowsSelection = false
    }
    func setUpData(){
        if let userName = user?.name,let userImage = user?.costumerImage{
            self.userName.text = userName
            self.userImage.image = UIImage(named: userImage)
        }
    }
    // MARK: - Btn tapped :-
    @IBAction func dismissBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate,UITableViewDataSource
extension ChatRoomViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messageTableView.dequeueReusableCell(withIdentifier: UserChatRoomTableViewCell.identifier, for: indexPath)as! UserChatRoomTableViewCell
        let message = messages[indexPath.row]
        cell.config(message: message)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
// MARK: - UITextFieldDelegate
extension ChatRoomViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,text.isEmpty == false {
            print(text)
            messages.append(.init(messageText: text, type: .outComing))
            self.messageTableView.reloadData()
            self.messageTextField.text = ""
        }
        return true
    }
}
