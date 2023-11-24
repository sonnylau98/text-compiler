(require 'text-compiler)

(defconst text-compiler-lisp--token-type
  '(
    ("COMMA" . "[,]")
    ("BACK_QUOTE" . "[`]")
    ("QT_S" . "[']")
    ("QT_D" . "[\"]")
    ("PAREN_OPN" . "[(]")
    ("PAREN_CLS" . "[)]")
    )
  "Lisp token type."
  )

(defconst text-compiler-lisp--comment-token-type
  '(("COMMENT" . "[;]"))
  "Lisp comment token type."
  )

(defconst text-compiler-lisp--into-level-symbols
  '("PAREN_OPN")
  "All symbols that goes into one nested level."
  )

(defconst text-compiler-lisp--back-level-symbols
  '("PAREN_CLS")
  "All symbols that goes back up one nested level."
  )

(defun text-compiler-lisp--make-token-type ()
  "Make up token type."
  (append ;; Unfinished
   )
  )

(defun text-compiler-lisp--make-token-type ()
  "Make up the token type."
  (append text-compiler-lisp--token-type
          text-compiler-lisp--comment-token-type
          text-compiler-lex--token-type))

(defun text-compiler-lisp (path)
  "Parse the PATH Lisp."
  (let* (
	 (text-compiler-lex--token-type (text-compiler-lisp--make-token-type))
	 (token-list (text-compiler-lex-tokenize-it path))
	 )
    (text-compiler-ast-build token-list
			     text-compiler-lisp--into-level-symbols
			     text-compiler-lisp--back-level-symbols
			     )
    )
  )

(provide 'text-compiler-lisp)
