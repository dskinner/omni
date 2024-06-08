;; performance
(setq gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024)) ;; 1mb

(setf default-frame-alist '((vertical-scroll-bars . nil)
                            (horizontal-scroll-bars . nil)
                            (menu-bar-lines . 0)
                            (tool-bar-lines . 0)
                            (font . "Go Mono-11")))

;; quiet
(setq inhibit-startup-message t
      initial-scratch-message ""
      eshell-banner-message ""
      warning-minimum-level :error)

(fset 'yes-or-no-p 'y-or-n-p)

;; user
(setq user-full-name "Daniel Skinner"
      user-mail-address "daniel@dasa.cc")

;; buffer
(setq-default tab-width 4)
(setq indent-tabs-mode nil)

;; utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; scrolling
(setf
 mouse-wheel-scroll-amount '(2 ((shift) . 1))
 mouse-wheel-progressive-speed nil
 mouse-wheel-follow-mouse 't
 scroll-step 1
 ring-bell-function 'ignore)

;; backup
(setf
 backup-directory-alist '(("." . "~/.emacs.d/backup"))
 backup-by-copying t
 version-control t
 delete-old-versions t
 kept-new-versions 1
 kept-old-versions 1)

;; proxy
;; (setf url-proxy-services '(("http"  . "localhost:9090")
;;                            ("https" . "localhost:9090")))

;; modes
(global-auto-revert-mode)
(save-place-mode)
(context-menu-mode)
(blink-cursor-mode nil)
(delete-selection-mode)

(line-number-mode)
(column-number-mode)
(size-indication-mode)

(winner-mode)
(tab-bar-mode)

(global-hl-line-mode)

;; (electric-pair-mode)

