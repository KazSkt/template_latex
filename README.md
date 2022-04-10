# LaTeX template

LaTeXをタグ付きでpushすることで自動コンパイル、pdfがリリースされます。

## 使い方

1. 「v0.1.1」や「v1」などのタグを付けてpushします
2. latex-action/Dockerfile のimage上でtexをコンパイルします。（コンパイルには1〜2分かかります）
3. 作成されたpdfはreleaseページに現れます。