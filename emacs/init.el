(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
