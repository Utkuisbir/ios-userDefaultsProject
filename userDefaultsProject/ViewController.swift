//
//  ViewController.swift
//  userDefaultsProject
//
//  Created by muammer utku isbir on 7.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var workText: UITextField!
    @IBOutlet weak var endDateText: UITextField!
    @IBOutlet weak var worksLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    override func viewDidLoad() {
        //aşağıdaki tanımlamalar bir üst blokta da yapılabilirdi, bu sayede DeleteClicked kısmında da bu değişkenleri kullanıp kod fazlalığından kurtulmuş olunurdu.
        let work = UserDefaults.standard.object(forKey: "work")
        let endDate = UserDefaults.standard.object(forKey: "endDate")
        //büyük verilerde çalışırken yukardaki tanımlamalar kullanılmaz, çünkü binlercesi olabilir hepsi için ayrı forkey gerekir.
        if let workInDefault = work as? String {
            worksLabel.text = "Works : \(workInDefault)"
        }
        if let endDateInDefault = endDate as? String {
            endDateLabel.text = "End Date : \(endDateInDefault)"
        }
        //object olduğu için string e cast edip boş olmadığı taktirde ekrana yazdırıyoruz.
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func saveButtonClicked(_ sender: Any) {
        UserDefaults.standard.set(workText.text, forKey:"work")
        UserDefaults.standard.set(endDateText.text, forKey: "endDate")
        
        //text fielddan en kötü boş string gelir , nil gelmeyeceği kesin, o yüzden ünlem kullanabiliriz.
        worksLabel.text = "Works : \(workText.text!)"
        endDateLabel.text = "End Date : \(endDateText.text!)"
    }
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        //silme işlemi kontrollü yapılmalı.Zaten silinmiş bir objecti tekrar silmek/ label değiştirmek sorun çıkarabilir.
        let work = UserDefaults.standard.object(forKey: "work")
        let endDate = UserDefaults.standard.object(forKey:  "endDate")
        if work as? String != nil{
            UserDefaults.standard.removeObject(forKey: "work")
        }
        if endDate as? String != nil{
            UserDefaults.standard.removeObject(forKey: "endDate")
        }
        worksLabel.text = "Works : "
        endDateLabel.text = "End Date : "
    }
    
}

