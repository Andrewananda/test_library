// The Swift Programming Language
// https://docs.swift.org/swift-book
import UIKit




public class MyLibrary: DynamicDialogDelegate {
    
    public func selectedDynamicItemFromTable(selectedTitle: String) {
        delegate?.selectedDynamicItemFromTable(selectedTitle: selectedTitle)
    }
    
    
    public var delegate: DynamicDialogDelegate?
    
    public init() {
        
    }
    
    public func initializeSdk(title: String, dataArr: [String], navigator: UIViewController) {
        if let navigaion = navigator.navigationController {
            let vc = MyLibraryDynamicDialog()
            vc.filterTitle = title
            vc.filteredData = dataArr
            vc.delegate = self
            navigator.present(vc, animated: false)
        }
        
        
    }
    
    
}
