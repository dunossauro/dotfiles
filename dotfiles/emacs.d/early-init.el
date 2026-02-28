(setq gc-cons-threshold 300000000
   gc-cons-percentage 0.6
   read-process-output-max (* 4 1024 1024))

(run-with-idle-timer
 5 t
 (lambda ()
   (garbage-collect)))
