//
//  CodeGenerator.swift
//  CodeGenerator
//
//

import UIKit

class CodeGenerator: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func singleEmployee(_ sender: Any)
    {
        let CodeGeneratorBasicDetailsObj = self.storyboard?.instantiateViewController(withIdentifier: "CodeGeneratorBasicDetails") as? CodeGeneratorBasicDetails
        CodeGeneratorBasicDetailsObj?.codeGeneratorType = "Single Employee"
        self.navigationController?.pushViewController(CodeGeneratorBasicDetailsObj!, animated: true)
    }

    @IBAction func GroupEmployee(_ sender: Any)
    {
        let CodeGeneratorBasicDetailsObj = self.storyboard?.instantiateViewController(withIdentifier: "CodeGeneratorBasicDetails") as? CodeGeneratorBasicDetails
        CodeGeneratorBasicDetailsObj?.codeGeneratorType = "Group Employee"
        self.navigationController?.pushViewController(CodeGeneratorBasicDetailsObj!, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
