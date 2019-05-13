//
//  HomePageViewController.swift
//  Worktime
//
//  Created by Kamil Gancarczyk on 13/04/2019.
//  Copyright © 2019 Kamil Gancarczyk. All rights reserved.
//

import UIKit
import Firebase

class HomePageViewController: UIViewController, UITextFieldDelegate{
    
    private var datepickerView : UIDatePicker?
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var freedayLabel: UILabel!
    @IBOutlet weak var lengthOfWorkDayLabel: UILabel!
    @IBOutlet weak var lengthTimeLabel: UILabel!
    @IBOutlet weak var workHoursLabel: UILabel!
    @IBOutlet weak var workHoursStartTextField: UITextField!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var workHoursEndTextField: UITextField!
    @IBOutlet weak var dutyHoursLabel: UILabel!
    @IBOutlet weak var dutyStartTextField: UITextField!
    @IBOutlet weak var dutyEndTextFields: UITextField!
    
    var monthBoolLabel : Bool = false
    var freedayBoolLabel : Bool = false
    var dayBoolLabel : Bool = false
    var lengthTimeBoolLabel : Bool = false
    
    var ref: DatabaseReference!
    var email : String = ""
    
    
    private let monthSource = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"]
    private let freeDaySource = ["Dzień wolny", "WŚ - święto", "WN - niedziela", "W5 – wolne z tytułu pięciodniowego tygodnia pracy", "CH - choroba", "UO – urlop okolicznościowy", "UW – urlop wypoczynkowy", "UB – urlop bezpłatny", "UM – urlop macierzyński", "UR – urlop rodzicielski", "WY – urlop wychowawczy", "ZW – zwolnienie na wezwanie sądowe/urzędowe"]
    private let daySource = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    private let timeLengthSource = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        FirebaseApp.configure()
        
        
        //ref.setValue(email)
        
        
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.isHidden = true
        hoursLabel.isHidden = true
        
        datepickerView = UIDatePicker()
        datepickerView?.datePickerMode = .time
        
