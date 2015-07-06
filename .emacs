(add-to-list 'load-path "/Applications/emacs.app/Contents/Resources/lisp/emacs-lisp")
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


(line-number-mode)

(setq inhibit-startup-message t)
(add-to-list 'load-path "~/.emacs.d/models")

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(require 'go-autocomplete)
(require 'auto-complete-config)

;(add-to-list 'ac-modes 'go-mode)
;(add-to-list 'ac-modes 'web-mode)
										;(cua-mode)



;;(set-face-background 'highlight-current-line-face "#111144")


(defun sf ()
  (interactive)
  (setenv "GOPATH"
		  (concat (getenv "HOME") "/Projects/sf" ":"
				  (getenv "HOME") "/Projects/sf/deps" ":"
				  "/usr/local/go/"
				  )
		  )
  (setenv "GOBIN"
		  (concat (getenv "HOME") "/Projects/sf/bin")
		  )
  )

(defun jj ()
  (interactive)
  (setenv "GOPATH"
		  (concat (getenv "HOME") "/Projects/jj/go" ":"
				  (getenv "HOME") "/Projects/jj/go/deps" ":"
				  "/usr/local/go/"
				  )
		  )
  (setenv "GOBIN"
		  (concat (getenv "HOME") "/Projects/sf/bin")
		  )
  )


(defun gopath-base ()
  (interactive)
  (setenv "GOPATH"
		  (concat (getenv "HOME") "/Projects/GoProject" ":"
				  "/usr/local/go/"
				  )
		  )
  )

(defun auto-gopath ()
  (interactive)
  (if (buffer-file-name)
	  (if (string-match "/sf/" (buffer-file-name))
		  (sf)
		(if (string-match "/jj/" (buffer-file-name))
			(jj)
		  (gopath-base)
		  ))
	  )
  )
(add-hook 'buffer-list-update-hook 'auto-gopath)



(setq-default backup-inhibited t)
(setq-default auto-save-default nil)
(setq-default create-lockfiles nil)

;; Now auto-

(add-to-list 'load-path "~/.emacs.d/models/go-mode.el")
(require 'go-mode-load)
(setenv "PATH"
 	(concat
 	 "/usr/local/go/bin" ":"
 	 (getenv "PATH")
 	 )
)
(setenv "GOPATH"
		(concat "/Users/Cheney/Projects/GoProject")
		)

(setq-default exec-path (append exec-path '("/usr/local/go/bin")))
(setq exec-path (append exec-path '("/Users/cheney/Projects/GoProject/bin")))
(setq tool-bar-mode -1)
(add-hook 'before-save-hook 'gofmt-before-save)


;(when (display-graphic-p) 
;  (setq fonts 
;        (cond ((eq system-type 'darwin)     '("M+ 2m light" "Noto Sans S Chinese thin"));  "Hiragino Sans GB")) 
;              ((eq system-type 'gnu/linux)  '("Menlo"     "WenQuanYi Zen Hei")) 
;              ((eq system-type 'windows-nt) '("Consolas"  "Microsoft Yahei"))))


; 中文阿里斯顿可减肥了空间了监督法空间aksdj阿萨德发空间
;(setq face-font-rescale-alist '(("STHeiti" . 1) ("Microsoft Yahei" . 1) ("WenQuanYi Zen Hei" . 1))) 
;(set-face-attribute 'default nil :font (format "%s:pixelsize=%d" (car fonts) 16))

;(dolist (charset '(kana han symbol cjk-misc bopomofo)) 
;    (set-fontset-font (frame-parameter nil 'font)
;					  charset (font-spec :family (car (cdr fonts)))))) 

(set-frame-parameter nil 'internal-border-width 0)
(set-window-parameter nil 'internal-border-width 0)
(set-face-attribute 'vertical-border nil :foreground "#444")
(set-face-attribute 'default nil :font "M+ 2m:pixelsize=16:weight=light:slant=normal:width=normal:spacing=100:scalable=true")
;(set-face-italic 'italic nil)

; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "Hiragino Sans GB"
                                       :size 16)))


(setq-default mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq-default tab-width 4)

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;(autoload 'ibuffer "ibuffer" "List buffers." t)

;(auto-save-mode)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode '(0 . 0))


(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullscreen))
  (if (frame-parameter nil 'fullscreen)
      (display-time-mode 1))
  (if (not (frame-parameter nil 'fullscreen))
      (display-time-mode 0))
  )
(global-set-key (kbd "<C-s-268632070>") 'toggle-fullscreen)

(require 'web-mode)
(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-script-padding 4)
  (setq web-mode-style-padding 4)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gohtml\\'" . web-mode))
(setq web-mode-engines-alist
	  '(("razor" . "\\.gohtml\\'")
		)
)

(auto-save-mode)
(setq-default backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq-default auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))

(require 'projectile)
(projectile-global-mode)

(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(defun vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "M-O") 'vi-open-line-above)

(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(global-set-key (kbd "M-o") 'vi-open-line-below)
(global-set-key (kbd "<C-return>") 'vi-open-line-below)

;(global-set-key (kbd "C-a") (kbd "M-m"))

(global-set-key (kbd "s-o") 'helm-projectile)
(setq ring-bell-function 'ignore)

(setq mouse-wheel-scroll-amount '(0.01))

(setq thrift-indent-level 4)

(global-set-key (kbd "<backtab>") (kbd "C-q TAB"))
(global-set-key (kbd "<C-tab>") (kbd "C-q TAB"))

;(global-auto-revert-mode t)

(server-start)

(global-set-key (kbd "s-i") 'helm-imenu)

(require 'window-numbering)
(window-numbering-mode)

(setq org-log-done 'time)

(global-set-key (kbd "s-[")  'pop-global-mark)
(global-set-key (kbd "s-;") 'goto-line)

(require 'redo)
(define-key global-map (kbd "C-x C-/") 'redo)
(require 'reopen)


(add-to-list 'load-path "/usr/local/go/misc/emacs")
(require 'go-mode-load)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

;(remove-hook 'buffer-access-fontify-functions 'auto-gopath)

(require 'go-eldoc) ;; Don't need to require, if you install by package.el
(add-hook 'go-mode-hook 'go-eldoc-setup)

(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(global-set-key (read-kbd-macro "<M-DEL>") 'backward-delete-word)
(global-set-key (read-kbd-macro "<C-w>") 'backward-delete-word)

(line-number-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (darktooth)))
 '(custom-safe-themes
   (quote
	("ebe1361423448b1008c3d388d1d986bf00d7f95f11999ae9ee58694c10680629" "b9b503fd149a5bfc7cc49744a3769dbda6a21c3433d9bbba6a8c14508d251459" "4d8a17c8614aad8625b206341213ec1dbefa9b3eb35efb68b3ea286aa33e7bbb" "6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "16a2527f2a0922754716c4e8fb75b34a02b2a89ecfab2df40c849342fd647c0c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
	(solarized-color-blend it "#002b36" 0.25)
	(quote
	 ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
	(("#073642" . 0)
	 ("#546E00" . 20)
	 ("#00736F" . 30)
	 ("#00629D" . 50)
	 ("#7B6000" . 60)
	 ("#8B2C02" . 70)
	 ("#93115C" . 85)
	 ("#073642" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
	(circe php+-mode php-mode darktooth-theme zenburn-theme protobuf-mode scala-mode yaml-mode window-numbering window-layout thrift solarized-theme smex redo+ perspective markdown-mode+ json-snatcher ibuffer-git highlight-current-line helm-projectile grizzl go-errcheck go-eldoc company-go auto-install auto-complete)))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#dc322f")
	 (40 . "#c85d17")
	 (60 . "#be730b")
	 (80 . "#b58900")
	 (100 . "#a58e00")
	 (120 . "#9d9100")
	 (140 . "#959300")
	 (160 . "#8d9600")
	 (180 . "#859900")
	 (200 . "#669b32")
	 (220 . "#579d4c")
	 (240 . "#489e65")
	 (260 . "#399f7e")
	 (280 . "#2aa198")
	 (300 . "#2898af")
	 (320 . "#2793ba")
	 (340 . "#268fc6")
	 (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
	(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq-default cursor-type 'bar)
(setq-default cursor-in-non-selected-windows nil)
(require 'highlight-current-line)
(highlight-current-line-on 1)
(set-face-background 'highlight-current-line-face "#2f2f2f")
(set-face-attribute 'region nil :background "#105ebc" :foreground "#ffffff")
(set-cursor-color "DarkOrange1")




(setq imenu-max-item-length 100)
(delete-selection-mode)

(global-set-key (read-kbd-macro "s-b") 'helm-buffers-list)
(global-set-key (read-kbd-macro "s-n") 'helm-buffers-list)
(global-set-key (read-kbd-macro "s-K") 'helm-show-kill-ring)
(global-set-key (read-kbd-macro "s-f") 'helm-occur)

(setq projectile-switch-project-action 'projectile-dired)
(put 'downcase-region 'disabled nil)

(add-hook 'python-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq python-indent 4)
    (setq tab-width 4)))

(setq helm-buffer-max-length 40)


(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer))))

(global-set-key (kbd "C-\\") 'switch-to-previous-buffer)
(global-set-key (kbd "s-\\") 'switch-to-previous-buffer)

(add-to-list 'auto-mode-alist '("\\.go$\\'" . go-mode))
(add-to-list 'auto-mode-alist '("\\.goc\\'" . c-mode))




(setq c-default-style "linux" c-basic-offset 4)



(defun toggle-letter-case ()
  "Toggle the letter case of current word or text selection.
Toggles from 3 cases: UPPER CASE, lower case, Title Case,
in that cyclic order."
  (interactive)
  (let (pos1 pos2 (deactivate-mark nil) (case-fold-search nil))
	(if (and transient-mark-mode mark-active)
		(setq pos1 (region-beginning)
			  pos2 (region-end))
	  (setq pos1 (car (bounds-of-thing-at-point 'word))
			pos2 (cdr (bounds-of-thing-at-point 'word))))

	(when (not (eq last-command this-command))
	  (save-excursion
		(goto-char pos1)
		(cond
		 ((looking-at "[[:lower:]][[:lower:]]") (put this-command 'state
													 "all lower"))
		 ((looking-at "[[:upper:]][[:upper:]]") (put this-command 'state
													 "all caps") )
		 ((looking-at "[[:upper:]][[:lower:]]") (put this-command 'state
													 "init caps") )
		 (t (put this-command 'state "all lower") )
		 )
		)
	  )

	(cond
	 ((string= "all lower" (get this-command 'state))
	  (upcase-initials-region pos1 pos2) (put this-command 'state "init
caps"))
	 ((string= "init caps" (get this-command 'state))
	  (upcase-region pos1 pos2) (put this-command 'state "all caps"))
	 ((string= "all caps" (get this-command 'state))
	  (downcase-region pos1 pos2) (put this-command 'state "all lower"))
	 )
	)
  )

(global-set-key (kbd "s-r") 'projectile-test-project)

(setq gofmt-command "goimports")
(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)
(desktop-save-mode t)
(global-set-key (kbd "s-|") 'other-window)


(require 'go-projectile)
(global-set-key (kbd "s-t") 'projectile-test-project)

(global-set-key (kbd "s-d") 'highlight-symbol-at-point)


(defun switch-between-window()
  (interactive)
  (select-window-1)
  (switch-to-previous-buffer)
  (select-window-2)
  (switch-to-previous-buffer)
  (select-window-1)
  (switch-to-previous-buffer)
  )

(setq ac-candidate-limit 50)



(defun kill-dired-buffers ()
	 (interactive)
	 (mapc (lambda (buffer) 
           (when (eq 'dired-mode (buffer-local-value 'major-mode buffer)) 
             (kill-buffer buffer))) 
         (buffer-list)))
