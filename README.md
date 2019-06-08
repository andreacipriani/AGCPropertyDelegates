# AGCPropertyDelegates
A collection of Swift property delegates

- `@DebuggingAccessors` | Helps debugging race conditions or unexpected accesses to vars
  -  Prints every access to `get` or `set` of the tagged variable, together with the current thread description
  
  <p align="left">
    <img width="270" height="100" src="images/debugging-accessors-annotations.png">
  </p>

  ![](images/debugging-accessors-annotations.png)
  ![](images/debugging-accessors-logs.png)
  
