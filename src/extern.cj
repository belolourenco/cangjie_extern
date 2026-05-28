package extern

public class ExternConversionException <: Exception {
    public ExternConversionException(message: String) {
        super(message)
    }
}

public class ExternDynamicException <: Exception {
    public ExternDynamicException(message: String) {
        super(message)
    }
}

public interface Runtime<T> where T <: Runtime<T> {
    // return a reference to the member
    static func memberAccess(e: Extern<T>, field: String): Extern<T>
    // return a reference to the indexed value
    static func indexAccess(e: Extern<T>, arg: Any): Extern<T>

    // dereferences the extern
    static func dereference(e: Extern<T>): Extern<T>

    // assigns the value to the extern
    static func assign(e: Extern<T>, value: Any) : Unit

    static func functionCall(e: Extern<T>, args: Array<Any>): Extern<T>

    static func fromExtern<R>(h: Extern<T>): R
    static func toExtern<R>(v: R): Extern<T>
}

public struct Extern<T> where T <: Runtime<T> {
    public Extern(public let content : Any) { }
}
