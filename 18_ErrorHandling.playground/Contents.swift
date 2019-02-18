
////////////////////////////////////////////////////////////////////////////////
// Throw and Catch

enum PrinterError: Error {
    case NoPaper
    case OutOfService
}

func doPrint() throws {
    throw PrinterError.NoPaper
}

do {
    try doPrint()
    
} catch PrinterError.NoPaper {
    print("No paper")
    
} catch {
    print("Printer has other error")
}


////////////////////////////////////////////////////////////////////////////////
// Another Full Example

enum VendingMachineError: Error {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventroy = [
        "Candy Bar": Item(price: 4, count: 3),
        "Chips": Item(price: 3, count: 4)
    ]
    
    var coinsDepoisted = 0
    
    func dispenceSnack(_ name: String) {
        print("Despencing \(name)")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = inventroy[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDepoisted else {
            throw VendingMachineError.InsufficientFunds(
                coinsNeeded: item.price - coinsDepoisted)
        }
        
        dispenceSnack(name)
        coinsDepoisted -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventroy[name] = newItem
    }
}

var vendingMachine = VendingMachine()

do {
    try vendingMachine.vend(itemNamed: "Chips")
    
} catch VendingMachineError.InvalidSelection {
    print("Invalied seleciton.")
    
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
    
} catch VendingMachineError.OutOfStock {
    print("Out of stock..")
}


////////////////////////////////////////////////////////////////////////////////
// Converting Errors to Optional Values

func someThrowingFuction() throws -> Int {
    return 0
}

let x = try? someThrowingFuction()

var y: Int? = nil
do {
    y = try someThrowingFuction()
} catch {
    y = nil
}


////////////////////////////////////////////////////////////////////////////////
// Specifying Cleanup Actions

// Use a defer statement to execute a set of statements 
//   just before code execution leaves the current block of code.
// Note: not when leave current function

// Use defer could put some pairs of code together, e.g., open/close.

class File {}

func openFile(_ name: String) -> File {
    print("Open file \(name)")
    
    return File()
}

func closeFile(_ name: String) {
    print("Close file \(name)")
}

func exists(_ name: String) -> Bool {
    return true
}

func processFile(_ name: String) {
    if exists(name) {
        let file = openFile(name)
        defer {
            closeFile(name)
        }
        
        print("- Will leave the block of defer.")
    }
    print("- After leave the block of defer.")
}

processFile("test.txt")

////////////////////////////////////////////////////////////////////////////////
// Assert

// When to use assertions?
// When a condition has the potential to be false, but must definitely be true.
// Suitable scenarios for an assertion check include:
//   Array's index is out of range.
//   Invalid parameter for a function.
//   An optional variant must have non-nil value.

// Assertions only work in debug mode.
//   In debug mode, if an assertion failed, App will stop at it.
//   In release mode, if an assertion failed, App will just terminate.

let age = -3
//assert(age >= 0, "Age can't be negative.") // This assert will fail


func lookforSomething(_ name:String) throws{
    //这里是作用域1 整个函数作用域

    print("1-1")
    if name == ""{
        //这里是作用域2 if的作用域
        print("2-1")
        defer{
            print("2-2")
        }
        print("2-3")
    }
    print("1-2")
    defer{
        print("1-3")
    }
    print("1-4")

    if name == "hello"{
        //作用域3
        print("3-1")
        defer{
            print("3-2")
        }
        print("3-3")
        defer{
            print("3-4")
        }
    }
}
//有兴趣的看看依次输出什么
//try! lookforSomething("")
//调出 debug Area 快捷键 shift+ command + y
try! lookforSomething("hello")

