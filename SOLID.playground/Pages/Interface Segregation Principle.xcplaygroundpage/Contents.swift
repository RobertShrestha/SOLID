/*
 The Interface Segregation Principle (ISP)
 CLIENTS SHOULD NOT BE FORCED TO DEPEND UPON INTERFACES THAT THEY DO NOT USE.
 How to detech Violations of ISP principle
 - Fat interface
 - Interfaces with Low Cohesion
 - Empty method Implementation
*/
import Foundation

print("===== Printer Scanner Fax Machine Example =====")
/*
 // MARK: Problem
 - MultiFunction interface has fat interface
 - MultiFunction interface has low cohesion
 - In HPPrinterNScanner and CanonPrinter there are some empty method implementation
*/
protocol MultiFunction {
    func printSomething()
    func getPrintSpoolDetails()
    func scan()
    func scanPhoto()
    func fax()
    func internetFax()
}
class XeroxWorkCenterOld: MultiFunction {
    func printSomething() {
        print("Print Something")
    }

    func getPrintSpoolDetails() {
        print("Print Spool Details")
    }

    func scan() {
        print("Scan")
    }

    func scanPhoto() {
        print("Scan Photo")
    }

    func fax() {
        print("Send Fax")
    }

    func internetFax() {
        print("Send Internet Fax")
    }
}
class HPPrinterNScannerOld: MultiFunction {
    func printSomething() {
        print("Print Something")
    }

    func getPrintSpoolDetails() {
        print("Print Spool Details")
    }

    func scan() {
        print("Scan")
    }

    func scanPhoto() {
        print("Scan Photo")
    }
    func fax() {}
    func internetFax() {}
}

class CanonPrinterOld: MultiFunction {
    func printSomething() {
        print("Print Something")
    }

    func getPrintSpoolDetails() {
        print("Print Spool Details")
    }

    func scan() {}
    func scanPhoto() {}
    func fax() {}
    func internetFax() {}
}
/*
 // MARK: Solution
 - MultiFunction interface has been divided into PrintProtocol, ScanProtocol and FaxProtocol
 - PrintProtocol, ScanProtocol and FaxProtocol interface has high cohesion
 - There are no more empty method implementatio now
*/
protocol PrintProtocol {
    func printSomething()
    func getPrintSpoolDetails()
}
protocol ScanProtocol {
    func scan()
    func scanPhoto()
}
protocol FaxProtocol {
    func fax()
    func internetFax()
}

class XeroxWorkCenter: PrintProtocol, ScanProtocol, FaxProtocol {
    func printSomething() {
        print("Print Something")
    }

    func getPrintSpoolDetails() {
        print("Print Spool Details")
    }

    func scan() {
        print("Scan")
    }

    func scanPhoto() {
        print("Scan Photo")
    }

    func fax() {
        print("Send Fax")
    }

    func internetFax() {
        print("Send Internet Fax")
    }
}
class HPPrinterNScanner: PrintProtocol, ScanProtocol {
    func printSomething() {
        print("Print Something")
    }

    func getPrintSpoolDetails() {
        print("Print Spool Details")
    }

    func scan() {
        print("Scan")
    }

    func scanPhoto() {
        print("Scan Photo")
    }
    func fax() {}
    func internetFax() {}
}

class CanonPrinter: PrintProtocol {
    func printSomething() {
        print("Print Something")
    }

    func getPrintSpoolDetails() {
        print("Print Spool Details")
    }
}
print("===== Gesture Example =====")
/*
 // MARK: Problem
 - GestureProtocol interface has fat interface
 - GestureProtocol interface has low cohesion
 - In PoorButton there are some empty method implementation
*/

protocol GestureProtocol {
    func didTap()
    func didDoubleTap()
    func didLongPress()
}

class SuperButtonOld: GestureProtocol {
    func didTap() {
        print("Tap")
    }

    func didDoubleTap() {
        print("Double Tap")
    }

    func didLongPress() {
        print("Long Press")
    }
}
class PoorButtonOld: GestureProtocol {
    func didTap() {
        print("Tap")
    }

    func didDoubleTap() { }

    func didLongPress() { }
}
/*
 // MARK: Solution
 - GestureProtocol interface has been divided into TapProtocol, DoubleTapProtocol and LongPressProtocol
 - There are no more empty method implementatio now
*/

protocol TapProtocol {
    func didTap()
}

protocol DoubleTapProtocol {
    func didDoubleTap()
}

protocol LongPressProtocol {
    func didLongPress()
}

class SuperButton: TapProtocol, DoubleTapProtocol, LongPressProtocol {
    func didTap() {
        print("Tap")
    }

    func didDoubleTap() {
        print("Double Tap")
    }

    func didLongPress() {
        print("Long Press")
    }
}

class PoorButton: TapProtocol {
    func didTap() {
        print("Tap")
    }
}
