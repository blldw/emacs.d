(provide 'setup-cedet)
(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)
;; (global-semantic-idle-summary-mode 1)

(semantic-mode 1)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

(require 'ede)
(global-ede-mode)

;; load my custom ede projects config
(let ((my-ede-projects-file (concat my-save-directory "my-ede-projects.el")))
  (if (file-exists-p my-ede-projects-file)
      (load-file my-ede-projects-file)))
