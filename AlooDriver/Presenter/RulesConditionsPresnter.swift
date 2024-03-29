//
//  RulesConditionsPresnter.swift
//  AlooDriver
//
//  Created by Hany Alkahlout on 04/11/2021.
//

import UIKit


protocol RulesConditionsPresnterDelegate {
    func showAlert(title:String,message:String)
    func privacyResponse(data:PrivacyPolicyData)
}

typealias RulesConditionsDelegate = RulesConditionsPresnterDelegate & UIViewController


class RulesConditionsPresnter: NSObject {
    weak var delegate:RulesConditionsDelegate?
    
    
    
    func getPrivceyText(){
        GeneralActions.shard.monitorNetwork {
            DispatchQueue.main.async {
                DataApiControllers.shard.privacyPolicy { status, message,data in
                    if status{
                        if let data = data{
                            DispatchQueue.main.async {
                                self.delegate?.privacyResponse(data: data)
                            }
                        }
                    }else{
                        DispatchQueue.main.async {
                            self.delegate?.showAlert(title: NSLocalizedString("Error", comment: ""), message: message)
                        }
                    }
                }
            }
        } notConectedAction: {
            DispatchQueue.main.async {
                self.delegate?.showAlert(title: NSLocalizedString("Error", comment: ""), message: NSLocalizedString("Internet Connection Error", comment: ""))
            }
        }
    }
    
    
}
