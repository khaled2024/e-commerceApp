//
//  DriverDetailsViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 05/03/2024.
//

import UIKit

class DriverDetailsViewController: UIViewController {

    @IBOutlet weak var imageeditBtn: UIButton!
    @IBOutlet weak var driverImage: UIImageView!
    static let identifier = "DriverDetailsViewController"
    var driver: DriverModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        setUpdata()
    }
    func setUpDesign(){
        self.view.backgroundColor = .white
        driverImage.makeCircle()
        imageeditBtn.makeCircle()
    }
    func setUpdata(){
        if let driver = self.driver{
            self.driverImage.image = driver.driverImage
        }
    }
    @IBAction func imageEditBtnTapped(_ sender: UIButton) {
        print("Tapped")
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
