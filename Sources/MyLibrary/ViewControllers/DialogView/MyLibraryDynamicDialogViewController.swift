//
//  MyLibraryDynamicDialogViewController.swift
//  
//
//  Created by AndrewAnanda on 02/11/2023.
//

import UIKit

public protocol DynamicDialogDelegate {
    func selectedDynamicItemFromTable(selectedTitle: String)
}

public class MyLibraryDynamicDialogViewController: LibraryBaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    
    
    public var filteredData = [String]()
    public var filteredSuggestions = [String]()
    public var filterTitle = ""
    var delegate: DynamicDialogDelegate?
    

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        lblTitle.text = filterTitle
        filteredSuggestions = filteredData
    }
    
    init() {
        super.init(nibName: "MyLibraryDynamicDialogViewController", bundle: Bundle.main)
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        txtSearch.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "suggestionCell")
        tableView.reloadData()
    }
    
    
    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    func show() {
        
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first?.rootViewController?.present(self, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController!.present(self, animated: true, completion: nil)
        }
    }

}



extension MyLibraryDynamicDialogViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    public final func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtSearch {
            DispatchQueue.main.async {
                let currentText = (self.txtSearch.text! as NSString).replacingCharacters(in: range, with: string)
                self.filteredSuggestions = self.filteredData.filter { $0.lowercased().contains(currentText.lowercased()) }
                self.tableView.reloadData()
            }
            
            DispatchQueue.main.async {
                if string == "" {
                    self.filteredSuggestions.append(contentsOf: self.filteredData)
                    self.tableView.reloadData()
                }
            }
            
        }
        return true
    }
    
    
    public final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSuggestions.count
    }
    
   public final func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = filteredSuggestions[indexPath.row]
        delegate?.selectedDynamicItemFromTable(selectedTitle: item)
        self.dismiss(animated: true)
    }

   public final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestionCell", for: indexPath)
        cell.textLabel?.text = filteredSuggestions[indexPath.row]
        return cell
    }
}
