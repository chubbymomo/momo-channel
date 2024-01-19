My personal channel for things that I want on Guix, free, non-free, etc.

channels.scm snippet:

`
(channel
  (name 'momo)
  (url "https://github.com/chubbymomo/momo-channel")
  (branch "main")
  (introduction
  (make-channel-introduction
    "2cea3a055a81cbcb5b8cd35031882b7410ce85e8"
    (openpgp-fingerprint
      "DBF2 8B13 AA26 2B72 389C E340 382B A84F 2AF7 F339"))))
`