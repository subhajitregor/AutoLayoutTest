//
//  CodeGeneratorBasicDetails.swift
//  CodeGeneratorBasicDetails
//
//

import UIKit

class CodeGeneratorBasicDetails: UIViewController, UITextFieldDelegate, UICollectionViewDelegate , UICollectionViewDataSource
{
    //MARK:- IBOUTLET declartion
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var taxYearLbl: UILabel!
    @IBOutlet weak var taxYearBtn: UIButton!
    
    @IBOutlet weak var employeeDetailsView: UIView!
    @IBOutlet weak var employeeNameLbl: UILabel!
    @IBOutlet weak var employeeNameTxt: UITextField!
    @IBOutlet weak var employeeIdLbl: UILabel!
    @IBOutlet weak var employeeIdTxt: UITextField!
    
    @IBOutlet weak var taxMonthLbl: UILabel!
    
    @IBOutlet weak var taxMonthView: UIView!
    @IBOutlet weak var taxMonthCollectionView: UICollectionView!
    
    @IBOutlet weak var allMonthsBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var collectionVIewTopSpacing: NSLayoutConstraint!
    
    @IBOutlet weak var employeeDetailsViewHeight: NSLayoutConstraint!
    
    //MARK: - variables declaration
    var codeGeneratorType:String?
    var monthList:[String] = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var selectedMonthList = [String]()
    var appDelegate = (UIApplication.shared.delegate! as! AppDelegate)

    
    // MARK: - View Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setDesignStyles()
        
    }

    override func viewWillAppear(_ animated: Bool)
    {
//        taxMonthCollectionView.frame = CGRect(x:taxMonthCollectionView.frame.origin.x , y: taxMonthCollectionView.frame.origin.y, width: taxMonthCollectionView.frame.size.width, height:taxMonthCollectionView.contentSize.height)

        print(codeGeneratorType!)
        if codeGeneratorType == "Single Employee"
        {
        }
        else if codeGeneratorType == "Group Employee"
        {
            employeeDetailsViewHeight.constant = 0
        }
        
        

    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLayoutSubviews()
    {

        let height = taxMonthCollectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeight.constant = height
        
        taxMonthLbl.sizeToFit()
        
//        self.view.addConstraint(NSLayoutConstraint(item: taxMonthView, attribute: .top, relatedBy: .equal, toItem: taxMonthLbl, attribute: .top, multiplier: 1.0, constant: 20))
        
    }
    
    // MARK: - Design style
    func setDesignStyles()
    {
        sp_textfield_Outfocus(employeeNameTxt)
        sp_textfield_Outfocus(employeeIdTxt)
        sp_primaryButton(nextBtn)
    }
    
    // MARK: - Button action
    @IBAction func prevPageBtnAction(_ sender: Any)
    {
        self.navigationController!.popViewController(animated: true)
    }
    @IBAction func nextPageBtnAction(_ sender: Any)
    {
        
    }

    // MARK: - CSS Methods
    func sp_textfield_Outfocus(_ textField: UITextField)
    {
        textField.leftViewMode = .always
        if UIDevice.current.userInterfaceIdiom == .pad {
            textField.font = UIFont(name: "Roboto-Bold", size: 16)
        }
        else {
            textField.font = UIFont(name: "Roboto-Bold", size: 16)
        }
        textField.textColor = UIColor(red:51.0/255.0, green:51.0/255.0, blue:51.0/255.0, alpha: 1.0)
        textField.backgroundColor = UIColor.clear
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: textField.frame.size.height - 1, width: textField.frame.size.width, height: 1.0)
        bottomBorder.backgroundColor = UIColor(red:192.0/255.0, green:192.0/255.0, blue:192.0/255.0, alpha: 1.0).cgColor
        textField.layer.addSublayer(bottomBorder)
    }
    
    func sp_primaryButton(_ button:UIButton)
    {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = UIFont(name: "NotoSans-Bold", size: 14)
    }
    // MARK: - Text Field delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == employeeNameTxt
        {
            employeeIdTxt .becomeFirstResponder()
        }
        else if textField == employeeIdTxt
        {
           resignFirstResponder()
        }
        else
        {
            resignFirstResponder()
        }
        return true
    }
    //MARK: - collection view delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return monthList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = taxMonthCollectionView.dequeueReusableCell(withReuseIdentifier: "MonthListCell", for: indexPath) as! MonthListCell
        cell.backgroundColor = UIColor.white
        cell.monthNameLbl.text = monthList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if !selectedMonthList.contains(monthList[indexPath.row])
        {
            selectedMonthList.append(monthList[indexPath.row])
            print(indexPath.row)

        }
    }
}
