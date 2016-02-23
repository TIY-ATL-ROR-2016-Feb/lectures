;; Hangman
;; Brit Butler
;; v.01
;; Feature Ideas: ASCII hangman. Eliminate explicit elt references and other hackish
;; stuff, especially show-letter. Import dictionary in place of *word-list*.

(defparameter *word-list* '("cookies" "kittens" "fairies"
                            "unicorns" "words" "linux"
                            "lisp" "music" "songs"
                            "beer" "love" "fun"
                            "code" "cease" "and"
                            "desist" "read" "print"
                            "eval" "loop" "macro"))

(defparameter *turn-count* nil)
(defparameter *letters-picked* nil)
(defparameter *word-in-progress* nil)
(defparameter *solved-word* nil)

(defun hangman ()
  (setf *turn-count* 7)
  (setf *letters-picked* '())
  (select-game-type)
  (work-on-word))

(defun select-game-type ()
  (if (y-or-n-p "Would you prefer to have a word chosen at random?")
      (set-the-words (elt *word-list* (random (length *word-list*))))
      (set-the-words (string-downcase (read-prompt "Please input your desired word: ")))))

(defun set-the-words (word-of-the-run)
  (setf *solved-word* word-of-the-run)
  (setf *word-in-progress* (make-array (length word-of-the-run)
                                       :initial-element #\- :element-type 'character))
  (format t "~a~%" *word-in-progress*))

(defun read-prompt (query-string)
  (format *query-io* query-string)
  (read-line *query-io*))

(defun check-letter (letter)
  (if (already-picked? letter)
      (format t "You already picked that goofball! Try again...~%")
      (push letter *letters-picked*))
  (cond ((is-in-word? letter) (show-letter letter))
        ((not (is-in-word? letter)) (decf *turn-count*)
         (format t "Nope. Not in there. ~a turns left.~%" *turn-count*))))

(defun is-in-word? (letter &key (start 0))
  (position letter *solved-word* :start start))

(defun already-picked? (letter)
  (position letter *letters-picked*))

(defun show-letter (letter)
  (setf (elt *word-in-progress* (is-in-word? letter)) letter)
  (format t "~a~%" *word-in-progress*))

(defun pick-a-letter (&key (message "Pick a letter please: "))
  (let ((rtn (read-prompt message)))
    (if (> (length rtn) 1)
        (pick-a-letter
          :message "We only need ONE letter thank you very much. Try again: ")
        (check-letter (elt rtn 0)))))

(defun work-on-word ()
  (pick-a-letter)
  (word-finished?))

(defun word-finished? ()
  (if (= *turn-count* 0)
      (game-over)
  (if (string= *solved-word* *word-in-progress*)
      (play-again? "Congratulations.")
      (work-on-word))))

(defun game-over ()
  (format t "Sorry. The word was ~a.~%" *solved-word*)
  (play-again? "You're all out of turns. Game over."))

(defun play-again? (message)
  (format t "~a~%" message)
  (if (y-or-n-p "Would you like to play again?")
      (hangman)
      (format t "Thanks for playing!~%")))