;;
(require 'which-key)
(setf which-key-show-early-on-C-h t
      which-key-sort-order 'which-key-local-then-key-order
      which-key-idle-delay 0.35
      which-key-secondary-delay 0.05)
(which-key-mode)

;; vim
(setq evil-want-keybinding nil)
(require 'evil)
(require 'evil-collection)
(require 'evil-surround)
(evil-set-leader 'motion (kbd "SPC"))
(evil-mode t)
(evil-collection-init)
(evil-collection-magit-setup)
(global-evil-surround-mode t)

;; More convenient key definitions in emacs
(require 'general)
(general-evil-setup)

;; (general-def dired-mode-map
;;   "RET" 'dired-find-alternate-file
;;   "^"   '(lambda () (interactive) (find-alternate-file "..")))

(general-nmap 'override
  "C-u" 'evil-scroll-up
  "K" 'evil-scroll-up
  "J" 'evil-scroll-down)

(general-create-definer leader-def :prefix "<f8>")

(leader-def
  "<f8>" (general-simulate-key "C-x" :which-key "commands")
  "b" 'consult-buffer
  "p" (general-simulate-key "C-x p" :which-key "project")
  "h" (general-simulate-key "C-h" :which-key "help")

  "f" 'find-file
  "F i" '((lambda () (interactive)(find-file "~/.emacs.d/init.el")) :which-key "~/.emacs.d/init.el")
  "F g" 'consult-ripgrep

  "g" 'magit ;; e.g. '(magit :which-key "git stuff")

  "w v" '((lambda () (interactive)(split-window-right)(windmove-right)) :which-key "split & move right")
  "w h" '((lambda () (interactive)(split-window-below)(windmove-down)) :which-key "split & move down")
  "w =" 'balance-windows
  "w u" 'winner-undo
  "w r" 'winner-redo
  "w o" 'delete-other-windows
  "w k" 'kill-buffer-and-window
  "w d" 'delete-window)

(general-def
  "M-(" 'paredit-wrap-round
  "M-\"" 'paredit-meta-doublequote

  "M-\\" '(lambda () (interactive) (insert (char-from-name "GREEK SMALL LETTER LAMDA")))
  "M-\-" "~"

  "C-/" 'comment-line

  "M-h" 'windmove-left
  "M-l" 'windmove-right
  "M-j" 'windmove-down
  "M-k" 'windmove-up
  "M-H" 'windmove-swap-states-left
  "M-L" 'windmove-swap-states-right
  "M-J" 'windmove-swap-states-down
  "M-K" 'windmove-swap-states-up)

;; theme
(require 'solaire-mode)
(solaire-global-mode t)
(load-theme 'doom-snazzy t)
(set-mouse-color "#fffff0")


;; https://github.com/emacs-mirror/emacs/blob/master/lisp/progmodes/project.el
(require 'project)

;; csharp solution as project root
(defun find-sln (dir)
  (seq-filter (lambda (f) (string= "sln" (file-name-extension f)))
              (directory-files dir)))

(defun project-try-sln (dir)
  (when-let (root (locate-dominating-file dir 'find-sln))
    (cons 'csharp-sln root)))

(cl-defmethod project-root ((project (head csharp-sln)))
  (cdr project))

(cl-defmethod project-ignores ((project (head csharp-sln)) _dir)
  '("bin/" "obj/"))

(add-hook 'project-find-functions #'project-try-sln)

;; go module as project root
(defun project-try-go-module (dir)
  (when-let (root (locate-dominating-file dir "go.mod"))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-try-go-module)

;; .project file as project root
(defun project-try-dot-project (dir)
  (when-let (root (locate-dominating-file dir ".project"))
    (cons 'dot-project root)))

(cl-defmethod project-root ((project (head dot-project)))
  (cdr project))

(add-hook 'project-find-functions #'project-try-dot-project)


;; Behavior-Driven Emacs Lisp Testing
;;(require 'buttercup)

;; treemacs
(general-def project-prefix-map
  "t" 'treemacs)
(treemacs-project-follow-mode t)
;; (treemacs-follow-mode t)
;; (treemacs-filewatch-mode t)
;; (treemacs-fringe-indicator-mode 'always)

;;
(require 'mood-line)
(mood-line-mode)

;;
(require 'paredit)
;; TODO consider lispy as an alternative to paredit (supposed to be "modern")

(defun my/lisp-conf ()
  (progn
    (enable-paredit-mode)
    (setq indent-tabs-mode nil)))

(add-hook 'emacs-lisp-mode-hook #'my/lisp-conf)
(add-hook 'lisp-mode-hook #'my/lisp-conf)

(defun my/scheme-conf ()
  (progn
    (enable-paredit-mode)
    (setq indent-tabs-mode nil)
    ;; (unless (string-match-p ".*-test.scm$" (buffer-file-name))
    ;;   (add-hook 'after-save-hook 'geiser-eval-buffer nil 'local))
    ))

(add-hook 'scheme-mode-hook #'my/scheme-conf)

(require 'go-mode)

;; vertical completion
(require 'vertico)
(vertico-mode t)
;;(setq vertico-scroll-margin 0)
(setq vertico-count 10)
;;(setq vertico-resize t)
(setq vertico-cycle t)
(general-def vertico-map
  "C-n" 'vertico-next
  "C-p" 'vertico-previous)

;; Enable rich annotations using the Marginalia package
(require 'marginalia)
(general-def minibuffer-local-map
  "M-A" 'marginalia-cycle)
(general-def completion-list-mode-map
  "M-A" 'marginalia-cycle)
(marginalia-mode)

;;
(use-package consult
  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  )

;;
(require 'corfu)
(setq corfu-cycle t
      corfu-auto t
      corfu-preview-current nil
      corfu-separator ?\s)
(global-corfu-mode)
(corfu-popupinfo-mode)
(general-def corfu-map
  "C-n" 'corfu-next
  "C-p" 'corfu-previous
  "<escape>" 'corfu-quit
  "<return>" 'corfu-insert)

;; orderless searching in completions
(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

;;
(require 'lsp)
(setq lsp-completion-provider :none
      lsp-ui-sideline-enable nil
      lsp-lens-enable nil)

(add-hook 'csharp-mode-hook #'lsp)
(add-hook 'go-mode-hook #'lsp)

(leader-def ;;'normal 'override
  "r" 'lsp-rename)

(general-def
  "M-RET" 'lsp-execute-code-action
  ;; TODO only bind if in lsp mode, otherwise use/find some other default
  "C-M-f" 'lsp-format-buffer)

(defun my/csharp-conf ()
  (leader-def ;;'normal 'override
    "t" 'lsp-csharp-run-last-tests
    "T t" 'lsp-csharp-run-test-in-buffer
    "T T" 'lsp-csharp-run-all-tests-in-buffer))

(add-hook 'csharp-mode-hook #'my/csharp-conf)


;; org-mode

;; org-roam
(setq org-roam-directory (file-truename "~/org-roam"))
(setq org-roam-completion-everywhere t)
(setq org-roam-database-connector 'sqlite-builtin)
(org-roam-db-autosync-mode)
(require 'org-roam-protocol)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((scheme . t)
   (emacs-lisp . t)))

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.razor\\'" . web-mode))
(setq web-mode-engines-alist
      '(("razor" . "\\.cshtml\\'")
        ("razor" . "\\.razor\\'")))
