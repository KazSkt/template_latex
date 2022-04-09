LaTeX template
====

This is a LaTeX template using Package iplab.sty.

## Feature
- Annotation
  
  ![With Annotation](https://user-images.githubusercontent.com/20383656/75781766-29c33c00-5da1-11ea-998e-b1f61ef9cb5a.png)
- Auto Compile & Release
- Google Drive Upload
- Slack Notification

  ![スクリーンショット 2020-12-05 1 34 03](https://user-images.githubusercontent.com/20383656/101189134-fac45880-3699-11eb-8c49-e734d8d42cb6.png)

## Environment
- Compiler: [upLaTeX](https://texwiki.texjp.org/?upTeX%2CupLaTeX), (pLaTex)
- PDF converter: dvipdfmx
- Automator: [latexmk](https://texwiki.texjp.org/?Latexmk)
- CI: Publish PDF to Release Pages by Github Actions

## Compile
```
$ latexmk paper.tex
```
or
```
$ uplatex paper.tex
$ ubibtex paper.tex
$ uplatex paper.tex
$ uplatex paper.tex
$ dvipdfmx paper
```

## Get Started with Github Actions
### Set config file
- Set your tex file info in ```.github/workflows/main.yml```
  - SOURCE_FOLDER_PATH: /* your tex file directory ex. ./ */
  - FILE_NAME: /* your tex file name ex. paper.pdf */
  - EMAIL_ADDRESS: /* your google mail address */
  - GDRIVE_FOLDER_ID:  /* your google drive folder ID ex. 19psK2v3qcijap6Fm9gE5fxyTnZPcHPPI */ 
    <details>
    <img width="840" alt="スクリーンショット 2020-12-05 1 28 00" src="https://user-images.githubusercontent.com/20383656/101188661-5a6e3400-3699-11eb-8640-54eed12555d7.png">

  - SLACK_CHANNEL:  /* your tex file name ex. times_yamato */
- Push tag v```x.x.x```
  ```git tag v1.0.0 && git push```
- Auto start to compile your tex file.
- After compiling, the PDF file is published in Release Page.

## Get Started with ```iplab.sty```
### LaTeX Installation
```
% \usepackage[draft]{iplab}                       % TODO, CHECK, FIXME表示
% \usepackage[draft,annot]{iplab}                 % TODO, CHECK, FIXME表示（注釈有）
% \usepackage[japanese]{iplab}                    % 日本語表示
% \usepackage[english]{iplab}                     % Draft English表示
\usepackage[draft,annot,japanese,english]{iplab}  % draft稿
% \usepackage[publish]{iplab}                     % 提出稿
```



### Usage of Package iplab.sty
#### Options
- ```draft```: 
  Enable TODO, CHECK, FIXME, FIXED commands.
- ```draft,annot```: 
  Enable TODO, CHECK, FIXME, FIXED commands showing annotations.
- ```japanese```: 
  Show Japanese (\J{...})
- ```english```: 
  Show English (\E{...})
- ```publish```: 
  Disable any commands.
#### Commands
- ```\TODO{You have to do this.}```
- ```\CHECK{You have to check this.}```
- ```\FIXME{You have to fix this.}```
- ```\FIXED{Hallo.}{Hello.}```
- ```\J{日本語...}```
- ```\E{Draft English...}```
### Examples
#### Annotation
![With Annotation](https://user-images.githubusercontent.com/20383656/75781766-29c33c00-5da1-11ea-998e-b1f61ef9cb5a.png)
#### No Annotation
![Without Annotation](https://user-images.githubusercontent.com/20383656/75782358-267c8000-5da2-11ea-8de6-3fe8993176b4.png)

## Default latexmk Setting
This setting is used automatically.
If you want to use your own settings, edit the .latexmkrc file in the same folder as the .tex file.

```
#!/usr/bin/env perl
$latex                         = 'uplatex %O -synctex=1 -halt-on-error -interaction=batchmode %S';
$pdflatex                      = 'pdflatex %O -synctex=1 -interaction=nonstopmode %S';
$lualatex                      = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
$xelatex                       = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';
$biber                         = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex                        = 'upbibtex %O %B';
$makeindex                     = 'upmendex %O -o %D %S';
$dvipdf                        = 'dvipdfmx %O -o %D %S';
$dvips                         = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf                        = 'ps2pdf %O %S %D';
$pdf_mode                      = 3;

$pvc_view_file_via_temporary = 0;
```

## Licence

[MIT](https://github.com/ukitomato/latex-template/blob/master/LICENSE)

## Author
Yuki Yamato [[ukitomato](https://github.com/ukitomato)]
