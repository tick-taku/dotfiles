;;-*- emacs-lisp -*-
;; (require 'package)
;; ;; MELPA-stableを追加
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; ;; Marmaladeを追加
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; ;; Orgを追加
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; ;; 初期化
;; (package-initialize)

;;---------------------------------------------------------------------------
;;; Load-path
;;---------------------------------------------------------------------------
(setq load-path
      (append
       (list (expand-file-name "~/.emacs-lisp/")) load-path))
(setq load-path
      (append
       (list (expand-file-name "/usr/local/share/emacs/site-lisp/")) load-path))
(setq load-path
      (append
       (list (expand-file-name "/usr/share/emacs/site-lisp/")) load-path))

;;---------------------------------------------------------------------------
;; Color Settings
;;---------------------------------------------------------------------------
;;行末のスペースを強調表示
(when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace t))

;; (load-theme 'manoj-dark t)
;; (load-theme 'deeper-blue t)
;; (load-theme 'misterioso t)
;; (load-theme 'tango-dark t)
;; (load-theme 'wombat t)
;; (load-theme 'wheatgrass t)
(load-theme 'tsdh-dark t)
;; (load-theme 'adwaita t)
;;(load "~/.emacs-lisp/monokai-theme.el")
;; (load-theme 'monokai t)
;; (load-theme 'tsdh-dark t)

;;---------------------------------------------------------------------------
;; Line Number Setting
;;---------------------------------------------------------------------------
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%4d ")
(global-set-key "\C-cl" 'linum-mode)

;;---------------------------------------------------------------------------
;; Region Highlight
;;---------------------------------------------------------------------------
(transient-mark-mode 1)

;;---------------------------------------------------------------------------
;;; Parenthesis
;;---------------------------------------------------------------------------
; hi-light
(show-paren-mode t)
(global-set-key "\M-i" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;;---------------------------------------------------------------------------
;; scroll control
;;---------------------------------------------------------------------------
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;;---------------------------------------------------------------------------
;;; Window Resize
;;---------------------------------------------------------------------------
(global-set-key "\C-xw" 'my-window-resizer)

(defun my-window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))

;;---------------------------------------------------------------------------
;; Dired
;;---------------------------------------------------------------------------
(require 'dired)
;;(setq dired-listing-switches "-l --show-control-chars")
(define-key dired-mode-map (kbd "K") 'dired-kill-subdir)
;; allow dired to be able to delete or copy a whole dir.
(setq dired-recursive-copies 'always) ; “always” means no asking
(setq dired-recursive-deletes 'top) ; “top” means ask once
;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先を
;; もう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

;; (setq find-ls-option '("-print0 | xargs -0 ls -aGFlhA --show-control-char" . ""))
;; (setq dired-listing-switches "-aGFlhA --show-control-char")

;;---------------------------------------------------------------------------
;; 下線
;;---------------------------------------------------------------------------
;;(defface hlline-face
;;  '((((class color)
;;      (background dark))
;;     (:background "gray0"))
;;    (((class color)
;;      (background light))
;;     (:background "ForestGreen"))
;;     (:background "gray30"))
;;    (t
;;     ()))
;;  "Used face hl-line.")
;;(setq hl-line-face 'hlline-face)
;;(global-hl-line-mode)

;;---------------------------------------------------------------------------
;; Common
;;---------------------------------------------------------------------------
;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)

;;; メニューバーとツールバーを表示しない
(menu-bar-mode -1)
;(tool-bar-mode -1)

;; my.cnfとかを"conf-mode"で開く
(add-to-list 'auto-mode-alist '("\\.cnf$" . conf-mode))

;; ペインの移動
(winner-mode)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Don't make backup file.
(setq make-backup-files nil)

;; ファイル名が被った時にディレクトリ名も表示
(require 'uniquify)
;;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)`
(setq uniquify-buffer-name-style 'forward)`

;;; スタートアップを出さない
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(inhibit-startup-screen t))

;; minibufferの補完機能を有効にする
(icomplete-mode t)

;;---------------------------------------------------------------------------
;;; tmux setting
;;---------------------------------------------------------------------------
;; (if (equal "xterm" (tty-type))
;;     (define-key input-decode-map "\e[1;2A" [S-up])
;;     (define-key input-decode-map "\e[1;2B" [S-down])
;;     (define-key input-decode-map "\e[1;2C" [S-right])
;;     (define-key input-decode-map "\e[1;2D" [S-left])
;;     (define-key input-decode-map "\e[1;5A" [C-up])
;;     (define-key input-decode-map "\e[1;5B" [C-down])
;;     (define-key input-decode-map "\e[1;5C" [C-right])
;;     (define-key input-decode-map "\e[1;5D" [C-left])
;;     (define-key input-decode-map "\e[1;5F" [C-end])
;;     (define-key input-decode-map "\e[1;5H" [C-home])
;;     (define-key input-decode-map "\e[1;3A" [M-up])
;;     (define-key input-decode-map "\e[1;3B" [M-down])
;;     (define-key input-decode-map "\e[1;3C" [M-right])
;;     (define-key input-decode-map "\e[1;3D" [M-left])
;; )
(if (equal "xterm-256color" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))
(if (equal "screen-256color" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))

;;---------------------------------------------------------------------------
;;; Key Binding
;;---------------------------------------------------------------------------
;; C-q でdiredに移動
;; (global-set-key "\C-Q" 'quit-window)

;; コメントアウト
;; 一行
(defun one-line-comment ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (end-of-line)
    (comment-or-uncomment-region (region-beginning) (region-end))))
(global-set-key (kbd "\M-/") 'one-line-comment)

(define-key global-map "\M-?" 'help-for-help)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-c" 'comment-region)
(global-set-key "\M-u" 'uncomment-region)
(global-set-key "\C-x\C-b" 'bs-show)

;; 他ウィンドウのスクロール
(global-set-key (kbd "M-<up>") 'scroll-other-window-down)
(global-set-key (kbd "M-<down>") 'scroll-other-window)

;;---------------------------------------------------------------------------
;; bs-show setting
;;---------------------------------------------------------------------------
(require 'bs)

(defun check-equal (buffer-name kwd-list)
  (let* ((ret))
    (dolist (e kwd-list ret)
      (if (string-match e buffer-name)
          (setf ret t)))))

(defmacro common-show-func (kwd-list)
  `(lambda (buffer)
     (let* ((name (buffer-name buffer)))
       (cond ((buffer-file-name buffer)
              t)
             ((check-equal name ,kwd-list)
              t)
             (t
              nil)))))

(defun set-my-bs-setting ()
  (interactive)
  (setf bs-configurations
        `(
          ("files" nil nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)
          ("files-and-shell" nil ,(common-show-func '("^*shell" "^*gud" "^*ansi-term"
                                                      "*js*" "*grep*"))
           nil bs-visits-non-file bs-sort-buffer-interns-are-last)
          ("all" nil nil nil nil nil))))

(set-my-bs-setting)

;;---------------------------------------------------------------------------
;; org-mode
;;---------------------------------------------------------------------------
(add-to-list
 'load-path
 (expand-file-name "/usr/local/share/emacs/24.3/lisp/org"))

(require 'org)
(require 'org-install)
;; *.org を org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; 表示を打ち切る
(setq org-startup-truncated t)
;; ファイルを開いたときに畳まない
(setq org-startup-folded nil)

(setq org-plantuml-jar-path "/usr/local/jars/plantuml.jar")
(defun org-mode-init ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   (add-to-list 'org-babel-load-languages '(plantuml . t))))
(add-hook 'org-mode-hook 'org-mode-init)

;;---------------------------------------------------------------------------
;; org-agenda
;;---------------------------------------------------------------------------
(setq org-directory "~/work_infra-schedule/infra-schedule")
(setq org-agenda-files (list org-directory))

(defun org-agenda-toggle-skip-scheduled-if-done ()
  "Toggle inclusion of entries with DONE in an agenda buffer."
  (interactive)
  (org-agenda-check-type t 'agenda)
  (setq org-agenda-skip-scheduled-if-done (not org-agenda-skip-scheduled-if-done))
  (org-agenda-redo)
  (org-agenda-set-mode-name)
  (message "DONE skip turned %s"
           (if org-agenda-skip-scheduled-if-done "on" "off")))

;; (org-defkey org-agenda-mode-map "D" 'org-agenda-toggle-skip-scheduled-if-done)

(setq org-agenda-custom-commands
      '(
	("p" "My Schedule"
	 ((agenda "" ((org-agenda-tag-filter-preset '("+matsumoto"
						      ;; "-sekiya"
						      ;; "-nakai"
						      ))
		      (org-agenda-include-deadlines nil)
		      (org-agenda-span 'day)
		      ))
	  (agenda "" ((org-agenda-tag-filter-preset '("+matsumoto"
						      ;; "-sekiya"
						      ;; "-nakai"
						      ))
		      (org-agenda-span 'day)
		      (org-agenda-entry-types '(:deadline))
		      ))))
	("d" "Only My Deadline"
	 ((agenda "" ((org-agenda-tag-filter-preset '("+kanemura"
						      ;; "-sekiya"
						      ;; "-nakai"
						      ))
		      (org-agenda-span 'day)
		      (org-agenda-entry-types '(:deadline))
		      ))))
	("D" "Only All Deadline"
	 ((agenda "" ((org-agenda-span 'day)
		      (org-agenda-entry-types '(:deadline))
		      ))))
	))

(setq org-capture-templates
      '(
	("t" "ToDo" entry (file+headline (expand-file-name "~/org-agenda-data/todo.org") "Inbox")
	 "** TODO %?\n")
	("p" "課題" entry (file+headline (expand-file-name "~/infra-schedule/Inbox.org") "Inbox")
	 "** NOPLAN %?\n")
	("m" "memo" entry (file (expand-file-name "~/org-agenda-data/memo.org"))
	 "* %?\n    %i\n    %a\n    %T"))
      ;; ("t" "ToDo" entry (file+headline (expand-file-name "~/org-agenda-data/todo.org") "Inbox")
      ;;  "** TODO %?\n    %i\n    %a\n    %T")
      )

;;---------------------------------------------------------------------------
;; ediff
;;---------------------------------------------------------------------------
;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

;;---------------------------------------------------------------------------
;; go lang
;;---------------------------------------------------------------------------
;; (add-to-list 'load-path "~/emacs/emacs-lisp/")
;; (require 'go-mode)

;;---------------------------------------------------------------------------
;; 関数一覧表示
;;---------------------------------------------------------------------------
(autoload 'se/make-summary-buffer "summarye" nil t)

;;---------------------------------------------------------------------------
;; GTAGS
;;---------------------------------------------------------------------------
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
	 (local-set-key "\M-t" 'gtags-find-tag)
	 (local-set-key "\M-r" 'gtags-find-rtag)
	 (local-set-key "\M-s" 'gtags-find-symbol)
	 (local-set-key "\C-t" 'gtags-pop-stack)
	 ))

;;---------------------------------------------------------------------------
;; INDENT
;;---------------------------------------------------------------------------
(electric-indent-mode -1)
;; (setq indent-tabs-mode 4)
(setq tab-width 4)

;;---------------------------------------------------------------------------
;; JS2-MODE
;;---------------------------------------------------------------------------
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (setq js-indent-level 1)
;; (setq-default js2-basic-offset 8)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0c49a9e22e333f260126e4a48539a7ad6e8209ddda13c0310c8811094295b3a3" "5b340b4eb24c3c006972f3bc3aee26b7068f89ba9580d9a4211c1db5d0a70ea2" default)))
 '(indent-tabs-mode nil)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t))

;; 先頭行移動対策
; http://d.hatena.ne.jp/khiker/20110923/emacs_c_a_m_m
;; (global-set-key "\C-a" '(lambda (arg)
;;                           (interactive "^p")
;;                           (cond
;;                            ((bolp)
;;                             (call-interactively 'back-to-indentation))
;;                            (t
;;                             (move-beginning-of-line arg)))))

;;---------------------------------------------------------------------------
;; BRS-MODE
;;---------------------------------------------------------------------------
(autoload 'brightscript-mode "brightscript-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.brs$" . brightscript-mode))

;; (setq auto-mode-alist (cons '("\\.brs$" . brightscript-mode) auto-mode-alist))

;;---------------------------------------------------------------------------
;; keyboard macro
;;---------------------------------------------------------------------------
(global-set-key [f7] 'start-kbd-macro)
(global-set-key [f8] 'end-kbd-macro)
(global-set-key [f9] 'call-last-kbd-macro)

;;---------------------------------------------------------------------------
;; auto-save
;;---------------------------------------------------------------------------
(setq auto-save-default nil)
(setq make-backup-files nil)

;;---------------------------------------------------------------------------
;; SWIFT MODE
;;---------------------------------------------------------------------------
(autoload 'swift-mode "swift-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.swift$" . swift-mode))
