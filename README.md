# AGCPropertyDelegates
A collection of Swift property delegates (see [Swift proposal](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-delegates.md))

- `@DebuggingAccessors` | Helps debugging race conditions or unexpected accesses to vars
  -  Prints every access to `get` or `set` of the tagged variable, together with the current thread description
  
  <p align="center">
    <img src="images/db-accessors.png">
  </p>  
