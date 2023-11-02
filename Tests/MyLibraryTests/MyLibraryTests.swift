import XCTest
@testable import MyLibrary

class MyLibraryTests: XCTestCase {
    
    var model = MyLibraryDynamicDialog()
    
    override func setUp() {
        model.filterTitle = "Test"
        model.filteredData = ["First", "Second", "Third", "Forth"]
        model.show()
    }
    
    func testExample() throws {
       
       // XCTAssertEqual(model.lblTitle.text ?? "",  "Test")
    }
}
