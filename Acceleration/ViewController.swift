//
//  ViewController.swift
//  Acceleration
//
//  Created by Mai Nguyen on 13/9/2023.
//

import UIKit

// View for calculating Velocity
class VelocityViewController: UIViewController {

    // Create outlet for select units menu
    @IBOutlet weak var selectUnitButton: UIButton!
    
    // Unit buttons collection
    @IBOutlet var unitButtonCollection: [UIButton]!
    
    // Create outlet for color view to show result
    @IBOutlet weak var colorView: UIView!
    
    // Create outlets for each text field
    @IBOutlet weak var wheelDiamterField: UITextField!
    @IBOutlet weak var rpmField: UITextField!
    @IBOutlet weak var velocityField: UITextField!
    
    // Create outlet for label that alerts user to choose unit
    @IBOutlet weak var alertSelectUnit: UILabel!
    
    // Get pi number
    let pi = Double.pi
    
    // Calculate metres per second velocity based on user's input of wheel diameter and rpm
    func mpsVelocity(_ sender: Any) -> Double{
        
        
        // Convert user input of wheel diameter into number
        let wheelDiamterNumber = wheelDiamterField.text!
        let wheelDiamterValue = (wheelDiamterNumber as NSString).doubleValue
        
        // Convert user input of rpm into number
        let rpmNumber = rpmField.text!
        let rpmValue = (rpmNumber as NSString).doubleValue
        
        // Default formula
        // let result = (pi*2)/60*(wheelValue/2)*rpmValue
        
        // Break down formula so that Xcode doesn't crash
        let piResult = (pi*2)/60
        let wheelRadiusValue = wheelDiamterValue / 2
        let mpsVelocity = piResult * wheelRadiusValue * rpmValue

        return mpsVelocity
    }
    
    // Calculate kilometres per hour velocity based on metres per second velocity
    func kphVelocity(_ sender: Any) -> Double{
        let mpsVelocity = mpsVelocity(self)
        let kphVelocity = mpsVelocity * 3.6
        let kphVelocityRounded = (kphVelocity * 1000).rounded() / 1000
        return kphVelocityRounded
    }
    
    // Calculate feet per second velocity based on metres per second velocity
    func fpsVelocity(_ sender: Any) -> Double{
        let mpsVelocity = mpsVelocity(self)
        let fpsVelocity = mpsVelocity * 3.28084
        let fpsVelocityRounded = (fpsVelocity * 1000).rounded() / 1000
        return fpsVelocityRounded
    }
    
    // Calculate miles per hour velocity based on metres per second velocity
    func mphVelocity(_ sender: Any) -> Double{
        let mpsVelocity = mpsVelocity(self)
        let mphVelocity = mpsVelocity * 2.23694
        let mphVelocityRounded = (mphVelocity * 1000).rounded() / 1000
        return mphVelocityRounded
    }
    
    // Create an action to check if textfield has been changed
    @IBAction func textFieldChanged(_ sender: Any) {
        velocityField.text = "0.0"
    }
    
    // Create an action to clear the current calculator
    @IBAction func clearCalculator(_ sender: Any) {
        wheelDiamterField.text = nil
        rpmField.text = nil
        velocityField.text = "0.0"
    }
    
    // Create an action that dissmisses the keyboard when user tap anywhere else on the screen
    @IBAction func tapToDismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    // Create action on button to calculate velocity based on the units user choose and utilise other functions to calculate velocity
    @IBAction func calculateVelocity(_ sender: Any){
        
        // Alert if user has not selected any units
        if(selectUnitButton.titleLabel?.text == "Select units"){
            alertSelectUnit.textColor = UIColor(red: 0.0118, green: 0.1882, blue: 0.2784, alpha: 1.0)
        }
        else{
            alertSelectUnit.textColor = UIColor(red: 0.9569, green: 0.9529, blue: 0.9333, alpha: 1.0)
        }
        
        // Declare variable to use later
        var velocity = 0.0
        
        // If user chooses to calculate in metres per second
        if(selectUnitButton.titleLabel?.text == "Metres per Second"){
            velocity = (mpsVelocity(self) * 1000).rounded() / 1000
            print("Metres per Second")
        }
        
        // If user chooses to calculate in kilometers per hour
        else if(selectUnitButton.titleLabel?.text == "Kilometers per Hour"){
            velocity = kphVelocity(self)
            print("Kilometers per Hour")
        }
        
        // If user chooses to calculate in feet per second
        else if(selectUnitButton.titleLabel?.text == "Feet per Second"){
            velocity = fpsVelocity(self)
            print("Feet per Second")
        }
        
        // If user chooses to calculate in miles per hour
        else if(selectUnitButton.titleLabel?.text == "Miles per Hour"){
            velocity = mphVelocity(self)
            print("Miles per Hour")
        }
        
        // Pass the result back to velocity field on screen
        velocityField.text = "\(velocity)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

    }
    
