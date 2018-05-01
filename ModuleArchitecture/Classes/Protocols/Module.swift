public protocol ModuleType: AnyObject {
    
}

public protocol ReusableModuleType: ModuleType {

    associatedtype Coordinator: ReusableCoordinatorType
    func createCoordinator() -> Coordinator
}

open class Module: ModuleType {

    public init() {

        //
    }
}
