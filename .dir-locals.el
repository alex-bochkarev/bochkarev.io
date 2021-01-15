;; Project-specific ELisp magic

;; enable auto-export on save (see https://ox-hugo.scripter.co/doc/auto-export-on-saving/)
(("content-org/"
  . ((org-mode . ((eval . (org-hugo-auto-export-mode)))))))
