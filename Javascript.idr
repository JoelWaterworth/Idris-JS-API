module Javascript

setOnLoadCallback : IO () -> IO ()
setOnLoadCallback x =
  mkForeign (FFun "(window.onload = %0)" [FFunction FUnit (FAny (IO ()))] FUnit) (const x)

setTimeout : IO () -> Int -> IO ()
setTimeout x delay =
  mkForeign (FFun "setTimeout(%0, %1)" [FFunction FUnit (FAny (IO ())), FInt] FUnit) (const x) delay
