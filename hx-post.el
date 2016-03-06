(defun hx/template (filename tags)
  (format "#+TITLE: %s
#+DATE: <%s>
#+TAGS: %s
#+LAYOUT: post
#+CATEGORIES: %s
#+OPTIONS toc:t line:t" filename (format-time-string "%Y-%m-%d %H:%M") tags filename))

(defun hx/new-post ()
  (interactive)
  (let* ((name (read-string "Filename: "))
         (title (read-string "Title: " ))
         (tags (read-string "Tags: " ))
         (template (hx/template name tags)))
    (if (file-exists-p (concat "C:/Users/ulrik/hexo/blog/source/_posts/" name ".org"))
        (message "File/Post already exists. It needs to have a unique name!")
      (progn
        (write-region template nil (concat "C:/Users/ulrik/hexo/blog/source/_posts/" name ".org"))))))


(defun hx/generate-and-start ()
  (interactive)
  (start-process "my-hexo" "hexo" "powershell.exe" "-file" "c:\\shared\\oh-my-hexo.ps1")
  (switch-to-buffer-other-window "hexo"))


