
(ert-deftest elpy-shell-starting-directory-in-project-mode ()
  (elpy-testcase ()
    (let ((elpy-shell-starting-directory 'project-root))
      (python-mode)
      (elpy-mode)
      (elpy-shell-switch-to-shell)
      (should (string= default-directory (elpy-project-root))))))

(ert-deftest elpy-shell-starting-directory-in-current-buffer-mode ()
  (elpy-testcase ()
    (let ((elpy-shell-starting-directory 'current-buffer)
          (curdir default-directory))
      (python-mode)
      (elpy-mode)
      (elpy-shell-switch-to-shell)
      (should (string= default-directory curdir)))))

(ert-deftest elpy-shell-starting-directory-in-specific-path-mode ()
  (elpy-testcase ()
    (let ((elpy-shell-starting-directory temporary-file-directory))
      (python-mode)
      (elpy-mode)
      (elpy-shell-switch-to-shell)
      (should (string= default-directory temporary-file-directory)))))

(ert-deftest elpy-shell-starting-directory-should-fail-when-misconfigured ()
  (elpy-testcase ()
    (let ((elpy-shell-starting-directory 'something-else))
      (python-mode)
      (elpy-mode)
      (should-error
      (elpy-shell-switch-to-shell)))))
