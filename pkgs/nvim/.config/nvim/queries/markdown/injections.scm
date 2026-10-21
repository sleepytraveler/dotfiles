; extends

; Pandoc/Quarto-style fenced code attributes use `{.language}` rather than a
; bare language identifier. The Markdown grammar exposes that class as
; `.language`, so strip its leading dot before injecting the content.
(
  (fenced_code_block
    (info_string
      (language) @injection.language)
    (code_fence_content) @injection.content)
  (#match? @injection.language "^\\.mermaid$")
  (#gsub! @injection.language "^%.(.+)$" "%1")
)