        datepickerView?.addTarget(self, action: #selector(HomePageViewController.timeChanged(datePicker:)), for: .valueChanged)
        

//        datepickerView?.addTarget(self, action: #selector(HomePageViewController.timeChangedForStartDuty(datePicker:)), for: .valueChanged)
//
//        datepickerView?.addTarget(self, action: #selector(HomePageViewController.timeChangedForEndDuty(datePicker:)), for: .valueChanged)
    
        workHoursStartTextField.inputView = datepickerView
        workHoursEndTextField.inputView = datepickerView
        dutyStartTextField.inputView = datepickerView
        dutyEndTextFields.inputView = datepickerView
        
        let tapMonth = UITapGestureRecognizer(target: self, action: #selector(tapOnMonth(gestureReconizer:)))
        monthLabel.addGestureRecognizer(tapMonth)
        monthLabel.isUserInteractionEnabled = true
        
        let tapFreeDay = UITapGestureRecognizer(target: self, action: #selector(tapOnFreeDay(gestureReconizer:)))
        freedayLabel.addGestureRecognizer(tapFreeDay)
        freedayLabel.isUserInteractionEnabled = true
        
        let tapDay = UITapGestureRecognizer(target: self, action: #selector(tapOnDay(gestureReconizer:)))
        dayLabel.addGestureRecognizer(tapDay)
        dayLabel.isUserInteractionEnabled = true
        
        let tapLengthDay = UITapGestureRecognizer(target: self, action: #selector(tapOnLengthDay(gestureReconizer:)))
        lengthTimeLabel.addGestureRecognizer(tapLengthDay)
        lengthTimeLabel.isUserInteractionEnabled = true

        let tapView = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
        view.addGestureRecognizer(tapView)
        
        print("Email is: \(email)")
        
    }
    
    @IBAction func saveData(_ sender: Any) {
        saveData()
    }
    
    func saveData() {
        let currentUser = Auth.auth().currentUser?.uid
        ref = Database.database().reference().child(currentUser!)
        let key = ref.childByAutoId().key
        
        let workDay = ["id": key,
                       "Start pracy": workHoursStartTextField.text! as String,
                       "Koniec pracy": workHoursEndTextField.text! as String,
                       "Start dyzuru": dutyStartTextField.text! as String,
                       "Koniec dyzuru": dutyEndTextFields.text! as String]
        
        ref.child(monthLabel.text!).child(dayLabel.text!).setValue(workDay)
    }
    

    @objc func timeChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let str = dateFormatter.string(from: datePicker.date)
        if workHoursStartTextField.isFirstResponder {
            workHoursStartTextField.text = str
        } else if workHoursEndTextField.isFirstResponder {
            workHoursEndTextField.text = str
        } else if dutyStartTextField.isFirstResponder{
            dutyStartTextField.text = str
        } else if dutyEndTextFields.isFirstResponder{
            dutyEndTextFields.text = str
        }
    }
  
    @objc func tapOnMonth(gestureReconizer: UITapGestureRecognizer) {
        print("Month")
        pickerView.isHidden = false
        monthBoolLabel = true
        freedayBoolLabel = false
        lengthTimeBoolLabel = false
        dayBoolLabel = false
        view.endEditing(true)
        pickerView.reloadAllComponents()
    }
    
    @objc func tapOnFreeDay(gestureReconizer: UITapGestureRecognizer) {
        print(freedayLabel.text!)
        pickerView.isHidden = false
        freedayBoolLabel = true
        monthBoolLabel = false
        lengthTimeBoolLabel = false
        dayBoolLabel = false
        view.endEditing(true)
        pickerView.reloadAllComponents()
        
    }
    
    @objc func tapOnDay(gestureReconizer: UITapGestureRecognizer) {
        print("Day")
        pickerView.isHidden = false
        freedayBoolLabel = false
        monthBoolLabel = false
        lengthTimeBoolLabel = false
        dayBoolLabel = true
        view.endEditing(true)
        pickerView.reloadAllComponents()
    }
    
    @objc func tapOnLengthDay(gestureReconizer: UITapGestureRecognizer) {
        print("Day")
        hoursLabel.isHidden = false
        pickerView.isHidden = false
        freedayBoolLabel = false
        monthBoolLabel = false
        dayBoolLabel = false
        lengthTimeBoolLabel = true
        view.endEditing(true)
        pickerView.reloadAllComponents()
    }
    
//    @objc func tapOnStartWork(gestureReconizer: UITapGestureRecognizer) {
//        print("Start work")
//        datepickerView.isHidden = false
//    }


    @IBAction func logoutButtonPressed(_ sender: Any) {
    
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
            
        } catch {
            print("error: there was a problem with sign out")
        }
    }
    
    @objc func backgroundViewTapped() {
        pickerView.isHidden = true
        view.endEditing(true)
//        datepickerView?.isHidden = true
    }
}





extension HomePageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if freedayBoolLabel == true {
            return freeDaySource.count
        }
        else if monthBoolLabel == true{
            return monthSource.count
        }
        else if dayBoolLabel == true {
            return daySource.count
        }
        else if lengthTimeBoolLabel == true {
            return timeLengthSource.count
        }
        else {
            return 0
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if freedayBoolLabel == true {
            freedayLabel.text = freeDaySource[row]
        }
        else if monthBoolLabel == true{
            monthLabel.text = monthSource[row]
        }
        else if dayBoolLabel == true {
            dayLabel.text = daySource[row]
        }
        else if lengthTimeBoolLabel == true {
            lengthTimeLabel.text = timeLengthSource[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if freedayBoolLabel == true {
            return freeDaySource[row]
        }
        else if monthBoolLabel == true{
            return monthSource[row]
        }
        else if dayBoolLabel == true {
            return daySource[row]
        }
        else if lengthTimeBoolLabel == true {
            return timeLengthSource[row]
        }
        else {
            return ""
        }
    }
    
    
    
}
