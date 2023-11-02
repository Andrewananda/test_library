// The Swift Programming Language
// https://docs.swift.org/swift-book
import UIKit

public class MyLibrary {
    
    public func initializeSdk(title: String, dataArr: [String], navigator: UIViewController) {
        if let navigaion = navigator.navigationController {
            let vc = MyLibraryDynamicDialog()
            vc.filterTitle = title
            vc.filteredData = dataArr
            navigator.present(vc, animated: false)
        }
        
        
    }
    
    
}
