;;; stan-snippets.el --- Yasnippets for Stan -*- lexical-binding: t; -*-

;; Copyright (C) 2012, 2013, 2014, 2015, 2016  Jeffrey Arnold
;;               2019 Kazuki Yoshida

;; Author: Jeffrey Arnold <jeffrey.arnold@gmail.com>,
;;         Kazuki Yoshida <kazukiyoshida@mail.harvard.edu>
;; Maintainer: Kazuki Yoshida <kazukiyoshida@mail.harvard.edu>
;; URL: http://github.com/stan-dev/stan-mode/stan-snippets
;; Keywords: languages,tools
;; Version: 10.0.0
;; Created: 2012-08-18
;; Package-Requires: ((emacs "24.3") (stan-mode "10.0.0") (yasnippet "0.8.0"))

;; This file is not part of GNU Emacs.

;;; License:
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see
;; <http://www.gnu.org/licenses/>

;;; Commentary:

;; Yasnippets for Stan.  This includes snippets for blocks, control structures,
;; and all functions.
;;

;; Usage:
;;
;;   (require 'stan-snippets)

;;; Code:
(require 'stan-mode)
(require 'yasnippet)

(defvar stan-snippets-root
  (file-name-directory
   (or load-file-name (buffer-file-name)))
  "Root directory containing `stan-mode' snippets.")

(add-hook
 'stan-mode-hook
 (lambda ()
   ;; this is needed to expand functions with _ in them.
   (setq-local yas-key-syntaxes (list "w_" "w_." "w_.()" "^ "))))

;;;###autoload
(defun stan-snippets-initialize ()
  "Initialize `stan-snippets'."
  (let ((snip-dir (expand-file-name "snippets" stan-snippets-root)))
    (when (boundp 'yas-snippet-dirs)
      (add-to-list 'yas-snippet-dirs snip-dir t))
    (yas-load-directory snip-dir)))


(provide 'stan-snippets)

;;; stan-snippets.el ends here
