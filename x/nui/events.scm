(define-module (nui events))

(export <mouse-event>
        mouse-event
        mouse-event?
        copy-mouse-event
        mouse-event-button
        set-mouse-event-button!
        mouse-event-action
        set-mouse-event-action!
        mouse-event-mods
        set-mouse-event-mods!
        mouse-event-xpos
        set-mouse-event-xpos!
        mouse-event-ypos
        set-mouse-event-ypos!
        <touch-event>
        touch-event
        touch-event?)

(import (srfi srfi-9))

;; usb hid spec provides 8 bits for buttons where 3 are specified and the rest are device specific
;; so will just use a byte to represent mouse buttons pressed simultaneously.

(define-record-type <mouse-event>
  (mouse-event button action mods xpos ypos)
  mouse-event?
  (button mouse-event-button set-mouse-event-button!)
  (action mouse-event-action set-mouse-event-action!)
  (mods mouse-event-mods set-mouse-event-mods!)
  (xpos mouse-event-xpos set-mouse-event-xpos!)
  (ypos mouse-event-ypos set-mouse-event-ypos!))

(define (copy-mouse-event e)
  (mouse-event
   (mouse-event-button e)
   (mouse-event-action e)
   (mouse-event-mods e)
   (mouse-event-xpos e)
   (mouse-event-ypos e)))

(define-record-type <touch-event>
  (touch-event)
  touch-event?)
