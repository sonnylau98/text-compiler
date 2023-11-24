(require 'text-compiler-util)
(require 'text-compiler-ast)
(require 'text-compiler-lex)

(defgroup text-compiler nil
  "Basic Parser in Emacs Lisp."
  :prefix "text-compiler"
  :group 'tools
  :link '(url-link :tag "Repository" "https://github.com/sonnylau98/text-compiler")
  )

;;;###autoload
(defun text-compiler (lan &optional path)
  "Parse the PATH with symbol language LAN support"
  (let ((mod-name (intern (format "text-compiler-%s" (symbol-name lan)))))
    (if (and (ignore-errors (require mod-name))
	     (functionp mod-name))
	(funcall mod-name path)
      (user-error "Language %s is not supported." lan)
	)
      )
  )

(provide 'text-compiler)
