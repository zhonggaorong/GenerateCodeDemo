//
//  ViewController.swift
//  GenerateCodeDemo
//
//  Created by 张国荣 on 16/8/12.
//  Copyright © 2016年 BateOrganization. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCodeTextField: UITextField!
    @IBOutlet weak var generateCodeView: GenerateCodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateCodeView.CreateGenerateCodeAction()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testingAction(sender: AnyObject) {
        if generateCodeView.codeString == myCodeTextField.text {
            var alert = UIAlertView.init(title:"恭喜", message: "验证通过", delegate: nil, cancelButtonTitle: "确 认")
            alert.show()
        }else {
            var alert = UIAlertView.init(title:"失望", message: "验证失败", delegate: nil, cancelButtonTitle: "确 认")
            alert.show()
        }
        
        myCodeTextField.resignFirstResponder()
    }
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}