    // Hide and show the unit buttons based on their previous state
    func showButtonVisibility(){
        unitButtonCollection.forEach{ button in
            UIView.animate(withDuration: 0.3){
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }

    // Show visibility for select unit button
    @IBAction func selectUnitAction(_ sender: Any) {
        showButtonVisibility()
    }
    
    // Show visibility for all unit buttons
    @IBAction func unitButtonAction(_ sender: UIButton){
        showButtonVisibility()
        
        // Use switch case to analyse which button is pressed, then change the title of the select unit button accordingly and update the velocity field to default as 0.0 to prompt user hit the calculate velocity button
            switch sender.titleLabel?.text{
            case "Metres per Second":
                selectUnitButton.setTitle("Metres per Second", for: .normal)
                colorView.backgroundColor = UIColor(red: 0.0118, green: 0.1882, blue: 0.2784, alpha: 1.0)
                velocityField.text = "0.0"

            case "Kilometers per Hour":
                selectUnitButton.setTitle("Kilometers per Hour", for: .normal)
                colorView.backgroundColor = UIColor(red: 0.1882, green: 0.2980, blue: 0.3843, alpha: 1.0)
                velocityField.text = "0.0"
                
            case "Feet per Second":
                selectUnitButton.setTitle("Feet per Second", for: .normal)
                colorView.backgroundColor = UIColor(red: 0.0118, green: 0.1882, blue: 0.2784, alpha: 1.0)
                velocityField.text = "0.0"
                
            case "Miles per Hour":
                selectUnitButton.setTitle("Miles per Hour", for: .normal)
                colorView.backgroundColor = UIColor(red: 0.1882, green: 0.2980, blue: 0.3843, alpha: 1.0)
                velocityField.text = "0.0"

            default:
                colorView.backgroundColor = .systemGray
            }
    }
}

// View for calculating RPM
class RPMViewController: UIViewController {

    // Create outlet for select units menu
    @IBOutlet weak var selectUnitButton: UIButton!
    
    // Unit buttons collection
    @IBOutlet var unitButtonCollection: [UIButton]!
    
    // Create outlet for color view to show result
    @IBOutlet weak var colorView: UIView!
    
    // Create outlets for each text field
    @IBOutlet weak var wheelDiamterField: UITextField!
    @IBOutlet weak var rpmField: UITextField!
    @IBOutlet weak var velocityField: UITextField!
    
    // Create outlet for label that alerts user to choose unit
    @IBOutlet weak var alertSelectUnit: UILabel!
    
    // Get pi number
    let pi = Double.pi
    
    // Calculate RPM based on metres per second (mps) velocity using user's input of wheel diameter and mps velocity
    func mpsRpm(_ sender: Any) -> Double{
        
        // Convert user input of wheel diameter into number
        let wheelDiamterNumber = wheelDiamterField.text!
        let wheelDiamterValue = (wheelDiamterNumber as NSString).doubleValue
        
        // Convert user input of mps velocity into number
        let mpsNumber = velocityField.text!
        let mpsValue = (mpsNumber as NSString).doubleValue
        
        // Break down formula so that Xcode doesn't crash
        let piResult = (pi*2)/60
        let wheelRadiusValue = wheelDiamterValue / 2
        let mpsRpm = mpsValue / (piResult * wheelRadiusValue)

        return mpsRpm
    }
    
    // Calculate RPM based on kilometres per hour (kph) velocity using user's input of wheel diameter and kph velocity
    func kphRpm(_ sender: Any) -> Double{
        
        // Convert user input of wheel diameter into number
        let wheelDiamterNumber = wheelDiamterField.text!
        let wheelDiamterValue = (wheelDiamterNumber as NSString).doubleValue
        
        // Convert user input of mps velocity into number
        let kphNumber = velocityField.text!
        let kphValue = (kphNumber as NSString).doubleValue
        let mpsValue = kphValue / 3.6
        
        // Break down formula so that Xcode doesn't crash
        let piResult = (pi*2)/60
        let wheelRadiusValue = wheelDiamterValue / 2
        let kphRpm = mpsValue / (piResult * wheelRadiusValue)

        return kphRpm
    }
    
    // Calculate RPM based on feet per second (fps) velocity using user's input of wheel diameter and kph velocity
    func fpsRpm(_ sender: Any) -> Double{
        
        // Convert user input of wheel diameter into number
        let wheelDiamterNumber = wheelDiamterField.text!
        let wheelDiamterValue = (wheelDiamterNumber as NSString).doubleValue
        
        // Convert user input of mps velocity into number
        let fpsNumber = velocityField.text!
        let fpsValue = (fpsNumber as NSString).doubleValue
        let mpsValue = fpsValue / 3.28084
        
        // Break down formula so that Xcode doesn't crash
        let piResult = (pi*2)/60
        let wheelRadiusValue = wheelDiamterValue / 2
        let fpsRpm = mpsValue / (piResult * wheelRadiusValue)

        return fpsRpm
    }
    
    // Calculate RPM based on miles per hour (mph) velocity using user's input of wheel diameter and mph velocity
    func mphRpm(_ sender: Any) -> Double{
        
        // Convert user input of wheel diameter into number
        let wheelDiamterNumber = wheelDiamterField.text!
        let wheelDiamterValue = (wheelDiamterNumber as NSString).doubleValue
        
        // Convert user input of mps velocity into number
        let mphNumber = velocityField.text!
        let mphValue = (mphNumber as NSString).doubleValue
        let mpsValue = mphValue / 2.23694
        
        // Break down formula so that Xcode doesn't crash
        let piResult = (pi*2)/60
        let wheelRadiusValue = wheelDiamterValue / 2
        let mphRpm = mpsValue / (piResult * wheelRadiusValue)

        return mphRpm
    }
    
    // Create an action to check if textfield has been changed
    @IBAction func textFieldChanged(_ sender: Any) {
        rpmField.text = "0.0"
    }
    
    // Create an action to clear the current calculator
    
    @IBAction func clearCalculator(_ sender: Any) {
        wheelDiamterField.text = nil
        velocityField.text = nil
        rpmField.text = "0.0"
    }
    
    // Create an action that dissmisses the keyboard when user tap anywhere else on the screen
    @IBAction func tapToDismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    // Create action on button to calculate velocity based on the units user choose and utilise other functions to calculate velocity
    @IBAction func calculateRpm(_ sender: Any){
        
        // Alert if user has not selected any units
        if(selectUnitButton.titleLabel?.text == "Select units"){
            alertSelectUnit.textColor = UIColor(red: 0.0118, green: 0.1882, blue: 0.2784, alpha: 1.0)
        }
        else{
            alertSelectUnit.textColor = UIColor(red: 0.9569, green: 0.9529, blue: 0.9333, alpha: 1.0)
        }
        
        // Declare variable to use later
        var rpm = 0.0
        
        // If user chooses to calculate in metres per second
        if(selectUnitButton.titleLabel?.text == "Metres per Second"){
            rpm = (mpsRpm(self) * 1000).rounded() / 1000
            print("Metres per Second RPM")
        }
        
        // If user chooses to calculate in kilometers per hour
        else if(selectUnitButton.titleLabel?.text == "Kilometers per Hour"){
            rpm = (kphRpm(self) * 1000).rounded() / 1000
            print("Kilometers per Hour RPM")
        }
        
        // If user chooses to calculate in feet per second
        else if(selectUnitButton.titleLabel?.text == "Feet per Second"){
            rpm = (fpsRpm(self) * 1000).rounded() / 1000
            print("Feet per Second RPM")
        }
        
        // If user chooses to calculate in miles per hour
        else if(selectUnitButton.titleLabel?.text == "Miles per Hour"){
            rpm = (mphRpm(self) * 1000).rounded() / 1000
            print("Miles per Hour RPM")
        }
        
        // Pass the result back to velocity field on screen
        rpmField.text = "\(rpm)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

    }
    
    // Hide and show the unit buttons based on their previous state
    func showButtonVisibility(){
        unitButtonCollection.forEach{ button in
            UIView.animate(withDuration: 0.3){
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }

    // Show visibility for select unit button
    @IBAction func selectUnitAction(_ sender: Any) {
        showButtonVisibility()
    }
    
    // Show visibility for all unit buttons
    @IBAction func unitButtonAction(_ sender: UIButton){
        showButtonVisibility()
        
        // Use switch case to analyse which button is pressed, then change the title of the select unit button accordingly and update the velocity field to default as 0.0 to prompt user hit the calculate velocity button
            switch sender.titleLabel?.text{
            case "Metres per Second":
                selectUnitButton.setTitle("Metres per Second", for: .normal)
                colorView.backgroundColor = UIColor(red: 0.0118, green: 0.1882, blue: 0.2784, alpha: 1.0)
                rpmField.text = "0.0"

            case "Kilometers per Hour":
                selectUnitButton.setTitle("Kilometers per Hour", for: .normal)
                colorView.backgroundColor = UIColor(red: 0.1882, green: 0.2980, blue: 0.3843, alpha: 1.0)
                rpmField.text = "0.0"
                
            case "Feet per Second":
                selectUnitButton.setTitle("Feet per Second", for: .normal)
                colorView.backgroundColor = UIColor(red: 0.0118, green: 0.1882, blue: 0.2784, alpha: 1.0)
                rpmField.text = "0.0"
                
            case "Miles per Hour":
                selectUnitButton.setTitle("Miles per Hour", for: .normal)
                colorView.backgroundColor = UIColor(red: 0.1882, green: 0.2980, blue: 0.3843, alpha: 1.0)
                rpmField.text = "0.0"

            default:
                colorView.backgroundColor = .systemGray
            }
    }
}

