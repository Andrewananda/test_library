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
    
    public func initializeSdk(title: String, dataArr: [String], viewController: UIViewController) {
        let vc = MyLibraryDynamicDialogViewController()
        vc.filterTitle = title
        vc.filteredData = dataArr
        vc.delegate = self
        vc.modalPresentationStyle = .custom
        vc.show()
        
    }
    
    
}
