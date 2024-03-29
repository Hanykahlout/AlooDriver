//
//  AboutAppViewController.swift
//  Aloo
//
//  Created by Hany Alkahlout on 29/09/2021.
//

import UIKit

class AboutAppViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UILabel!
    
    @IBOutlet weak var whatsappNumberLabel: UILabel!    
    
    private let presnter = AboutAppPresnter()
    private var data:AboutData?
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var whatsappView: UIView!
    @IBOutlet weak var whatsappLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
        // Do any additional setup after loading the view.
    }
    
    func initlization(){
        presnter.delegate = self
        emailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(emailAction)))
        whatsappView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(whatsappAction)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if L102Language.currentAppleLanguage() == "ar"{
            backButton.transform = .init(rotationAngle: .pi)
        }
        presnter.getAboutData()
    }
    
    
    @objc private func emailAction(){
        // if you want to send him to email
    }

    
    @objc private func whatsappAction(){
        let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(whatsappLabel.text!)")!
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        }
    }
    
    
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func linkedInAction(_ sender: Any) {
        if let data = data,let linkedInLink = data.linkedin{
            let appURL = URL(string: linkedInLink)!
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL)
            }
        }
    }
    
    @IBAction func instagramAction(_ sender: Any) {
        if let data = data,let instagramLink = data.instagram{
            let appURL = URL(string: instagramLink)!
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL)
            }
        }
    }
    
    @IBAction func twitterAction(_ sender: Any) {
        if let data = data,let twitterLink = data.twitter{
            let appURL = URL(string: twitterLink)!
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL)
            }
        }
    }
    
    
}

extension AboutAppViewController:AboutAppPresnterDelegate{
    func showAlert(title: String, message: String) {
        GeneralActions.shard.showAlert(viewController: self, title: title, message: message)
    }
    
    func aboutDataResonse(data: AboutData) {
        self.data = data
        emailLabel.text = data.email ?? ""
        whatsappLabel.text = data.whatsapp ?? ""
    }
    
    
    
    
}
