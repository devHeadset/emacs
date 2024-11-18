(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

;; jetbrains mono nerd font
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 120)

;; init packages sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package evil)
(require 'evil)
(evil-mode 1)

(use-package general
          :config
          (general-evil-setup)

          ;; set up 'SPC' as the global leader key
          (general-create-definer ht/leader-keys
            :states '(normal insert visual emacs)
            :keymaps 'override
            :prefix "SPC" ;; set leader
            :global-prefix "M-SPC") ;; access leader in insert mode

          (ht/leader-keys
            "b" '(:ignore t :wk "buffer")
            "bb" '(switch-to-buffer :wk "Switch buffer")
            "bk" '(kill-this-buffer :wk "Kill this buffer")
            "bn" '(next-buffer :wk "Next buffer")
            "bp" '(previous-buffer :wk "Previous buffer")
            "br" '(revert-buffer :wk "Reload buffer"))
            "bi"  '(ibuffer :wk "Ibuffer")

 (ht/leader-keys
  "." '(find-file :wk "Find file")
  "f c" '((lambda () (interactive) (find-file "~/.emacs.d/config.org")) :wk "Edit emacs config")
  "TAB TAB" '(comment-line :wk "Comment lines"))



 (ht/leader-keys
  "h" '(:ignore t :wk "Help")
  "h f" '(describe-function :wk "Describe function")
  "h v" '(describe-variable :wk "Describe variable")
  ;;"h r r" '((lambda () (interactive) (load-file "~/.config/emacs/init.el")) :wk "Reload emacs config"))
  "h r r" '(reload-init-file :wk "Reload emacs config"))

 (ht/leader-keys
  "t" '(:ignore t :wk "Toggle")
  "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
  "t t" '(visual-line-mode :wk "Toggle truncated lines"))

 (ht/leader-keys
  "h" '(:ignore t :wk "Help")
  "h f" '(describe-function :wk "Describe function")
  "h v" '(describe-variable :wk "Describe variable")
  "h r r" '(reload-init-file :wk "Reload emacs config"))

 (ht/leader-keys
  "t" '(:ignore t :wk "Toggle")
  "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
  "t t" '(visual-line-mode :wk "Toggle truncated lines"))


)

(defun reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (load-file user-init-file))

(use-package catppuccin-theme)
  (load-theme 'catppuccin :no-confirm)

(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package which-key
  :init
    (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
	  which-key-sort-order #'which-key-key-order-alpha
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 6
	  which-key-side-window-slot -10
	  which-key-side-window-max-height 0.25
	  which-key-idle-delay 0.8
	  which-key-max-description-length 25
	  which-key-allow-imprecise-window-fit t
	  which-key-separator " >" ))
