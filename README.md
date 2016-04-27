# ShakeToChange
Change environment using shake

## How To Use
Copy this code into your view controller.

```
override func canBecomeFirstResponder() -> Bool {
  return true
}
    
override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
  if motion == .MotionShake {
    ShakeToChange.handleShake(self)
  }
}
```

Detect current environment.

```
if ShakeToChange.currentEnvironment() == ShakeToChange.isProduction {
            
}
        
if ShakeToChange.currentEnvironment() == ShakeToChange.isDevelopment {
            
}
```

## Shake to Change
![Screenshot](https://www.dropbox.com/s/w1n505h56im3zcc/Screenshot.png?dl=0&raw=1)
