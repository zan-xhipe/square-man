(define-module (square-man game-state)
  #:use-module (srfi srfi-9)
  #:use-module (2d sprite)
  #:use-module (square-man entity)
  #:export (<game-state>
	    make-game-state
	    game-state?
	    player
	    food
	    draw
	    update))

(define-record-type <game-state>
  (make-game-state player food)
  game-state?
  (player player)
  (food food))

(define *sprite-batch* (make-sprite-batch))

(define (draw state)
  (with-sprite-batch *sprite-batch*
    (for-each
     (lambda (entity)
       (draw-entity entity))
     (cons (player state)
	   (food state)))))

(define (update state)
  (update-entity! (player state)))
